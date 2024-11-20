<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../admin/header.jsp"%>
<head>
<style>
#scrollTopBtn {
	position: fixed;
	bottom: 20px;
	right: 20px;
	width: 50px;
	height: 50px;
	background-color: rgba(255, 255, 255, 0.5);
	color: black;
	border-radius: 50%;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	display: none;
	justify-content: center;
	align-items: center;
	text-align: center;
	font-size: 16px;
	cursor: pointer;
	transition: opacity 0.3s, transform 0.3s;
}

#scrollTopBtn:hover {
	opacity: 0.8;
	transform: scale(1.1);
}

#scrollTopBtn:active {
	transform: scale(0.9);
}

.modal {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	display: none;
	justify-content: center;
	align-items: center;
	z-index: 1000;
}

h1 {
	font-size: 30px;
}
.hideCom {
	background-color: #fff;
	width: 80%;
	max-width: 800px;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	z-index: 1001;
	position: relative;
}

.modaltable{
background-color: #fff;
	width: 80%;
	max-width: 800px;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	z-index: 1001;
	position: relative;
}
#closeModal {
	position: absolute;
	top: 10px;
	right: 25px;
	font-size: 35px;
	color: #333;
	cursor: pointer;
	font-weight: bold;
}

.hideCom table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

.hideCom th, .hideCom td {
	border-bottom: 1px solid #ddd;
}

.hideCom th {
	background-color: #f4f4f4;
	font-weight: bold;
}

table, tr, td, th{
	height: 56px;
}


.hideContent {
	display: none;
}


.cm_no {
	width: 50px;
}

.admin_table{
	background-color: #f4f4f4;
}

.inner tr {
	height: 56px !important;
}

button{
	padding: 0 10px;
}

.inner table button{
	border-radius: 5px;
	background-color: black;
	color: white;
}
section#admin .button_list, 
section#admin1 .button_list {
    float: right;
    margin-bottom: 30px;
}

section#admin .button_list button, 
section#admin1 .button_list button {
    width: 55px;
    height: 30px;
    border-radius: 5px;
	background-color: black;
	color: white;
}

section#admin div.inner table, 
section#admin1 div.inner table {
    width: 100%;
    text-align: center;
    border: solid 1px red;
    border-collapse: collapse;
}

section#admin div.inner table tr,
section#admin div.inner table tr th,
section#admin div.inner table tr td,
section#admin1 div.inner table tr,
section#admin1 div.inner table tr th,
section#admin1 div.inner table tr td {
    border: solid 1px #e3e3e3;
}

section#admin div.inner table tr:nth-of-type(1), 
section#admin1 div.inner table tr:nth-of-type(1) {
    height: 30px;
}

section#admin div.inner table tr:nth-child(even), 
section#admin1 div.inner table tr:nth-child(even) {
    height: 50px;
}

section#admin div.inner table tr td:nth-of-type(1), 
section#admin1 div.inner table tr td:nth-of-type(1) {
    width: 50px;
}

section#admin1 div.inner table tr td > input[type=text], section#admin1 div.inner table tr td textarea, 
section#admin1 div.inner table tr td > input[type=text], section#admin1 div.inner table tr td textarea {
	height: 50px;
	font-size: 16px;
}

section#admin div.inner table tr td input[type=text] 
 {	
 	height: 100%;
    width: 100%;
    border: none;
    text-align: center;
}
section#admin1 div.inner table tr td input[type=text]{
	width: 100%;
    border: none;
    text-align: center
}

section#admin div.inner table tr td textarea, 
section#admin1 div.inner table tr td textarea {
    width: 100%;	
    padding: 5px;
    border: none;
    vertical-align: middle;
}

section#admin div.inner table tr td img, 
section#admin1 div.inner table tr td img {
    width: 50%;
}

section#admin div.inner table tr td textarea {
	background-color: #ddd;
}

section#admin div.inner table tr input:read-only, 
section#admin1 div.inner table tr input:read-only {
    outline: none;
}

#admin1 {
	margin-top : 40px;
}

.inner tr{
	font-size: 20px;
}

.inner th input, .inner td input{
	font-size: 18px;	
}
</style>
<body>
	<%@ include file="../admin/menu.jsp"%>
	<main>
		<section id="admin">
			<h1>쇼핑정보 관리</h1>
			<div class="inner">
				<div class="button_list">
					<button class="update_button pointer">수정</button>
					<button class="delete_button pointer">삭제</button>
				</div>

				<table>
					<tr class="admin_table">
						<th><input type="checkbox" id="all_check" class="pointer"
							name="all_check"></th>
						<th style="width: 120px;">글번호</th>
						<th style="width: 120px;">작성자</th>
						<th>제목</th>
						<th style="width: 150px;">작성일자</th>
						<th style="width: 150px;">관리</th>
					</tr>
					<c:forEach items="${shoppingList}" var="shoppingList">
						<tr>
							<td><input type="checkbox" class="check pointer"
								name="commu_check"></td>
							<td><input type="text" name="cm_no"
								value="${shoppingList.cm_no}" readonly></td>
							<td><input type="text" name="cm_writer"
								value="${shoppingList.cm_writer}" readonly></td>
							<td><input type="text" name="cm_title"
								value="${shoppingList.cm_title}"></td>
							<td><input type="text" name="cm_date"
								value="${shoppingList.cm_date}" readonly>
							<td>
								<button style="cursor: pointer;"
									onclick="ShowComment(${shoppingList.cm_no})">댓글</button>
								<button style="cursor: pointer;"
									onclick="ContentTog(${shoppingList.cm_no})">상세</button>
							</td>
						</tr>
						<tr class="hideContent${shoppingList.cm_no} hideContent">
							<td colspan="2">수정하기</td>
							<td colspan="4"><textarea id="content" class="inputData"
									name="cm_content" placeholder="내용 입력">${shoppingList.cm_content}</textarea></td>
						</tr>
						<tr class="hideContent${shoppingList.cm_no} hideContent">
							<td colspan="6" style="border: none;" class="hide content"><c:choose>
									<c:when test="${not empty shoppingList.cm_img}">
										<c:forEach items="${fn:split(shoppingList.cm_img, ',')}"
											var="img">
											<img style="width: 300px; height: 300px; display: inline;"
												src="${pageContext.request.contextPath}/resources/img/community/${img.trim()}">
										</c:forEach>
									</c:when>
									<c:otherwise>
										<p></p>
									</c:otherwise>
								</c:choose></td>
						</tr>
					</c:forEach>
				</table>

			</div>
		</section>
	</main>
	<div class="modal" id="modal">
		<main class="hideCom">
			<span id="closeModal">&times;</span>
			<section id="admin1">
				<div class="inner">
					<table>
						<tr>
							<th>글번호</th>
							<th style="width: 100px;">작성자</th>
							<th>댓글내용</th>
							<th style="width: 180px;">작성일</th>
							<th>관리</th>
						</tr>
						<tbody class="modalCom">
							<c:forEach items="${shoppingListCom}" var="shoppingCom">
								<tr>
									<td><input type="text" name="cm_no"
										value="${shoppingCom.cm_no }" readonly></td>
									<td><input type="text" name="co_writer"
										value="${shoppingCom.co_writer }" readonly></td>
									<td><input type="text" name="co_content"
										value="${shoppingCom.co_content }" readonly></td>
									<td><input type="text" name="co_date"
										value="${shoppingCom.co_date }" readonly></td>
									<td><button type="button"
											onclick="deleteCom(${shoppingCom.cm_no}, ${shoppingCom.co_no})">삭제</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</section>
		</main>
	</div>
	<script>
		function ContentTog(cm_no){
			let Tog = ".hideContent" + cm_no;
			$(Tog).toggle();
		}
	
	
		$("#all_check").click(function(){
			let result = false;
			
			$(".check").each(function(index, item){
				if($(item).prop("checked") == true){
					result = true;
				}
				
				if(result == false){
					$(item).prop("checked", true);
				} else {
					$(item).prop("checked", false);
				}
			});
		});
		
		$(".delete_button").click(function () {
			$("input.check:checked").each(function () {
						let tr = $(this).closest("tr");
						let nexttr = $(tr).netx("tr");
						let cm_no = $(tr).children("td").children("input[name='cm_no']").val();
						let cm_title = $(tr).children("td").children("input[name='cm_title']").val();
						let cm_content = $(nexttr).children("td").children("textarea[name='cm_content']").val();

						if (confirm("정말로 삭제하시겠습니까?")) {
							$.ajax({
								type: "POST",
								url: "/adminShoppingDelete.do",
								data: {
									cm_no: cm_no,
									cm_title: cm_title,
									cm_content: cm_content
								},
								cache: false,
								success: function (data) {
									console.log('ajax 성공');
									console.log(data);
									console.log(data.length);
									
									let con = '<tr>';
									con += '<th><input type="checkbox" id="all_check" class="pointer" name="all_check"></th>';
									con += '<th style="width: 120px;">글번호</th>';
									con += '<th style="width: 120px;">작성자</th>';
									con += '<th>제목</th>';
									con += '<th style="width: 150px;">작성일자</th>';
									con += '<th style="width: 150px;">관리</th>';
									con += '</tr>';

									if (data.length > 0) {
										$("table").html("");
										for (let i = 0; i < data.length; i++) {
											con += '<tr>';
											con += '<td><input type="checkbox" class="check pointer" name="vs_check"></td>';
											con += '<td><input type="text" name="cm_no" value="'+data[i].cm_no+'" readonly></td>'
											con += '<td><input type="text" name="cm_writer" value="' + data[i].cm_writer + '" readonly></td>';
											con += '<td><input type="text" name="cm_title" value="' + data[i].cm_title + '"></td>';
											con += '<td><input type="text" name="cm_date" value="' + data[i].cm_date + '" readonly>';
											con += '<td>';
											con += '<button style="cursor: pointer;" onclick="ShowComment('+data[i].cm_no +')">댓글</button>';
											con += '<button style="margin-left: 5px; cursor: pointer;" onclick="ContentTog('+data[i].cm_no+')">상세</button>';
											con += '</td>';
											con += '</tr>';
											con += '<tr class="hideContent' +data[i].cm_no +' hideContent">';
											con += '<td colspan="2">수정하기</td>';
											con += '<td colspan="4" style="vertical-align: top; height: inherit;">';
											con += '<textarea style="height: 100%;"id="content" class="inputData" name="cm_content" placeholder="내용 입력">'+ data[i].cm_content +'</textarea></td>';
											con += '</tr>';
											con += '<tr class="hideContent'+data[i].cm_no +' hideContent">';
											
											if(data[i].cm_img != null){
												console.log(data[i].cm_img, "if문");
												con += '<td colspan="6" style="border: none;" class="hide content">';
													
												 const imgArray = data[i].cm_img.split(',');
												 console.log('imgArray',imgArray);	
												 
												 imgArray.forEach(function(img)  {	
													 con += '<img style="width: 300px; height: 300px;display: inline;"	src="${pageContext.request.contextPath}/resources/img/community/'+ img.trim() + '">';
												        console.log('img',img.trim());
												    });
												 con += '</td>';
											} else {
												con += '<td colspan="6"><p></p></td>';
											}
											con += '</tr>';
										}
									} else {
										con += '<tr>'
										con += '<td colspan="5">'
										con += '<p>내용없음</p>'
										con += '</td>'
									}
									alert("삭제가 완료되었습니다.");
									$("table").append(con);

								},
								error: function (error) {
								}
							});
						}
					});
		});
		
	
		function ShowComment(cm_no){
			$.ajax({
				type : "post",
				url : "/adminShoppingCom.do",
				data : {
					cm_no : cm_no
				},
				cache : false,
				
				success : function(data){
					let com = '';
					console.log("ajax success");
					console.log(data);
					console.log(data.length);
					$(".modalCom").html("");
					
					if(data.length>0){
						console.log("if문");
						for(let i = 0; i < data.length; i++){
							console.log("for문");
							com += '<tr>'
							com += '<td><input type="text" name="cm_no"	value="'+data[i].cm_no+'" readonly></td>'
							com += '<td><input type="text" name="co_writer"	value="'+data[i].co_writer+'" readonly></td>'
							com += '<td><input type="text" name="co_content" value="'+data[i].co_content+'" readonly></td>'
							com += '<td><input type="text" name="co_date" value="'+data[i].co_date+'" readonly></td>'
							com += '<td><button type="button" onclick="deleteCom('+data[i].cm_no+')">삭제</button></td>';
							com += '</tr>'
							}
						
						} else {
							com += '<tr><td colspan="5"><p>댓글이 없습니다.</p></td></tr>'
						}
						
					$(".modalCom").append(com);
					$(".modal").show();
		 			$('#modal').css("display", "flex");
					},
					error : function (error){
						
					}
					
		    });
		}
			
		$('#closeModal').click(function() {
		    $('#modal').hide();
		});
		
		$(".update_button").click(function () {
			$("input.check:checked").each(function () {
						let tr = $(this).closest("tr");
						let nexttr = $(tr).next("tr");
						let cm_no = $(tr).children("td").children("input[name='cm_no']").val();
						let cm_title = $(tr).children("td").children("input[name='cm_title']").val();
						let cm_content = $(nexttr).children("td").children("textarea[name='cm_content']").val();

						if (confirm("수정 하시겠습니까?")) {
							$.ajax({
								type: "POST",
								url: "/adminShoppingUpdate.do",
								data: {
									cm_no: cm_no,
									cm_title: cm_title,
									cm_content: cm_content
								},
								cache: false,
								success: function (data) {
									console.log('ajax 성공');
									console.log(data);
									console.log(data.length);
									
									let con = '<tr>';
									con += '<th><input type="checkbox" id="all_check" class="pointer" name="all_check"></th>';
									con += '<th style="width: 120px;">글번호</th>';
									con += '<th style="width: 120px;">작성자</th>';
									con += '<th>제목</th>';
									con += '<th style="width: 150px;">작성일자</th>';
									con += '<th style="width: 150px;">관리</th>';
									con += '</tr>';

									if (data.length > 0) {
										$("#admin table").html("");
										for (let i = 0; i < data.length; i++) {
											con += '<tr>';
											con += '<td><input type="checkbox" class="check pointer" name="vs_check"></td>';
											con += '<td><input type="text" name="cm_no" value="'+data[i].cm_no+'" readonly></td>'
											con += '<td><input type="text" name="cm_writer" value="' + data[i].cm_writer + '" readonly></td>';
											con += '<td><input type="text" name="cm_title" value="' + data[i].cm_title + '"></td>';
											con += '<td><input type="text" name="cm_date" value="' + data[i].cm_date + '" readonly>';
											con += '<td>';
											con += '<button style="cursor: pointer;" onclick="ShowComment('+data[i].cm_no +')">댓글</button>';
											con += '<button style="margin-left: 5px; cursor: pointer;" onclick="ContentTog('+data[i].cm_no+')">상세</button>';
											con += '</td>';
											con += '</tr>';
											con += '<tr class="hideContent' +data[i].cm_no +' hideContent">';
											con += '<td colspan="2">수정하기</td>';
											con += '<td colspan="4" style="vertical-align: top; height: inherit;">';
											con += '<textarea style="height: 100%;"id="content" class="inputData" name="cm_content" placeholder="내용 입력">'+ data[i].cm_content +'</textarea></td>';
											con += '</tr>';
											con += '<tr class="hideContent'+data[i].cm_no +' hideContent">';
											
											if(data[i].cm_img != null){
												console.log(data[i].cm_img, "if문");
												con += '<td colspan="6" style="border: none;" class="hide content">';
													
												 const imgArray = data[i].cm_img.split(',');
												 console.log('imgArray',imgArray);	
												 
												 imgArray.forEach(function(img)  {	
													 con += '<img style="width: 300px; height: 300px;display: inline;"	src="${pageContext.request.contextPath}/resources/img/community/'+ img.trim() + '">';
												        console.log('img',img.trim());
												    });
												 con += '</td>';
											} else {
												con += '<td colspan="6"><p></p></td>';
											}
											con += '</tr>';
										}
									} else {
										con += '<tr>'
										con += '<td colspan="5">'
										con += '<p>내용없음</p>'
										con += '</td>'
									}
									alert("수정이 완료되었습니다.");
									$("#admin table").append(con);

								},
								error: function (error) {
								}
							});
						}
					});
		});
		
		function deleteCom(cm_no, co_no){
			if(confirm("정말 삭제하시겠습니까?")){
			$.ajax({
				type : "post",
				url : "/adminShoppingComDel.do",
				data : {cm_no : cm_no, co_no : co_no},
				cache : false,
				
				success : function(data){
					let com="";
					console.log("ajax 들어옴");
					console.log(data);
					$(".modalCom").html("");
					
					if(data.length > 0){
						console.log("if문");
						for(let i = 0; i < data.length; i++){
							console.log("for문");
							com += '<tr>'
							com += '<td><input type="text" name="cm_no"	value="'+data[i].cm_no+'" readonly></td>'
							com += '<td><input type="text" name="co_writer"	value="'+data[i].co_writer+'" readonly></td>'
							com += '<td><input type="text" name="co_content" value="'+data[i].co_content+'" readonly></td>'
							com += '<td><input type="text" name="co_date" value="'+data[i].co_date+'" readonly></td>'
							com += '<td><button type="button" onclick="deleteCom('+data[i].cm_no+ ', '+data[i].co_no+')">삭제</button></td>'
							com += '</tr>'
						}
					} else {
						com += '<tr><td colspan="5"><p>삭제할 내용이 없습니다.</p></td></tr>'
					}
					$(".modalCom").append(com);
					$(".modal").show();
					$('#modal').css("display", "flex");
				},
				error : function (error){
					
				}
			});
			}
		}
	</script>
</body>









