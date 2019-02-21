<%@page import="DAOImpl.ComponentsDAOImpl"%>
<%@page import="DAOImpl.ProductsDAOImpl"%>
<%@page import="pojo.Components"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.Products"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<html>
    <head>
    <title>Add Assemblyline</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <div id="container">
        <nav>
            <a href="tabela_Products.jsp" class="button">Tabel Products</a>
            <a href="tabela_Components.jsp" class="button">Tabel Components</a>
            <a href="tabela_Assemblyline.jsp" class="button">Tabel AssemblyLine</a>
            <a href="adauga_Product.jsp" class="button">Add Products</a>
            <a href="adauga_Component.jsp" class="button">Add Components</a>
            <a href="adauga_Assemblyline.jsp" class="button">Add AssemblyLine</a>
            </nav>
            <h2 class="title"> Add Assemblyline </h2>
            <form action="AssemblylineController" method="GET">
            <label>Product:</label>
                <select name="idProducts">
                    <c:forEach items="${listaProducts}" var="Products">
                        <option value="${Products.idProducts}">${Products.idProducts}, ${Products.name}, ${Products.code}, ${Products.date}, ${Products.price}</option>
                    </c:forEach>
                </select>
            <label>Component:</label>
                <select name="idComponents">
                    <c:forEach items="${listaComponents}" var="Components">
                        <option value="${Components.idComponents}">${Components.idComponents}, ${Components.name}, ${Components.model}, ${Components.manufacturer}, ${Components.costs}, ${Components.parameters}</option>
                    </c:forEach>
                </select>
            <label>Validation:</label>
                <input type="text" name="validation" placeholder="">
            <input type="submit" name="adaugaAssemblyline" value="Submit">
            </form>
            <form action="AssemblylineController" method="POST">
            <input type="submit" name="afiseazaAssemblyline" value="Table Assemblyline">
        </form>
            <a href="index.html" class="button" id="home">HOME</a>
            <div id="footer">
                <div id="txt"></div>
                <p>&copy;Manea Vlad</p>
            </div>
        </div><!--#container-->
    <script>
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