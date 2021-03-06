
package Modelo;

import java.sql.*;
import java.util.ArrayList;
import Utils.ConexionDB;

public class ProductoDB {
    
    public static ArrayList<Producto> obtenerProducto(){
        ArrayList<Producto> lista= new ArrayList<Producto>();
        try {
            CallableStatement cl=ConexionDB.getConexion().prepareCall("{call listaProductos()}");
        ResultSet rs=cl.executeQuery();
        while (rs.next()){
            Producto p = new Producto( rs.getString(1), rs.getString(2),rs.getDouble(3),rs.getString(4));
            lista.add(p);
        }
        } catch (Exception e){}
        return lista;
            }
}


