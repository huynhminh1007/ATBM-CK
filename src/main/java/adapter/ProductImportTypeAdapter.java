package adapter;

import Model.Product;
import Model.ProductImport;
import com.google.gson.*;

import java.lang.reflect.Type;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class ProductImportTypeAdapter implements JsonDeserializer<ProductImport> {
    @Override
    public ProductImport deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
        JsonObject jsonObject = json.getAsJsonObject();

        int productId = jsonObject.get("id").getAsInt();
        String productName = jsonObject.get("name").getAsString();
        double weight = jsonObject.get("weight").getAsDouble();
        double costPrice = jsonObject.get("costPrice").getAsDouble();
        int quantity = jsonObject.get("quantity").getAsInt();

        LocalDateTime localDateTime = LocalDateTime.parse(jsonObject.get("dateCreated").getAsString()
                , DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm"));
        Timestamp dateCreated = Timestamp.valueOf(localDateTime);

        ProductImport productImport = new ProductImport();
        productImport.setProductId(productId);
        productImport.setProductName(productName);
        productImport.setWeight(weight);
        productImport.setCostPrice(costPrice);
        productImport.setQuantity(quantity);
        productImport.setDateCreated(dateCreated);

        return productImport;
    }
}
