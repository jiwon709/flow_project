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
		var name_arr = [];
		
		var deleteName;
		var whatName;
		
		$(".checkbox_fix").change(function(){
				//체크박스 선택 시, 배열에 추가한다.
				if($(".checkbox_fix").is(":checked")){
					chk_arr.push($(this).val());
					
					//check용
					/* console.log("check 수 : " + $('input:checkbox[name="checkbox_fix"]:checked').length);
					console.log("배열 수 : " + chk_arr.length); */
					
					
					//함수 실행
					change();
					
		
					//체크한 값을 하나씩 넣기 위해 초기화
					chk_arr = [];
					
					//선택했던 값들 넣어주는 배열 생성
					name_arr.push($(this).val());
					
					//현재 화면에서 선택 되어있는 값들 넣어주는 배열 생성
					var len = $("input[name='checkbox_fix']:checked").length;
					var checkArr = [];
					if(len >= 1){
						$("input[name='checkbox_fix']:checked").each(function(e){
							var value = $(this).val();
							checkArr.push(value);
						});
					}

					//체크박스 해제 시 두 배열 비교 후 데이터 삭제
					if(checkArr.length < name_arr.length){
						whatName = name_arr[name_arr.length - 1];
						
						while(true){
							var search = name_arr.indexOf(whatName);
							
							if(search != -1){
								name_arr.splice(search, 1);
							}else{
								break;
							}
						}
						changeDelete();
					}
					
					//데이터 삭제되었는지 확인용
					console.log("check 된 항목 : " + checkArr);
					console.log("check 했던 항목들 : " + name_arr);
					
				} else{
					console.log("uncheck");
					
					whatName = name_arr[name_arr.length - 1];
					changeDelete();
					chk_arr = [];
				}
			});
		
		
		//checkbox_insert method
		function change() {
			$.ajax({
				url : "<c:url value='/list/checkboxList'/>"
				,type : "post"
				,dataType : "text"
				,data : { 
					chbox : chk_arr
				}
				,success : function(data) {
					console.log("insert : " + data);
				}
				,error : function(request, status, error) {
					console.log(error);
				}
			});
		}
		
		//checkbox_delete method
		function changeDelete() {
			$.ajax({
				url : "<c:url value='/list/checkboxListDelete'/>"
				,type : "post"
				,dataType : "text"
				,data : { 
					deleteName : whatName
				}
				,success : function(data) {
					console.log("delete : " + data);
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
			
			//공백만 입력하거나 아무 값도 넣지 않았을 때
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
		
		
		
		//custom_box insert method start
		var cnt = 0;
		
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
					
					
					var what_deleteName = result;
					console.log("what_deleteName : " + what_deleteName);
					
					
					var tag = "<input type='button' class='customNameBox'";
					tag += "name='" + $("#custom_text").val() + "'" 
					tag += "value='" + $("#custom_text").val() + " x'/>";
					
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
						return false;
					}
					
					//custom_box delete method start
					$(".customNameBox").on("click",function(){
						
						$.ajax({
							url : "<c:url value='/list/customDelete'/>"
							,type : "post"
							,data : {
								customName : result
							}
							,success : function(){ 
								console.log("custom delete success");
								
								$("#put_num").html("");
								
								var minus_cnt = cnt;
								minus_cnt--;
								
								var num_tag = minus_cnt;
								num_tag += "/200";
								$("#put_num").append(num_tag);
								
								$("input[name=" + result + "]").remove();
							}
							,error : function(request, status, error){
								console.log("custom error : " + error);
							}
						});
					});
					
				}
				,error : function(request, status, error) {
					console.log(error);
				}
			});
			
		}
		
	});
	
	
	
	//readList for database_table
	/* $(function(){
		$.ajax({
			url : "<c:url value='/list/readList'/>"
			,type : "post"
			,success : function(data){
				console.log(data);
				console.log("readList success");
				
				$.each(data, function(index, vo){
					var tag = "<tr>";
					tag += "<td>" + vo.fix_name + "</td>";
					tag += "<td>" + vo.put_name + "</td>";
					tag += "</tr>";
					
					$("#here").append(tag);
				})
			}
			,error : function(request, status, error){
				console.log(error);
			}
		});
	}); */
 

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
                   </div>
               </td>
           </tr>
       </table>
   </div>
   
   <table id="here"></table>
   
   <%-- <script src="<c:url value="/resources/jquery-3.5.1.min.js"/>"></script>
   <script src="<c:url value="/resources/js/app.js"/>"></script> --%>
   
</body>
</html>