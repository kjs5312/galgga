package com.galgga.businessLods.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.galgga.Lod.vo.LodImgFileVO;
import com.galgga.Lod.vo.LodVO;
import com.galgga.Lod.vo.UnitImgFileVO;
import com.galgga.Lod.vo.UnitVO;

@Repository("UnitsDAO")
public class BusinessUnitDAOImpl implements BusinessUnitDAO{
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public int insertNewUnits(Map newUnitsMap) throws DataAccessException{
		sqlSession.insert("mapper.lods.insertNewUnits", newUnitsMap);
		return Integer.parseInt(String.valueOf(newUnitsMap.get("unit_id")));
	}
	
	@Override
	public void insertUnitsImageFile(List unitsImgList) throws DataAccessException{
		for(int i=0; i<unitsImgList.size(); i++) {
			UnitImgFileVO unitImgFileVO=(UnitImgFileVO)unitsImgList.get(i);
			sqlSession.insert("mapper.lods.insertNewUnitImg", unitImgFileVO);
		}
	}
	
	  @Override
	  public List<UnitVO> selectUnitsDetail(String lod_id) throws DataAccessException{
		  List<UnitVO> unitVO = (ArrayList) sqlSession.selectList("mapper.lods.selectUnitInfo",lod_id);
		  return unitVO;
	  }
	  @Override
	  public List<UnitImgFileVO> selectUnitDetailImage(String lod_id) throws DataAccessException{
		  List<UnitImgFileVO> unitImgList = (ArrayList)sqlSession.selectList("mapper.lods.selectUnitImgInfo",lod_id);
		  return unitImgList;
	  }
}
