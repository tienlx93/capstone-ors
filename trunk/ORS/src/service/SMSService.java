package service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

/**
 * Created by Tuan on 7/21/2015.
 */
public class SMSService {
    final String APIKey="9FA68980299951A7F08EEED9E813D5";//Dang ky tai khoan tai esms.vn de lay Key
    final String SecretKey="6980B3A2E203899567552DE2717FB5";
    private String message;
    private String phone;


    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String execute() {

        return "SUCCESS";

    }

    public String send() throws IOException {

        String url = "http://api.esms.vn/MainService.svc/xml/SendMultipleMessage_V2/";

        URL obj;
        try {
            obj = new URL(url);

            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            //you need to encode ONLY the values of the parameters
            String customers = "";

            String[] lstPhone = phone.split(",");

            for (int i = 0; i < lstPhone.length; i++)
            {
                customers = customers + "<CUSTOMER>"
                        + "<PHONE>" + lstPhone[i].replace(" ", "") + "</PHONE>"
                        + "</CUSTOMER>";
            }

            //Nếu gửi không dấu thì ko cần encode message và UNICODE=0
            //Nếu gửi không dấu thì 160 ký tự 1 tin
            String SampleXml = "<RQST>"
                    + "<APIKEY>" + APIKey + "</APIKEY>"
                    + "<SECRETKEY>" + SecretKey + "</SECRETKEY>"
                    + "<ISFLASH>0</ISFLASH>"
                    + "<UNICODE>0</UNICODE>"
                    + "<SMSTYPE>7</SMSTYPE>"
                    + "<CONTENT>" + message + "</CONTENT>"
                    + "<CONTACTS>" + customers + "</CONTACTS>"
                    + "</RQST>";
            //Nếu gửi có dấu thì phải encode về UTF-8 và replace dấu + thành %20 và UNICODE=1
            //Tuy nhiên gửi có dấu thì độ dài 1 tin nhắn sẽ là 70 ký tự 1 tin, nên cân nhắc chi phí
//            String SampleXml = "<RQST>"
//                    + "<APIKEY>" + APIKey + "</APIKEY>"
//                    + "<SECRETKEY>" + SecretKey + "</SECRETKEY>"
//                    + "<ISFLASH>0</ISFLASH>"
//                    + "<UNICODE>1</UNICODE>"
//                    + "<CONTENT>" + URLEncoder.encode(message,"UTF-8").replace("+", "%20") + "</CONTENT>"
//                    + "<CONTACTS>" + customers + "</CONTACTS>"
//                    + "</RQST>";



            String postData = SampleXml.trim();

            con.setDoOutput(true);
            con.setRequestMethod("POST");

            con.setFixedLengthStreamingMode(postData.getBytes().length);
            con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            //send the POST out
            PrintWriter out = new PrintWriter(con.getOutputStream());
            out.print(postData);
            out.close();


            int responseCode = con.getResponseCode();
            System.out.println("\nSending 'GET' request to URL : " + url);
            System.out.println("Response Code : " + responseCode);
            if(responseCode==200)//Đã gọi URL thành công, tuy nhiên bạn phải tự kiểm tra CodeResult xem tin nhắn có gửi thành công không, vì có thể tài khoản bạn không đủ tiền thì sẽ thất bại
            {
                //Check CodeResult from response
            }
            //Đọc Response
            BufferedReader in = new BufferedReader(
                    new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            //print result
            System.out.println(response.toString());
        } catch (MalformedURLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "SUCCESS";

    }
}
