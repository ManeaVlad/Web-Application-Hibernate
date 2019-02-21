<html>
    <head>
    <title>Add Components</title>
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
            <h2 class="title"> Add Component </h2>
            <form action="ComponentsController" method="GET">
            <label>Name:</label>
                <input type="text" name="name" placeholder="Place the name..">
            <label>Model:</label>
                <input type="text" name="model" placeholder="">
            <label>Manufacturer:</label>
                <input type="text" name="manufacturer" placeholder="">
            <label>Costs:</label>
                <input type="number" name="costs" placeholder="">
            <label>Parameters:</label>
                <input type="text" name="parameters" placeholder="">
            <input type="submit" name="adaugaComponent" value="Submit">
            </form>
            <form action="ComponentsController" method="POST">
            <input type="submit" name="afiseazaComponents" value="Table Components">
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