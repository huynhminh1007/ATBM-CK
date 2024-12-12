package adapter;

import Model.CartItem;
import com.google.gson.TypeAdapter;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;

import java.io.IOException;

public class CartItemTypeAdapter extends TypeAdapter<CartItem> {
    @Override
    public void write(JsonWriter jsonWriter, CartItem cartItem) throws IOException {
        jsonWriter.beginObject();

        jsonWriter.name("productId").value(cartItem.getProduct().getId());
        jsonWriter.name("quantity").value(cartItem.getQuantity());

        jsonWriter.endObject();
    }

    @Override
    public CartItem read(JsonReader jsonReader) throws IOException {
        return null;
    }
}
