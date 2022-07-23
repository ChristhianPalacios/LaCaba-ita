package Beans;

public class ProductosBeans {
    
    private int id;
    private String nombre;
    private String codigo;
    private String descripcion;
    private String imagen;
    private int stock;
    private double precio;
    private int id_categoria;
    private int id_unidad;
    
    public ProductosBeans(int id, String nombre, String codigo, String descripcion, String imagen,int stock, double precio, int id_categoria, int id_unidad) {
        this.id = id;
        this.nombre = nombre;
        this.codigo = codigo;
        this.descripcion = descripcion;
        this.imagen = imagen;
        this.stock = stock;
        this.precio= precio;
        this.id_categoria= id_categoria;
        this.id_unidad= id_unidad;
    
    }

    public ProductosBeans(String string, String string0, int aInt, String string1, double aDouble) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
    
    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }
    
    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion= descripcion;
    }

   public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
    
    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio= precio;
    }
    public int getCategoria() {
        return id_categoria;
    }

    public void setCategoria(int id_categoria) {
        this.id_categoria= id_categoria;
    }
    public int getUnidad() {
        return id_unidad;
    }

    public void setUnidad(int id_unidad) {
        this.id_unidad= id_unidad;
    }       
    
}
