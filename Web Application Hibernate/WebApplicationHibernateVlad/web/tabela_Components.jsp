<html>
    <head>
    <title>Tabela Components</title>
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
                $("#stergeComponent").hide();
                $("#modificaComponent").hide();

                $("#update").click(function () {
                    $("#modificaComponent").show();
                    $("#stergeComponent").hide();
                });
                $("#delete").click(function () {
                    $("#stergeComponent").show();
                    $("#modificaComponent").hide();
                });
            });
        </script>
    </head>
    <body onload="startTime()">
        <header>
        <img src="itibiti.jpg" alt="O prostie!" height="250" width="100%">
        </header>
        <div id="container">
        <nav>
            <a href="tabela_Products.jsp" class="button">Tabel Products</a>
            <a href="tabela_Components.jsp" class="button">Tabel Components</a>
            <a href="tabela_Assemblyline.jsp" class="button">Tabel Assemblyline</a>
            <a href="adauga_Product.jsp" class="button">Add Products</a>
            <a href="adauga_Component.jsp" class="button">Add Components</a>
            <a href="adauga_Assemblyline.jsp" class="button">Add Assemblyline</a>
            </nav>
            <h2 class="title">Components Table</h2>
            <input type="text" id="searchBar" onkeyup="myFunction()" placeholder="Search Name.." title="Type name">
            <table id="myTable">
            <tr class="header">
                <th style="width:20%;">IdComponent</th>
                <th style="width:20%;">Name</th>
                <th style="width:20%;">Model</th>
                <th style="width:20%;">Manufacturer</th>
                <th style="width:20%;">Costs</th>
                <th style="width:20%;">Parameters</th>
                </tr>
               <c:forEach var="Components" items="${listaComponents}">
                <tr>
                    <td>${Components.idComponents}</td>
                    <td>${Components.name}</td>
                    <td>${Components.model}</td>
                    <td>${Components.manufacturer}</td>
                    <td>${Components.costs}</td>
                    <td>${Components.parameters}</td>

                </tr>
            </c:forEach>
            </table>
            <form action="ComponentsController" method="POST">
            <p id="center">Modifica: <input type="checkbox" id="update"> Sterge: <input type="checkbox" id="delete" onclick="document.getElementById('name').disabled = this.checked;
                        document.getElementById('model').disabled = this.checked;
                        document.getElementById('manufacturer').disabled = this.checked;
                        document.getElementById('costs').disabled = this.checked;
                document.getElementById('parameters').disabled = this.checked;"></p>
                <select name="idComponents">
                    <c:forEach items="${listaComponents}" var="Components">
                        <option value="${Components.idComponents}">${Components.idComponents}</option>
                    </c:forEach>
                </select>
            <label>Name:</label>
                <input id="name" type="text" name="name" placeholder="Place the name..">
            <label>Model:</label>
                <input id="model" type="text" name="model" placeholder="">
            <label>Manufacturer:</label>
                <input id="manufacturer" type="text" name="manufacturer" placeholder="">
            <label>Costs:</label>
                <input id="costs" type="number" name="costs" placeholder="">
            <label>Parameters:</label>
                <input id="parameters" type="text" name="parameters" placeholder="">
            <input type="submit" id="modificaComponent" name="modificaComponent" value="Modifica">
            <input type="submit" id="stergeComponent" name="stergeComponent" value="Sterge">  
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