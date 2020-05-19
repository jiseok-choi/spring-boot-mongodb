<!--%@page import="com.util.DBCPConn"% -->
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.dxteam.onboard.util.MyUtil"%>
<%@page import="com.dxteam.onboard.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dxteam.onboard.dao.BoardDAO"%>
<!-- %@page import="com.util.DBConn"% -->
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>


<%@page import="com.mongodb.DBObject" %>
<%@page import="com.mongodb.DBCollection" %>
<%@page import="com.mongodb.BasicDBObject" %>
<%@page import="com.mongodb.DB" %>
<%@page import="com.mongodb.Mongo"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.util.JSON"%>




<!--%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

	
	Connection conn = DBCPConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	MyUtil myutil = new MyUtil();
	

	//넘어온 페이지 번호(MyUtil,article,update,delete)
	String pageNum = request.getParameter("pageNum");
	

	//첫시작시 현재페이지 1
	int currentPage = 1;
	

	//넘어온 페이지 번호가 존재할 경우 현재페이지에 값 넣어주기
	if(pageNum!=null)
		currentPage = Integer.parseInt(pageNum);
	

	//검색키와 값
	String searchKey = request.getParameter("searchKey");
	String searchValue = request.getParameter("searchValue");
	

	//검색어가 있을 경우
	if(searchValue!=null){
		if(request.getMethod().equalsIgnoreCase("GET")){
			searchValue = URLDecoder.decode(searchValue,"UTF-8");
		}

	
	}else{//검색어가 없을 경우
		searchKey="subject";
		searchValue = "";
	}

	
	//전체데이터 갯수 구하기
	int dataCount = dao.getDataCount(searchKey, searchValue);

	
	//한페이지에 표시할 데이터의 갯수
	int numPerPage = 5;

	
	//전체 페이지수 구하기
	int totalPage = myutil.getPageCount(numPerPage, dataCount);
	

	//전체페이지수가 표시할 페이지수보다 큰 경우(삭제로 인해)
	if(currentPage>totalPage)
		currentPage = totalPage;


	//데이터베이스에서 가져올 rownum의 시작과 끝
	int start = (currentPage-1)*numPerPage+1;
	int end = currentPage*numPerPage;
	

	//데이터베이스에서 해당 페이지를 가져온다.
	List<BoardDTO> lists = dao.getLists(start, end, searchKey, searchValue);

	
	//검색(기능을 사용할 경우 get방식의 주소에 추가로 적용시켜주겠다. 사용자정의)
	String param = "";
	if(!searchValue.equals("")){
		param = "?searchKey="+searchKey;
		param+= "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
	}
	

	//페이징 처리
	String listUrl = "list.jsp"+param;
	String pageIndexList = myutil.pageIndexList(currentPage, totalPage, listUrl);

	
	//글내용 보기 주소 정리(html에서 onclick의 주소가 너무 기니까 한번에 정리)
	String articleUrl = cp+"/board/article.jsp";
	if(param.equals("")){
		articleUrl += "?pageNum="+currentPage;
		//board/article.jsp?pageNum=5
	}else{
		articleUrl += param + "&pageNum="+currentPage;
		//board/article.jsp?searchKey=name&searchValue=suzi&pageNum=5
	}
	DBCPConn.close();
%-->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 자바 프로그램을 태그로 사용하도록 정의-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--숫자나 통화, 날짜 같은 형태 맞춰주기 위하여 정의-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게 시 판</title>
</head>
<body>

<div id="bbsList">
	<div id="bbsList_title">
	게 시 판(JSP)
	</div>
	<div id="bbsList_header">
		<div id="leftHeader">
		<form action="" name="searchForm" method="post">
			<select name="searchKey" class="selectField">
				<option value="subject">제목</option>
				<option value="name">작성자</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="searchValue" value="<!-- %=searchValue % -->" class="textField"/>
			<input type="button" value="검  색" class="btn2" onclick="sendIt()"/>
		</form>
		</div>
		<div id="rightHeader">
			<input type="button" value=" 글올리기 " class="btn2"
			onclick="javascript:location.href='<!-- %=cp % -->/board/created.jsp';" />
		</div>
	</div>
	

	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<!--데이터가 있는 만큼 <tr>이 반복됨 -->
			<c:forEach items="${list }" var="dto">
				<tr>
					<td>${dto.no}</td>
					<td>${dto.title}</td>
					<td>${dto.writer}</td>
					<td><fmt:formatDate value="${dto.writeDate}" pattern="yyyy-MM-dd"/></td>
					<td>${dto.hit}</td>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>

<!-- 
여기에 자른 코드 넣기
 -->


</div>






</body>
</html>