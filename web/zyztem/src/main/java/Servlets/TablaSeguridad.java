package Servlets;

import Beans.Incidencia;
import Daos.IncidenciaDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "TablaSeguridad", value = "/TablaSeguridad")
public class TablaSeguridad extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IncidenciaDao idao = new IncidenciaDao();
        ArrayList<Incidencia> listaIncidencias = null;
        try {
            listaIncidencias = idao.obtenerIncidencias();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        request.setAttribute("listaIncidencias",listaIncidencias);

        RequestDispatcher view = request.getRequestDispatcher("listarIncidencias.jsp");
        view.forward(request,response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
