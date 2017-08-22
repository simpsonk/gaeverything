package com.bitschool.gaeverything;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitschool.dto.BlogDTO;
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
	
	
	public List<BlogDTO> getBlogImage(){
		 String clientId = "LEq7OLCKz1iWikgbm3jr";//애플리케이션 클라이언트 아이디값";
	        String clientSecret = "pNcj27Jve1";//애플리케이션 클라이언트 시크릿값";
	        List<BlogDTO> list1 = service.selectBlog();
	        List<BlogDTO> list2 = null;
	       /* for(int i=0;i<list1.size();i++){
		        try {
		        	String title = null;
		        	String text = null;
		        	String apiURL = null;
		        	
		        		title = list1.get(i).getTitle();
		        		text = URLEncoder.encode(title, "UTF-8");
		        		apiURL = "https://openapi.naver.com/v1/search/image?query=\""+ text + "\""; // json 결과
		        		URL url = new URL(apiURL);
			            HttpURLConnection con = (HttpURLConnection)url.openConnection();
			            con.setRequestMethod("GET");
			            con.setRequestProperty("X-Naver-Client-Id", clientId);
			            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			            int responseCode = con.getResponseCode();
			            BufferedReader br;
			            if(responseCode==200) { // 정상 호출
			                br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
			            } else {  // 에러 발생
			                br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
			            }
			            String inputLine;
			            StringBuffer response = new StringBuffer();
			            while ((inputLine = br.readLine()) != null) {
			                response.append(inputLine);
			            }
			            br.close();
			            ObjectMapper mapper = new ObjectMapper();
			            HashMap<String,Object> map = null;
			            map = mapper.readValue(response.toString(),new TypeReference<HashMap<String,Object>>(){});
			            String itemdata = (String) mapper.writeValueAsString(map.get("items"));
			            System.out.println(itemdata);
		            	          
		         
		        } catch (Exception e) {
		            System.out.println(e);
		        }
	    	}      */
	        return list1;
	}
	@RequestMapping(value="/insertBlogImage", method=RequestMethod.GET)
	public String insertBlogData(){
		String url = null;
		List<BlogDTO> list = this.getBlogImage();
		return url;
	}
	
	
	//블로그 데이터 입력
	   public List<BlogDTO> GetBlogDatum() {
	        String clientId = "LEq7OLCKz1iWikgbm3jr";//애플리케이션 클라이언트 아이디값";
	        String clientSecret = "pNcj27Jve1";//애플리케이션 클라이언트 시크릿값";
	        List<LocationDTO> ldtolist = service.selectLocation();
	        List<BlogDTO> list = null;		
	        List<BlogDTO> lists = new ArrayList<BlogDTO>();
	        for(int i=0;i<ldtolist.size();i++){	
	        	LocationDTO ldto = ldtolist.get(i);					
		        try {
		            String text = URLEncoder.encode(ldto.getTitle(), "UTF-8");
		            String apiURL = "https://openapi.naver.com/v1/search/blog?query=\""+ text + "\""; // json 결과
		            //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
		            URL url = new URL(apiURL);
		            HttpURLConnection con = (HttpURLConnection)url.openConnection();
		            con.setRequestMethod("GET");
		            con.setRequestProperty("X-Naver-Client-Id", clientId);
		            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
		            int responseCode = con.getResponseCode();
		            BufferedReader br;
		            if(responseCode==200) { // 정상 호출
		                br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
		            } else {  // 에러 발생
		                br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
		            }
		            String inputLine;
		            StringBuffer response = new StringBuffer();
		            while ((inputLine = br.readLine()) != null) {
		                response.append(inputLine);
		            }
		            br.close();
		            //System.out.println(response.toString());
		            ObjectMapper mapper = new ObjectMapper();
		            HashMap<String,Object> map = null;
		            map = mapper.readValue(response.toString(),new TypeReference<HashMap<String,Object>>(){});
		            String itemdata = (String) mapper.writeValueAsString(map.get("items"));
		    		//System.out.println(itemdata);
		    		list = mapper.readValue(itemdata,new TypeReference<List<BlogDTO>>(){});
		    		for(int j=0;j<list.size();j++){
		    			list.get(j).setLocationSeq(ldto.getLocationSeq());
		    			if(list.get(j).getTitle().contains(ldto.getTitle())){
		    				lists.add(list.get(j));
		    			}
		    		}    		
		        } catch (JsonParseException e) {
					e.printStackTrace();
				} catch (JsonMappingException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
		    	
	        }
	        return lists;
	    }
	   
	   
	
	@RequestMapping(value="/insertBlogData", method=RequestMethod.GET)
	public String insertBlogData(BlogDTO dto){
		List<BlogDTO> list = this.GetBlogDatum();
		//System.out.println("insertBlogData / list : "+list);
		String url = null;
		boolean flag = false;
		for(int i=0;i<list.size();i++){
			flag = service.insertBlogData(list.get(i));
		}
		return url;
	}
	
	
	
	// 지도 데이터 넣는 방법 : 
	// "OO구 동물병원" /  page= 1,2,3 / substring 140~160 알아서 맞추기   
	// http://localhost:5050/data/insertData 
	
/*	public List<Location2DTO> GetDatum(){
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
    }  */      
	
	
	@RequestMapping(value="/insertData", method=RequestMethod.GET)
	public String insertData(LocationDTO dto){
		List<Location2DTO> list = this.GetDatum();
		String url = null;
		boolean flag = false;
		for(int i=0;i<list.size();i++){
			flag = service.insertEventData(list.get(i));
		}
		System.out.println(flag);
		return url;
	}
	
	public List<Location2DTO> GetDatum(){
    	List<Location2DTO> list = null;
        try {
            String text = URLEncoder.encode("광주 서구 공원", "UTF-8");      
            String apiURL = "https://dapi.kakao.com/v2/local/search/keyword.json?query="+text+"&page=2&appkey=ebfbfbd7a5ec71c10c63936dd90beb22&size=15";
           
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
	
	
	
}
