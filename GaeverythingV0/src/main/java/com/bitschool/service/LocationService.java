package com.bitschool.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.bitschool.dao.LocationDAO;
import com.bitschool.dto.LocationDTO;
import com.bitschool.dto.MapInfomation;
import com.bitschool.utils.AscendCom;

@Service
public class LocationService {
	@Inject
	private SqlSession session;
	
	@Inject
	private LocationDAO dao;
	
	private final static String namespace = "com.bitschool.bootstrap.LocationMapper";
	
	public boolean insert(List<LocationDTO> myObjects) {
		// TODO Auto-generated method stub
		boolean flag = false;
		int cnt = 0;
		for(int i=0;i<myObjects.size();i++){
			cnt = session.insert(namespace+".insert", myObjects.get(i));
		}
		if(cnt>0){
			flag = true;
		}
		return flag;
	}

	public List<LocationDTO> getData(MapInfomation info) {
		// TODO Auto-generated method stub
		List<LocationDTO> list  = null;
		List<LocationDTO> levelList = null;
		try {
			if(info.getOption()==0&&info.getSearchWord().equals("")){
				list = dao.selectAll();
			}else if(info.getOption()==1){
				list = dao.selectShopName(info);
			}else if(info.getOption()==2){
				list = dao.selectLocation(info);
			}
			levelList = this.levelEffect(info, list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return levelList;
	}
	
	
	
	public List<LocationDTO> levelEffect(MapInfomation info, List<LocationDTO> list){
		double[] distances = {0.8, 1.6, 2.5, 6, 10, 30, 50};
		AscendCom asc = new AscendCom();
		int index;
		
		if(info.getLevel()<4){
			index = 0;
		}else if(info.getLevel()>10){
			return list;
		}else{
			index = info.getLevel()-4;
		}
		List<LocationDTO> levelList = new ArrayList<LocationDTO>();
		double startLat = info.getLat();
		double startLon = info.getLon();
		
		for(int i=0;i<list.size();i++){
			LocationDTO temp = list.get(i);
			double endLat = Double.parseDouble(temp.getLatitude());
			double endLon = Double.parseDouble(temp.getLongitude());
			double radius = this.distanceCalcu(startLat, startLon, endLat, endLon, "kilometer");
			temp.setRadius(radius);
			
			if(!(radius>distances[index])){
				levelList.add(temp);
				System.out.println(radius);
			}
		}
		Collections.sort(levelList, asc);
		System.out.println(levelList);
		return levelList;
	}
	
	private double distanceCalcu(double lat1, double lon1, double lat2, double lon2, String unit) {
        
        double theta = lon1 - lon2;
        double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
         
        dist = Math.acos(dist);
        dist = rad2deg(dist);
        dist = dist * 60 * 1.1515;
         
        if (unit == "kilometer") {
            dist = dist * 1.609344;
        } else if(unit == "meter"){
            dist = dist * 1609.344;
        }
        return (dist);
    }
     
 
    // This function converts decimal degrees to radians
    private double deg2rad(double deg) {
        return (deg * Math.PI / 180.0);
    }
     
    // This function converts radians to decimal degrees
    private double rad2deg(double rad) {
        return (rad * 180 / Math.PI);
    }
    
    public List<LocationDTO> levelEffect1(MapInfomation info, List<LocationDTO> list){
		List<LocationDTO> levelList = new ArrayList<LocationDTO>();
		double earthRad = 6371;
		double startLat = info.getLat();
		double startLon = info.getLon();
		
		for(int i=0;i<list.size();i++){
			LocationDTO temp = list.get(i);
			double endLat = Double.parseDouble(temp.getLatitude());
			double endLon = Double.parseDouble(temp.getLongitude());
			
			double x = (Math.cos(startLon)*earthRad*2*Math.PI/360)*Math.abs(startLat-endLat);
			double y = (earthRad*2*Math.PI/360)*Math.abs(startLon-endLon);
			
			double distance = Math.sqrt((Math.pow(2, x)+Math.pow(2, y)));
			if(!(distance>0.8)){
				levelList.add(temp);
				System.out.println(distance);
			}
		}
		return levelList;
	}

	public List<LocationDTO> getSearchData(MapInfomation info) {
		// TODO Auto-generated method stub
		List<LocationDTO> list = null;
		try {
			list = dao.selectShopName(info);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}


}