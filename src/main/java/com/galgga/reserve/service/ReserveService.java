package com.galgga.reserve.service;

import java.util.List;
import java.util.Map;

import com.galgga.reserve.vo.BeforeResVO;
import com.galgga.reserve.vo.ReserveVO;

public interface ReserveService {
	public void haveReserve(ReserveVO reserveVO) throws Exception;
	public Map beforeRes(String lod_id, String unit_name) throws Exception;
	
	public List myReserveList(int M_id) throws Exception;
}
