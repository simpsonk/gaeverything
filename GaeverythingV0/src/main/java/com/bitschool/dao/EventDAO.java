package com.bitschool.dao;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bitschool.dto.EventDTO;

@Repository
public class EventDAO {
	
	@Inject
	private SqlSession session;
	
	public static String namespace = "com.bitschool.Event.EventMapper";

	public List<EventDTO> readAll()  throws SQLException {
		List<EventDTO> list = session.selectList(namespace+".readAll");		
		return list;
	}
	
	

}
