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
import com.bitschool.dao.EventDAO;
import com.bitschool.dao.LocationDAO;
import com.bitschool.dao.PetPageDAO;
import com.bitschool.dto.BookCalendarDTO;
import com.bitschool.dto.BookEventCalendarDTO;
import com.bitschool.dto.CalendarDTO;
import com.bitschool.dto.CalendarFormat;
import com.bitschool.dto.EventDTO;
import com.bitschool.dto.LocationDTO;

@Service
public class CalendarService{

	@Inject
	private CalendarDAO dao;
	
	@Inject
	private LocationDAO ldao;
	
	@Inject
	private CalendarDAO Cdao;
	
	@Inject
	private EventDAO Edao;
	
	
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
		String[] colorType = {"#37b6bd","#b3c211","#ffb400","#f91941", "#fa5b0f"};
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
				}else if(list.get(i).getDogid()==1){
					EventDTO Edto;
					try {
						
						Edto = Edao.getOneEvent(list.get(i).getEventNo());
						
						c.setLongitude(Edto.getLongitude());
						c.setLatitude(Edto.getLatitude());
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				calendar.add(c);
				System.out.println(calendar.toString());
			}else{
				String repeat = list.get(i).getRepeatdata();
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
	
	public boolean bookingAdd(BookCalendarDTO dto,String email){
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			LocationDTO Ldto = ldao.selectLocationSeq(dto.getLocationSeq());
			CalendarDTO Cdto = new CalendarDTO();
			Cdto.setId(email);
			Cdto.setDogid(0);
			Cdto.setTitle("병원예약");//병원, 카페에 따라 다르게
			Cdto.setPlace(Ldto.getTitle());
			Cdto.setStartDate(dto.getBookDate());
			String time = dto.getBookTime();
			String[] times = time.split(" ");
			String resultStart = null;
			String resultEnd = null;
			if(times[1].equals("pm")){
				String[] fTimes = times[0].split(":");
				int fTime = Integer.parseInt(fTimes[0])+12;
				resultStart = fTime+":"+fTimes[1];
				resultEnd = (fTime+2)+":"+fTimes[1];
			}else{
				String[] fTimes = times[0].split(":");
				int fTime = Integer.parseInt(fTimes[0]);
				resultStart = fTime+":"+fTimes[1];
				resultEnd = (fTime+2)+":"+fTimes[1];
			}
			Date date;
			try {
				DateFormat dateS = new SimpleDateFormat("H:mm");
				date = dateS.parse(resultStart);
				DateFormat dateE = new SimpleDateFormat("HH:mm");
				resultStart = dateE.format(date);
				date = dateS.parse(resultEnd);
				resultEnd = dateE.format(date);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Cdto.setStartTime(resultStart);
			Cdto.setEndDate(dto.getBookDate());
			Cdto.setEndTime(resultEnd);
			Cdto.setMessage(null);
			Cdto.setLocationseq(dto.getLocationSeq());
			flag = Cdao.insert2(Cdto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	public boolean bookingAdd2(BookEventCalendarDTO dto,String email){
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			EventDTO Edto = Edao.getOneEvent(dto.getEventNo());
			CalendarDTO Cdto = new CalendarDTO();
			Cdto.setId(email);
			Cdto.setDogid(1);
			Cdto.setTitle(Edto.getEventName());
			Cdto.setPlace(Edto.getLocation());
			Cdto.setStartDate(dto.getBookDate());
			String time = dto.getBookTime();
			String[] times = time.split(" ");
			String resultStart = null;
			String resultEnd = null;
			if(times[1].equals("pm")){
				String[] fTimes = times[0].split(":");
				int fTime = Integer.parseInt(fTimes[0])+12;
				resultStart = fTime+":"+fTimes[1];
				resultEnd = (fTime+2)+":"+fTimes[1];
				System.out.println(fTimes[0]+"      "+fTimes[1]);
			}else{
				String[] fTimes = times[0].split(":");
				int fTime = Integer.parseInt(fTimes[0]);
				resultStart = fTime+":"+fTimes[1];
				resultEnd = (fTime+2)+":"+fTimes[1];
			}
			Date date;
			try {
				DateFormat dateS = new SimpleDateFormat("H:mm");
				date = dateS.parse(resultStart);
				DateFormat dateE = new SimpleDateFormat("HH:mm");
				resultStart = dateE.format(date);
				date = dateS.parse(resultEnd);
				resultEnd = dateE.format(date);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Cdto.setStartTime(resultStart);
			Cdto.setEndDate(dto.getBookDate());
			Cdto.setEndTime(resultEnd);
			Cdto.setMessage(null);
			Cdto.setEventNo(dto.getEventNo());
			flag = Cdao.insert3(Cdto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	public boolean bookingAddNearby(int eventNo, String startDate, int locationSeq, String email) {
		boolean flag = false;
		try {
			LocationDTO Ldto = ldao.selectLocationSeq(locationSeq);
			CalendarDTO Cdto = new CalendarDTO();
			Cdto.setId(email);
			Cdto.setDogid(1);
			Cdto.setTitle(Ldto.getTitle());//병원, 카페에 따라 다르게
			Cdto.setPlace(Ldto.getTitle());
			Cdto.setStartDate(startDate);

			Cdto.setStartTime("00:00");
			Cdto.setEndDate(startDate);
			Cdto.setEndTime("00:00");
			Cdto.setMessage(null);
			Cdto.setLocationseq(Ldto.getLocationSeq());
			flag = Cdao.insert2(Cdto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public boolean bookingEvent(int eventNo, String startDate, String eventName, String address, String email) {
		boolean flag = false;
		//LocationDTO Ldto = ldao.selectLocationSeq(locationSeq);
		CalendarDTO Cdto = new CalendarDTO();
		Cdto.setId(email);
		Cdto.setDogid(1);
		Cdto.setTitle(eventName);//병원, 카페에 따라 다르게
		Cdto.setPlace(address);
		Cdto.setStartDate(startDate);
		Cdto.setStartTime("10:00");
		Cdto.setEndDate(startDate);
		Cdto.setEndTime("00:00");
		Cdto.setMessage(null);
		Cdto.setLocationseq(eventNo);
		flag = Cdao.insert2(Cdto);
		return flag;
	}
}
