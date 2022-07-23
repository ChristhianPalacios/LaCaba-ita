
package Beans;

public class Beans_Reserva {
     private int dni;
    private String nombre;
    private String pers;
    private String fecha;
    private String hora;
     private String plato;
     private String ocasion;

    public Beans_Reserva(int dni, String nombre, String pers, String fecha, String hora, String plato, String ocasion) {
        this.dni = dni;
        this.nombre = nombre;
        this.pers = pers;
        this.fecha = fecha;
        this.hora = hora;
        this.plato = plato;
        this.ocasion = ocasion;
    }

    public Beans_Reserva(int aInt, String string, String string0, String string1, String string2, String string3) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPers() {
        return pers;
    }

    public void setPers(String pers) {
        this.pers = pers;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public String getPlato() {
        return plato;
    }

    public void setPlato(String plato) {
        this.plato = plato;
    }

    public String getOcasion() {
        return ocasion;
    }

    public void setOcasion(String ocasion) {
        this.ocasion = ocasion;
    }
     
     
}
