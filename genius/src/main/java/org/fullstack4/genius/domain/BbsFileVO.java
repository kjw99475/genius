package org.fullstack4.genius.domain;

import lombok.*;
import lombok.extern.log4j.Log4j2;

@Log4j2///실제 배포시에 넣지마
@ToString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BbsFileVO {
    private int file_idx;
    private int bbs_idx;
    private String save_name;
    private String original_name;
    private String path;
}
