package com.galgga.reserve.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.galgga.Lod.vo.LodVO;
import com.galgga.reserve.vo.BeforeResVO;
import com.galgga.reserve.vo.ReserveVO;

@Repository("reserveDAO")
public class ReserveDAOImpl implements ReserveDAO {
	@Autowired
	private SqlSession sqlSession;
	
	
	  public void haveReserve(ReserveVO reserveVO) throws DataAccessException{
	  sqlSession.insert("mapper.reserve.haveReserve", reserveVO); 
	  
	  }
	 
	
	public BeforeResVO reserveData(String lod_id, String unit_name) throws DataAccessException{
		
		Map data = new HashMap();
		data.put("unit_name", unit_name);
		data.put("lod_id", lod_id);
		
		BeforeResVO beforeResVO =  (BeforeResVO) sqlSession.selectOne("mapper.lods.reserveData", data);
		return beforeResVO;
	}
	
	
	
	@Override
	  public List selectMyReserveList(int M_id) throws DataAccessException{ 
		  List<LodVO> myReserveList =  (ArrayList) sqlSession.selectList("mapper.reserve.selectMyReserve", M_id);
	  	return myReserveList;
		 }
}
