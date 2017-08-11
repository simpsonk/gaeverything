package com.bitschool.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bitschool.dto.CalendarDTO;

@Repository
public class CalendarDAO {
	
	private static final String namespace = "com.bitschool.gaverything.CalendarMapper";
	private static final Logger logger = LoggerFactory.getLogger(CalendarDAO.class);
	
	@Inject
	private SqlSession session;

	public List<CalendarDTO> selectId(String id) {
		// TODO Auto-generated method stub
		List<CalendarDTO> list = null;
		list = session.selectList(namespace+".selectId",id);
		return list;
	}
	
	public List<CalendarDTO> selectAll() {
		// TODO Auto-generated method stub
		List<CalendarDTO> list = null;
		list = session.selectList(namespace+".selectAll");
		return list;
	}
	
	public CalendarDTO select(Integer seq){
		CalendarDTO dto = null;
		dto = session.selectOne(namespace+".select",seq);
		return dto;
	}

	public boolean insert(CalendarDTO dto) {
		// TODO Auto-generated method stub
		boolean flag = false;
		int aCnt = session.insert(namespace+".insert",dto);
		if(aCnt>0){
			flag = true;
		}
		return flag;
	}
	public boolean insert2(CalendarDTO dto) {
		// TODO Auto-generated method stub
		boolean flag = false;
		int aCnt = session.insert(namespace+".insert2",dto);
		if(aCnt>0){
			flag = true;
		}
		return flag;
	}
	public boolean insert3(CalendarDTO dto) {
		// TODO Auto-generated method stub
		boolean flag = false;
		int aCnt = session.insert(namespace+".insert3",dto);
		if(aCnt>0){
			flag = true;
		}
		return flag;
	}

	public boolean update(CalendarDTO dto) {
		// TODO Auto-generated method stub
		boolean flag = false;
		int aCnt = session.update(namespace+".modify", dto);
		if(aCnt>0){
			flag = true;
		}
		return flag;
	}

	public boolean delete(Integer seq) {
		// TODO Auto-generated method stub
		boolean flag = false;
		int aCnt = session.delete(namespace+".delete",seq);
		if(aCnt>0){
			flag = true;
		}
		return flag;
	}

}
