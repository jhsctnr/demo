package com.example.demo.domain.member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Slf4j
@Repository
@RequiredArgsConstructor
public class MemberRepository {

    private final SqlSessionTemplate dao;

    public int saveMember(Member member) {
        return dao.insert("item.findById", member);
    }

    public Member findById(Long id) {
        return dao.selectOne("com.example.demo.domain.member.MemberMapper.getMemberById", id);
    }

    public Member findByLoginId(String loginId) {
        return dao.selectOne("item.findByLoginId", loginId);
    }

    public List<Member> findAll() {
        return dao.selectList("item.findAll");
    }
}
