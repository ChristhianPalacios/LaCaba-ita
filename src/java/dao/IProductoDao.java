/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Beans.ProductosBeans;

/**
 *
 * @author Christian
 */
public interface IProductoDao {
    
    ProductosBeans listarPorId(int id);
    ProductosBeans editar (ProductosBeans productosBeans);
    
}