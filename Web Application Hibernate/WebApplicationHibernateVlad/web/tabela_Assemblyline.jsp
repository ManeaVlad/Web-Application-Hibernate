<%@page import="DAOImpl.ComponentsDAOImpl"%>
<%@page import="DAOImpl.ProductsDAOImpl"%>
<%@page import="pojo.Components"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.Products"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
    <title>Tabela Assemblyline</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Normalize.css -->
        <link rel="stylesheet" type="text/css" href="normalize.css">
        <!-- Style -->
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
        <!-- Icon -->
        <link rel="icon" href="rezistorlink.png" type="image/gif" sizes="16x16">
        <!-- Bootstrap
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">-->
        <!--Chestii-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#stergeAssemblyline").hide();
                $("#modificaAssemblyline").hide();

                $("#update").click(function () {
                    $("#modificaAssemblyline").show();
                    $("#stergeAssemblyline").hide();
                });
                $("#delete").click(function () {
                    $("#stergeAssemblyline").show();
                    $("#modificaAssemblyline").hide();
                });
            });
        </script>
    </head>
    <body onload="startTime()">
        <%
        ProductsDAOImpl productDaoImpl = new ProductsDAOImpl();
        ComponentsDAOImpl componentDaoImpl = new ComponentsDAOImpl();
        List<Products> listaProducts = new ArrayList();
        listaProducts = productDaoImpl.afiseazaProducts();
        List<Components> listaComponents = new ArrayList();
        listaComponents = componentDaoImpl.afiseazaComponents();
        request.setAttribute("listaProducts", listaProducts);
        request.setAttribute("listaComponents", listaComponents);
        %>
        <header>
        <img src="itibiti.jpg" alt="O prostie!" height="250" width="100%">
        </header>
        <div id="container2">
        <nav>
            <a href="tabela_Products.jsp" class="button">Tabel Products</a>
            <a href="tabela_Components.jsp" class="button">Tabel Components</a>
            <a href="tabela_Assemblyline.jsp" class="button">Tabel Assemblyline</a>
            <a href="adauga_Product.jsp" class="button">Add Products</a>
            <a href="adauga_Component.jsp" class="button">Add Components</a>
            <a href="adauga_Assemblyline.jsp" class="button">Add Assemblyline</a>
            </nav>
            <h2 class="title">Assemblyline Table</h2>
            <input type="text" id="searchBar" onkeyup="myFunction()" placeholder="Search Name.." title="Type name">
            <table id="myTable">
            <tr class="header">
                <th>IdAssemblyline</th>
                <th>IdProducts</th>
                <th>Name</th>
                <th>Code</th>
                <th>Date</th>
                <th>Price</th>
                <th>IdComponents</th>
                <th>Name</th>
                <th>Model</th>
                <th>Manufacturer</th>
                <th>Costs</th>
                <th>Parameters</th>
                <th>Validation</th>
                </tr>
                <c:forEach var="Assemblyline" items="${listaAssemblyline}">
                <tr>
                    <td>${Assemblyline.idAssemblyline}</td>
                    <td>${Assemblyline.products.idProducts}</td>
                    <td>${Assemblyline.products.name}</td>
                    <td>${Assemblyline.products.code}</td>
                    <td>${Assemblyline.products.date}</td>
                    <td>${Assemblyline.products.price}</td>
                    <td>${Assemblyline.components.idComponents}</td>
                    <td>${Assemblyline.components.name}</td>
                    <td>${Assemblyline.components.model}</td>
                    <td>${Assemblyline.components.manufacturer}</td>
                    <td>${Assemblyline.components.costs}</td>
                    <td>${Assemblyline.components.parameters}</td>
                    <td>${Assemblyline.validation}</td>
                    
                </tr>
            </c:forEach>
            </table>
            <form action="AssemblylineController" method="POST">
        <p align="center">
                Modifica: <input type="checkbox" id="update"> Sterge: <input type="checkbox" id="delete" onclick="document.getElementById('idProducts').disabled = this.checked;
                        document.getElementById('idComponents').disabled = this.checked;
                        document.getElementById('validation').disabled = this.checked;"></p>
                        <label>idAssemblyline:</label>
                <select name="idAssemblyline">
                    <c:forEach items="${listaAssemblyline}" var="Assemblyline">
                        <option value="${Assemblyline.idAssemblyline}">${Assemblyline.idAssemblyline}</option>
                    </c:forEach>
                </select>
                <label>Products:</label>
                <select name="idProducts">
                    <c:forEach items="${listaProducts}" var="Products">
                        <option value="${Products.idProducts}">${Products.idProducts}, ${Products.name}, ${Products.code}, ${Products.date}, ${Products.price}</option>
                    </c:forEach>
                </select>
                <label>Components:</label>
                <select name="idComponents">
                    <c:forEach items="${listaComponents}" var="Components">
                        <option value="${Components.idComponents}">${Components.idComponents}, ${Components.name}, ${Components.model}, ${Components.manufacturer}, ${Components.costs}, ${Components.parameters}</option>
                    </c:forEach>
                </select>
            <label>Validation:</label>
                <input id="validation" type="text" name="validation" placeholder="">
            <input type="submit" id="modificaAssemblyline" name="modificaAssemblyline" value="Modifica">
            <input type="submit" id="stergeAssemblyline" name="stergeAssemblyline" value="Sterge">  
            </form>
            <a href="index.html" class="button" id="home">HOME</a>
            <div id="footer">
                <div id="txt"></div>
                <p>&copy;Manea Vlad</p>
            </div>
        </div><!--#container-->
        
        <script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("searchBar");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
                
function startTime() {
  var today = new Date();
  var h = today.getHours();
  var m = today.getMinutes();
  var s = today.getSeconds();
  m = checkTime(m);
  s = checkTime(s);
  document.getElementById('txt').innerHTML =
  h + ":" + m + ":" + s;
  var t = setTimeout(startTime, 500);
}
function checkTime(i) {
  if (i < 10) {i = "0" + i};
  return i;
}
</script>
    </body>
</html>