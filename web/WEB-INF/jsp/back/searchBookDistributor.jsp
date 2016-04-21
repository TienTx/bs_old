<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="tool.MyTool"%>
<%@page import="entity.person.employee.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="pg" uri="/WEB-INF/lib/pagertag.jar"%>
<spring:url value="/resources/image/thumb" var="image" />

<%@include file="inc/header.jsp" %>
<section class="search">
    <form method="get" action="" name="searchBookDistributor" id="searchBookDistributor">
        <input type="text" name="key" id="searchVal">
        <input type="submit" value="Tìm kiếm">
    </form>
</section>
<section class="distributor">
    <a href="${pageContext.request.contextPath }/staffmanager/searchBookDistributor?nxb=nha-xuat-ban-ha-noi">Nhà xuất bản hà nội</a>
    <a href="${pageContext.request.contextPath }/staffmanager/searchBookDistributor?nxb=nha-xuat-ban-da-nang">Nhà xuất bản đà nẵng</a>
</section>


<section class="page">
    <c:forEach items="${pages }" var="page">
        <a href="${url }?pageNum=${page } ">${page } </a>
    </c:forEach>
</section> <!-- End Page -->
<section class="allBook">
    <table class="outtable">
        <tr>
            <th><spring:message code="cart.book" /></th>
            <th><spring:message code="cart.coverimage" /></th>
            <th><spring:message code="cart.author" /></th>
            <th><spring:message code="cart.price" /></th>
            <th><spring:message code="cart.saleprice" /></th>
            <th>Số lượng đặt hàng tối đa</th>
            <th><spring:message code="cart.category" /></th>
            <th><spring:message code="cart.bookset" /></th>
            <th>Nhà cung cấp</th>
        </tr>
        <pg:paging pageSize="9">
            <c:forEach items="${listBook }" var="rows">
                <script type="text/javascript">
                    var s = convertString('${rows.publisher}');
                    alert(s);
                </script>
                <pg:item>
                    <tr>
                        <c:set var="nxb" value="nha-xuat-ban-ha-noi"/>
                        <c:choose>
                            <c:when test="${rows.publisher == 'Nhà xuất bản Hà Nội'}">
                                <c:set var="nxb" value="nha-xuat-ban-ha-noi"/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="nxb" value="nha-xuat-ban-da-nang"/>
                            </c:otherwise>
                        </c:choose>                            
                        <td><a href="${pageContext.request.contextPath }/staffmanager/${nxb}/detailsBookDistributor?idBook=${rows.idBook }">
                                ${rows.title }
                            </a></td>
                        <td><a href="${pageContext.request.contextPath }/staffmanager/${nxb}/detailsBookDistributor?idBook=${rows.idBook }">
                                <img src="http://${rows.image }" alt="${rows.title}" style="width: 100px; height: 100px;">
                            </a></td>
                        <td>${rows.author }</td>
                        <td>${rows.originalPrice }</td>
                        <td>${rows.salePrice }</td>
                        <td>${rows.quantity }</td>
                        <td>${rows.category.name }</td>
                        <td>${rows.bookSet.name }</td>
                        <td>${rows.publisher }</td>                        
                    </tr>
                </pg:item>
            </c:forEach>
        </pg:paging>
    </table> <!-- End Table -->
</section> <!-- End AllBook -->

<%@include file="inc/footer.jsp" %>