<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!-- 자바 프로그램을 태그로 사용하도록 정의-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--숫자나 통화, 날짜 같은 형태 맞춰주기 위하여 정의-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
<style type="text/css">
		#wrap {
			width: 800px;
			margin: 0 auto 0 auto;
		}

		#topForm{
			text-align :right;
		}

		#board, #pageForm, #searchForm{
			text-align :center;
		}
		
		#bList{
			text-align :center;
		}
	</style>
	
	<script type="text/javascript">
		function writeForm(){
			location.href="BoardWriteForm.bo";
		}
	</script>
</head>
<body>

<div id="wrap">
	<div id="searchForm">
		<form>
			<select name="opt">
				<option value="0">제목</option>
				<option value="1">내용</option>
				<option value="2">제목+내용</option>
				<option value="3">글쓴이</option>
			</select>
			<input type="text" size="20" name="condition"/>&nbsp;
			<input type="submit" value="검색"/>
		</form>	
	</div>
	<br>
	<div id="topForm">
		<c:if test="${sessionScope.sessionID!=null}">
			<input type="button" value="글쓰기" onclick="writeForm()">
		</c:if>	
	</div>
	<br>
	<div id="board">
		<table id="bList" width="800" border="3" bordercolor="lightgray">
			<tr heigh="30">
				<td>글번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>	
			<tbody>
				<!--데이터가 있는 만큼 <tr>이 반복됨 -->
				<c:forEach items="${list }" var="dto">
					<tr>
						<td></td>
						<td>${dto.title}</td>
						<td>${dto.writer}</td>
						<td><fmt:formatDate value="${dto.writeDate}" pattern="yyyy-MM-dd"/></td>
						<td>${dto.hit}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<br>
	<div id="pageForm">
		페이지 번호
	</div>
	<br>

	<button onclick="location.href='write'">글쓰기</button>

</div>	

</body>
</html>