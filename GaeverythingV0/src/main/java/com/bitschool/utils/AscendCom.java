package com.bitschool.utils;

import java.util.Comparator;

import com.bitschool.dto.LocationDTO;

public class AscendCom implements Comparator<LocationDTO>{

	@Override
	public int compare(LocationDTO o1, LocationDTO o2) {
		// TODO Auto-generated method stub
		double temp = Double.parseDouble(o1.getRadius()) - Double.parseDouble(o2.getRadius());
		if(temp>0){
			return 1;
		}else{
			return -1;
		}
	}

}
