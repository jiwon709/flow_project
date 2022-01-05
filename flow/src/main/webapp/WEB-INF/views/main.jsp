<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                   <input type="checkbox" name="bat">bat
                   <input type="checkbox" name="cmd">cmd
                   <input type="checkbox" name="com">com
                   <input type="checkbox" name="cpl">cpl
                   <input type="checkbox" name="exe">exe
                   <input type="checkbox" name="scr">scr
                   <input type="checkbox" name="js">js
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
               <td>
                   <input type="text">
               </td>
           </tr>
       </table>
   </div>
</body>
</html>