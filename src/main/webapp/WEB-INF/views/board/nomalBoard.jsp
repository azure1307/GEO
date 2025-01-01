<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>


<head>
</head>
<%@ include file="../comm/header.jsp"%>
<meta charset="UTF-8">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/sweetalert2@11.10.8/dist/sweetalert2.all.min.js"></script>
<script src="./js/board.js"></script>
<body>
	<%@ include file="../comm/sidebar.jsp"%>
	<main id="main" class="main">


	<form action="./multiDeleteBoard.do" method="post" onsubmit="return chkSubmit()">
				<!-- 게시판 테이블 -->
	  <table class="table display" id="BoardTable">
				<!-- 게시판 선택 -->

				<br>
				<h1>일반 게시판</h1>
				<thead>
					<tr>
						<c:if test="${loginVo.emp_auth=='AU002'}">
							<th class="text-center" scope="col"><input type="checkBox" id="chkbox" name="allCheckBox" class="allCheckBox" onclick="checkAll(this.checked)"></th>
						</c:if>
						<th scope="col" class="text-center">No.</th>
						<th scope="col" class="text-center">제목</th>
						<th scope="col" class="text-center">작성자</th>
						<th scope="col" class="text-center">작성일</th>
						<th scope="col" class="text-center">추천</th>
						<th scope="col" class="text-center">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="nomal" items="${nomalBoard}" varStatus="vs">
						<tr>
							<c:if test="${loginVo.emp_auth=='AU002'}">
								<th class="text-center" scope="row"><input type="checkbox" name="ch" class="ch" value="${nomal.bo_no}"></th>
							</c:if>
							<td class="text-center">${nomalBoard.size()-vs.index}</td>
							<td style="cursor: pointer;" class="text-center" onclick="location.href='./detailBoard.do?bo_no=${nomal.bo_no}'">${nomal.bo_title}</td>
							<td class="text-center">${nomal.emp_name}</td>
							<td class="text-center">${nomal.bo_regdate}</td>
							<td class="text-center">${nomal.bo_like_count}</td>
							<td class="text-center">${nomal.bo_view_count}</td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
			<!-- </table> -->

			<c:if test="${loginVo.emp_auth=='AU002'}">
				<input class="btn btn-danger" type="submit" value="삭제">
			</c:if>
			<input class="btn btn-primary" type="button" onclick="location.href='./writeBoard.do'" value="새글쓰기">
		</form>
		<br>



	</main>
	<!-- End #main -->

</body>


<%@ include file="../comm/footer.jsp"%>
<script type="text/javascript">
if(${loginVo.emp_auth=='AU002'}){
$(document).ready(function() {
	$("#BoardTable").DataTable({
		"info": false,
		"columnDefs":[
			{"orderable": false, "targets":0}
		]
	});
});
}else{
	$(document).ready(function() {
		$("#BoardTable").DataTable({
			"info" : false,
			"order": [[3, "desc"]]
		});
	});
}
</script>
</html>
