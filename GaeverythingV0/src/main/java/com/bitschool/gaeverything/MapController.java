package com.bitschool.gaeverything;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitschool.dto.LocationDTO;
import com.bitschool.dto.MapInfomation;
import com.bitschool.service.LocationService;
import com.bitschool.service.PageService;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;


@RequestMapping(value = "map")
@Controller
public class MapController {
	
	@Inject
	private LocationService service;
	
	@Inject
	private PageService pService;
	
	@RequestMapping(value = "/viewMapList", method = RequestMethod.GET)
	public String viewMapList(HttpServletRequest request){
		String url = "map/map_list";
		return url;
	}
	
	@RequestMapping(value = "getLocationData", method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody HashMap<String, Object> getLocationData(
			@RequestParam(value = "searchWord", defaultValue = "") String searchWord,
			@RequestParam(value = "categories", defaultValue = "5 449 776") String categories,
			@RequestParam("level") int level,
			@RequestParam("lat") double lat,
			@RequestParam("lon") double lon,
			@RequestParam(value = "option", defaultValue = "0") int option
			){
		MapInfomation info = new MapInfomation(searchWord, categories, level, lat, lon, option);
		List<LocationDTO> list = service.getData(info);
		HashMap<String, Object> map = pService.makeSerachList(0, 5, list);
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("places", list);
		data.put("pList", map.get("pList"));
		data.put("infoList", map.get("infoList"));
		return data;
	}
	
	@RequestMapping(value = "getPagingData", method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody HashMap<String, Object> getPagingData(@RequestParam("data") String locData, @RequestParam("page") int page){
		HashMap<String, Object> data = new HashMap<String, Object>();
		ObjectMapper mapper = new ObjectMapper();
		List<LocationDTO> list = null;
		HashMap<String, Object> map = null;
		try {
			list = mapper.readValue(locData, new TypeReference<List<LocationDTO>>(){});
			map = pService.makeSerachList(page, 5, list);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		data.put("places", list);
		data.put("pList", map.get("pList"));
		data.put("infoList", map.get("infoList"));
		System.out.println(locData+":"+page);
		System.out.println(locData);
		return data;
	}
	
	@RequestMapping(value = "homeSearchResult", method = RequestMethod.POST)
	public String homeSearchResult(@RequestParam(value = "searchWord") String word, @RequestParam(value = "searchOption") String option,
			Model model){
		String url = "map/map_list";
		model.addAttribute("word", word);
		model.addAttribute("option", option);
		return url;
	}
	
	@RequestMapping(value = "viewDetailpage", method = RequestMethod.GET)
	public String viewDetailpage(){
		String url = "map/map_detailpage";
		return url;
	}

}
