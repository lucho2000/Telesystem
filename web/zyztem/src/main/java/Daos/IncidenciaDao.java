package Daos;

import Beans.Incidencia;

import java.sql.*;
import java.util.ArrayList;

public class IncidenciaDao {

    public ArrayList<Incidencia> obtenerIncidencias() throws SQLException {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/telesystem_aa";

        ArrayList<Incidencia> listaIncidencia = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             Statement stm = conn.createStatement();
             ResultSet rs = stm.executeQuery("SELECT * FROM incidencia")) {

            while (rs.next()) {
                Incidencia incidencia = new Incidencia();
                incidencia.setIdIncidencia(rs.getInt(1));
                incidencia.setFecha(rs.getString(2));
                incidencia.setNombreIncidencia(rs.getString(3));
                incidencia.setZonaPUCP(rs.getString(4));
                incidencia.setLatitud(rs.getDouble(5));
                incidencia.setLongitud(rs.getDouble(6));
                incidencia.setValidaIncidencia(rs.getBoolean(7));
                incidencia.setDescripcion(rs.getString(8));
                incidencia.setContador_reabierto(rs.getInt(9));

                listaIncidencia.add(incidencia);
            }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return listaIncidencia;
    }
}
