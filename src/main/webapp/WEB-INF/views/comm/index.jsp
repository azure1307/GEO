<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<%@ include file="./header.jsp" %>
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.js'></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/locales/ko.js"></script>
<link href="https://cdn.jsdelivr.net/gh/sun-typeface/SUIT@2/fonts/static/woff2/SUIT.css" rel="stylesheet">
<style>
	body {font-family: 'SUIT', sans-serif;}
	td a {
		color: inherit; /* 링크 색상을 부모 요소의 색상으로 설정 */
	}
	
	td strong {
		font-weight: normal; /* strong 효과 제거 */
        }

    td em {
		font-style: normal; /* em 효과 제거 */
    }
    
    td u {
    	text-decoration: none;
    }
</style>
<body>
	<script>
        $(document).ready(function() {
            $('#arriveWorkBtn').click(function() {
                sendRequest('arriveWork.do');
            });

            $('#leftWorkBtn').click(function() {
                sendRequest('leftWork.do', true);
            });
            
            function sendRequest(url, isLeaving) {
                var emp_no = $('#emp_no').val();

                $.ajax({
                    type: 'POST',
                    url: url,
                    data: { emp_no: emp_no },
                    success: function(response) {
                        if (response.status === 'success') {
                            $('#message').css('display', 'none');
                            // 현재 시각 구하기
                            var now = new Date();
                            var hours = now.getHours().toString().padStart(2, '0');
                            var minutes = now.getMinutes().toString().padStart(2, '0');
                            var seconds = now.getSeconds().toString().padStart(2, '0');
                            var currentTime = hours + ':' + minutes + ':' + seconds;
                            
                            // 출근 완료 메시지와 현재 시각 알림
                            if (url === 'arriveWork.do') {
                                alert('현재 시각 : ' + currentTime + '\n출근 완료');
                            } else if (url === 'leftWork.do' && isLeaving) {
                                alert('현재 시각 : ' + currentTime + '\n퇴근 완료');
                            }
                        } else if (response.status === 'alreadyArrived') {
                            // 출근 처리 실패: 이미 출근한 경우
                            alert('이미 출근하셨습니다.');
                        } else {
                            $('#message').css('color', 'red').text(response.message);
                        }
                    },
                    error: function(xhr, status, error) {
                        $('#message').text('서버와의 통신 중 오류가 발생했습니다: ' + error).css('color', 'red');
                    }
                });
            }
        });
    </script>
	<%@ include file="./sidebar.jsp" %>
 	<main id="main" class="main" style="background:#eef2fa;">
	
		<div class="pagetitle">
	      <h1 style="font-family: 'SUIT'">메인화면</h1>
	      <nav>
	        <ol class="breadcrumb">
	          <li class="breadcrumb-item" style="font-family: 'SUIT'"><a href="./index.do">홈</a></li>
	          <li class="breadcrumb-item active" style="font-family: 'SUIT'">메인화면</li>
	        </ol>
	      </nav>
	    </div><!-- End Page Title -->

		<section class="section dashboard">
	      <div class="row">
	
	        <!-- Left side columns -->
	        <div class="col-lg-3">
	
			  <!-- Card with an image on top -->
	          <div class="card" style="height: 330px;">
	            <div class="card-img-top" style="background-color: #E2E2E2; width: 100%; height: 160px; position: relative;">
	            <!-- 일단 이미지를 띄움 : img src="assets/img/product-5.jpg" --> 
	            <!-- DB에서 가져옴 : img src="storage/${mainVo.emp_img} -->
	            	<img src="assets/img/manager.jpg" style="width: 120px; height: 120px;
	            		border-radius: 50%; position: absolute; top: 50%; left: 50%;
	            		transform: translate(-50%, -50%); background-color: white;"
        				onerror="this.style.display='none'; this.parentElement.style.backgroundColor = 'white';">
	            </div>
	            <div class="card-body" style="text-align: center;">
					<h5 class="card-title" style="display: inline-block; font-family: 'SUIT'">${mainVo.emp_name}</h5>
					<p class="card-text">${mainVo.emp_dept}팀 ${mainVo.emp_pos}</p>
					<input type="hidden" id="emp_no" value="${loginVo.emp_no}">
	              <button id="arriveWorkBtn" class="btn btn-primary">출근</button>
				  <button id="leftWorkBtn" class="btn btn-danger">퇴근</button>
	            </div>
	          </div>
	          <!-- End Card with an image on top -->


			  <div class="card" style="height: 330px;">
	            <div class="card-body" style="text-align: center;">
	              <h5 class="card-title" style="display: inline-block; font-family: 'SUIT'">
	              	10월 결재 현황
	              </h5>
	              
	              <div class="mb-4"></div>
	              <div class="mb-4"></div>
	              
	              <table class="table">
	              	<thead>
		              	<tr>
		              		<td scope="col">총합</td>
		              		<td scope="col">대기</td>
		              		<td scope="col">진행중</td>
		              	</tr>
	              	</thead>
	              	<tbody>
		              	<tr>
		              		<!-- 총합 -->
		              		<th rowspan="3" scope="col" style="vertical-align: middle;">${sum}</th>
		              		<th scope="col">${waiting}</th> <!-- 대기 -->
		              		<th scope="col">${progress}</th> <!-- 진행중 -->
		              	</tr>
		              	
		              	<tr>
		              		<td scope="col">승인</td>
		              		<td scope="col">반려</td>
		              	</tr>
		              	
		              	<tr>
		              		<th scope="col">${complete}</th> <!-- 승인 -->
		              		<th scope="col">${reject}</th> <!-- 반려 -->
		              	</tr>
	              	</tbody>
	              </table>
	            </div>
	          </div>
			
			  <div class="card" style="height: 350px;">
	            <div class="card-body" style="text-align: center;">
	              <h5 class="card-title" style="display: inline-block; margin-bottom: 0; font-family: 'SUIT'" >
	              	10월 근태 현황
	              </h5>
	              
	              <!-- Pie Chart -->
	              <canvas id="pieChart" style="max-height: 400px; margin-top: 0;"></canvas>
	              <script>
	                document.addEventListener("DOMContentLoaded", () => {
	                  new Chart(document.querySelector('#pieChart'), {
	                    type: 'pie',
	                    data: {
	                      labels: [
	                        '출근',
	                        '조퇴',
	                        '지각',
	                        '결근'
	                      ],
	                      datasets: [{
	                        label: 'My First Dataset',
	                        data: ['17', 
	                        	'2', 
	                        	'1',
	                        	'0'],
	                        backgroundColor: [
	                          'rgb(255, 99, 132)',
	                          'rgb(54, 162, 235)',
	                          'rgb(255, 205, 86)',
	                          'rgb(0, 0, 0)'
	                        ],
	                        hoverOffset: 4
	                      }]
	                    },
	                    options: {
	                        plugins: {
	                          legend: {
	                            display: true,
	                            position: 'top', // 범례 위치 설정 (예: 'top', 'bottom', 'left', 'right')
	                            labels: {
	                              padding: 20   // 각 범례 항목 사이의 여백
	                            },
	                          }
	                        }
	                      }
	                  });
	                });
	              </script>
	              <!-- End Pie CHart -->
	              
	            </div>
	          </div>

	          
	            
	        </div><!-- End Left side columns -->
	
	        <!-- Right side columns -->
	        <div class="col-lg-9">
	        
				<!-- 공지 게시판 -->
	            <div class="col-12">
	              <div class="card recent-sales overflow-auto" style="height: 330px; position: relative;">
	
	                <div class="card-body">
	                  <h5 class="card-title" style="font-family: 'SUIT'">공지 게시판</h5>
	
	                  <!-- Default Table -->
		              <table class="table display" id="notiTable">
		                <thead>
		                  <tr>
		                    <th scope="col" class="text-center" style="width: 10%;">No.</th>
		                    <th scope="col" class="text-center" style="width: 40%;">글제목</th>
		                    <th scope="col" class="text-center" style="width: 20%;">작성자</th>
		                    <th scope="col" class="text-center" style="width: 10%;">조회수</th>
		                    <th scope="col" class="text-center" style="width: 20%;">작성일자</th>
		                  </tr>
		                </thead>
		                
		                <!-- tbody -->
		                <tbody>
		                  <c:forEach var="vo" items="${board}" varStatus="vs">
		                    <tr>
		                      <th scope="row" class="text-center">${fn:length(board) - vs.index}</th>
		                      
		                      <td><a href="./detailBoard.do?bo_no=${vo.bo_no}">
		                      	${vo.bo_title}
		                      </a></td>
		                      
		                      <td class="text-center">${vo.emp_name}</td> 
		                      <td class="text-center">${vo.bo_view_count}</td> 
		                      <td class="text-center">${vo.bo_regdate}</td>
		                    </tr>
		                  </c:forEach>
		                </tbody>
		              </table>
		              <!-- End Default Table Example -->
	
	                </div>
	
	              </div>
	            </div><!-- 공지 게시판 End -->
	            
	            <!-- 결재 문서함 -->
	            <div class="col-12">
	              <div class="card recent-sales overflow-auto" style="height: 330px;">
	
	                <div class="card-body">
	                  <h5 class="card-title" style="font-family: 'SUIT'">결재 문서함</h5>
	
	                  <!-- Default Table -->
		              <table class="table display" id="notiTable">
		                <thead>
		                  <tr>
		                    <th scope="col" class="text-center" style="width: 10%;">No.</th>
		                    <th scope="col" class="text-center" style="width: 40%;">기안내용</th>
		                    <th scope="col" class="text-center" style="width: 20%;">기안자</th>
		                    <th scope="col" class="text-center" style="width: 10%;">결재상태</th>
		                    <th scope="col" class="text-center" style="width: 20%;">기안일자</th>
		                  </tr>
		                </thead>
		                
		                <!-- tbody -->
		                <tbody>
		                  <c:forEach var="vo" items="${docu}" varStatus="vs">
		                    <tr>
		                      <th scope="row" class="text-center">${fn:length(docu) - vs.index}</th>
		                      
		                      <!-- 한번도 읽지않은 쪽지는 New 표시 -->
		                      <td><a href="./detailAppr.do?variety=appr&apd_no=${vo.apd_no}">
		                      	${vo.apd_form}) ${vo.apd_con}
		                      </a></td>
		                      
		                      <td class="text-center">${vo.emp_no}</td> 
		                      <td class="text-center">
								<c:choose>
						            <c:when test="${vo.apd_status eq 'W'}">
						                <span class="badge border-primary border-1 text-primary">대기</span>
						            </c:when>
									<c:when test="${vo.apd_status eq 'C'}">
				                		<span class="badge border-warning border-1 text-warning">완료</span>
				                	</c:when>
				                	<c:when test="${vo.apd_status eq 'P'}">
				                		<span class="badge border-success border-1 text-success">진행</span>
				                	</c:when>
				                	<c:otherwise>
				                		<span class="badge border-secondary border-1 text-secondary">반려</span>
				                	</c:otherwise>
								</c:choose>
		                      </td> 
		                      <td class="text-center">${vo.reg_date}</td>
		                    </tr>
		                  </c:forEach>
		                </tbody>
		              </table>
		              <!-- End Default Table Example -->
	
	                </div>
	
	              </div>
	            </div><!-- 결재 문서함 End -->
	
				<!-- 달력 -->
				<div class="col-12">
	              <div class="card recent-sales overflow-auto" style="height: 350px;">
					<div class="mb-4"></div>
	                <div class="card-body">

					  <!-- 달력 그려지는 부분 -->
	                  <div id="calendar-container" style="height: 300px; font-family: 'SUIT'">
						  <div id="indexCalendar" style="height: 100%; font-family: 'SUIT'"></div>
					  </div>
					  
					  <script>
					        var calendarData = [
					        	<c:forEach var="cal" items="${calList}" varStatus="status">
						            {
						                title: "${cal.cal_title}",
						                start: "${cal.cal_start}",
						                end: "${cal.cal_stop}",
						                content: "${cal.cal_content}",
						                color: "#FCB31E"
						            }<c:if test="${!status.last}">,</c:if>
					       		</c:forEach>
					        ];
	
					        document.addEventListener('DOMContentLoaded', function() {
					            var calendarEl = document.getElementById('indexCalendar');
					            var calendar = new FullCalendar.Calendar(calendarEl, {
					                initialView: 'dayGridWeek', // 기본 주간 보기
					                selectable: true, // 셀 선택 활성화
					                displayEventTime: false, // 시간 제거
					                editable: false, // 일정 수정 비활성화
					                slotMinTime: "09:00:00", // 시작 시간 설정
					                slotMaxTime: "18:00:00", // 끝 시간 설정
					                locale: 'ko', // 한국어 설정
					                height: 300,
					                events: calendarData // 일정 데이터를 캘린더에 표시
					            });
					            calendar.render(); // 캘린더 초기화
					        });
						
						</script>
	                </div>
	                <!-- End card-body -->
	
	              </div>
	            </div>
	            <!-- End 달력 -->
				
	
	        </div><!-- End Right side columns -->
	
	      </div>
	    </section>

  	</main><!-- End #main -->


</body>
  <%@ include file="./footer.jsp" %>
<script type="text/javascript">


</script>

</html>