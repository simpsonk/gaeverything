package com.bitschool.dao;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bitschool.dto.BlogDTO;
import com.bitschool.dto.Location2DTO;
import com.bitschool.dto.LocationDTO;


@Repository
public class DataDAO {
	@Inject
	private SqlSession session;
	
	private final static String namespace = "com.bitschool.bootstrap.DataMapper";
	
	//블로그 데이터 불러오기
	public List<BlogDTO> selectBlog() throws SQLException{
		List<BlogDTO> list = null;
		list = session.selectList(namespace+".selectBlog");
		return list;
	}
	
	
	public List<LocationDTO> selectLocation() throws SQLException{
		List<LocationDTO> list = null;
		list = session.selectList(namespace+".selectLocation");
		return list;
	}
	
	public boolean insertData(Location2DTO dto) throws SQLException{
		// TODO Auto-generated method stub
		boolean flag = false;
		int aCnt = session.insert(namespace+".insert",dto);
		if(aCnt>0){
			flag = true;
		}
		return flag;
	}

	public boolean insertBlogData(BlogDTO dto) throws SQLException{
		// TODO Auto-generated method stub
		boolean flag = false;
		int aCnt = session.insert(namespace+".insertBlog",dto);
		if(aCnt>0){
			flag = true;
		}
		return flag;
	}
}
