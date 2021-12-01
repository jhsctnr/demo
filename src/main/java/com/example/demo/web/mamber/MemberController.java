package com.example.demo.web.mamber;

import com.example.demo.domain.member.Member;
import com.example.demo.domain.member.MemberMapper;
import com.example.demo.domain.member.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
@RequestMapping("/members")
public class MemberController {

//    private final MemberRepository memberRepository;
    private final MemberMapper memberMapper;

    @GetMapping("/add")
    public String addForm(@ModelAttribute("member") Member member) {
        return "members/addMemberForm";
    }

    @PostMapping("add")
    @Transactional
    public String addMember(@Valid @ModelAttribute Member member, BindingResult bindingResult) {
        //ID 존재 여부 검사
        Optional<Member> memberOptional = memberMapper.findByLoginId(member.getLoginId());
        if(memberOptional.isPresent()) {
            bindingResult.rejectValue("loginId", "duplication", "이미 존재 하는 아이디 입니다.");
            return "members/addMemberForm";
        }

        //binding 에러 처리
        if (bindingResult.hasErrors()) {
            return "members/addMemberForm";
        }

        //멤버 저장
        memberMapper.saveMember(member);

        return "redirect:/";
    }

}
