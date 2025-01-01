package com.nike.geo.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.nike.geo.vo.co.CalVo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class CalDaoImpl implements ICalDao {

	private final SqlSessionTemplate session;
	private final String NS = "com.nike.geo.model.CalDaoImpl.";
	
	@Override
	public List<CalVo> calList(String[] chkArray) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("chkArray",chkArray);
		return session.selectList(NS+"calList", map);
	}
	
	@Override
	public boolean insertCal(Map<String, Object> map) {
		return session.insert(NS+"insertCal", map)>0?true:false;
	}

	@Override
	public int dragUpdateCal(Map<String, Object> map) {
		return session.update(NS+"dragUpdateCal", map);
	}
	
	@Override
	public int delflagCal(String seqs) {
		return session.delete(NS+"delflagCal", seqs);
	}
	
	@Override
	public int updateCal(CalVo vo) {
		return session.update(NS+"updateCal", vo);
	}

	@Override
	public CalVo getOneCal(int no) {
		return session.selectOne(NS+"getOneCal", no);
	}
}
