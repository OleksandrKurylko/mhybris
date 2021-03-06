<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>

<c:url value="/search/" var="searchUrl"/>
<c:url value="/search/autocomplete/${component.uid}" var="autocompleteUrl"/>


<div class="siteSearch">
	<form name="search_form" method="get" action="${searchUrl}">
		<div class="control-group left">
			<spring:theme code="text.search" var="searchText"/>
			<label class="control-label skip" for="search">${searchText}</label>
			<div class="controls">
				<spring:theme code="search.placeholder" var="searchPlaceholder"/>
				<ycommerce:testId code="header_search_input">
					<input id="search" class="siteSearchInput left" type="text" name="text" value="" maxlength="100" placeholder="${searchPlaceholder}" data-options='{"autocompleteUrl" : "${autocompleteUrl}","minCharactersBeforeRequest" : "${component.minCharactersBeforeRequest}","waitTimeBeforeRequest" : "${component.waitTimeBeforeRequest}","displayProductImages" : ${component.displayProductImages}}'/>
				</ycommerce:testId>
				<ycommerce:testId code="header_search_button">
					<button class="siteSearchSubmit" type="submit"/></button>
				</ycommerce:testId>
			</div>
		</div>
	</form>
</div>
<%--CHINAACC_START --%>
<div class="search-suggest">
	<ul>
		<c:forEach items="${component.linkComponents}" var="linkObj">
			<cms:component component="${linkObj}" evaluateRestriction="true" element="li" />
		</c:forEach>
	</ul>
</div>
<%--CHINAACC_END --%>
