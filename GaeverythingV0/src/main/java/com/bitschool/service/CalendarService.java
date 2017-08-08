package com.bitschool.service;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.CalendarDAO;
import com.bitschool.dao.LocationDAO;
import com.bitschool.dto.CalendarDTO;
import com.bitschool.dto.CalendarFormat;
import com.bitschool.dto.LocationDTO;

@Service
public class CalendarService{

	@Inject
	private CalendarDAO dao;
	
	@Inject
	private LocationDAO ldao;
	
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

	public List<CalendarFormat> jsonAll(String id) {
		// TODO Auto-generated method stub
		List<CalendarDTO> list = dao.selectId(id);
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
				c.setSeq(list.get(i).getCalendarseq());
				if(list.get(i).getDogid()==0){
					LocationDTO ldto;
					try {
						ldto = ldao.selectLocationSeq(list.get(i).getLocationseq());
						c.setLongitude(ldto.getLongitude());
						c.setLatitude(ldto.getLatitude());
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				calendar.add(c);
			}else{
				String repeat = list.get(i).getRepeatdata();
				//System.out.println(repeat);
				String[] repeatSplit = repeat.split(",");
				int dateForm = Integer.parseInt(repeatSplit[0]);
				if(dateForm==1){
					String startA = list.get(i).getStart();
					String[] startB = startA.split("T");
					try {
						DateFormat dateF = new SimpleDateFormat("yyyy-MM-dd");
						Date date = dateF.parse(startB[0]);
						DateFormat dateF2 = new SimpleDateFormat("yyyy-D");
						String dateS = dateF2.format(date);
						String[] dateArray = dateS.split("-");
						int dateInt = Integer.parseInt(dateArray[1]);
						for (int k = 0; k < 100; k++) {
								String dateFinal = dateArray[0] + "-" + dateInt;
								Date date2 = dateF2.parse(dateFinal);
								String dateFinal2 = dateF.format(date2);
								c = new CalendarFormat();
								c.setId(list.get(i).getId());
								c.setTitle(list.get(i).getTitle());
								c.setStart(dateFinal2+"T00:00");
								c.setEnd(dateFinal2+"T00:00");
								c.setColor(colorType[list.get(i).getDogid()]);
								c.setSeq(list.get(i).getCalendarseq());
								calendar.add(c);
							dateInt += dateForm;
						}
					} catch (ParseException ex) {
						ex.printStackTrace();
					}
				}else if(dateForm==2){
					String startA = list.get(i).getStart();
					String[] startB = startA.split("T");
					try {
						DateFormat dateF = new SimpleDateFormat("yyyy-MM-dd");
						Date date = dateF.parse(startB[0]);
						DateFormat dateF2 = new SimpleDateFormat("yyyy-ww- E");
						String dateS = dateF2.format(date);
						String[] dateArray = dateS.split("-");
						int dateInt = Integer.parseInt(dateArray[1]);
						for (int k = 0; k < 100; k++) {
							for(int h=2;h<repeatSplit.length;h++){
								String dateFinal = dateArray[0] + "-" + dateInt + "-" + repeatSplit[h];
								Date date2 = dateF2.parse(dateFinal);
								String dateFinal2 = dateF.format(date2);
								c = new CalendarFormat();
								c.setId(list.get(i).getId());
								c.setTitle(list.get(i).getTitle());
								c.setStart(dateFinal2+"T00:00");
								c.setEnd(dateFinal2+"T00:00");
								c.setColor(colorType[list.get(i).getDogid()]);
								c.setSeq(list.get(i).getCalendarseq());
								calendar.add(c);
							}
							dateInt += dateForm;
						}
					} catch (ParseException ex) {
						ex.printStackTrace();
					}
				}else if(dateForm==3){
					
				}else if(dateForm==4){
					
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
