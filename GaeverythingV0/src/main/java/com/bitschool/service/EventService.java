package com.bitschool.service;



import java.sql.SQLException;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.bitschool.dao.EventDAO;
import com.bitschool.dto.ActUserDTO;
import com.bitschool.dto.BoardDTO;
import com.bitschool.dto.EventDTO;
import com.bitschool.dto.EventSearchDTO;
import com.bitschool.dto.LocationDTO;
import com.bitschool.utils.ActUserManager;

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

	public EventDTO readOne(int eventNo) {
		EventDTO detail = null;
		try {
			detail = eDAO.getOneEvent(eventNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return detail;
	}
	
	
	/*public int countReviews(int eventNo){
		int count = 0;
		try {
			count = eDAO.countReviews(eventNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}*/
	
	/*public List<Double> getRatings(int eventNo){
		List<Double> ratings = null;
		try {
			ratings = eDAO.getRatings(eventNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ratings;
	}*/	
	
	
}
