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
<section class="msg">${msg }</section>
<a href="${pageContext.request.contextPath }/staffmanager/addBook"
   class="addBook"> Thêm sách</a>

<section class="search">
    <form method="get" action="" name="adsearchFrm" id="adsearchFrm">
        <select name="op" id="searchOption">
            <option class="op" value="n1" selected="selected">
                &raquo; <spring:message code="search.searchbyname"/> 
            </option>
            <option class="op" disabled="disabled">
                <spring:message code="search.searchbycategory"/>
            </option>
            <c:if test="${!empty listCandBS[0]}">
                <c:forEach items="${listCandBS[0]}" var="rowsC">
                    <option class="op" value="ct${rowsC.idCategory}">&raquo; ${rowsC.name}</option>
                </c:forEach>
            </c:if>
            <option class="op" disabled="disabled"><spring:message code="search.searchbybookset"/></option>
            <c:if test="${!empty listCandBS[1]}">
                <c:forEach items="${listCandBS[1]}" var="rowsBS">
                    <option class="op" value="bs${rowsBS.idBookSet}">&raquo; ${rowsBS.name}</option>
                </c:forEach>
            </c:if>
        </select>
        <input type="text" name="key" id="searchVal">
        <input type="submit" value="Tìm kiếm">
    </form>
    <h1>&clubs; <spring:message code="book.bookset"/>:</h1>
    <c:if test="${!empty listCandBS[0]}">
        <ul class="allC">
            <c:forEach items="${listCandBS[0]}" var="rowsC">
                <li>
                    <a href="${pageContext.request.contextPath }/staffmanager?ct=${rowsC.idCategory }&name=${rowsC.sortLink}">
                        &raquo; ${rowsC.name}
                    </a>
                </li>
            </c:forEach>
        </ul>
    </c:if>
    <h1>&clubs; <spring:message code="book.category"/>:</h1>
    <c:if test="${!empty listCandBS[1]}">
        <ul class="allBS">
            <c:forEach items="${listCandBS[1]}" var="rowsBS">
                <li>
                    <a href="${pageContext.request.contextPath }/staffmanager?bs=${rowsBS.idBookSet }&name=${rowsBS.sortLink}">
                        &raquo; ${rowsBS.name}
                    </a>
                </li>
            </c:forEach>
        </ul>
    </c:if>
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
            <th><spring:message code="cart.quantity" /></th>
            <th><spring:message code="cart.category" /></th>
            <th><spring:message code="cart.bookset" /></th>
            <th colspan="2"><spring:message code="cart.option" /></th>
        </tr>
        <pg:paging pageSize="9">
            <c:forEach items="${listBook }" var="rows">
                <pg:item>
                    <tr>
                        <td>${rows.title }</td>
                        <td><img src="${image}/${rows.image}" alt="${rows.title}"
                                 style="width: 100px; height: 100px;"></td>
                        <td>${rows.author }</td>
                        <td>${rows.originalPrice }</td>
                        <td>${rows.salePrice }</td>
                        <td>${rows.quantity }</td>
                        <td>${rows.category.description }</td>
                        <td>${rows.set.description }</td>
                        <td><a href="" class="btnDelBook" data-id="${rows.idBook }">
                                Xóa </a></td>
                        <td><a class="btnEditBook" data-id="${rows.idBook }"
                               href="${pageContext.request.contextPath }/staffmanager/editBook?idBook=${rows.idBook }"> 
                                Sửa
                            </a></td>
                    </tr>
                </pg:item>
            </c:forEach>
        </pg:paging>
    </table> <!-- End Table -->
</section> <!-- End AllBook -->
<!--</section>-->
<%@include file="inc/footer.jsp" %>