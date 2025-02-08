<%@include file="comunes/header.jsp"%>
<%@include file="comunes/nav.jsp"%>

<div class="container">
  <div class="text-center" style="margin: 30px">
    <h3>Agregar Empleado</h3>
  </div>
  <!-- modelAttribute es un concepto de Spring MVC con el que un objeto captura todos los elementos del form -->
  <!-- Recordar que name es lo que da los valores a los elementos para que luego sean mapeados en el servidor -->
  <form action="${urlAgregar}" modelAttribute="empleadoForma" method="post">
    <div class="mb-3">
      <label for="nombre" class="form-label">Nombre</label>
      <input type="text" class="form-control" id="nombre" name="nombre" required="true">
    </div>
    <div class="mb-3">
      <label for="departamento" class="form-label">Departamento</label>
      <input type="text" class="form-control" id="departamento" name="departamento">
    </div>
    <div class="mb-3">
      <label for="sueldo" class="form-label">Sueldo</label>
      <input type="number" step="any" class="form-control" id="sueldo" name="sueldo">
    </div>
    <div class="text-center">
      <button type="submit" class="btn btn-warning btn-sm me-3">Agregar</button>
      <a href="${urlInicio}" class="btn btn-danger btn-sm">Regresar</a>
    </div>
  </form>
</div>

<%@include file="comunes/footer.jsp"%>