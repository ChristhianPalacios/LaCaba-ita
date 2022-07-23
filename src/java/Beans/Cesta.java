package Beans;

public class Cesta {
    private int id;
    private String nombre;
    private double precio;
    private int can;

    public Cesta(int id, String nombre, double precio, int can) {
        this.id = id;
        this.nombre = nombre;
        this.precio = precio;
        this.can = can;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getCan() {
        return can;
    }

    public void setCan(int can) {
        this.can = can;
    }
    

}