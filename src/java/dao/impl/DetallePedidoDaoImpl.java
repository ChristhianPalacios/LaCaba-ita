/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.impl;

import Beans.DetallePedidoBeans;
import Beans.PedidosBeans;
import Utils.ConexionDB;
import dao.IDetallePedidoDao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Christian
 */
public class DetallePedidoDaoImpl implements IDetallePedidoDao{

    @Override
    public DetallePedidoBeans registrar(DetallePedidoBeans detallePedidoBeans) {
        PreparedStatement sta;
        try {
            
            sta = ConexionDB.getConexion().prepareStatement("insert into detalle_pedido (id_pedido, id_producto, cantidad, precio_unitario, sub_total) "+
                    "values(?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            
            sta.setInt(1, detallePedidoBeans.getIdPedido()); //
            sta.setInt(2, detallePedidoBeans.getIdProducto());
            sta.setInt(3, detallePedidoBeans.getCantidad());
            sta.setDouble(4, detallePedidoBeans.getPrecioUnitario());
            sta.setDouble(5, detallePedidoBeans.getSubTotal()); //
            
            int  r = sta.executeUpdate();
            if (r == 0) {
                System.out.println("Error: " + "Insertado");
            } 
            
            try (ResultSet rs = sta.getGeneratedKeys()) {
                if (rs.next()) {
                    detallePedidoBeans.setId(rs.getInt(1));
                }
                rs.close();
            }
        
        } catch (SQLException ex) {
            Logger.getLogger(PedidoDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return detallePedidoBeans;
    }

    @Override
    public List<DetallePedidoBeans> listarPorIdPedido(Integer idPedido) {
        
        PreparedStatement sta;
        ArrayList<DetallePedidoBeans> lista =null;
        
        try {
            sta = ConexionDB.getConexion().prepareStatement("select * from detalle_pedido where id_pedido=?");
            sta.setInt(1, idPedido);
            ResultSet rs = sta.executeQuery();

            lista = new ArrayList<>();

            while (rs.next()) {
                DetallePedidoBeans dpb = new DetallePedidoBeans( rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getDouble(5), rs.getDouble(6));
                lista.add(dpb);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PedidoDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return lista;
    }
    
}
