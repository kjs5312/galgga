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
import com.galgga.main.vo.MainListVO;

@Repository("lodsDAO")
public class BusinessLodDAOImpl implements BusinessLodDAO{
	@Autowired
	private SqlSession sqlSession;
	
	
	
	
	
	@Override
	public int insertNewLods(Map newLodsMap) throws DataAccessException{
		sqlSession.insert("mapper.lods.insertNewLods", newLodsMap);
		return Integer.parseInt(String.valueOf(newLodsMap.get("lod_id")));
	}
	

	
	
	@Override
	public void insertLodsImageFile(List lodsImgList) throws DataAccessException{
		for(int i=0; i<lodsImgList.size(); i++) {
			LodImgFileVO lodImgFileVO=(LodImgFileVO)lodsImgList.get(i);
			sqlSession.insert("mapper.lods.insertNewLodImg", lodImgFileVO);
		}
	}
	
	
	
	  //text로 목록 보여줌
	  @Override
	  public List selectMyLodsList(int B_id) throws DataAccessException{ 
		  List<LodVO> myLodsList =  (ArrayList) sqlSession.selectList("mapper.lods.selectMyLods", B_id);
	  	return myLodsList;
		 }
	  
	  //디테일 정보 
	  @Override
	  public LodVO selectLodsDetail(String lod_id) throws DataAccessException{
		  LodVO lodVO = (LodVO) sqlSession.selectOne("mapper.lods.selectLodInfo",lod_id);
		  return lodVO;
	  }

	  
	  //디테일 사진들
	  @Override
	  public List<LodImgFileVO> selectLodComImg(String lod_id) throws DataAccessException{
		  List<LodImgFileVO> lodComImgList = (ArrayList)sqlSession.selectList("mapper.lods.selectLodComImgInfo",lod_id);
		  return lodComImgList;
	  }
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  //메인 페이지 사진 평점순
	  @Override
	  public List<MainListVO> lodList_value() throws DataAccessException{
		  List<MainListVO> lodImgList = (ArrayList)sqlSession.selectList("mapper.lods.mainpage_value");
		  return lodImgList;
	  }
	  
	//메인 페이지 사진 평점순
	  @Override
	  public List<MainListVO> lodList_reserve() throws DataAccessException{
		  List<MainListVO> lodImgList = (ArrayList)sqlSession.selectList("mapper.lods.mainpage_reserve");
		  return lodImgList;
	  }
	  
	}

