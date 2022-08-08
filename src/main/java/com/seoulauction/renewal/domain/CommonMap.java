package com.seoulauction.renewal.domain;

import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
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

	private final String JSON_KEY ="JSON";

	private final ObjectMapper mapper = new ObjectMapper();
	
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

	public static CommonMap create(String key , Object value){
		return new CommonMap(key , value);
	}

	public static CommonMap create(int page , int size){
		CommonMap map = new CommonMap();
		map.putPage(page,size);
		return map;
	}


	public String getString(Object key){
		return super.get(key) instanceof String ? (String) super.get(key) : null;
	}

	public Integer getInteger(Object key){
		return super.get(key) instanceof Integer ? (Integer) super.get(key) : null;
	}

	public Boolean getBoolean(Object key){
		return super.get(key) instanceof Boolean ? (Boolean) super.get(key) : null;
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

	public CommonMap toLowerCaseMap(){
		CommonMap newMap = new CommonMap();
		this.keySet().forEach(c-> newMap.put(c.toLowerCase() , this.get(c)));
		return newMap;
	}

	/**
	 * Data 에 JSONStringify 가 있다면 Map 으로 변환. ( JSON 대문자 키로 매칭 )
	 * @return
	 */
	public void settingJsonStrToObject(){
		this.keySet().stream().filter(f -> f.contains(JSON_KEY)).forEach(fo -> {
			if (this.get(fo) != null) {
				try {
					this.put(fo, mapper.readValue(String.valueOf(this.get(fo)), Map.class));

				} catch (JsonProcessingException e) {
					//오류날경우
					this.put(fo, new CommonMap());
				}
			} else {
				//값이없는경우 빈값을 넣어준다.
				this.put(fo, new CommonMap());
			}
		});
	}

	/**
	 * Data 에 값이 Y,N 일경우 Y-> true , N -> FALSE로 변환.
	 * @return
	 */
	public void settingYNValueToBoolean(){
		//값이 Y 이거나 N 일경우.

		this.keySet().stream().filter(
			c-> ( this.get(c) !=null && (this.get(c).equals("Y") || this.get(c).equals("N") ) )
		).forEach(fo -> {
			if (this.get(fo) != null) {
				this.put(fo, this.get(fo).equals("Y"));
			} else {
				this.put(fo, false);
			}
		});
	}

}
