package com.example.demo.domain.item;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter @Setter
public class Item {

    private Long id;
    private String itemName;
    private Integer price;
    private Integer quantity;

    private String open;
    private String regions;
    private String itemType;
    private String deliveryCode;

    public Item() {

    }

    public Item(String itemName, Integer price, Integer quantity) {
        this.itemName = itemName;
        this.price = price;
        this.quantity = quantity;
    }
}
