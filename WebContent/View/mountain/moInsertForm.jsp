<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../review/rvTOP.jsp"%>
<%
	int myoffset = 2;
	int mywidth = twelve - 2 * myoffset;
	int formleft = 1;
	int formright = twelve - formleft;
%>

<!-- SmartEditor -->
<script type="text/javascript" src="<%=contextPath%>/SmartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"> </script>
<!-- SmartEditor -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
#contents {
	height: 500px;
}
</style>

<style type="text/css">
.imabutton {
	background-color: #cbe7cb;
	border: none;
	color: white;
	padding: 5px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	margin: 2px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
}

.imamybutton1 {
	background-color: white;
	color: #cbe7cb;
	border: 2px solid #cbe7cb;
	border-radius: 20px;
}

.imamybutton1:hover {
	background-color: #cbe7cb;
	color: white;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
		<form class="form-horizontal" role="form" action="<%=MyCtrlByForm%>" method="post" id="frm">
			<input type="hidden" name="command" value="moInsert"> <label>MOUNTAIN WRITE</label><br>
			<br>
			<div class="form-group ">
				<label class="control-label col-sm-<%=formleft%>" for="subject">NAME</label>
				<div class="col-sm-<%=myoffset%>">
					<select class="form-control " name="area" id="area">
						<option value="-" selected="selected">--지역 선택--
						<option value="자유게시판">자유게시판
					</select>
				</div>
				<div class="col-sm-<%=formright - myoffset%>">
					<input type="text" class="form-control" name="name" id="name" placeholder="name">
				</div>
			</div>
			<br>
			<div class="form-group ">
			<label class="control-label col-sm-<%=formleft%>" for="subject">NAME</label>
			<div class="col-sm-<%=myoffset%>">
					<select class="form-control " name="area" id="thema">
						<option value="-" selected="thema">--테 마--
						<option value="꽃">꽃
						<option value="계절">계절
					</select>
				</div>
			</div>
			<br>
			<div class="form-group ">
				<label class="control-label col-sm-<%=formleft%>" for="subject">ADDRESS</label>
				<div class="col-sm-<%=formright%>">
					<input type="text" class="form-control" name="address" id="address" placeholder="address">
				</div>
			</div>
			<br>
			<div class="form-group ">
				<label class="control-label col-sm-<%=formleft%>" for="content">THUMBNAIL</label>
				<div class="col-sm-<%=formright%>" align="center">
					<img id="thumbnailt" src="<%=contextPath%>/View/images/산타니05.jpg" class="img-rounded"
						alt="Cinque Terre" width="400px" height="250px"><br><br>
					<div class="form-group">
						<button type="button" id="image_add" class="imamybutton imamybutton1">IMAGE</button>
						&nbsp;&nbsp;
						<button type="button" id="image_remove" class="imamybutton imamybutton1">DELETE</button>
						<input type="file" name="image" id="image" class="hide">
					</div>
				</div>
			</div>
			<br>
			<div class="form-group">
				<label class="control-label col-sm-<%=formleft%>" for="content">NOTE</label>
				<div class="col-sm-<%=formright%>">
					<textarea class="form-control" rows="10" cols="30" id="content" name="content"
						style="width: 100%; height: 5;"></textarea>
					<script>
							var oEditors = [];
							$(function(){
								nhn.husky.EZCreator.createInIFrame({
									oAppRef: oEditors,
									elPlaceHolder: "content",
									//SmartEditor2Skin.html 파일이 존재하는 경로
									sSkinURI: "<%=request.getContextPath()%>/SmartEditor/SmartEditor2Skin.html",	
									htParams : {
										// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
										bUseToolbar : true,				
										// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
										bUseVerticalResizer : true,		
										// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
										bUseModeChanger : true,			
										fOnBeforeUnload : function(){
											
										}
									}, 
									fOnAppLoad : function(){
										//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
										oEditors.getById["content"].exec("PASTE_HTML", [""]);	
									},
									fCreator: "createSEditor2"
									});
								});
							</script>
				</div>
			</div>
			<div class="form-group">
				<div align="center" class="col-sm-offset-5 col-sm-10">
					<button class="topmybutton topmybutton1" type="button" id="savebtn">SAVE</button>
					&nbsp;&nbsp;&nbsp;
					<button class="topmybutton topmybutton1" type="button" id="gotoback">BACK</button>
				</div>
			</div>
		</form>
	</div>

	<script>
	
	$(document).ready(function() {
		$("#image").change(function() {
			var ext = $('#image').val().split('.').pop().toLowerCase();
			if ($.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {
				alert("gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.");
				$("#image").val("");
			} else {
				var thisDom = $("#image")[0];
				if (thisDom.files && thisDom.files[0]) {
					var file = new FileReader();
					file.onload = function(e) {
						$("#thumbnailt").attr("src", e.target.result);
					}
					file.readAsDataURL(thisDom.files[0]);
				}
			}
		});
	});
	$(document).ready(function() {
		$("#image_add").click(function() {
			$("#image").click();	
		});
	});
	
	$(document).ready(function() {
		$("#savebtn").click(function() {	
			if($("#image").val() != null || $("#image").val() != "") {
				if($("#area").val() != "-"){
					if($("#name").val() != null || $("#name").val() != "") {
						if($("#address").val() != null || $("#address").val() != "") {
							oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
							$("#frm").submit();
				        	//폼 submit
						} else {
							alert("주소를 입력해주세요");
							return false;
						}
					} else {
						alert("이름을 입력해주세요");
						return false;
					}
				} else {
					alert("지역을 선택해주세요");
					return false;
				}
			} else {
				alert("THUMBNAIL을 추가해주세요");
				return false;
			}
		});
	});

	$(document).ready(function() {
		var oEditors = [];
		$(function(){
			nhn.husky.EZCreator.createInIFrame({
				oAppRef: oEditors,
				elPlaceHolder: "ir1",
				//SmartEditor2Skin.html 파일이 존재하는 경로
				sSkinURI: "../SmartEditor/SmartEditor2Skin.html",	
				htParams : {
					// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseToolbar : true,				
					// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseVerticalResizer : true,		
					// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
					bUseModeChanger : true,			
					fOnBeforeUnload : function(){
						
					}
				}, 
				fOnAppLoad : function(){
					//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
					oEditors.getById["ir1"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문구"]);	
				},
				fCreator: "createSEditor2"
				});
			});
		});
	
		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});
		
		$(document).ready(function() {
			$("#gotoback").click(function() {
				location.href='<%=MyCtrlCommand%>boList&${requestScope.parameters}';
											});
						});//뒤로가기
	</script>
</body>
</html>
