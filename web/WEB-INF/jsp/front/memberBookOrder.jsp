<%@page import="entity.order.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url value="/resources/image/thumb" var="image" />
<spring:url value="/resources/image/icon" var="icon" />
<%@include file="../template/header.jsp" %>
<%@include file="inc/topHeader.jsp" %>
<%@include file="inc/navigation.jsp" %>

<section class="inside clearfix mg">
    <section class="content">
        <fieldset id="addressShipping">
            <legend><spring:message code="order.order"/></legend>
            <h2 id="ordererror" class="hide"><spring:message code="order.ordererror"/></h2>
            <c:if test="${!empty bookNotFound && bookNotFound == true}">
                <h2><spring:message code="book.notfound"/></h2>
            </c:if>
            <c:if test="${empty bookNotFound && !empty currentBookOrder}">
                <form id="bodbmb" action="" method="post">

                    <table class="outtable">
                        <tr>
                            <th><spring:message code="cart.book"/></th>
                            <th><spring:message code="cart.coverimage"/></th>
                            <th><spring:message code="cart.author"/></th>
                            <th><spring:message code="cart.price"/></th>
                            <th><spring:message code="cart.saleprice"/></th>
                            <th><spring:message code="cart.quantity"/></th>
                            <th><spring:message code="cart.category"/></th>
                            <th><spring:message code="cart.bookset"/></th>
                            <th><spring:message code="cart.total"/> (VNĐ)</th>
                        </tr>
                        <tr>
                            <td>
                                <a href="<%=request.getContextPath()%>/book/${currentBookOrder.idBook}-${currentBookOrder.sortLink}.html">
                                    ${currentBookOrder.title}
                                </a>
                            </td>
                            <td>
                                <a href="<%=request.getContextPath()%>/book/${currentBookOrder.idBook}-${currentBookOrder.sortLink}.html">
                                    <img src="${image}/${currentBookOrder.image}" alt="${currentBookOrder.title}">
                                </a>
                            </td>
                            <td>${currentBookOrder.author}</td>
                            <td>${currentBookOrder.originalPrice}</td>
                            <td>
                                <input type="text" value="${currentBookOrder.salePrice}" readonly="" disabled="">
                            </td>
                            <td class="quantity">
                                <select>
                                    <option value="1" selected="">1</option>
                                    <% for (int k = 2; k <= 10; k++) {%>
                                    <option value="<%=k%>"><%=k%></option>
                                    <%}%>
                                </select>
                                <input type="hidden" name="q" value="1" id="qtt">
                            </td>
                            <td>${currentBookOrder.category.name}</td>
                            <td>${currentBookOrder.set.name}</td>
                            <td>
                                <input type="text" value="${currentBookOrder.salePrice}" readonly="" disabled="" id="ttprc">
                            </td>
                        </tr>
                    </table>
                    <ul>
                        <li id="licp"><spring:message code="order.mcardpoint"/></li>
                        <li id="lincp"><spring:message code="order.mncardpoint"/></li>
                    </ul>
                    <section id="cp">
                        <c:if test="${currentBookOrder.salePrice < 100000}">
                            <label id="condition"><spring:message code="order.condition"/></label>
                        </c:if>
                        <label for="code">Code: </label>
                        <input style="text-transform: uppercase;"
                               type="text" id="code" name="code" pattern="([A-Za-z0-9]){6,6}">
                        <span id="right" class="hide">&nbsp;</span>
                        <span id="wrong" class="hide">&nbsp;</span>
                        <section id="codeif">
                            <p><spring:message code="order.crpoint"/>&nbsp;<i id="crpoint">0</i>&nbsp;&nbsp;-&nbsp;<spring:message code="order.applypoint"/>&nbsp;<i id="applypoint">0</i></p>
                            <small class="hide"><spring:message code="order.isnotcardpoint"/></small>
                        </section>
                    </section>
                    <fieldset>
                        <legend><spring:message code="user.addressshipping"/></legend>
                        <input required="" type="text" name="number" placeholder="<spring:message code="user.housenumber"/>"
                               pattern="\d{1,10}">
                        <input required="" type="text" name="lane" placeholder="<spring:message code="user.lane"/>"
                               pattern="[a-zA-Z0-9àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴÈÉẸẺẼÊỀẾỆỂỄÌÍỊỈĨÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠÙÚỤỦŨƯỪỨỰỬỮỲÝỴỶỸĐ ]{1,10}">
                        <input required="" type="text" name="street" placeholder="<spring:message code="user.street"/>"
                               pattern="[a-zA-Z0-9àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴÈÉẸẺẼÊỀẾỆỂỄÌÍỊỈĨÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠÙÚỤỦŨƯỪỨỰỬỮỲÝỴỶỸĐ ]{6,20}">
                        <input required="" type="text" name="ward" placeholder="<spring:message code="user.ward"/>"
                               pattern="[a-zA-Z0-9àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴÈÉẸẺẼÊỀẾỆỂỄÌÍỊỈĨÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠÙÚỤỦŨƯỪỨỰỬỮỲÝỴỶỸĐ ]{6,20}">
                        <input required="" type="text" name="district" placeholder="<spring:message code="user.district"/>"
                               pattern="[a-zA-Z0-9àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴÈÉẸẺẼÊỀẾỆỂỄÌÍỊỈĨÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠÙÚỤỦŨƯỪỨỰỬỮỲÝỴỶỸĐ ]{6,20}">
                        <input required="" type="text" name="city" placeholder="<spring:message code="user.city"/>"
                               pattern="[a-zA-Z0-9àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴÈÉẸẺẼÊỀẾỆỂỄÌÍỊỈĨÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠÙÚỤỦŨƯỪỨỰỬỮỲÝỴỶỸĐ ]{6,20}">
                        <select name="country">
                            <option value="Việt Nam" selected="">Việt Nam</option>
                            <option value="UK">UK</option>
                        </select>
                        <input type="hidden" value="${customerMemberUsername}" id="crcusmbun">
                        <input type="submit" value="OK">
                    </fieldset>
                </form>
            </c:if>
        </fieldset>
    </section>
    <%@include file="inc/rightAside.jsp" %>
</section>
<%@include file="inc/seenBook.jsp" %>

<%@include file="../template/footer.jsp" %>