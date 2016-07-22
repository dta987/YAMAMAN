<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../member/meMypage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="panel panel-success">
		<div class="panel-heading">회원목록</div>
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>닉네임</th>
					<th>가입일자</th>
					<c:if test="${sessionScope.whologin == 2}">
						<th>수정</th>
						<th>삭제</th>
					</c:if>
				</tr>
			</thead>

			<c:forEach var="bean" items="${requestScope.lists}">
				<tr>
					<td>${bean.user_id}</td>
					<td><a href="<%=MyCtrlCommand%>meDetailView&id=${bean.user_id}&${requestScope.parameters}">${bean.user_name}</a></td>
					<td>${bean.user_email}</td>
					<td>${bean.user_nickname}</td>
					<td>${bean.sign_date}</td>
					<c:if test="${sessionScope.whologin == 2}">
						<td><a
							href="<%=MyCtrlCommand%>meUpdateForm&id=${bean.user_id}&${requestScope.parameters}">수정</a></td>
						<td><a href="<%=MyCtrlCommand%>meDelete&id=${bean.user_id}&${requestScope.parameters}">삭제</a></td>
					</c:if>
				</tr>
			</c:forEach>

			<tr>
				<td colspan="10" align="center">
					<form class="form-inline" role="form" name="myform" action="<%=MyCtrlByForm%>" method="get">
						<input type="hidden" name="command" value="meList">
						<div class="form-group">
							<select class="form-control" name="mode" id="mode">
								<option value="-" selected="selected">-- 선택하세요---------
								<option value="user_name">이름
								<option value="user_id">아이디
								<option value="user_nickname">닉네임
							</select>
						</div>
						<div class="form-group">
							<input type="text" class="form-control btn-xs" name="keyword" id="keyword"
								placeholder="검색 키워드">
						</div>
						<button class="btn btn-default btn-warning" type="submit">검색</button>
						<button class="btn btn-default btn-warning" type="button" id="searchAll">전체검색</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<p class="form-control-static">${requestScope.pagingStatus}</p>
					</form>
				</td>
			</tr>
		</table>
		<div align="center">
			<footer>${requestScope.pagingHtml}</footer>
		</div>
	</div>

	<script type="text/javascript">
	$(document).ready(function() {
		$("#searchAll").click(function() {
			location.href = '<%=MyCtrlCommand%>meList'
			})
		})

		$(document).ready(function() {
			$("#mode option").each(function(index) {
				if ($(this).val() == "${requestScope.mode}") {
					$(this).attr("selected", "selected");
				}
			})
		})

		$(document).ready(function() {
			$("#keyword").val("${requestScope.keyword}");
		})
	</script>
</body>
</html>