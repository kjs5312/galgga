package com.galgga.businessLods.service;

import java.util.List;
import java.util.Map;

import com.galgga.main.vo.MainListVO;

public interface BusinessLodService {
	public int addNewLods(Map newLodsMap) throws Exception;
	public List myLodsList(int B_id) throws Exception; 
	public int addNewUnits(Map newUnitsMap) throws Exception; 
	
	public Map lodsInfo(String lod_id) throws Exception;
	public Map unitsInfo(String lod_id) throws Exception;
	
	public List<MainListVO> valueLods() throws Exception;
	public List<MainListVO> reserveLods() throws Exception;
	
}
