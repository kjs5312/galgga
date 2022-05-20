package com.galgga.reserve.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.galgga.member.dao.MemberDAO;
import com.galgga.reserve.dao.ReserveDAO;
import com.galgga.reserve.vo.BeforeResVO;
import com.galgga.reserve.vo.ReserveVO;

@Service("reserveService")
@Transactional(propagation=Propagation.REQUIRED)
public class ReserveServiceImpl implements ReserveService{

	@Autowired
	private ReserveDAO reserveDAO;


	
	  public void haveReserve(ReserveVO reserveVO) throws Exception{
	  reserveDAO.haveReserve(reserveVO);
	  
	  }
	 

	@Override
	public Map beforeRes(String lod_id, String unit_name) throws Exception{
		Map beforeMap = new HashMap();
		BeforeResVO beforeResVO = reserveDAO.reserveData(lod_id, unit_name);
		beforeMap.put("beforeResVO", beforeResVO);
		
		return beforeMap;
	}
	
	  @Override 
	  public List myReserveList(int M_id) throws Exception{
	   List myReserveList= reserveDAO.selectMyReserveList(M_id);
	   if(myReserveList.size()==0) {
		   return null;
	   }
		  
	   return myReserveList; 
	}
	
	
	
}
