package com.example.demo.domain.member;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

@Getter
@Setter
public class Member {

    private Long id;

    @NotBlank
    private String loginId;

    @NotBlank
    private String name;

    @NotBlank
    private String password;
}
