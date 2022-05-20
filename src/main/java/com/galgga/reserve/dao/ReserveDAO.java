package com.galgga.reserve.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.galgga.reserve.vo.BeforeResVO;
import com.galgga.reserve.vo.ReserveVO;

public interface ReserveDAO {
	public void haveReserve(ReserveVO reserveVO) throws DataAccessException;
	
	public BeforeResVO reserveData(String lod_id, String unit_name) throws DataAccessException;
	
	public List selectMyReserveList(int M_id) throws DataAccessException;
}
