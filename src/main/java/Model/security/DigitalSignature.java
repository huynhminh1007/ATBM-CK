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
}
