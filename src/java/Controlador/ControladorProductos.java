/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.Producto;
import Modelo.ProductoMenu;
import java.sql.SQLException;

/**
 *
 * @author USER
 */
public class ControladorProductos {
    public String getProductos() throws SQLException{
       ProductoMenu mp = new ProductoMenu();
       String htmlcode="";
       for(Producto producto : mp.getAllProductos()){
           htmlcode += "<div class=\"col-lg-6 menu-item filterDiv "+producto.getId_categoria()+"\">\n" +
"                            <img src=\"img/"+producto.getImagen()+"\" class=\"menu-img\" alt=\"\">\n" +
"                            <div class=\"menu-content\">\n" +
"                                <a href=\"ServletProd?op=anadir&cod="+producto.getId()+"&des="+producto.getNombre()+"&pre="+producto.getPrecio()+"\">"+producto.getNombre()+"</a><span>S/"+producto.getPrecio()+"</span>\n" +
"                            </div>\n" +
"                            <div class=\"menu-ingredients\">\n" +
"                                <p> "+producto.getDescripcion()+"</p>\n" +
"                            </div>\n" +
"                        </div>";
       }
       return htmlcode;
    }
    
        public String getProductosWithPrecio() throws SQLException{
       ProductoMenu mp = new ProductoMenu();
       String htmlcode="";
       for(Producto producto : mp.getAllProductos()){
           htmlcode += "<div class=\"col-lg-6 menu-item filterDiv "+producto.getId_categoria()+"\">\n" +
"                            <img src=\"img/"+producto.getImagen()+"\" class=\"menu-img\" alt=\"\">\n" +
"                            <div class=\"menu-content\">\n" +
"                               <a class=\"col-8 a\" href=\"ServletProd?op=anadir&cod="+producto.getId()+"&des="+producto.getNombre()+"&pre="+producto.getPrecio()+"\">"+producto.getNombre()+"</a>"+
"                               <span class=\"col-2\">S/"+producto.getPrecio()+"</span>" +
"                               <a class=\"col-2\" href=\"ServletProd?op=anadir&cod="+producto.getId()+"&des="+producto.getNombre()+"&pre="+producto.getPrecio()+"\">"+
"                                   <button class=\"col-12\">PEDIR</button>"+
"                               </a>\n" +
"                            </div>\n" +
"                            <div class=\"menu-ingredients\">\n" +
"                                <p> "+producto.getDescripcion()+"</p>\n" +
"                            </div>\n" +
"                        </div>";
       }
       return htmlcode;
    }
    
    
}
