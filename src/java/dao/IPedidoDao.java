/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Beans.PedidosBeans;
import java.util.List;

/**
 *
 * @author Christian
 */
public interface IPedidoDao {
    
    PedidosBeans registrar (PedidosBeans pedidosBeans);
    PedidosBeans editar (PedidosBeans pedidosBeans);
    List<PedidosBeans> listar ();
    List<PedidosBeans> listarPorId (Integer id);
    
}
