package com.nike.geo.service;

import java.util.List;

import com.nike.geo.vo.comm.FileVo;
import com.nike.geo.vo.msg.MsgVo;

public interface IMsgService {

	/**
	 * 받은 쪽지 목록 조회
	 * @param recvId
	 * @return List<MsgVo>
	 */
	public List<MsgVo> selectMsgListRecv(String recvId);
	
	/**
	 * 보낸 쪽지 목록 조회 
	 * @param sendId
	 * @return List<MsgVo>
	 */
	public List<MsgVo> selectMsgListSend(String sendId);
	
	/**
	 * 쪽지 상세 조회
	 * @param no
	 * @return MsgVo
	 */
	public MsgVo selectMsgOne(String no);
	
	/**
	 * 쪽지 작성
	 * @param MsgVo
	 * @return 0 혹은 1
	 */
	public int insertMsg(MsgVo vo);
	
	/**
	 * 쪽지 파일 업로드
	 * @param Filevo
	 * @return 0 혹은 1
	 */
	public int insertFile(FileVo vo);
	
	/**
	 * 쪽지 파일 다운로드 
	 * @param no
	 * @return FileVo
	 */
	public FileVo selectFile(String no);
	
	/**
	 * 쪽지 읽기
	 * @param MsgVo
	 * @return 0 혹은 1
	 */
	public int updateMsgRead(MsgVo vo);
	
	/**
	 * 받은 쪽지 삭제(update)
	 * @param noList
	 * @return 삭제한 row 갯수
	 */
	public int deleteMsgRecv(List<String> noList);
	
	/**
	 * 보낸 쪽지 삭제(update) 
	 * @param noList
	 * @return 삭제한 row 갯수
	 */
	public int deleteMsgSend(List<String> noList);

	/**
	 * 안읽은 쪽지 갯수 확인 
	 * @param no
	 * @return 안읽은 쪽지 갯수
	 */
	public int cntUnreadMsg(String no);
	
	/**
	 * 안읽은 쪽지 최신순 3개 조회 
	 * @param recvId
	 * @return 안읽은 쪽지 최신순 3개
	 */
	public List<MsgVo> selectLatestMsg(String recvId);
	
}
