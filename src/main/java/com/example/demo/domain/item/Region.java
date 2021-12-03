package com.example.demo.domain.item;

public enum Region {
    SEOUL("서울"), BUSAN("부산"), JEJU("제주");

    private final String description;

    Region(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}
