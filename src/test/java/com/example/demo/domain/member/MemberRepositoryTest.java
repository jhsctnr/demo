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

    @Autowired
    private MemberRepository memberRepository;

    @Test
    void saveMember() {
        //given
        Member member = new Member();
        member.setLoginId("test");
        member.setName("spring");
        member.setPassword("test!");

        //when
        int result = memberRepository.saveMember(member);

        //then
        assertThat(result).isEqualTo(1);
    }

    @Test
    void getMemberById() {
        //given

        //when
        Member member = memberRepository.findById(2L);


        //then
        assertThat(member.getName()).isEqualTo("spring");

    }

    @Test
    void getMemberByLoginId() {
        //given
        Member memberNew = new Member();
        memberNew.setLoginId("wonhoi");
        memberNew.setName("spring");
        memberNew.setPassword("test!");

        //when
        memberRepository.saveMember(memberNew);
        List<Member> memberList = memberRepository.findByLoginId("wonhoi");
        Member member1 = memberList.stream()
                .findAny()
                .filter(member -> "wonhoi".equals(member.getLoginId()))
                .orElse(null);

        //then
        assertThat(member1.getLoginId()).isEqualTo("wonhoi");
    }

    @Test
    void findAll() {
        List<Member> all = memberRepository.findAll();

        //then
        assertThat(all.size()).isEqualTo(2);
    }
}