package com.galgga.business.main.service;

import java.util.Map;

import com.galgga.business.main.vo.BusinessVO;

public interface BusinessService {
	public BusinessVO login(Map loginMap) throws Exception;
	public void addBusiness(BusinessVO businessVO) throws Exception;
	public String overlapped(String id) throws Exception;
}
