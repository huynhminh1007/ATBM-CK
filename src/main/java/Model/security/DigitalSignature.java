package Model.security;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.security.*;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;

public class DigitalSignature {

    private KeyPair keyPair;
    private Signature signature;
    private PrivateKey privateKey;
    private PublicKey publicKey;

    private String algorithm;

    public void init(String algorithm, String algRandom, int keySize) throws NoSuchAlgorithmException, NoSuchProviderException {
        this.algorithm = algorithm;

        KeyPairGenerator generator = KeyPairGenerator.getInstance("DSA");
        SecureRandom random = SecureRandom.getInstance(algRandom);
        generator.initialize(keySize, random);

        keyPair = generator.generateKeyPair();
        signature = Signature.getInstance(algorithm);
    }

    public void setAlgorithm(String algorithm) throws NoSuchAlgorithmException {
        this.algorithm = algorithm;
        signature = Signature.getInstance(algorithm);
    }

    public boolean generateKey() {
        if (keyPair == null)
            return false;

        privateKey = keyPair.getPrivate();
        publicKey = keyPair.getPublic();

        return true;
    }

    public String sign(String data) throws SignatureException, InvalidKeyException {
        return sign(data.getBytes());
    }

    public String sign(byte[] data) throws InvalidKeyException, SignatureException {
        signature.initSign(privateKey);
        signature.update(data);
        byte[] signedData = signature.sign();

        return Base64.getEncoder().encodeToString(signedData);
    }

    public boolean verify(String data, String sign) throws InvalidKeyException, SignatureException {
        signature.initVerify(publicKey);
        signature.update(data.getBytes());
        byte[] decodedSignature = Base64.getDecoder().decode(sign);

        return signature.verify(decodedSignature);
    }

    public String signFile(String src) throws InvalidKeyException, IOException, SignatureException {
        signature.initSign(privateKey);
        BufferedInputStream in = new BufferedInputStream(new FileInputStream(src));
        byte[] buffer = new byte[10 * 1024];
        int bytesRead;

        while ((bytesRead = in.read(buffer)) != -1) {
            signature.update(buffer, 0, bytesRead);
        }

        in.close();

        return Base64.getEncoder().encodeToString(signature.sign());
    }

    public boolean verifyFile(String src, String sign) throws InvalidKeyException, IOException, SignatureException {
        signature.initVerify(publicKey);
        byte[] signValue = Base64.getDecoder().decode(sign);

        BufferedInputStream in = new BufferedInputStream(new FileInputStream(src));
        byte[] buffer = new byte[10 * 1024];
        int bytesRead;

        while ((bytesRead = in.read(buffer)) != -1) {
            signature.update(buffer, 0, bytesRead);
        }

        in.close();

        return signature.verify(signValue);
    }

    public PrivateKey decodePrivateKey(String base64Key) throws NoSuchAlgorithmException, InvalidKeySpecException {
        byte[] keyBytes = Base64.getDecoder().decode(base64Key);
        KeyFactory keyFactory = KeyFactory.getInstance("DSA");
        return keyFactory.generatePrivate(new PKCS8EncodedKeySpec(keyBytes));
    }

    public PublicKey decodePublicKey(String base64Key) throws NoSuchAlgorithmException, InvalidKeySpecException {
        byte[] keyBytes = Base64.getDecoder().decode(base64Key);
        KeyFactory keyFactory = KeyFactory.getInstance("DSA");
        return keyFactory.generatePublic(new X509EncodedKeySpec(keyBytes));
    }

    public void loadPrivateKey(String privateKey) throws NoSuchAlgorithmException, InvalidKeySpecException {
        this.privateKey = decodePrivateKey(privateKey);
    }

    public void loadPublicKey(String publicKey) throws NoSuchAlgorithmException, InvalidKeySpecException {
        this.publicKey = decodePublicKey(publicKey);
    }

    public String getPrivateKey() {
        return Base64.getEncoder().encodeToString(privateKey.getEncoded());
    }

    public String getPublicKey() {
        return Base64.getEncoder().encodeToString(publicKey.getEncoded());
    }

    public static void main(String[] args) throws NoSuchAlgorithmException, InvalidKeySpecException, SignatureException, InvalidKeyException {
        DigitalSignature signature = new DigitalSignature();
        signature.setAlgorithm("SHA224withDSA");
        signature.loadPublicKey("MIIDQzCCAjUGByqGSM44BAEwggIoAoIBAQCPeTXZuarpv6vtiHrPSVG28y7FnjuvNxjo6sSWHz79NgbnQ1GpxBgzObgJ58KuHFObp0dbhdARrbi0eYd1SYRpXKwOjxSzNggooi/6JxEKPWKpk0U0CaD+aWxGWPhL3SCBnDcJoBBXsZWtzQAjPbpUhLYpH51kjviDRIZ3l5zsBLQ0pqwudemYXeI9sCkvwRGMn/qdgYHnM423krcw17njSVkvaAmYchU5Feo9a4tGU8YzRY+AOzKkwuDycpAlbk4/ijsIOKHEUOThjBopo33fXqFD3ktm/wSQPtXPFiPhWNSHxgjpfyEc2B3KI8tuOAdl+CLjQr5ITAV2OTlgHNZnAh0AuvaWpoV499/e5/pnyXfHhe8ysjO65YDAvNVpXQKCAQAWplxYIEhQcE51AqOXVwQNNNo6NHjBVNTkpcAtJC7gT5bmHkvQkEq9rI837rHgnzGC0jyQQ8tkL4gAQWDt+coJsyB2p5wypifyRz6Rh5uixOdEvSCBVEy1W4AsNo0fqD7UielOD6BojjJCilx4xHjGjQUntxyaOrsLC+EsRGiWOefTznTbEBplqiuH9kxoJts+xy9LVZmDS7TtsC98kOmkltOlXVNb6/xF1PYZ9j897buHOSXC8iTgdzEpbaiH7B5HSPh++1/et1SEMWsiMt7lU92vAhErDR8C2jCXMiT+J67ai51LKSLZuovjntnhA6Y8UoELxoi34u1DFuHvF9veA4IBBgACggEBAIDqG05lKo7zBxuWn1rccr3Oy6ggOARdFV36LhlbUyH5iH6P2CQSrcYBcKCRlz/mxgExcqtlY54F22SN3J9nicnHUtdWqw5weKXw+NrepdU9nigTjajmHig4PZQ4Y3PnlJFsEfibEWmLNlnxcnQhljCHXvIn0kxmkuY24e827CMc1wmHyFLqMe76hBf9Ns30ciKBYL2cm2AS53CvfBDYprytOSD6Vml6GS8dtRTLNYOHzOXMs3I6JSdWf0LV27siSfGP6NtA6xYqEUTX+ShD3lSDQMXMEsfE4cB5koByAI0gn7dgg8qxRPdSWaq+7O13naglgHB+r0Fd6lhU8jv+dSw=");
        System.out.println(signature.verify("0crLXlH+0o7YFAMdH8ggRNsJrORPcYzNAZxDKUFZouYbvCDZQt8cSMShbO2Z9DPHCNiTT6F8NU3IjeRJYcubUw==", "MDwCHB9xztsJcPJxNq4Rs6hpWLDvyAHzczygRVFzXkYCHFJgn/4tVC+S+ZnS6NRGMJ2Zvcj2OLZ48lG/aQw="));
    }
}
