package com.example.handlers.products;

import com.example.templating.Renderer;
import com.example.utils.MainMenu;
import io.javalin.http.Context;
import io.javalin.http.Handler;
import java.util.HashMap;

public class NewProductHandler implements Handler {
    @Override
    public void handle( Context context) throws Exception {
        HashMap<String, Object> modelData = new HashMap<>();
        modelData.put("main_menu", MainMenu.get());
        context.html(Renderer.render("product_new.ftl", modelData));
    }
}