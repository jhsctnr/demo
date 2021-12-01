package com.example.demo.domain.member;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.*;

@SpringBootTest
@Transactional
class MemberRepositoryTest {

//    @Autowired
//    private MemberRepository memberRepository;

    @Autowired
    private MemberMapper memberMapper;

    @Test
    void saveMember() {
        //given
        Member member = new Member();
        member.setLoginId("test");
        member.setName("spring");
        member.setPassword("test!");

        //when
        int result = memberMapper.saveMember(member);

        //then
        assertThat(result).isEqualTo(1);
    }

    @Test
    void getMemberById() {
        //given

        //when
        Member member = memberMapper.findById(36L);


        //then
        assertThat(member.getName()).isEqualTo("해성");

    }

    @Test
    void getMemberByLoginId() {
        //given
        Member memberNew = new Member();
        memberNew.setLoginId("wonhoi");
        memberNew.setName("spring");
        memberNew.setPassword("test!");

        //when
        memberMapper.saveMember(memberNew);
        Optional<Member> memberOptional = memberMapper.findByLoginId("test");
        Member member1 = memberOptional.filter(member -> "test".equals(member.getLoginId()))
                .orElse(null);

        //then
        assertThat(member1.getName()).isEqualTo("해성");
    }

    @Test
    void findAll() {
        List<Member> all = memberMapper.findAll();

        //then
        assertThat(all.size()).isEqualTo(1);
    }
}