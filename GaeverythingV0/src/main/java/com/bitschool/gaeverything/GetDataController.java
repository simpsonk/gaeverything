package com.bitschool.gaeverything;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitschool.dto.Location2DTO;
import com.bitschool.dto.LocationDTO;
import com.bitschool.service.DataService;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;



@RequestMapping("/data")
@Controller
public class GetDataController {
	@Inject
	private DataService service;	
	
	//데이터 넣는 방법 : 
	// "OO구 동물병원" /  page= 1,2,3 / substring 140~160 알아서 맞추기   
	// http://localhost:5050/data/insertData 
	
	public List<Location2DTO> GetDatum(){
    	List<Location2DTO> list = null;
        try {
            String text = URLEncoder.encode("안양시 동물병원", "UTF-8");      
            String apiURL = "https://dapi.kakao.com/v2/local/search/keyword.json?query="+text+"&page=3&appkey=ebfbfbd7a5ec71c10c63936dd90beb22&size=15";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            BufferedReader br;  
            br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));    
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            System.out.println("response.toString() : "+response.toString());
            String data = response.toString();
            String docudata = data.substring(144, data.length()-1);
            System.out.println("docudata : "+docudata);
    		ObjectMapper mapper = new ObjectMapper();  
    		try {
    			list = mapper.readValue(docudata, new TypeReference<List<Location2DTO>>(){});
    			Location2DTO ldto = list.get(0);
    			System.out.println("list : "+list);
    			System.out.println("ldto : "+ldto);
    		} catch (JsonParseException e) {
    			e.printStackTrace();
    		} catch (JsonMappingException e) {
    			e.printStackTrace();
    		} catch (IOException e) {
    			e.printStackTrace();
    		}
            
        } catch (Exception e) {
            System.out.println(e);
        } 
        System.out.println();
        return list;
    }        
	
	
	@RequestMapping(value="/insertData", method=RequestMethod.GET)
	public String insertData(LocationDTO dto){
		List<Location2DTO> list = this.GetDatum();
		System.out.println("insertData / list : "+list);
		String url = null;
		boolean flag = false;
		for(int i=0;i<list.size();i++){
			flag = service.insertData(list.get(i));
		}
		System.out.println(flag);
		return url;
	}
}
