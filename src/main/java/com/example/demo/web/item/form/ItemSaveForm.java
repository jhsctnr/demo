package com.example.demo.web.item.form;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Range;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Getter @Setter
public class ItemSaveForm {

    @NotBlank
    private String itemName;

    @NotNull
    @Range(min = 100, max = 1000000)
    private Integer price;

    @NotNull
    @Range(min = 1, max = 9999)
    private Integer quantity;
}
