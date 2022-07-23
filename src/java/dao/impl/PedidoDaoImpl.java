/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.impl;

import Beans.PedidosBeans;
import Utils.ConexionDB;
import dao.IPedidoDao;
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
public class PedidoDaoImpl implements IPedidoDao{

    @Override
    public PedidosBeans registrar(PedidosBeans pedidosBeans) {
        
        PreparedStatement ps;
        try {
            
            ps = ConexionDB.getConexion().prepareStatement("insert into pedido (id_cliente, nombre_cliente, dni, detalle_adicional, direccion, total, "+
                    "id_estado, creado, metodo_pago, detalle_pago) values(?,?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            
            ps.setInt(1, pedidosBeans.getIdCliente()); //
            ps.setString(2, pedidosBeans.getNombreCliente());
            ps.setInt(3, pedidosBeans.getDni());
            ps.setString(4, pedidosBeans.getDetalleAdicional());
            ps.setString(5, pedidosBeans.getDireccion()); //
            ps.setDouble(6, pedidosBeans.getTotal());
            ps.setInt(7, pedidosBeans.getIdEstado());
            ps.setString(8, pedidosBeans.getCreado()); //
            ps.setString(9, pedidosBeans.getMetodoPago());
            ps.setString(10, pedidosBeans.getDetallePago());
            
            int  r = ps.executeUpdate();
            if (r == 0) {
                System.out.println("Error: " + "Insertado");
            } 
            
            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    pedidosBeans.setId(rs.getInt(1));
                }
                rs.close();
            }
        
        } catch (SQLException ex) {
            Logger.getLogger(PedidoDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return pedidosBeans;
    }

    @Override
    public List<PedidosBeans> listar() {
        
        PreparedStatement ps;
        ArrayList<PedidosBeans> lista =null;
        
        try {
            ps = ConexionDB.getConexion().
                    prepareStatement("select * from pedido");
             ResultSet rs = ps.executeQuery();

            lista = new ArrayList<>();
            while (rs.next()) {
                PedidosBeans em = new PedidosBeans( rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getString(5),
                        rs.getString(6),rs.getDouble(7), rs.getInt(8), rs.getString(9), rs.getString(10), rs.getString(11));
                lista.add(em);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PedidoDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
       
        return lista;
        
    }

    @Override
    public List<PedidosBeans> listarPorId(Integer codigo) {
        
        PreparedStatement sta;
        ArrayList<PedidosBeans> lista =null;
        
        try {
            sta = ConexionDB.getConexion().prepareStatement("select * from pedido where id=?");
            sta.setInt(1, codigo);
            ResultSet rs = sta.executeQuery();

            lista = new ArrayList<>();

            while (rs.next()) {
                PedidosBeans em = new PedidosBeans( rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getString(5),
                        rs.getString(6),rs.getDouble(7), rs.getInt(8), rs.getString(9), rs.getString(10), rs.getString(11));
                lista.add(em);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PedidoDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return lista;
       
    }

    @Override
    public PedidosBeans editar(PedidosBeans pedidosBeans) {
        
        
        PreparedStatement ps;
        
        try {

            ps = ConexionDB.getConexion().prepareStatement("update pedido set nombre_cliente=?,  dni=?, direccion=?, total=?, id_estado=?, creado=?, metodo_pago=?, detalle_pago=? where id=?");
             
            ps.setString(1, pedidosBeans.getNombreCliente());
            ps.setInt(2, pedidosBeans.getDni());
            ps.setString(3, pedidosBeans.getDireccion());
            ps.setDouble(4, pedidosBeans.getTotal());
            ps.setInt(5, pedidosBeans.getIdEstado());
            ps.setString(6, pedidosBeans.getCreado()); //
            ps.setString(7, pedidosBeans.getMetodoPago());
            ps.setString(8, pedidosBeans.getDetallePago());
            ps.setInt(9, pedidosBeans.getId());
            
            int  r = ps.executeUpdate();
            if (r == 0) {
                System.out.println("Error: " + "Insertado");
            }
       
        
        } catch (SQLException ex) {
            Logger.getLogger(PedidoDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return pedidosBeans;
                
                
    }
    
}
