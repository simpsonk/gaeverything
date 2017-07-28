package com.bitschool.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class GetData {
	public static String getData(){
		BufferedReader bufferedReader = null;
		String resultSet = null;		
		String requestUrl = "https://dapi.kakao.com/v2/local/search/keyword.json?query=성북구 동물병원&page=2&appkey=ebfbfbd7a5ec71c10c63936dd90beb22&size=15";
		try {
			URL url = new URL(requestUrl);
			URLConnection conn = url.openConnection();
			bufferedReader = new BufferedReader(new InputStreamReader(conn.getInputStream()));		
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try{
				bufferedReader.close();
			}catch(IOException e){
				
			}
			
		}		
		return resultSet;
	}
	
	public static String parseJSONData(BufferedReader bufferedReader){
		String resultSet = null;
		
		try {
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject)jsonParser.parse(bufferedReader);
			resultSet = jsonObject.toJSONString();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}			
		return resultSet;
	}
}
