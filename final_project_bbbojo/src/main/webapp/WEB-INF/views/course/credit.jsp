<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../includes/head.jsp"/>
<sec:csrfMetaTags/>
</head>
<body>
<jsp:include page="../includes/header.jsp"/>
			<div class="content-body" >
                <div class="enrollInfo card col-lg-6" style="float: none; margin: 0 auto">
               		<div class="card mt-3">
               			<div class="card-body">
             				<div class="float-left mt-1 ml-2">
		                       	<label for="avg">평균 : </label>
		                       	<input type="text" id="avg" disabled="disabled" value="0" name="avg" style="border: none; background: transparent;">
              					</div>
	                       	<div class="float-right">
		                       	<button class="btn btn-primary" id="add">추가</button>
		                       	<button class="btn btn-primary" id="addAll">저장</button>
	                       	</div>
	                       	<sec:authentication property="principal" var="pinfo"/>
		                    <sec:authorize access="isAuthenticated()">
		                    <input type="hidden" name="studno" id="studno" value="${pinfo.memberVo.studno}"/>
		                    </sec:authorize>
               			</div>
               		</div>
                	<div class="mt-3 mb-3">
                        <div class="p-0"  id="table">
                            <table class="table rounded m-0"  style="border-radius: 0.25rem;">
                                <thead class="table-active" style="background: none;">
                                    <tr class="text-center">
                                        <th colspan="8">과목명</th>
	                                    <th>학점 0/4.5 (0.1+)</th>
                                    </tr>
                                </thead>
                                <tbody id="enrollList">
                                
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
			</div>
<jsp:include page="../includes/footer.jsp"/>
<script src="${pageContext.request.contextPath}/resources/js/course.js"></script>
<script>
var csrfHeader = $("meta[name='_csrf_header']").attr("content");
var csrfToken = $("meta[name='_csrf']").attr("content");

$(document).ajaxSend(function(e, xhr) {
	xhr.setRequestHeader(csrfHeader, csrfToken);
});
var count = 0;
var count2 = 0;
var studno = $("#studno").val();
$(function () {
	creditService.get(studno, function (data) {
		for(var i in data){
		var str = "";
		str += '<tr class="text-center">'
        str += '	<td colspan="8"><input class="form-control-sm w-100 text-center mt-1" type="text"value="'+data[i].courname+'"></td>'
        str += '	<td><input type="range" min="0.0" max="4.5" step="0.1" name="credit'+count++ +'"  id="credit" value="0" class="form-range mt-2"> </td>'
        str += '	<td colspan="1"><p class="mt-2" name="value'+count2++ +'"></p></td>'
		str += '</tr>'
	$("#enrollList").append(str);
		}
	})
	
	// 행 추가
	
	$("#add").click(function () {
		var str = "";
			str += '<tr class="text-center">'
            str += ' <td colspan="8"><input type="text"></td>'
            str += '<td><input type="range" min="0.0" max="4.5" step="0.1" name="credit'+count++ +'"  id="credit" value="0" class="form-range"> </td>'
            str += '<td><p name="value'+count2++ +'"></p></td>'
			str += ' </tr>'
		$("#enrollList").append(str);
	})
	

	// 학점값 자동계산
	$('#enrollList').on('change',function(){
		var value = 0;
		var result = 0;
		var avg = 0;
		var length2 = 0;
		for(var i = 0; i < $('tr').length-1; i++){
			value = $('input[name=credit'+i+']').val();
			$('p[name=value'+i+']').text(value);
			
			if(value != 0){
				length2 += 1;
			}
			result = Number(result) + Number(value);
		}
			avg = result/Number(length2);
		$('#avg').val(avg);
	})
	
	// 과목 저장
	$('#addAll').click(function () {
		var a = $('#enrollList').children('tr').length;
		var list = new Array();
		for(var i = 0; i<a; i++){
			var b = new Object();
			b.courname = $('#enrollList').children('tr').eq(i).children().children().val();
			b.studno = studno;
			if(b.courname){
			list.push(b);
			}
		}
		creditService.add(list);
		alert("저장 완료");
		location.reload();
	})
})
</script>
<jsp:include page="../includes/foot.jsp"/>
</body>
</html>