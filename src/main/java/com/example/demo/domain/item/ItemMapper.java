package com.example.demo.domain.item;

import com.example.demo.domain.member.Member;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ItemMapper {

    int saveItem(Item item);
    Item findById(Long id);
    List<Item> findAll();

    int updateItem(Item updateParam);

    int deleteItem(Long id);

    Long getId();
}
