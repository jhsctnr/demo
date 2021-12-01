package com.example.demo.domain.login;

import com.example.demo.domain.member.Member;
import com.example.demo.domain.member.MemberMapper;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class LoginServiceTest {

    @Autowired
    MemberMapper memberMapper;

    @Test
    void login() {
        Optional<Member> member = memberMapper.findByLoginId("test");

        Assertions.assertThat(member.get().getLoginId()).isEqualTo("test");
    }

}