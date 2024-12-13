package Database;

import Model.security.OrderSignature;
import RowMaper.security.OrderSignatureMapper;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

public class OrderSignatureDAO extends AbtractDAO<OrderSignature> {

    public OrderSignature findByOrder(int orderId) {
        String sql = "SELECT * FROM order_signatures WHERE orderId = ? ORDER BY signed_date DESC LIMIT 1";
        List<OrderSignature> list = querry(sql, new OrderSignatureMapper(), orderId);
        return list == null || list.isEmpty() ? null : list.get(0);
    }

    public int insert(OrderSignature orderSignature) {
        String sql = "INSERT INTO order_signatures(keyId, signatureBase64, orderId, `hash`) VALUES(?,?,?,?)";

        return save(sql, orderSignature.getKeyId(), orderSignature.getSignatureBase64(), orderSignature.getOrderId(), orderSignature.getHash());
    }

    public static void main(String[] args) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        OrderSignatureDAO dao = new OrderSignatureDAO();
        System.out.println(dao.findByOrder(1));
    }
}