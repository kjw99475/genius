package org.fullstack4.genius.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import java.time.LocalDate;

@Log4j2
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LoginDTO {
    private int member_idx;
    @Builder.Default
    private String social_type=null;
    @NotBlank
    private String member_id;
    private String member_name;
    @NotBlank
    private String pwd;
    private LocalDate birthday;
    private String phone;
    private String gender;
    private String zip_code;
    private String addr1;
    private String addr2;
    private int point;
    private String profile;
    private LocalDate reg_date;
    private String admin_YN;
    private LocalDate modify_date;
    private LocalDate leave_date;
    private String status;
    @Builder.Default
    private String terms1="N";
    @Builder.Default
    private String terms2="N";
    @Builder.Default
    private String terms3="N";
    @Builder.Default
    private String terms4="N";
    private String email;
}
