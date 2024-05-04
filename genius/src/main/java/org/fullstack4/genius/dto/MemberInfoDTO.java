package org.fullstack4.genius.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.PastOrPresent;
import javax.validation.constraints.Pattern;
import java.time.LocalDate;

@Log4j2
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MemberInfoDTO {
    private int member_idx;
    @Builder.Default
    private String social_type=null;
    @Pattern(regexp = "^[a-z0-9]{8,20}$")
    private String member_id;
    @Pattern(regexp = "^[ㄱ-ㅎ가-힣]{2,20}$")
    private String member_name;
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
    private String pwdCheck;
}
