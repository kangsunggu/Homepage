<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.util.*" %>
<%@ page import="memo.*" %>
<%@ page import="utility.*" %>
<%@ page import="bbs.*" %>
<%@ page import="member.*" %>
<%@ page import="images.*" %>


<%@ page import="org.apache.commons.fileupload.*" %>

<jsp:useBean id="mdao" class="memo.MemoDAO"/>
<jsp:useBean id="bdao" class="bbs.BbsDAO"/>
<jsp:useBean id="dao" class="member.MemberDAO"/>
<jsp:useBean id="idao" class="images.ImagesDAO"/>

<% request.setCharacterEncoding("utf-8"); 
	String root = request.getContextPath();
%> 
 
