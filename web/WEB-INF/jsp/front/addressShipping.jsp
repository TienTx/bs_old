
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
            <legend><spring:message code="user.addressshipping"/></legend>
            <form action="<%=request.getContextPath()%>/member/${customerMemberUsername}/order.html" method="post">
                <ul>
                    <li id="licp2"><spring:message code="order.mcardpoint"/></li>
                    <li id="lincp2"><spring:message code="order.mncardpoint"/></li>
                </ul>
                <section id="cp">
                    <c:if test="${crTotalPrice < 100000}">
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
                <input required="" type="text" name="mbsnumber" placeholder="<spring:message code="user.housenumber"/>"
                       pattern="\d{1,10}">
                <input required="" type="text" name="mbslane" placeholder="<spring:message code="user.lane"/>"
                       pattern="[a-zA-Z0-9àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴÈÉẸẺẼÊỀẾỆỂỄÌÍỊỈĨÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠÙÚỤỦŨƯỪỨỰỬỮỲÝỴỶỸĐ ]{1,10}">
                <input required="" type="text" name="mbsstreet" placeholder="<spring:message code="user.street"/>"
                       pattern="[a-zA-Z0-9àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴÈÉẸẺẼÊỀẾỆỂỄÌÍỊỈĨÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠÙÚỤỦŨƯỪỨỰỬỮỲÝỴỶỸĐ ]{6,20}">
                <input required="" type="text" name="mbsward" placeholder="<spring:message code="user.ward"/>"
                       pattern="[a-zA-Z0-9àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴÈÉẸẺẼÊỀẾỆỂỄÌÍỊỈĨÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠÙÚỤỦŨƯỪỨỰỬỮỲÝỴỶỸĐ ]{6,20}">
                <input required="" type="text" name="mbsdistrict" placeholder="<spring:message code="user.district"/>"
                       pattern="[a-zA-Z0-9àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴÈÉẸẺẼÊỀẾỆỂỄÌÍỊỈĨÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠÙÚỤỦŨƯỪỨỰỬỮỲÝỴỶỸĐ ]{6,20}">
                <input required="" type="text" name="mbscity" placeholder="<spring:message code="user.city"/>"
                       pattern="[a-zA-Z0-9àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴÈÉẸẺẼÊỀẾỆỂỄÌÍỊỈĨÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠÙÚỤỦŨƯỪỨỰỬỮỲÝỴỶỸĐ ]{6,20}">
                <select name="mbscountry">
                    <option value="Việt Nam" selected="">Việt Nam</option>
                    <option value="UK">UK</option>
                </select>
                <input type="hidden" value="${customerMemberUsername}" id="crcusmbun">
                <input type="hidden" value="${crTotalPrice}" id="ttprc">
                <input type="submit" value="OK">
            </form>
        </fieldset>
    </section>
    <%@include file="inc/rightAside.jsp" %>
</section>
<%@include file="inc/seenBook.jsp" %>

<%@include file="../template/footer.jsp" %>