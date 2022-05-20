package com.galgga.business.main.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.galgga.business.main.dao.BusinessDAO;
import com.galgga.business.main.vo.BusinessVO;

@Service("businessService")
@Transactional(propagation=Propagation.REQUIRED)
public class BusinessServiceImpl implements BusinessService {
	@Autowired
	private BusinessDAO businessDAO;
	
	@Override
	public BusinessVO login(Map loginMap) throws Exception {
		return businessDAO.login(loginMap);
	}
	
	@Override
	public void addBusiness(BusinessVO businessVO) throws Exception {
		businessDAO.insertNewBusiness(businessVO);
	}
	
	@Override
	public String overlapped(String id) throws Exception {
		return businessDAO.selectOverlappedID(id);
	}
}
