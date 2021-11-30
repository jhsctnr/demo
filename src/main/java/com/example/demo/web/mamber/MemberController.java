package com.example.demo.web.mamber;

import com.example.demo.domain.member.Member;
import com.example.demo.domain.member.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/members")
public class MemberController {

    private final MemberRepository memberRepository;

    @GetMapping("/add")
    public String addForm(@ModelAttribute("member") Member member) {
        return "members/addMemberForm";
    }

    @PostMapping("add")
    public String addMember(@Valid @ModelAttribute Member member, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "members/addMemberForm";
        }
        
        //ID 존재 여부 검사 TODO
        List<Member> memberList = memberRepository.findByLoginId(member.getLoginId());
        if(!ObjectUtils.isEmpty(memberList)) {
            bindingResult.rejectValue("loginId", "duplication", "이미 존재 하는 아이디 입니다.");
            return "members/addMemberForm";
        }


        return "redirect:/";
    }

}
