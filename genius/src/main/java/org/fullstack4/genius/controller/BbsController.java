package org.fullstack4.genius.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.util.List;
import java.util.UUID;

@Log4j2
@Controller
@RequestMapping(value="/bbs")
@RequiredArgsConstructor
public class BbsController {

    @RequestMapping(value="/fileUpload", method= RequestMethod.GET)
    public String fileUploadGET() {
        return "/bbs/fileUpload";
    }

    @RequestMapping(value="/fileUpload", method= RequestMethod.POST)
    public String fileUploadPOST(@RequestParam("file") MultipartFile file) {
        String uploadFolder = "D:\\java4\\uploads";
        String fileRealName = file.getOriginalFilename(); //원래 파일의 이름
        long size = file.getSize();
        String fileExt = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length()); // 확장자명
        //엑셀.파.일xxx.xls --> 제일 마지막 인덱스의 . 에서부터 파일이름 끝에를 파싱

        log.info("============================");
        log.info("uploadFolder : " + uploadFolder);
        log.info("fileRealName : " + fileRealName);
        log.info("size : " + size);
        log.info("fileExt : " + fileExt);


        //새로운 파일명 생성
        UUID uuid = UUID.randomUUID();
        String[] uuids = uuid.toString().split("-");
        String newName = uuids[0];

        log.info("uuid : " + uuid);
        log.info("uuids : " + uuids);
        log.info("newName : " + newName);


        File saveFile = new File(uploadFolder + "\\" + newName + fileExt);

        try {
            file.transferTo(saveFile);
        } catch (IllegalStateException e) {
            e.printStackTrace();
        }
        catch(Exception e) {
            e.printStackTrace();
        }

        log.info("============================");

        return "/bbs/fileUpload";
    }

    @RequestMapping(value="/fileUpload2", method= RequestMethod.GET)
    public String fileUpload2GET() {
        return "/bbs/fileUpload2";
    }
    @RequestMapping(value="/fileUpload2", method= RequestMethod.POST)
    public String fileUpload2POST(MultipartHttpServletRequest files) {
        String uploadFolder = "D:\\java4\\uploads";

        List<MultipartFile> list = files.getFiles("files");
        for(MultipartFile file : list) {
            String fileRealName = file.getOriginalFilename(); //원래 파일의 이름
            long size = file.getSize();
            String fileExt = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length()); // 확장자명
            //엑셀.파.일xxx.xls --> 제일 마지막 인덱스의 . 에서부터 파일이름 끝에를 파싱

            log.info("============================");
            log.info("uploadFolder : " + uploadFolder);
            log.info("fileRealName : " + fileRealName);
            log.info("size : " + size);
            log.info("fileExt : " + fileExt);

            //새로운 파일명 생성
            UUID uuid = UUID.randomUUID();
            String[] uuids = uuid.toString().split("-");
            String newName = uuids[0];

            log.info("uuid : " + uuid);
            log.info("uuids : " + uuids);
            log.info("newName : " + newName);

            File saveFile = new File(uploadFolder + "\\" + newName + fileExt);

            try {
                file.transferTo(saveFile);
            } catch (IllegalStateException e) {
                e.printStackTrace();
            }
            catch(Exception e) {
                e.printStackTrace();
            }

            log.info("============================");
        }
        return "/bbs/fileUpload2";
    }
}
