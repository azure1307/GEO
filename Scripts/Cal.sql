SELECT CAL_NO, CAL_TITLE,CAL_CONTENT, CAL_DEL_YN 
   FROM CAL;

 -- 삭제된 일정 복구
UPDATE CAL SET CAL_DEL_YN ='N'
WHERE CAL_DEL_YN = 'Y';

-- 일정 작성
INSERT INTO CAL(CAL_NO, CAL_TITLE, CAL_CONTENT, 
                     CAL_START, CAL_STOP, CAL_TYPE, CAL_OPEN_YN, CAL_DEL_YN)
VALUES(CAL_SEQ.NEXTVAL, '최이사 연차', '이사는 연차가 마음대로란다',  TO_DATE('2024/08/23 00:00','YYYY/MM/DD HH24:MI'), 
TO_DATE('2024/08/23 23:59','YYYY/MM/DD HH24:MI'), '2', 'N', 'N');


--일정 삭제
UPDATE CAL SET CAL_DEL_YN = 'Y'
	WHERE CAL_DEL_YN = 'N'
	AND CAL_NO = '12';

--일정 상세보기
SELECT CAL_NO, C.EMP_NO, CAL_TITLE, CAL_CONTENT, 
       CAL_START, CAL_STOP
	FROM CAL
	WHERE CAL_NO = '4';

--일정 수정
SELECT  CAL_NO, C.EMP_NO, CAL_TITLE, CAL_CONTENT,
           CONTENT, ""REF"", STEP, 
           ""DEPTH"", DELFLAG, 
           TO_CHAR(REGDATE, 'YYYY/MM/DD HH24:MI') REGDATE
         FROM ANSWERBOARD a 
         WHERE CAL_DEL_YN = 'Y';
        
UPDATE CAL SET CAL_DEL_YN = 'N'
        WHERE CAL_TYPE IN('0','1','2' );
       
CREATE SEQUENCE CAL_SEQ START WITH 1 INCREMENT BY 1;

--드래그 앤 드롭
UPDATE CAL SET "CAL_START" = TO_DATE(CAL_START,'YYYY/MM/DD HH24:MI'), "CAL_STOP" = TO_DATE(CAL_STOP,'YYYY/MM/DD HH24:MI')
	WHERE CAL_NO= '4';




SELECT CAL_NO, C.EMP_NO, CAL_TITLE, CAL_CONTENT, 
       CAL_START , 
       CAL_STOP
		FROM CAL
		WHERE CAL_DEL_YN = 'N';
		
	
	
--UPDATE 
	
UPDATE CAL SET CAL_TITLE= '2222222', 
        CAL_CONTENT = '2222222',
        "CAL_START" = TO_DATE('2024/09/10 09:00','YYYY/MM/DD HH24:MI'), 
        "CAL_STOP" = TO_DATE('2024/09/10 18:00','YYYY/MM/DD HH24:MI'), 
        CAL_TYPE= 2 , CAL_OPEN_YN= 'Y'
WHERE CAL_NO = 12;

UPDATE CAL SET CAL_TITLE= #{cal_title}, 
        CAL_CONTENT = #{cal_content},
        "CAL_START" = TO_DATE(#{cal_start},'YYYY/MM/DD HH24:MI'), 
        "CAL_STOP" = TO_DATE(#{cal_stop},'YYYY/MM/DD HH24:MI'),
        CAL_TYPE= #{cal_type} , CAL_OPEN_YN= #{cal_open_yn}
WHERE CAL_NO = #{cal_no}


-- JOIN 
SELECT CAL_NO, C.EMP_NO, CAL_TITLE, CAL_CONTENT, 
       CAL_START, CAL_STOP, CAL_TYPE, CAL_OPEN_YN
	   FROM CAL C INNER JOIN EMP A 
        ON C.EMP_NO  = A.EMP_NO
	   WHERE CAL_DEL_YN = 'N';

