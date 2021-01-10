package Utility;

/**
 *
 * @author Maulik
 */
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class GetSession {

    private static String JSESSIONID = null;
    private static HttpSession session = null;

    public static String getJSESSIONID() {
        return JSESSIONID;
    }

    public static void setJSESSIONID(String JSESSION_ID) {
        JSESSIONID = JSESSION_ID;
    }

    public static void sessionValidation(HttpServletResponse response) throws IOException {
        if (session.getAttribute("logon").toString() != "true") {
            session.invalidate();
            response.getWriter().println("<script>window.location.href='"+ApplicationConfig.LoginPage+"';</script>");
        }
    }

    public static void setServletRequest(HttpServletRequest request) {
        session = request.getSession();
        session.setMaxInactiveInterval(ApplicationConfig.GetMaxInactiveInterval());
    }
    
    public static String getSessionString(String arg)
    {
    	return (String) session.getAttribute(arg);
    }

    
}
