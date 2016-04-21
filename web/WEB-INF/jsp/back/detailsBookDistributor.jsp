<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url value="/resources/image/thumb" var="image" />
<spring:url value="/resources/image/icon" var="icon" />

<%@include file="inc/header.jsp" %>
<section class="inside clearfix mg">
    <section class="content1">
        <c:if test="${!empty bookNotExist}">
            <h2><spring:message code="book.notexist"/></h2>
        </c:if>
        <c:if test="${empty bookNotExist}">
            <c:if test="${!empty bookNotFound}">
                <h2><spring:message code="book.notfound"/></h2>
            </c:if>
            <c:if test="${empty bookNotExist && empty bookNotFound && !empty crBook}">
                <section class="bookdetails">
                    <a class="cvim">
                        <img src="http://${crBook.image }" alt="${crBook.title}">
                    </a>
                    <section class="dtls">
                        <h1><a href="">${crBook.title}</a>
                        </h1>
                        <h3><i><spring:message code="book.author"/>:</i>&nbsp; ${crBook.author}</h3>
                        <h4><i><spring:message code="book.originalprice"/>:</i>&nbsp; <strike><font color="green">${crBook.originalPrice} VNĐ</font></strike></h4>
                        <h4><i><spring:message code="book.originalprice"/>:</i>&nbsp; <i><font color="green"><spring:message code="book.isupdating"/></font></i></h4>
                        <h3><i><spring:message code="book.saleprice"/>:</i>&nbsp; <font color="red">${crBook.salePrice} VNĐ</font></h3>
                        <h3><i><spring:message code="book.status"/>:</i>&nbsp; <i><spring:message code="book.outofstock"/></i></h3>
                        <h3>
                            <i><spring:message code="book.category"/>:</i>&nbsp;
                            <a>
                                &nbsp;${crBook.category.name}
                            </a>
                        </h3>
                        <h3>
                            <i><spring:message code="book.bookset"/>:</i>&nbsp;
                            <a>
                                &nbsp;${crBook.bookSet.name}
                            </a>
                        </h3>
                    </c:if>
                </section>
                <section class="odop">
                    <h4><spring:message code="book.booknow"/></h4>
                    <button class="odb" data-bind="${crBook.idBook}#${crMbUserName}">
                        <spring:message code="book.order"/>
                    </button>
                </section>
                <article class="artcl">
                    <h2><spring:message code="book.description"/></h2>
                    <p><i>&nbsp;</i>${crBook.description}</p>
                </article>
            </section>
        </c:if>
    </section>
    <form class="hide1 odcart" id="odcart" method="post" action="${pageContext.request.contextPath }/orderDistributor">
        <h2><spring:message code="user.addressshipping"/></h2>
        <input required="" type="text" name="quantity" placeholder="Số lượng đặt mua" pattern="([0-9]{1,})">
        <input required="" type="text" name="nameBS" placeholder="Tên cửa hàng"
               pattern="[a-zA-Z0-9àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴÈÉẸẺẼÊỀẾỆỂỄÌÍỊỈĨÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠÙÚỤỦŨƯỪỨỰỬỮỲÝỴỶỸĐ ]{5,}">
        <input required="" type="text" name="adrShip" placeholder="Địa chỉ giao hàng"
               pattern="[a-zA-Z0-9àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴÈÉẸẺẼÊỀẾỆỂỄÌÍỊỈĨÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠÙÚỤỦŨƯỪỨỰỬỮỲÝỴỶỸĐ ]{5,}">
        <input required="" type="text" name="phoneNumber" placeholder="<spring:message code="user.phone"/>"                
               pattern="((\+84)|(0))[1-9]\d{2,9}">
        <input type="submit" value="OK">
    </form>
    <%@include file="inc/footer.jsp" %>