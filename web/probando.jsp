<%-- 
    Document   : probando
    Created on : 22/11/2021, 08:24:27 PM
    Author     : USER
--%>

<%@page import="Controlador.ControladorProductos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Controlador.ControladorProductos cp = new ControladorProductos();
%>
<!DOCTYPE html>
<html>
    <style>
        .filterDiv {
            display: none;
        }
        .show {
            display: block;
        }
    </style>
    <link href="estilos/estilos1.css" rel="stylesheet" type="text/css"/>
    <body>

        <section id="menu" class="menu section-bg">
            <div class="container" data-aos="fade-up">
                <div class="section-title">
                    <h2>Menu</h2>
                    <p>Platos deliciosos </p>
                </div>

                <div class="row">
                    <div class="col-lg-12 d-flex justify-content-center">
                        <div id="menu-flters">
                            <button class="btn active" onclick="filterSelection('all')"> Todo</button>
                            <button class="btn" onclick="filterSelection('7')"> Platos</button>
                            <button class="btn" onclick="filterSelection('8')"> Ensaladas</button>
                            <button class="btn" onclick="filterSelection('6')"> Bebidas</button>
                            <button class="btn" onclick="filterSelection('5')('11')"> Postres y Guarniciones</button>
                            <div class="dropdown">
                                <button onclick="myFunction()" class="dropbtn">Dropdown</button>
                                <div id="myDropdown" class="dropdown-content">
                                    <a href="#about">About</a>
                                    <a href="#base">Base</a>
                                    <a href="#blog">Blog</a>
                                    <a href="#contact">Contact</a>
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row menu-container">
                    <%= cp.getProductos()%>
                </div>

                <script>
                    filterSelection("all")
                    function filterSelection(c) {
                        var x, i;
                        x = document.getElementsByClassName("filterDiv");
                        if (c == "all")
                            c = "";
                        for (i = 0; i < x.length; i++) {
                            w3RemoveClass(x[i], "show");
                            if (x[i].className.indexOf(c) > -1)
                                w3AddClass(x[i], "show");
                        }
                    }

                    function w3AddClass(element, name) {
                        var i, arr1, arr2;
                        arr1 = element.className.split(" ");
                        arr2 = name.split(" ");
                        for (i = 0; i < arr2.length; i++) {
                            if (arr1.indexOf(arr2[i]) == -1) {
                                element.className += " " + arr2[i];
                            }
                        }
                    }

                    function w3RemoveClass(element, name) {
                        var i, arr1, arr2;
                        arr1 = element.className.split(" ");
                        arr2 = name.split(" ");
                        for (i = 0; i < arr2.length; i++) {
                            while (arr1.indexOf(arr2[i]) > -1) {
                                arr1.splice(arr1.indexOf(arr2[i]), 1);
                            }
                        }
                        element.className = arr1.join(" ");
                    }

                    // Add active class to the current button (highlight it)
                    var btnContainer = document.getElementById("menu-flters");
                    var btns = btnContainer.getElementsByClassName("btn");
                    for (var i = 0; i < btns.length; i++) {
                        btns[i].addEventListener("click", function () {
                            var current = document.getElementsByClassName("active");
                            current[0].className = current[0].className.replace(" active", "");
                            this.className += " active";
                        });
                    }
                </script>
            </div>
        </section>
    </body>
</html>

