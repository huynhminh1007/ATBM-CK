package RowMaper.security;

import Model.security.OrderSignature;
import RowMaper.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class OrderSignatureMapper implements RowMapper<OrderSignature> {
    @Override
    public OrderSignature map(ResultSet r) throws SQLException {
        OrderSignature orderSignature = new OrderSignature();

        try {
            orderSignature.setId(r.getInt("signatureId"));
            orderSignature.setKeyId(r.getInt("keyId"));
            orderSignature.setSignatureBase64(r.getString("signatureBase64"));
            orderSignature.setOrderId(r.getInt("orderId"));
            orderSignature.setHash(r.getString("hash"));
            orderSignature.setSignedDate(r.getTimestamp("signed_date"));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderSignature;
    }
}
