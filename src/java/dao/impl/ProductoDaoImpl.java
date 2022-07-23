/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.impl;

import Beans.PedidosBeans;
import Beans.ProductosBeans;
import Utils.ConexionDB;
import dao.IProductoDao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Christian
 */
public class ProductoDaoImpl  implements IProductoDao{

    @Override
    public ProductosBeans listarPorId(int id) {
        
        PreparedStatement sta;
        ProductosBeans productosBeans = null;
        
        try {
            sta = ConexionDB.getConexion().prepareStatement("select * from productos where id=?");
            sta.setInt(1, id);
            ResultSet rs = sta.executeQuery();


            while (rs.next()) {
                productosBeans = new ProductosBeans( rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getInt(6),rs.getDouble(7), rs.getInt(8), rs.getInt(9));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PedidoDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return productosBeans;
        
    }

    @Override
    public ProductosBeans editar(ProductosBeans productosBeans) {
        
        PreparedStatement ps;
        
        try {

            ps = ConexionDB.getConexion().prepareStatement("update productos set stock=? where id=?");
             
            ps.setInt(1, productosBeans.getStock());
            ps.setInt(2, productosBeans.getId());
            
            int  r = ps.executeUpdate();
            if (r == 0) {
                System.out.println("Error: " + "Insertado");
            }
       
        
        } catch (SQLException ex) {
            Logger.getLogger(PedidoDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return productosBeans;
                
    }
    
}