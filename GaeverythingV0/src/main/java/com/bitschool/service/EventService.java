package com.bitschool.service;



import java.sql.SQLException;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.bitschool.dao.EventDAO;
import com.bitschool.dto.EventDTO;

@Service
public class EventService {
	
	@Inject
	private EventDAO eDAO;

	public List<EventDTO> getAllLists() {
		List<EventDTO> list = null;
		try {
			list = eDAO.readAll();
			System.out.println("서비스 리스트개수:" + list.size());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
