package com.example.demo.domain.member;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Optional;

@Mapper
public interface MemberMapper {

    int saveMember(Member member);
    Member findById(Long id);
    Optional<Member> findByLoginId(String loginId);
    List<Member> findAll();

}
