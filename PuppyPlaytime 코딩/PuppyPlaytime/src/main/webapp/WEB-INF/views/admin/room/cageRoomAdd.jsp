<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>케이지 테이블 팝업</title>

<style type="text/css">
body { margin:0 }
input,textarea,select { margin:0; padding:0;border:0;display:inline}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	
	$(function(){
		$("#insertData").click(function(){
			if($("#c_no").val()==""){
				$("#c_no").val(0);
			}
			
			if($("#c_status").val()==""){
				$("#c_status").val("use");
			}
			if($("#c_kind").val().replace(/\s/g,"")==""){
				alert('케이지 종류를 입력해주세요.');
				return false;
			}
			if($("#c_price").val().replace(/[^0-9]/g,"")==""){
				alert('케이지 가격을 입력해주세요.');
				return false;
			}
			if($("#c_usestatus").val().replace(/\s/g,"")==""){
				alert('케이지 사용현황을 입력해주세요.');
				return false;
			}
			if($("#c_explain").val().replace(/\s/g,"")==""){
				alert('케이지 설명을 입력해주세요.');
				return false;
			}
			if($("#file").val().replace(/\s/g,"")==""){
				alert('케이지 사진을 등록해주세요.');
				return false;
			}
			
			$("#roomForm").attr({
				"method":"POST",
				"action":"/admin/room/roomList.do"
			});

			$("#roomForm").submit();
		});
		
		$("#closeWindow").click(function(){
			window.history.back();
		});
	});
	
	
	
</script>
</head>
<body>
	<div>
		<form id ="roomForm" name="roomForm" enctype="multipart/form-data">
			<table border="1">
				<thead>
					<tr>
						<td colspan="4" align="center"><h4>케이지 룸 등록</h4></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th><span class ="required">*</span>케이지 종류</th>
						<td>
							<select name="c_kind">
								<option id="c_kind" value="소형">소형</option>
								<option id="c_kind" value="중형">중형</option>
								<option id="c_kind" value="대형">대형</option>
							</select>
						</td>
						<th><span class ="required">*</span>케이지 유형</th>
						<td>
							<select name="c_type">
								<option id="c_type" value="NOMAL">NOMAL</option>
								<option id="c_type" value="VIP">VIP</option>
							</select>
						</td>
					</tr>

					<tr>
						<th><span class ="required">*</span>케이지 번호</th>
						<td><input type="text" id="c_no" name="c_no" disabled="disabled"/></td>
					</tr>
					<tr>
						<th><span class ="required">*</span>가격</th>
						<td><input type="text" id="c_price" name="c_price"/></td>
					</tr>
					<tr>
						<th><span class ="required">*</span>사용현황</th>
						<td><input type="text" id="c_usestatus" name="c_usestatus" value ="unusing" readonly/></td>
					</tr>
					<tr>
						<th><span class ="required">*</span>케이지 설명</th>
						<td><textarea id="c_explain" name="c_explain"></textarea></td>
					</tr>
					<tr>
						<th><span class ="required">*</span>케이지 사진</th>
						<td><input type="file" id="file" name="file"/></td>
					</tr>
				</tbody>
			</table>
			<input type="hidden" id="c_status" name="c_status" />
			<input type="hidden" id="c_picture" name="c_picture" value="${file}" />
		</form>
	</div>
	<div>
		<p></p>
		<table>
			<tr align ="center">
				<td><input type="button" id ="insertData" value="등록"/></td>
				<td><input type="button" id ="closeWindow" value="취소" /></td>
			</tr>
		</table>
	</div>
</body>
</html>