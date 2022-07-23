
package Beans;

public class PedidosBeans {
    
    private int  id;
    private int  idCliente;
    private String nombreCliente;
    private int dni;
    private String detalleAdicional;
    private String direccion;
    private Double  total;
    private int idEstado;
    private String creado;
    private String metodoPago;
    private String detallePago;

    public PedidosBeans(){}
    
    public PedidosBeans(int id, int idCliente, String nombreCliente, int dni, String detalleAdicional, String direccion, Double total, int idEstado, String creado, String metodoPago, String detallePago) {
        this.id = id;
        this.idCliente = idCliente;
        this.nombreCliente = nombreCliente;
        this.dni = dni;
        this.detalleAdicional = detalleAdicional;
        this.direccion = direccion;
        this.total = total;
        this.idEstado = idEstado;
        this.creado = creado;
        this.metodoPago = metodoPago;
        this.detallePago = detallePago;
    }
       
    public PedidosBeans(int idCliente, String nombreCliente, int dni, String detalleAdicional, String direccion, Double total, int idEstado, String creado, String metodoPago, String detallePago) {
        this.idCliente = idCliente;
        this.nombreCliente = nombreCliente;
        this.dni = dni;
        this.detalleAdicional = detalleAdicional;
        this.direccion = direccion;
        this.total = total;
        this.idEstado = idEstado;
        this.creado = creado;
        this.metodoPago = metodoPago;
        this.detallePago = detallePago;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public String getDetalleAdicional() {
        return detalleAdicional;
    }

    public void setDetalleAdicional(String detalleAdicional) {
        this.detalleAdicional = detalleAdicional;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public int getIdEstado() {
        return idEstado;
    }

    public void setIdEstado(int idEstado) {
        this.idEstado = idEstado;
    }

    public String getCreado() {
        return creado;
    }

    public void setCreado(String creado) {
        this.creado = creado;
    }

    public String getMetodoPago() {
        return metodoPago;
    }

    public void setMetodoPago(String metodoPago) {
        this.metodoPago = metodoPago;
    }

    public String getDetallePago() {
        return detallePago;
    }

    public void setDetallePago(String detallePago) {
        this.detallePago = detallePago;
    }

  
  
}
