package com.bitschool.dao;

import java.nio.channels.SelectableChannel;
import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bitschool.dto.EventDTO;
import com.bitschool.dto.EventSearchDTO;

@Repository
public class EventDAO {
	
	@Inject
	private SqlSession session;
	
	public static String namespace = "com.bitschool.Event.EventMapper";

	public List<EventDTO> readAll()  throws SQLException {
		List<EventDTO> list = session.selectList(namespace+".readAll");		
		System.out.println("�ٿ����:" + list.size());
		return list;
	}

	public List<EventDTO> getSearchResult(EventSearchDTO sDTO)  throws SQLException{
		List<EventDTO> list = session.selectList(namespace+".search", sDTO);
		System.out.println("검색결과 수:" + list.size());
		return list;
	}
	
	

}
