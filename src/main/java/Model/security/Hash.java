package Model.security;

import javax.crypto.Mac;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.io.*;
import java.math.BigInteger;
import java.security.DigestInputStream;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class Hash {

    private static final String ALGORITHM = "SHA-512";
    private static final String HMAC = "HmacSHA512";
    private static final Integer RADIX = 16;

    public String hash(String plainText, String encoding, boolean isUpper) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        String decodedText = decodeInput(plainText, encoding);
        String res = new BigInteger(1, hash(decodedText)).toString(RADIX);

        return isUpper ? res.toUpperCase() : res;
    }

    public String hashBase64(String plainText, String encoding) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        String decodedText = decodeInput(plainText, encoding);
        return Base64.getEncoder().encodeToString(hash(decodedText));
    }

    public String hmacHash(String plainText, String secretKey, String encoding, boolean isUpper) throws UnsupportedEncodingException, NoSuchAlgorithmException, InvalidKeyException {
        String decodedText = decodeInput(plainText, encoding);
        byte[] hmacBytes = hmacHash(decodedText, secretKey);
        String res = new BigInteger(1, hmacBytes).toString(RADIX);

        return isUpper ? res.toUpperCase() : res;
    }

    public String hmacHashBase64(String plainText, String secretKey, String encoding) throws UnsupportedEncodingException, NoSuchAlgorithmException, InvalidKeyException {
        String decodedText = decodeInput(plainText, encoding);
        return Base64.getEncoder().encodeToString(hmacHash(decodedText, secretKey));
    }

    private byte[] hmacHash(String plainText, String secretKey) throws NoSuchAlgorithmException, InvalidKeyException {
        SecretKey key = new SecretKeySpec(secretKey.getBytes(), ALGORITHM);

        Mac mac = Mac.getInstance(HMAC);
        mac.init(key);

        byte[] hmacBytes = mac.doFinal(plainText.getBytes());

        return hmacBytes;
    }

    private byte[] hash(String plainText) throws NoSuchAlgorithmException {
        MessageDigest messageDigest = MessageDigest.getInstance(ALGORITHM);
        return messageDigest.digest(plainText.getBytes());
    }

    public String hashFile(String src) throws IOException, NoSuchAlgorithmException {
        File srcFile = new File(src);

        MessageDigest messageDigest = MessageDigest.getInstance(ALGORITHM);
        InputStream in = new BufferedInputStream(new FileInputStream(srcFile));
        DigestInputStream dis = new DigestInputStream(in, messageDigest);

        byte[] buffer = new byte[10 * 1024];
        int byteRead;

        do {
            byteRead = dis.read(buffer);
        } while (byteRead != -1);

        return new BigInteger(1, messageDigest.digest()).toString(RADIX);
    }

    private String decodeInput(String input, String encoding) throws UnsupportedEncodingException {
        switch (encoding.toLowerCase()) {
            case "utf-8":
                return input;
            case "base64":
                return new String(Base64.getDecoder().decode(input));
            case "hex":
                return hexToString(input);
            default:
                throw new IllegalArgumentException("Unsupported encoding: " + encoding);
        }
    }

    private String hexToString(String hex) throws UnsupportedEncodingException, NumberFormatException {
        byte[] bytes = new byte[hex.length() / 2];
        for (int i = 0; i < hex.length(); i += 2) {
            String chunk = hex.substring(i, i + 2);
            bytes[i / 2] = (byte) Integer.parseInt(chunk, 16);
        }
        return new String(bytes, "UTF-8");
    }
}