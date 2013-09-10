<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${not empty errorMsg}">
    <div class="alert alert-error">
        <button type="button" class="close" data-dismiss="alert">x</button>
        ${errorMsg}
    </div>
</c:if>

<div class="row">
    <div class="span12">
        <form method="get" action="/cas-sso-sessions-report/search" class="form-inline" >
            <input name="casUrl" class="span5" type="text"  placeholder="Please enter CAS server URL (with full HTTP scheme)">
            <button type="submit" class="btn btn-primary"> Get CAS SSO sessions</button>
        </form>
    </div>
</div>

<c:if test="${not empty casServerUrl}">
    <div class="alert alert-info">
        CAS SSO sessions for the server running at: <strong>${casServerUrl}</strong>
    </div>
</c:if>

<c:if test="${not empty casSsoSessions}">
    <div class="menu">
        <div class="accordion">
            <c:forEach items="${casSsoSessions}" var="casSsoSession" varStatus="i">
                <div class="accordion-group">
                    <div class="accordion-heading user">
                        <a class="accordion-toggle" data-toggle="collapse"
                           href="#${casSsoSession.authenticated_principal}${i.count}">User: ${casSsoSession.authenticated_principal}</a>
                    </div>
                    <div id="${casSsoSession.authenticated_principal}${i.count}" class="accordion-body collapse">
                        <div class="accordion-inner">
                            <table class="table table-striped table-condensed">
                                <thead>
                                <tr>
                                    <th>Authentication Date</th>
                                    <th>Number of uses for this SSO session</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>${casSsoSession.authentication_date}</td>
                                    <td>${casSsoSession.number_of_uses}</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</c:if>
