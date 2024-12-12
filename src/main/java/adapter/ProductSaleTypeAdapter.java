package adapter;

import Model.ProductSale;
import com.google.gson.*;

import java.lang.reflect.Type;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class ProductSaleTypeAdapter implements JsonDeserializer<ProductSale> {
    @Override
    public ProductSale deserialize(JsonElement json, Type type, JsonDeserializationContext jsonDeserializationContext) throws JsonParseException {
        JsonObject jsonObject = json.getAsJsonObject();

        int id = jsonObject.get("id").getAsInt();
        String sale = jsonObject.get("sale").getAsString();
        double newPrice = jsonObject.get("newPrice").getAsDouble();
        int quantity = jsonObject.get("quantity").getAsInt();

        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm");

        Timestamp startDateDiscount = Timestamp.valueOf(LocalDateTime.parse(jsonObject.get("startDateDiscount").getAsString()
                , dateTimeFormatter));
        Timestamp endDateDiscount = Timestamp.valueOf(LocalDateTime.parse(jsonObject.get("endDateDiscount").getAsString()
                , dateTimeFormatter));

        return new ProductSale(id, sale, newPrice, quantity, startDateDiscount, endDateDiscount);
    }
}
