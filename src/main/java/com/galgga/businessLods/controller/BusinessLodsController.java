package com.galgga.businessLods.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface BusinessLodsController {

	public ResponseEntity addNewLods (MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	public ResponseEntity addNewUnits (MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	public ModelAndView businessMain(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView lodsDetail(@RequestParam("lod_id") String lod_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
}
