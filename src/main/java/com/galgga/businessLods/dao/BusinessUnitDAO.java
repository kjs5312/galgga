package com.galgga.businessLods.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.galgga.Lod.vo.UnitImgFileVO;
import com.galgga.Lod.vo.UnitVO;

public interface BusinessUnitDAO {
	public int insertNewUnits(Map newUnitsMap) throws DataAccessException;
	public void insertUnitsImageFile(List UnitsImgList)  throws DataAccessException;

	public List<UnitVO> selectUnitsDetail(String lod_id) throws DataAccessException;
	public List<UnitImgFileVO> selectUnitDetailImage(String lod_id) throws DataAccessException;
}
