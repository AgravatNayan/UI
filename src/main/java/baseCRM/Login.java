package baseCRM;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import Utility.APICall;
import Utility.ApplicationConfig;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
		rs.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String result="";
		String ls_status = null;		
		String username = request.getParameter("USERNAME");
		String password = request.getParameter("PASSWORD");
		HttpSession session=request.getSession();
		JSONObject jOutput = new JSONObject();
		try {
			
			jOutput.put("USERNAME",username);
			jOutput.put("PASSWORD",password);
			jOutput.put("REQUEST_IP",request.getRemoteAddr());
			if("N".equalsIgnoreCase(ApplicationConfig.ApiConnect))
				result=ApplicationConfig.TestingRes;
			else
				result=APICall.CallAPI("LOGINREQ",jOutput.toString());
			System.out.println("Result:"+result);
			
			JSONArray jArrayIn = null;
			JSONObject Jin = new JSONObject(result);								
			ls_status = Jin.getString("STATUS_CD");					
			if (ls_status.equals("0")) {
				jArrayIn = Jin.getJSONArray("RESPONSE");
				if(jArrayIn.length() > 0)
				{
					JSONObject JObj =(JSONObject) jArrayIn.get(0);
					username = JObj.getString("USER_ID");
					String comp_cd = JObj.getString("COMP_CD");
					String user_img="";
					String activity_cd = "";
					try {
						user_img="data:image/png;base64,"+JObj.getString("USER_PHOTO");
					} catch (Exception e) {
						user_img="";
					}
					try {
						activity_cd=JObj.getString("ACTIVITY_CD");
					} catch (Exception e) {
						activity_cd="";
					}
					session.setAttribute("logon","true");
					session.setAttribute("USER_ID",username);
					session.setAttribute("COMP_CD",comp_cd);
					session.setAttribute("USER_PHOTO",user_img);
					session.setAttribute("ACTIVITY_CD",activity_cd);
					session.setAttribute("MENU",JObj.get("MENU"));
					
				}
				JSONObject jout=new JSONObject();
				jout.put("STATUS_CD","0");
				jout.put("MESSAGE","<script>window.location.href='main';</script>");
				result = jout.toString();
				
			}
			
		} catch (JSONException e) {
			System.out.println("login error:"+e+" Response :"+result);
			result=ApplicationConfig.ErrorResponse.replaceAll("$ERROR_MSG$",e.getMessage().replaceAll("\"",""));
			response.sendError(500,"Internal error : "+e.getMessage());
		}
		
		///System.out.println("Final Result : "+result);
		response.getWriter().print(result);
		
		//response.getWriter().print(result);
		// TODO Auto-generated method stub
		
		/*String ls_response = null; 
		String ls_status = null;
		
		String username = request.getParameter("userName");
		String password = request.getParameter("password");
		
		JSONObject jInput = new JSONObject();
		try {
			jInput.put("username", username);
			jInput.put("password", password);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
					
		OkHttpClient client = new OkHttpClient();

		MediaType mediaType = MediaType.parse("application/json");
		RequestBody body = RequestBody.create(mediaType, "{\r\n  \"username\": \""+username+"\",\r\n  \"password\": \""+password+"\"\r\n}");
		Request request1 = new Request.Builder()
		  .url("http://localhost:9096/crm/login")
		  .post(body)
		  .addHeader("content-type", "application/json")
		  .addHeader("cache-control", "no-cache")
		  .addHeader("postman-token", "ee2aca99-43ad-e862-2a6e-2042091f3fc8")
		  .build();

		Response response1 = client.newCall(request1).execute();
		
		String ls_data = response1.body().string();
		
		
		JSONObject jOutput = null;		
		try {
			jOutput = new JSONObject(ls_data);
			ls_response = jOutput.getString("RESPONSE"); 
			ls_status = jOutput.getString("STATUS_CD");
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		if (ls_status.equals("000")) {		
//			RequestDispatcher rs = request.getRequestDispatcher("baseCRM.jsp");			
//			rs.include(request, response);			
			
			
			response.sendRedirect("https://www.google.com");
		}
		
		if (ls_status.equals("999")) {						
			try {
				ls_status = jOutput.getString("ERROR_MSG");
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
			request.setAttribute("ERROR_MSG", ls_status);
			rs.include(request, response);			 
		}*/
	}
}
