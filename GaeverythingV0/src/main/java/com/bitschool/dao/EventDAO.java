package com.bitschool.dao;

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
		return list;
	}

	public List<EventDTO> getSearchResult(EventSearchDTO sDTO)  throws SQLException{
		List<EventDTO> list = session.selectList(namespace+".search", sDTO);
		return list;
	}

	public EventDTO getOneEvent(int eventNo) throws SQLException {
		EventDTO detail = session.selectOne(namespace+".getOne", eventNo);
		//System.out.println("이벤트 디테일ok");
		return detail;
	}
	
	

}
