package com.example.demo.domain.item;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

import static org.assertj.core.api.Assertions.*;
import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@Transactional
class ItemMapperTest {


    @Autowired
    private ItemMapper itemMapper;

    @Test
    void saveItem() {
        //given
        Item item = new Item();
//        item.setId(1L);
        item.setItemName("spring");
        item.setPrice(10000);
        item.setQuantity(10);

        //when
//        itemMapper.saveItem(item);
        Long id = item.getId();
//        Item result = itemMapper.findById(id);
//        Map<String, Object> result = itemMapper.findById(id);

        //then
//        assertThat(result.get("ID")).isEqualTo(id);
    }

    @Test
    void findAll() {
        List<Item> result = itemMapper.findAll();
        assertThat(result.size()).isEqualTo(2);
    }

    @Test
    void updateItem() {
        //given
        Item item = new Item("spring", 10000, 10);
        Item updateParam = new Item("update", 20000, 20);

        //when
//        itemMapper.saveItem(item);
        Long id = item.getId();
        updateParam.setId(id);
        itemMapper.updateItem(updateParam);
//        Item result = itemMapper.findById(id);
//        Map<String, Object> result = itemMapper.findById(id);

        //then
//        assertThat(result.get("ITEMNAME")).isEqualTo("update");
    }

}