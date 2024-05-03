package org.fullstack4.genius.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import javax.validation.constraints.*;
import java.time.LocalDate;

@Log4j2
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MemberDTO {
    private int member_idx;
    @Builder.Default
    private String social_type=null;
    @Pattern(regexp = "^[a-z0-9]{8,20}$")
    private String member_id;
    @Pattern(regexp = "^[ㄱ-ㅎ가-힣]{2,20}$")
    private String member_name;
    @Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{10,16}$")
    private String pwd;
    @PastOrPresent
    private LocalDate birthday;
    @Pattern(regexp = "^[0-9]{10,11}$")
    private String phone;
    @NotBlank
    private String gender;
    @NotBlank
    private String zip_code;
    @NotBlank
    private String addr1;
    private String addr2;
    private int point;
    private String profile;
    private LocalDate reg_date;
    @Builder.Default
    private String admin_YN="N";
    private LocalDate modify_date;
    private LocalDate leave_date;
    @Builder.Default
    private String status="Y";
    @NotBlank
    private String terms1;
    @NotBlank
    private String terms2;
    @Builder.Default
    private String terms3="N";
    @Builder.Default
    private String terms4="N";
    @NotBlank
    private String email;
    @AssertTrue
    private Boolean idAuthYN;
    @AssertTrue
    private Boolean emailAuthYN;
    @NotBlank
    private String pwdCheck;
}
