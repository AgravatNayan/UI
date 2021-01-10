package Utility;

import java.util.concurrent.TimeUnit;

import com.squareup.okhttp.MediaType;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.RequestBody;
import com.squareup.okhttp.Response;

public class APICall {
  public static String CallAPI(String action,String request_data)
  {
	  String Result="";
	  String req_url = ApplicationConfig.getConfig("REQ_URL");
	  int timeout=0;
	  try {
		  timeout =  Integer.parseInt(ApplicationConfig.getConfig("TIMEOUT"));
		  if(timeout <= 0 ) {
			  timeout = 60000;
		  }
	  }catch (Exception e) {
		 timeout = 60000;
	}
	  try {
			  OkHttpClient client = new OkHttpClient();
		
				MediaType mediaType = MediaType.parse("application/json");
				RequestBody body = RequestBody.create(mediaType, request_data);
				Request request1 = new Request.Builder()
				  .url(req_url)
				  .post(body)
				  .addHeader("content-type", "application/json")
				  .addHeader("cache-control", "no-cache")
				  .addHeader("action", action)
				  .build();
				client.setConnectTimeout(timeout, TimeUnit.MILLISECONDS);
				Response response1 = client.newCall(request1).execute();
				if(response1.isSuccessful())
				{
					Result = response1.body().string();
					
				}
				else {
					System.out.println("Request URL : "+req_url+"/"+action+"\nResponse Code : " +response1.code());
					Result=ApplicationConfig.ErrorResponse.replace("$ERROR_MSG$","Error Calling Api (status : "+response1.code()+").");
				}
				response1.body().close();
				//System.out.println("response1.message() :"+response1.message());
											
	  }catch(Exception e)
	  {
		  System.out.println("API Call Error : "+e);
		  Result=ApplicationConfig.ErrorResponse.replace("$ERROR_MSG$",e.getMessage().replaceAll("\"",""));
	  }
	  return Result;
  }
}