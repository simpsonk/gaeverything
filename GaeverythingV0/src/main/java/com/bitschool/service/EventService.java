package com.bitschool.service;



import java.sql.SQLException;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.bitschool.dao.EventDAO;
import com.bitschool.dto.EventDTO;
import com.bitschool.dto.EventSearchDTO;

@Service
public class EventService {
	
	@Inject
	private EventDAO eDAO;

	public List<EventDTO> getAllLists() {
		List<EventDTO> list = null;
		try {
			list = eDAO.readAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public List<EventDTO> searchEvent(EventSearchDTO sDTO) {
		List<EventDTO> list = null;
		try {
			list = eDAO.getSearchResult(sDTO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
