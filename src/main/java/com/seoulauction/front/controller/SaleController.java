package com.seoulauction.front.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller("saleController")
public class SaleController {

	protected final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value="/search")
	public String search(@RequestParam Map<String, String> params, ModelMap model, HttpServletRequest request){

		return "/sale/lotSearchList";
	}

}
