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
	
	
	//checkBox
	$(function(){
		
		var chk_arr = [];
		
		$(".checkbox_fix").change(function(){
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
					change();
					chk_arr = [];
				}
			});
		
		
		//post method start
		function change() {
			$.ajax({
				url : "<c:url value='/list/checkboxList'/>"
				,type : "post"
				,dataType : "text"
				,data : { 
					chbox : chk_arr
				}
				,success : function(data) {
					console.log(data);
				}
				,error : function(request, status, error) {
					console.log(error);
				}
			});
		}	
	
	});
	
	
	
	
	//customBox
	$(function(){
		
		$("#custom_add").on("click", function(){
			var customNameDoc = document.getElementById("custom_text");
			var customNameCheck = document.getElementById("customNameBox");
			
			if(customNameDoc.value.trim().length==0 || customNameDoc.value.trim()==""){
				alert("확장자를 입력해 주세요.");
				return false;
			}
			if(customNameDoc.value.length >= 20){
				alert("20자 내외로 입력해 주세요.");
				return false;
			}
			else{
				add();
			}
		});
		
		
		
		
		//post method start
		var cnt = 0;
		
		function add(){	
			$.ajax({
				url : "<c:url value='/list/customList'/>"
				,type : "post"
				,contentType : "application/json; charset=utf-8"
				,data : JSON.stringify({
					"put_name" : $("#custom_text").val()
				})
				,success : function() {
					console.log("성공");
				}
				,error : function(request, status, error) {
					console.log(error);
				}
			});
		}
		 
		function add(){	
			$.ajax({
				url : "<c:url value='/list/customList'/>"
				,type : "post"
				,dataType : "text"
				,data : {
					customName : $("#custom_text").val()
				}
				,success : function(result) {
					console.log(result);
					
					//customBox input
					var tag = "<button type='button' id='customNameBox' value='";
					tag += $("#custom_text").val()
					tag += "'>"
					tag += $("#custom_text").val()
					tag += " x"
					tag += "</button>";
					 
					$("#custom_box").append(tag);
					
					
					//customBox customName_num
					$("#put_num").html("");	
					cnt++;
		
					var num_tag = cnt;
					num_tag += "/200";
					
					$("#put_num").append(num_tag);
					
					//customBox 200개 제한
					if(cnt == 200){
						alert("200개까지 등록 가능합니다.");
					}
					
					$("#customNameBox").on("click",customDelete());
					
				}
				,error : function(request, status, error) {
					console.log(error);
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
                   <input type="text" id="custom_text" name="custom_text">
                   <input type="button" id="custom_add" value="+추가">
               </td>
           </tr>
           <tr>
               <td></td>
               <td colspan="2">
                   <div style="border:1px solid; width:200px; height:100px;" id="custom_box">
                   		<p id="put_num">0/200</p>
                   		<table id="here"></table>
                   </div>
               </td>
           </tr>
       </table>
   </div>
   
   <%-- <script src="<c:url value="/resources/jquery-3.5.1.min.js"/>"></script>
   <script src="<c:url value="/resources/js/app.js"/>"></script> --%>
   
</body>
</html>