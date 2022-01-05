<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/style/style.css">

<title>main_page</title>

<script src="<c:url value="/resources/jquery-3.5.1.min.js"/>"></script>
<script>

	$(function(){
		
		var chk_arr = [];
		
			
			//체크박스 선택 시, 배열에 추가한다.
			if($(".checkbox_fix").is(":checked")){
				chk_arr.push($(this).val());
				console.log("push : " + chk_arr);
				
				console.log("check 수 : " + $('input:checkbox[name="checkbox_fix"]:checked').length);
				console.log("배열 수 : " + chk_arr.length);
			}
			
			//혹시라도 배열의 길이가 체크한 값보다 더 많아지면 강제 pop
			if($('input:checkbox[name="checkbox_fix"]:checked').length < chk_arr.length) {
				chk_arr.pop($(this).val());
				console.log("pop : " + chk_arr);
			}
			
			//체크한 값을 하나씩 확인하기 위해 초기화
			else{
				chk_arr = [];
			}
		
		
		
		function changeList() {
			$.ajax({
				url : "<c:url value='/list/checkboxList'/>"
				,type : "post"
				,data : { 
					"chbox" : chk_arr 
				}
				,dataType : "JSON"
				,success : function(data) {
					alert(data);
				}
				,error : function(request, status, error) {
					alert(error);
				}
			});
		} 
		


	});
	

</script>

</head>
<body>
	<div>
       <hr>
           <li>파일 확장자 차단</li>
       <hr>
   </div>

   <div>

       <table>
           <tr>
               <td>
                   고정 확장자
               </td>
               <td>
                   <input type="checkbox" name="checkbox_fix" class="checkbox_fix" value="bat">bat
                   <input type="checkbox" name="checkbox_fix" class="checkbox_fix" value="cmd">cmd
                   <input type="checkbox" name="checkbox_fix" class="checkbox_fix" value="com">com
                   <input type="checkbox" name="checkbox_fix" class="checkbox_fix" value="cpl">cpl
                   <input type="checkbox" name="checkbox_fix" class="checkbox_fix" value="exe">exe
                   <input type="checkbox" name="checkbox_fix" class="checkbox_fix" value="scr">scr
                   <input type="checkbox" name="checkbox_fix" class="checkbox_fix" value="js">js
               </td>
           </tr>
           <tr>
               <td>
                   커스텀 확장자
               </td>
               <td>
                   <input type="text">
                   <button type="button">+추가</button>
               </td>
           </tr>
           <tr>
               <td></td>
               <td colspan="2">
                   <!-- <textarea style="resize:none; width:200px; height:100px;"></textarea> -->
                   <div style="border:1px solid; width:200px; height:100px;">
                   		<p id="put_num">0/200</p>
                   </div>
               </td>
           </tr>
       </table>
   </div>
   
   <script src="<c:url value="/resources/jquery-3.5.1.min.js"/>"></script>
   <script src="<c:url value="/resources/js/app.js"/>"></script>
   
</body>
</html>