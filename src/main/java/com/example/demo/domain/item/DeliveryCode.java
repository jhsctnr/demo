package com.example.demo.domain.item;

public enum DeliveryCode {
    FAST("빠른 배송"), NORMAL("일반 배송"), SLOW("느린 배송");

    private final String description;

    DeliveryCode(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}
