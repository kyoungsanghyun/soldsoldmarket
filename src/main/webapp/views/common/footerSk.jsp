<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>   
<c:set var = "path" value = "${pageContext.request.contextPath}"/>  
<style>
a{
    text-decoration: none;
}
</style>
	<footer>
		<div id="footer01">
            <span><a href="${path}/Terms">이용약관</a> </span><span>|</span><span><a href="${path}/Privacy">개인정보처리방침</a> </span><span>|</span><span> 회원정보</span>
			<p>CopyRight2022<br>
            soldsoldMarket</p>
        </div>
	</footer>

</body>
</html> 