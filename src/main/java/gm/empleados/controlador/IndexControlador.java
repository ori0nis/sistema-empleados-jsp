package gm.empleados.controlador;

import gm.empleados.modelo.Empleado;
import gm.empleados.servicio.EmpleadoServicio;
import jakarta.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class IndexControlador {
    private static final Logger logger = LoggerFactory.getLogger(IndexControlador.class);

    @Autowired
    EmpleadoServicio empleadoServicio;

    // RequestMapping determina qué request HTTP debe ser manejada cuando el usuario entra en localhost:8080/empleados
    @RequestMapping(value = "/", method = RequestMethod.GET)
    // ModelMap es el objeto que se va a compartir con la vista de la página.
    // String = archivo JSP con el que se trabajará.
    public String iniciar(ModelMap modelo){
        List<Empleado> empleados = empleadoServicio.listarEmpleados();
        empleados.forEach((empleado) -> logger.info(empleado.toString()));
        // Compartimos el modelo con la vista para que la info de la BD llegue a la página:
        modelo.put("empleados", empleados);
        return "index"; // Con esto se retorna index.jsp, por lo que Spring busca un archivo con este nombre que será
        // el que determine la vista.
    }

    // Aquí solo vamos a mostrar el formulario:
    @RequestMapping(value = "/agregar", method = RequestMethod.GET)
    public String mostrarAgregar(){
        return "agregar"; // Retornamos agregar.jsp
    }

    @RequestMapping(value = "/agregar", method = RequestMethod.POST)
    // Aquí procesamos la acción del formulario:
    public String agregar(@ModelAttribute("empleadoForma") Empleado empleado, HttpServletRequest request){
        logger.info("Empleado a agregar: " + empleado);
        empleadoServicio.guardarEmpleado(empleado);
        return "redirect:/"; // Redirigimos a la página de inicio, es decir, "/"
    }

    @RequestMapping(value = "/editar", method = RequestMethod.GET)
    public String mostrarEditar(@RequestParam int id, ModelMap modelo){
        Empleado empleado = empleadoServicio.buscarEmpleadoPorId(id);
        logger.info("Empleado a editar: " + empleado);
        // Necesitamos compartir el modelo con la vista otra vez:
        modelo.put("empleado", empleado);
        return "editar"; // Mostramos editar.jsp
    }

    @RequestMapping(value = "/editar", method = RequestMethod.POST)
    public String editar(@ModelAttribute("empleadoForma") Empleado empleado){
        logger.info("Empleado a editar: " + empleado);
        empleadoServicio.guardarEmpleado(empleado);
        return "redirect:/"; // En lugar de volver a dar la ruta "/" de inicio, redireccionamos para que se recargue
        // la lista de empleados
    }

    @RequestMapping(value = "/eliminar", method = RequestMethod.GET)
    public String eliminar(@RequestParam int id){
        Empleado empleado = new Empleado();
        empleado.setId(id);
        empleadoServicio.eliminarEmpleado(empleado);
        logger.info("Empleado a eliminar: " + empleado);
        return "redirect:/";
    }
}
