package com.bitschool.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
			if((list.get(i).getRepeatdata())==null){
				c = new CalendarFormat();
				c.setId(list.get(i).getId());
				c.setTitle(list.get(i).getTitle());
				c.setStart(list.get(i).getStart());
				c.setEnd(list.get(i).getEnd());
				c.setColor(colorType[list.get(i).getDogid()]);
				c.setSeq(list.get(i).getSeq());
				calendar.add(c);
			}else{
				String repeat = list.get(i).getRepeatdata();
				String[] repeatSplit = repeat.split(",");
				int week = Integer.parseInt(repeatSplit[0]);
				String startA = list.get(i).getStart();
				String[] startB = startA.split("T");
				try {
					DateFormat dateF = new SimpleDateFormat("yyyy-MM-dd");
					Date date = dateF.parse(startB[0]);
					DateFormat dateF2 = new SimpleDateFormat("yyyy-ww-E");
					String dateS = dateF2.format(date);
					String[] dateArray = dateS.split("-");
					int dateInt = Integer.parseInt(dateArray[1]);
					for (int k = 0; k < 100; k++) {
						for(int h=1;h<repeatSplit.length;h++){
							String dateFinal = dateArray[0] + "-" + dateInt + "-" + repeatSplit[h];
							System.out.println(dateFinal);
							Date date2 = dateF2.parse(dateFinal);
							String dateFinal2 = dateF.format(date2);
							c = new CalendarFormat();
							c.setId(list.get(i).getId());
							c.setTitle(list.get(i).getTitle());
							c.setStart(dateFinal2+"T00:00");
							c.setEnd(dateFinal2+"T00:00");
							c.setColor(colorType[list.get(i).getDogid()]);
							c.setSeq(list.get(i).getSeq());
							calendar.add(c);
						}
						dateInt += week;
					}
				} catch (ParseException ex) {
					ex.printStackTrace();
				}
				
			}
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
