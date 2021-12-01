package com.example.demo.domain.login;

import com.example.demo.domain.member.Member;
import com.example.demo.domain.member.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class LoginService {

    private final MemberMapper memberMapper;

    public Member login(String loginId, String password) {
        return memberMapper.findByLoginId(loginId)
                .filter(m -> m.getPassword().equals(password))
                .orElse(null);
    }
}
