package org.fullstack4.genius.Common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class CommonUtil {

    public static boolean Login(HttpSession session) {
        return session.getAttribute("userId") != null;
    }
    public static boolean AutoLogin(HttpServletRequest req) {
        String id = CookieUtil.getCookieValue(req, "user_id") ==null?"":CookieUtil.getCookieValue(req, "user_id");
        return id != "";
    }
    public static boolean saveId(HttpServletRequest req){
        String save = CookieUtil.getCookieValue(req,"save_id") ==null?"":CookieUtil.getCookieValue(req,"save_id");
        return save!= "";
    }
}
