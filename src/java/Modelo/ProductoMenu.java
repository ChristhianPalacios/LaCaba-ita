/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import Utils.ConexionDB;
import static Utils.ConexionDB.getConexion;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author USER
 */
public class ProductoMenu {
       public static ArrayList<Producto> getAllProductos() throws SQLException{
        ArrayList<Producto> productos= new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs =null;
        try {
            String sql ="call selectProductos()";
            pst = ConexionDB.getConexion().prepareCall(sql);
            rs=pst.executeQuery();
        while (rs.next()){
            productos.add(new Producto(rs.getInt("id"), rs.getString("nombre"),rs.getString("codigo"),rs.getString("descripcion"),rs.getString("imagen"),rs.getInt("stock"),rs.getDouble("precio"),rs.getInt("id_categoria"),rs.getInt("id_unidad")));
            }
        } catch (Exception e){
        }finally{
            try{
                if(rs != null) rs.close();
                if (pst!=null) pst.close(); 
                if (getConexion() != null) getConexion().close(); 
            }catch(Exception e){
            }
        }
        return productos;
            }
}
