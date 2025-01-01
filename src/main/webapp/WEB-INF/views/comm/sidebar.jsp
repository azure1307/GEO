<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>

  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link collapsed" href="./index.do">
          <i class="bi bi-grid"></i>
          <span>&nbsp;메인 화면</span>
        </a>
      </li><!-- End Dashboard Nav -->

	  <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#approval-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-journal-text"></i><span>&nbsp;전자 결재</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="approval-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
        

          
          <li>
            <a href="./apprHome.do">
              <i class="bi bi-circle"></i><span>결재 양식</span>
            </a>
          </li>
          
          <li>
            <a href="./apprList.do?variety=appr">
              <i class="bi bi-circle"></i><span>결재 문서함</span>
            </a>
          </li>
          
          <li>
            <a href="./apprList.do?variety=submit">
              <i class="bi bi-circle"></i><span>기안 문서함</span>
            </a>
          </li>
          
          <li>
            <a href="./apprList.do?variety=ref">
              <i class="bi bi-circle"></i><span>참조 문서함</span>
            </a>
          </li>
          
          <li>
            <a href="./apprList.do?variety=temp">
              <i class="bi bi-circle"></i><span>임시 문서함</span>
            </a>
          </li>
          
          <li>
            <a href="./signHome.do">
              <i class="bi bi-circle"></i><span>전자 서명 관리</span>
            </a>
          </li>
          
        </ul>
      </li><!-- End Approval Nav -->

			<li class="nav-item">
				<a class="nav-link collapsed" data-bs-target="#hr-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-person"></i>
						<span>&nbsp;인사 관리</span>
							<i class="bi bi-chevron-down ms-auto">
						</i>
				</a>
				<ul id="hr-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
					<li>
						<a href="./selectAll.do"> 
							<i class="bi bi-circle"></i>
							<span>사원 조회</span>
						</a>
					</li>
					<li>
						<c:if test="${loginVo.emp_auth eq 'AU002'}">
							<a href="./insertEmp.do"> <i class="bi bi-circle"></i>
								<span>사원 추가(관리자만 보이게)</span>
							</a>
						</c:if>
					</li>
				</ul>
			</li>
			<!-- End HR Nav -->
      
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#orgChart-nav" href="./org.do"> 
        <!-- // data-bs-toggle="collapse" 지웠음 --> 
          <i class="bi bi-diagram-3"></i><span>&nbsp;조직도</span>
        </a>
      </li><!-- End orgChart Nav -->
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="./calendar.do">
          <i class="bi bi-calendar-check"></i><span>&nbsp;일정 관리</span>
        </a>
      </li><!-- End Calendar Nav -->
      
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#board-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-layout-text-window-reverse"></i><span>&nbsp;게시판</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="board-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="./announcements.do">
              <i class="bi bi-circle"></i><span>공지 게시판</span>
            </a>
          </li>
          
          <li>
            <a href="./nomalBoard.do">
              <i class="bi bi-circle"></i><span>일반 게시판</span>
            </a>
          </li>
          
          <li>
          <c:if test="${loginVo.emp_auth eq 'AU002'}">
            <a href="./delBoard.do">
              <i class="bi bi-circle"></i><span>삭제 게시판</span>
            </a>
            </c:if>
          </li>
        </ul>
      </li><!-- End Board Nav -->
      
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#message-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-envelope"></i><span>&nbsp;쪽지</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="message-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="./recvMsg.do">
              <i class="bi bi-circle"></i><span>받은 쪽지함</span>
            </a>
          </li>
          
          <li>
            <a href="./sendMsg.do">
              <i class="bi bi-circle"></i><span>보낸 쪽지함</span>
            </a>
          </li>
        </ul>
      </li><!-- End Message Nav -->
	</ul>
  </aside><!-- End Sidebar-->
</body>