package com.seoulauction.renewal.domain;

import java.util.HashMap;
import java.util.Map;

import lombok.Getter;

/**
 * 
 * @author 김융훈
 * 다목적 공통적으로 사용할 맵.
 */
public class CommonMap extends HashMap<String, Object>{
	
	private static final long serialVersionUID = 1L;

	@Getter
	private int page;
	@Getter
	private int size;
	
	public CommonMap(){}

	public CommonMap (String key, Object value) {
		super.put(key, value);
	}
	
	public CommonMap( Map<String, Object> map){
		putAll(map);
	}
	/*
	 * Pagiation 처리
	 */
	public CommonMap putPage(int page , int size){
		this.page = page;
		this.size = size;
		super.put("page", page);
		super.put("size", size);
		super.put("offset" , (size * (page - 1)));
		return this;
	}
	
	@Override
	public Object get(Object key) {
		return super.get(key);
	}

	@Override
	public CommonMap put(String key, Object value) {
		super.put(key, value);
		return this;
	}
	
	public Map<String, Object> toMap(){
		return this;
	}

}
