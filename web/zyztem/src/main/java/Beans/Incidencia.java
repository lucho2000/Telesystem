package Beans;

public class Incidencia {

    private Integer idIncidencia;
    private String fecha;
    private String nombreIncidencia;
    private String zonaPUCP;
    private Double latitud;
    private Double longitud;
    private Boolean validaIncidencia;
    private String Descripcion;
    private Integer contador_reabierto;
    private Integer idTipoIncidencia;
    private Integer idNivelUrgencia;
    private Integer EstadoIncidencia;
    private Integer Usuarios_codigo;


    public Integer getIdIncidencia() {
        return idIncidencia;
    }

    public void setIdIncidencia(Integer idIncidencia) {
        this.idIncidencia = idIncidencia;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getNombreIncidencia() {
        return nombreIncidencia;
    }

    public void setNombreIncidencia(String nombreIncidencia) {
        this.nombreIncidencia = nombreIncidencia;
    }

    public String getZonaPUCP() {
        return zonaPUCP;
    }

    public void setZonaPUCP(String zonaPUCP) {
        this.zonaPUCP = zonaPUCP;
    }

    public Double getLatitud() {
        return latitud;
    }

    public void setLatitud(Double latitud) {
        this.latitud = latitud;
    }

    public Double getLongitud() {
        return longitud;
    }

    public void setLongitud(Double longitud) {
        this.longitud = longitud;
    }

    public Boolean getValidaIncidencia() {
        return validaIncidencia;
    }

    public void setValidaIncidencia(Boolean validaIncidencia) {
        this.validaIncidencia = validaIncidencia;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String descripcion) {
        Descripcion = descripcion;
    }

    public Integer getContador_reabierto() {
        return contador_reabierto;
    }

    public void setContador_reabierto(Integer contador_reabierto) {
        this.contador_reabierto = contador_reabierto;
    }

    public Integer getIdTipoIncidencia() {
        return idTipoIncidencia;
    }

    public void setIdTipoIncidencia(Integer idTipoIncidencia) {
        this.idTipoIncidencia = idTipoIncidencia;
    }

    public Integer getIdNivelUrgencia() {
        return idNivelUrgencia;
    }

    public void setIdNivelUrgencia(Integer idNivelUrgencia) {
        this.idNivelUrgencia = idNivelUrgencia;
    }

    public Integer getEstadoIncidencia() {
        return EstadoIncidencia;
    }

    public void setEstadoIncidencia(Integer estadoIncidencia) {
        EstadoIncidencia = estadoIncidencia;
    }

    public Integer getUsuarios_codigo() {
        return Usuarios_codigo;
    }

    public void setUsuarios_codigo(Integer usuarios_codigo) {
        Usuarios_codigo = usuarios_codigo;
    }
}
