package com.bitschool.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.CalendarDAO;
import com.bitschool.dto.CalendarDTO;
import com.bitschool.dto.CalendarFormat;

@Service
public class CalendarService{

	@Inject
	private CalendarDAO dao;
	
	public List<CalendarDTO> listCalendarAll() {
		// TODO Auto-generated method stub
		List<CalendarDTO> list = null;
		list = dao.selectAll();
		return list;
	}

	public boolean registCalendar(CalendarDTO dto) {
		// TODO Auto-generated method stub
		boolean flag = false;
		flag = dao.insert(dto);
		return flag;
	}
	
	public CalendarDTO readCalendar(Integer seq){
		CalendarDTO dto = null;
		dto = dao.select(seq);
		return dto;
	}

	public List<CalendarFormat> jsonAll() {
		// TODO Auto-generated method stub
		List<CalendarDTO> list = dao.selectAll();
		List<CalendarFormat> calendar = new ArrayList<CalendarFormat>();
		CalendarFormat c = null;
		String[] colorType = {"#0045C6","#A20082","#C40000","#F5A9A9"};
		for(int i=0;i<list.size();i++){
			c = new CalendarFormat();
			c.setId(list.get(i).getId());
			c.setTitle(list.get(i).getTitle());
			c.setStart(list.get(i).getStart());
			c.setEnd(list.get(i).getEnd());
			c.setColor(colorType[list.get(i).getDogid()]);
			c.setSeq(list.get(i).getSeq());
			calendar.add(c);
		}
		return calendar;
	}

	public boolean modifyCalendar(CalendarDTO dto) {
		// TODO Auto-generated method stub
		boolean flag = false;
		flag = dao.update(dto);
		return flag;
	}

	public boolean removeCalendar(Integer seq) {
		// TODO Auto-generated method stub
		boolean flag = false;
		flag = dao.delete(seq);
		return flag;
	}

}
