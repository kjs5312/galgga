package com.galgga.businessLods.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.galgga.Lod.vo.LodImgFileVO;
import com.galgga.Lod.vo.LodVO;
import com.galgga.main.vo.MainListVO;

public interface BusinessLodDAO {
	public int insertNewLods(Map newLodsMap) throws DataAccessException;
	public void insertLodsImageFile(List lodsImgList)  throws DataAccessException;
	
	public List selectMyLodsList(int B_id) throws DataAccessException;
	public LodVO selectLodsDetail(String lod_id) throws DataAccessException;
	public List<LodImgFileVO> selectLodComImg(String lod_id) throws DataAccessException;
	
	public List<MainListVO> lodList_value() throws DataAccessException;
	public List<MainListVO> lodList_reserve() throws DataAccessException;
}
