package com.web.cookie.a04_Jung.a02_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.cookie.a04_Jung.a03_repository.A03_JungDao2;
import com.web.cookie.a04_Jung.vo.JungPageSch;
import com.web.cookie.a04_Jung.vo.Machine_management;
import com.web.cookie.a04_Jung.vo.Periodic_inspection;



@Service
public class A02_JungService2 {
@Autowired(required=false)
private A03_JungDao2 dao;

//정기검사 CRUD
public List<Periodic_inspection> getJungPage2List(JungPageSch sch){
	if(sch.getMch_nm()==null) sch.setMch_nm("");
	sch.setMch_nm("%"+sch.getMch_nm()+"%");
	
	// 1. 총데이터 건수 설정.
	sch.setCount(dao.getJungPageCount2(sch));
	// 2. 한번에 보일 페이지의 데이터 건수
	if(sch.getPageSize()==0) {
		sch.setPageSize(5);
	}
	// 3. 총페이지 수..(총데이터건수/한번에 보일 데이터 건수)
	sch.setPageCount((int)Math.ceil(  sch.getCount()/(double)sch.getPageSize() ));
	
	if(sch.getCurPage()==0)
		sch.setCurPage(1);
	if(sch.getCurPage()>sch.getPageCount())
		sch.setCurPage(sch.getPageCount()); //예를 들어, 총 10페이지의 데이터가 있고 현재 페이지가 11인 경우를 생각해봅시다
	//따라서, 페이지 번호가 11인 경우, 코드는 sch.setCurPage(10);을 실행하여 현재 페이지를 10으로 설정합니다.

	sch.setStart(Math.max(0,(sch.getCurPage()-1)*sch.getPageSize()+1));
	/// 마지막페이지 : 현재클릭한페이지번호 * 선택한페이지의크기
	//  DB에서 자동 처리해주나, 정확한 로직 처리를 위해
	int endNo = sch.getCurPage()*sch.getPageSize(); //현재페이지의 끝 번호를 계산
	sch.setEnd(endNo>sch.getCount()?sch.getCount():
							sch.getCurPage()*sch.getPageSize()); 
	// 페이지 블럭 처리
	// 1. 블럭 크기 설정.
	sch.setBlockSize(5);
	// 2. 블럭 번호 = 올림(현재페이지번호/블럭의크기)
	int blockNum = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlockSize());
	// 3. 시작 블럭
	sch.setStartBlock(Math.max(0,(blockNum-1)*sch.getBlockSize()+1));
	// 4. 마지막블럭(예외처리-기본적으로 블럭번호는 블럭번호*블럭의크기로 하는데 정확하게 
	//    페이지크기 보다 클수 있다.)
	int endBlock = blockNum * sch.getBlockSize();
	sch.setEndBlock(endBlock>sch.getPageCount()?sch.getPageCount():endBlock);
	
	return dao.getJungPage2List(sch);
}

public List<Periodic_inspection> getPeriodic_inspectionList(Periodic_inspection sch){
	if(sch.getMch_nm()==null) sch.setMch_nm("");
	sch.setMch_nm("%"+sch.getMch_nm()+"%");
	return dao.getPeriodic_inspectionList(sch);
}
public Periodic_inspection getPeriodic_inspection(int prd_ins_id) {
	return dao.getPeriodic_inspection(prd_ins_id);
}
public String insertPeriodic_inspection(Periodic_inspection ins) {
	return dao.insertPeriodic_inspection(ins)>0?"등록성공":"등록실패";
}
public String updatePeriodic_inspection(Periodic_inspection upt) {
	return dao.updatePeriodic_inspection(upt)>0?"수정성공":"수정실패";
}
public String deletePeriodic_inspection(int prd_ins_id) {
	return dao.deletePeriodic_inspection(prd_ins_id)>0?"삭제성공":"삭제실패";
}


}
