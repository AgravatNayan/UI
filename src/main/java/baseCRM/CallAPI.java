package baseCRM;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
public class CallAPI {
	    public static void main(String[] args) throws IOException {

	        // Create a neat value object to hold the URL
	    	String POST_PARAMS="";
	        URL url = new URL("https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY");

	        // Open a connection(?) on the URL(?) and cast the response(??)
	        HttpURLConnection postConnection = (HttpURLConnection) url.openConnection();
	        
	        postConnection.setRequestMethod("POST");
	        postConnection.setRequestProperty("userId", "a1bcdefgh");
	        postConnection.setRequestProperty("Content-Type", "text/xml");
	        postConnection.setDoOutput(true);
	        
	        OutputStream os = postConnection.getOutputStream();
	        os.write(POST_PARAMS.getBytes());
	        os.flush();
	        os.close();
	        int responseCode = postConnection.getResponseCode();
	        System.out.println("POST Response Code :  " + responseCode);
	        System.out.println("POST Response Message : " + postConnection.getResponseMessage());
	        // This line makes the request
	        InputStream responseStream = postConnection.getInputStream();

	        BufferedReader in = new BufferedReader(new InputStreamReader(postConnection.getInputStream()));
	        StringBuffer response = new StringBuffer();
	        String readLine;
	        while ((readLine = in .readLine()) != null) {
	        	response.append(readLine);
	        }
	        in .close();
	        // Finally we have the response
	        System.out.println("Response => "+response.toString());

	    }

	}
