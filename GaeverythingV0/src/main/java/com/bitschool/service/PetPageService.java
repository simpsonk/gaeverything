package com.bitschool.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.PetPageDAO;
import com.bitschool.dto.MemberDTO;
import com.bitschool.dto.MyPageDTO;
import com.bitschool.dto.PetPageDTO;

@Service
public class PetPageService {
	@Inject
	private PetPageDAO pdao;
	
		//PetPage에 펫 등록하기(insert) (photo 입력 필수)
		public boolean insertPetData(PetPageDTO member){
			boolean flag= false;
			try {
				flag = pdao.insertData(member);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return flag;
		}
		
		//PetPage에 펫 등록하기(insert) (photo 입력안해도 등록 가능)
		public boolean insertPetData2(PetPageDTO member){
			boolean flag= false;
			try {
				flag = pdao.insertData2(member);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return flag;
		}
		
		//전체 펫 개수 가져오기
		public int countPetData(MemberDTO mem){
			int count = 0 ;
			try {
				count = pdao.countData(mem);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return count;
		}
		
		//전체 펫들 가져오기
		public List<PetPageDTO> readPetsData(MemberDTO mem){
			List<PetPageDTO> list = null;
			try {
				list = pdao.readPets(mem);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
		}
		
		// 등록된 펫 삭제
		public boolean deletePetData(PetPageDTO pet){
			boolean flag= false;
			try {
				flag = pdao.deleteData(pet);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return flag;
		}	

		//PetPage의 펫 수정하기(photo도 수정)
		public boolean updatePetData(PetPageDTO pet){
			boolean flag = false;
			try {
				flag = pdao.updateData(pet);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
			return flag;
		}
	
	//PetPage 펫 수정(photo는 수정하지 않을 때)
	public boolean updatePetData2(PetPageDTO pet){
		boolean flag = false;
		try {
			flag = pdao.updateData2(pet);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return flag;
	}
		
	//펫 한마리 정보 불러오기
	public PetPageDTO readPetData(PetPageDTO pet) {
		try {
			pet = pdao.selectPetData(pet);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return pet;
	}
	

}
