package com.test.geo;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.nike.geo.service.IEmpService;
import com.nike.geo.vo.hr.EmpVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class Jsy_Test {

	// junit은 @RequiredArgsConstructor 사용불가 / @Autowired만 사용하기

	@Autowired
	private SqlSessionTemplate template;

	@Autowired
	private IEmpService service;

//	@Test
//	public void test() {
//		
////		#{emp_no}, #{emp_pos}, #{emp_dept}, #{emp_pw}, 
////		#{emp_name}, #{emp_gender}, TO_CHAR(SYSDATE, 'YYYY-MM-DD'), #{emp_email}, 
////		#{emp_phone}, #{emp_birth}, #{emp_address}, 'AU003', 
////		'ST001', '', '', TO_CHAR(SYSDATE, 'YYYY-MM-DD'), 
////		'', TO_CHAR(SYSDATE, 'YYYY-MM-DD'))
//		EmpVo vo = new EmpVo();
//		vo.setEmp_no("AA000");
//		vo.setEmp_pos("SY001");
//		vo.setEmp_dept("SY001");
//		vo.setEmp_pw("SY001");
//		vo.setEmp_name("SY001");
//		vo.setEmp_gender("SY001");
//		vo.setEmp_hiredate("SY001");
//		vo.setEmp_email("SY001");
//		vo.setEmp_phone("010-0000-0000");
//		vo.setEmp_birth("1994-04-24");
////		vo.setEmp_address("ㅁㄴㅇㅁㄴㅇ");
//		vo.setEmp_auth("W");
//		vo.setEmp_status("Y");
//		vo.setEmp_retiredate(" ");
//		vo.setReg_id("Y");
//		vo.setReg_date("2024-08-19");
//		vo.setMod_id("Y");
//		vo.setMod_date("2024-08-19");
//		
//		int n = service.insertEmp(vo);
//		assertNotNull(n);
//	}

	@Test
	public void test11() {
//		template.selectOne("TE123", service);
		String id = "TE123";

        // 서비스 또는 매퍼를 사용하여 쿼리 실행
        EmpVo vo = template.selectOne("getEmployeeById", id);

        // 데이터가 제대로 조회되었는지 확인
//        assertNotNull(vo, "Employee data should not be null");
        assertNotNull(vo.getEmp_img(), "Employee image should not be null");

        // 예: 예상 이미지 경로 확인
        String expectedImagePath = "/images/TE123.jpg";
        assertEquals(expectedImagePath, vo.getEmp_img(), "Employee image path does not match");
    }
}

