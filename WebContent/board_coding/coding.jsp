<%@page import="com.hanul.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.hanul.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardDAO boardDAO = new BoardDAO();
	
	int curPage = 1;
	String kind = request.getParameter("kind");
	String search = request.getParameter("search");
	
	if(kind==null){
		kind = "subject";
	}
	
	if(search==null){
		
		search="";
	}
	try{
		curPage = Integer.parseInt(request.getParameter("curPage"));
		
	} catch(Exception e){}
 
	int perPage = 10;
	int startRow = (curPage-1)*perPage+1;
	int lastRow = curPage*perPage;
	
	List<BoardDTO> ar = boardDAO.selectList(kind, search, startRow, lastRow);
	
	
	int totalCount = boardDAO.getCount(kind, search);
	
	int totalPage = totalCount/perPage;
	if(totalCount%10 != 0){
		totalPage++;
	}
	
	int perBlock = 5;
	int totalBlock = totalPage/perBlock;
	if(totalPage%5 != 0){
		totalBlock++;
	}
	
	int curBlock = curPage/perBlock;
	if(curPage%5 != 0){
		curBlock++;
	}
	
	int startNum = (curBlock-1)*perBlock+1;
	int lastNum = curBlock*perBlock;
	
	if(curBlock == totalBlock){
		lastNum = totalPage;
	} 
			
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../temp/style.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../temp/header.jsp"></jsp:include>

<div class="size_board">
<jsp:include page="../temp/leftMenu.jsp"></jsp:include>
	<div class="menuName">
			<div class="menuCenter">
				<p>coding</p>
			</div>
	</div>	
	
			
	<div class="content_b">
	<div class="container" style="width: 930px">
	<table class="table table-hover">
			
			<tr>
				<th>Num</th>
				<th>Subject</th>
				<th>Writer</th>
				<th>Date</th>
				<th>Hit</th>
			</tr>
			  
			<%for(BoardDTO boardDTO : ar){ %>
			<tr>
				<td><%= boardDTO.getNum()%></td>
				<td><a href="" style="color: black"><%= boardDTO.getSubject()%></a></td>
				<td><%= boardDTO.getWriter()%></td>
				<td><%= boardDTO.getReg_date()%></td>
				<td><%= boardDTO.getHit()%></td>
				
			</tr>
			<%} %>
			
	</table>
	</div>	
		
		<div id="searchBar">
			<form class="form-inline" action="./coding.jsp">
			    <div class="form-group">
			    	<select class="form-control" name="kind">
				        <option>subject</option>
				        <option>content</option>
				        <option>writer</option>
			     	</select>	
						    
			      <input type="text" class="form-control" id="search" placeholder="Enter search" name="search">
			    </div>
			    
			    <button type="submit" class="btn btn-default">Search</button>
			  </form>
		</div>
		
		<div style="text-align: right">
			<a href="" class="btn btn-primary" role="button">Write</a>
		</div> 
	
		<div class="container-fluid">
			<div class="row" style="text-align: center">
				    
			  <ul class="pagination">
			  	<li><a href="./coding.jsp?curPage=<%= 1%>&kind=<%=kind%>&search=<%=search%>"><span class="glyphicon glyphicon-backward"></span></a></li>
			  	
			  	<%if (curBlock>1){ %>
			  	<li><a href="./coding.jsp?curPage=<%= startNum-1%>&kind=<%=kind%>&search=<%=search%>"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
			  	<%} %>
			   	<% for(int i=startNum;i<=lastNum;i++){ %>
			   		<li><a href="./coding.jsp?curPage=<%=i%>&kind=<%=kind%>&search=<%=search%>"><%=i%></a></li>
			   	<%} %>
			   	
			   	<% if(curBlock < totalBlock){ %>
			   	<li><a href="./coding.jsp?curPage=<%=lastNum+1%>&kind=<%=kind%>&search=<%=search%>"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
			   	<%} %>	
			   	<li><a href="./coding.jsp?curPage=<%=totalPage%>&kind=<%=kind%>&search=<%=search%>"><span class="glyphicon glyphicon-forward"></span></a></li>
			  </ul>
			  
		  	</div>
		</div>
	
	
	</div>

</div>	
	

<jsp:include page="../temp/footer.jsp"></jsp:include>
</body>
</html>