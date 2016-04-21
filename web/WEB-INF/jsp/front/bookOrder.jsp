<%@page import="entity.order.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url value="/resources/image/thumb" var="image" />
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
                <form id="bodbcs" action="" method="post">

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
                                <c:if test="${currentBookOrder.salePrice != '-1'}">
                                    <c:forEach items="${currentBookOrder.listDeals}" var="km">
                                        <font color="red">
                                        <spring:message code="book.discount"/> ${km.discount}%
                                        </font>
                                    </c:forEach>
                                </c:if>
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
                        <li id="licp"><spring:message code="order.cardpoint"/></li>
                        <li id="lincp"><spring:message code="order.ncardpoint"/></li>
                    </ul>
                    <section id="cp">
                        <label id="condition"><spring:message code="order.condition"/></label>
                        <label for="cc">Code: </label>
                        <input style="text-transform: uppercase;"
                               type="text" id="cc" class="code" name="code" pattern="([A-Za-z0-9]){6,6}">
                        <span id="right" class="hide">&nbsp;</span>
                        <span id="wrong" class="hide">&nbsp;</span>
                        <section id="codeif">
                            <p><spring:message code="order.crpoint"/>&nbsp;<i id="crpoint">0</i>&nbsp;&nbsp;-&nbsp;<spring:message code="order.applypoint"/>&nbsp;<i id="applypoint">0</i></p>
                            <small class="hide"><spring:message code="order.notexistcardpoint"/></small>
                        </section>
                        <fieldset>
                            <legend><spring:message code="user.addressshipping"/></legend>
                            <input type="text" id="cpemail1" name="email1" class="hide" >
                            <input type="text" id="cpphone1" name="phoneNumber1" class="hide" >
                        </fieldset>
                    </section>
                    <fieldset id="ncp">
                        <legend><spring:message code="user.addressshipping"/></legend>
                        <center><small><spring:message code="order.note"/></small></center>
                        <input type="email" id="cpemail2" name="email2" placeholder="<spring:message code="user.email"/>" 
                               value="${email}"
                               maxlength="30"
                               pattern="^([^.@]+)(\.[^.@]+)*@([^.@]+\.)+([^.@]+)$">
                        <input type="text" id="cpphone2" name="phoneNumber2" placeholder="<spring:message code="user.phone"/>" 
                               value="${phoneNumber}"
                               pattern="((\+84)|(0))[1-9]\d{2,9}">
                    </fieldset>
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
                    <input type="submit" value="OK">
                </form>
            </c:if>
        </fieldset>
    </section>
    <%@include file="inc/rightAside.jsp" %>
</section>
<%@include file="inc/seenBook.jsp" %>

<%@include file="../template/footer.jsp" %>