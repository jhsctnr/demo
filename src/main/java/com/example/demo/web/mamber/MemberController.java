package com.example.demo.web.mamber;

import com.example.demo.domain.member.Member;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/members")
public class MemberController {

    @GetMapping("/add")
    public String addForm(@ModelAttribute Member member) {
        return "members/addMemberForm";
    }


}
