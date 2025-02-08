<%@include file="comunes/header.jsp"%>
<%@include file="comunes/nav.jsp"%>

<div class="container">
  <div class="text-center" style="margin: 30px">
    <h3>Editar Empleado</h3>
  </div>
  <!-- modelAttribute es un concepto de Spring MVC con el que un objeto captura todos los elementos del form -->
  <!-- Recordar que name es lo que da los valores a los elementos para que luego sean mapeados en el servidor -->
  <form action="${urlEditar}" modelAttribute="empleadoForma" method="post">
  <!-- Metemos un campo oculto para que el formulario se llene con el id del empleado que está siendo editado.
  Cuando estamos agregando no tenemos que especificar id, pero cuando estamos editando sí porque si no el id no se
  incluirá en el submit -->
    <input type="hidden" name="id" value="${empleado.id}"/>
    <div class="mb-3">
      <label for="nombre" class="form-label">Nombre</label>
  <!-- Ahora ya estamos recibiendo un modelo por parte del método mostrarEditar(), así que lo utilizamos para que
  los elementos muestren su valor -->
      <input type="text" class="form-control" id="nombre" name="nombre" required="true" value="${empleado.nombre}">
    </div>
    <div class="mb-3">
      <label for="departamento" class="form-label">Departamento</label>
      <input type="text" class="form-control" id="departamento" name="departamento" value="${empleado.departamento}">
    </div>
    <div class="mb-3">
      <label for="sueldo" class="form-label">Sueldo</label>
      <input type="number" step="any" class="form-control" id="sueldo" name="sueldo" value="${empleado.sueldo}">
    </div>
    <div class="text-center">
      <button type="submit" class="btn btn-warning btn-sm me-3">Agregar</button>
      <a href="${urlInicio}" class="btn btn-danger btn-sm">Regresar</a>
    </div>
  </form>
</div>

<%@include file="comunes/footer.jsp"%>