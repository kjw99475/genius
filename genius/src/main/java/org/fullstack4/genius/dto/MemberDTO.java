package org.fullstack4.genius.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import java.time.LocalDate;

@Log4j2
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MemberDTO {
    private int member_idx;
    private String member_id;
    private String member_name;
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
    private String terms1;
    private String terms2;
    private String terms3;
    private String terms4;
    private String email;
}
