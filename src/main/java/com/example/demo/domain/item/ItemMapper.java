package com.example.demo.domain.item;

import com.example.demo.domain.member.Member;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ItemMapper {

    int saveItem(Map<String, Object> item);

    Map<String, Object> findById(Map<String, Object> id);

    List<Item> findAll();

    int updateItem(Item updateParam);

    int deleteItem(Long id);

//    Long getId();
}
