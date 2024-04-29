package org.fullstack4.genius.Common;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;
import java.util.Set;

public class CommonUtil {

    public static String parseString(Object obj) {
        return (obj != null) ? (String)obj : "";
    }

    public static boolean nullCheck(String str) {
        if (str.equals("")){
            return false;
        } else if (str.trim().equals("")) {
            return false;
        }
        return true;
    }

    public static int parseInt(String str) {
        int result = 0;
        try {
            str = parseString(str);
            result = Integer.parseInt(str);
        } catch (NumberFormatException e) {
            System.out.println("숫자가 아닌 값 들어옴.");
        }
        return result;
    }
    public static String getUploadFolder(HttpServletRequest request, String target) {
        // target 인자에는 upload폴더 하위 폴더 명을 넣으시오
        String realPath = request.getServletContext().getRealPath("");
        return realPath.substring(0,realPath.indexOf("build")) + "src\\main\\webapp\\resources\\upload\\" + target;
    }

//    /**
//     * POST 요청 보내기
//     * @param String paramUrl // 요청 url
//     * @param Map<String, String> paramMap // 요청 파라미터
//     * @return Strin
//     */
    public static String postConnection(String paramUrl, Map<String, String> paramMap) {
        try{
            if(parseString(paramUrl).isEmpty()){
                throw new Exception("URL is null!!");
            }

            HttpHeaders headers = new HttpHeaders();
            headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

            MultiValueMap<String, String> params = new LinkedMultiValueMap<>();

            if(!paramMap.isEmpty()){
                Set<String> key = paramMap.keySet();
                for (Object obj : key) {
                    String keyName = (String) obj;
                    String valueName = paramMap.get(keyName);

                    params.add(keyName, valueName);
                }
            }

            RestTemplate restTemplate = new RestTemplate();
            HttpEntity<MultiValueMap<String, String>> httpEntity = new HttpEntity<>(params, headers);

            ResponseEntity<String> response = restTemplate.exchange(
                    paramUrl,
                    HttpMethod.POST,
                    httpEntity,
                    String.class
            );

            // 응답
            return response.getBody();

        } catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }

//    /**
//     * GET 요청 보내기
//     * @param String paramUrl // 요청 url
//     * @param Map<String, String> paramMap // 요청 파라미터
//     * @return Strin
//     */
    public static String getConnection(String paramUrl, Map<String, String> paramMap) {
        try{
            if(parseString(paramUrl).isEmpty()){
                throw new Exception("URL is null!!");
            }

            HttpHeaders headers = new HttpHeaders();
            headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

            if(!paramMap.isEmpty()){
                Set<String> key = paramMap.keySet();
                for (Object obj : key) {
                    String keyName = (String) obj;
                    String valueName = paramMap.get(keyName);

                    paramUrl += "&" + keyName + "=" + valueName;
                }
            }

            RestTemplate restTemplate = new RestTemplate();
            HttpEntity<MultiValueMap<String, String>> httpEntity = new HttpEntity<>(headers);

            ResponseEntity<String> response = restTemplate.exchange(
                    paramUrl,
                    HttpMethod.GET,
                    httpEntity,
                    String.class
            );

            // 응답
            return response.getBody();

        } catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }


}
