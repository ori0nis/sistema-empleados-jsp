<%@include file="comunes/header.jsp"%>
<%@include file="comunes/nav.jsp"%>

        <div class="container">
            <div class="text-center" style="margin: 30px">
                <h3>Sistema de Empleados</h3>
            </div>
            <div class="container">
                <table class="table table-striped table-hover table-bordered align-middle">
                    <thead class="table-dark text-center">
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Departamento</th>
                        <th scope="col">Sueldo</th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- Hacemos un forEach con la etiqueta JSTL. La variable empleado sale de lo que se le pasa al
                    modelo con put en el método iniciar() del controlador. Posteriormente, iniciar() enruta hacia
                    este index.jsp con el return -->
                    <c:forEach var="empleado" items="${empleados}">
                        <tr>
                            <th scope="row">${empleado.id}</th>
                            <td>${empleado.nombre}</td>
                            <td>${empleado.departamento}</td>
                            <td>
                                <!-- FMT es para dar formato -->
                                <fmt:setLocale value="en_US"/>
                                <fmt:formatNumber type="currency" value="${empleado.sueldo}"/>
                            </td>
                            <td class="text-center">
                                <!-- Creamos URL dinámicos para los botones -->
                                <c:set var="urlEditar">
                                    <c:url value="${application.contextPath}/editar">
                                        <!-- En este caso necesitamos proporcionar un parámetro para que el botón
                                        sepa qué empleado editar -->
                                        <c:param name="id" value="${empleado.id}"/>
                                    </c:url>
                                </c:set>
                                <a href="${urlEditar}" class="btn btn-warning btn-sm me-3">Editar</a>
                                <c:set var="urlEliminar">
                                    <c:url value="${application.contextPath}/eliminar">
                                        <!-- De nuevo, necesitamos proporcionar un id para que el servidor sepa qué
                                        empleado eliminar -->
                                        <c:param name="id" value="${empleado.id}"/>
                                    </c:url>
                                </c:set>
                                <a href="${urlEliminar}" class="btn btn-danger btn-sm">Eliminar</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

<%@include file="comunes/footer.jsp"%>