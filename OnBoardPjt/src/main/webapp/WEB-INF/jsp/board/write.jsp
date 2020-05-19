<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
	
	<style type="text/css">
		#title{
			height : 16;
			font-family :'돋움';
			font-size : 12;
			text-align :center;
		}
	</style>
</head>
<body>

	<br>
	<b><font size="6" color="gray">글쓰기</font></b>
	<br>
	
	<form method="post" action="/board/insert" name="boardForm" enctype="multipart/form-data"> 

	<table width="700" border="3" bordercolor="lightgray" align="center">
		<tr>
			<td id="title">작성자</td>
			<td>
				<input name="board_name" type="text" size="70" maxlength="100" value=""/>
			</td>
		</tr>
			<tr>
			<td id="title">
				제 목
			</td>
			<td>
				<input name="board_subject" type="text" size="70" maxlength="100" value=""/>
			</td>		
		</tr>
		<tr>
			<td id="title">
				내 용
			</td>
			<td>
				<textarea name="board_content" cols="72" rows="20"></textarea>			
			</td>		
		</tr>

		<tr align="center" valign="middle">
			<td colspan="5">
				<input type="submit" value="등록" >		
			</td>
		</tr>
	</table>	
	</form>
	
</body>
</html>