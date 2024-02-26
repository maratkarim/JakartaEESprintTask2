<%@ page import="java.awt.*" %>
<%@ page import="Classes.DBManager" %>
<%@ page import="Classes.Items" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Main Page</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</head>
<body>

  <div class="container">
    <%@include file="navbar.jsp" %>
    <br>
    <h1 class="text-center">Welcome BITLAB SHOP</h1>
    <p class="text-center" style="color: darkgray">Electronic devices with high quality and service</p>
    <br><br>

    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
      ADD ITEM
    </button>
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">ADD ITEM</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <form action="/addItem" method="post">
            <div class="modal-body">
              <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Name</label>
                <input name="name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
              </div>
              <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">DESRIPTION</label>
                <input name="description" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
              </div>
              <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">PRICE</label>
                <input name="price" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-primary">Save changes</button>
            </div>
          </form>

        </div>
      </div>
    </div>
    <br><br>

    <div class="row">

      <div class="row">
        <%
          ArrayList<Items> itemsList = new ArrayList<>();
          itemsList = DBManager.getItems();

            for (Items item : itemsList) {
        %>
        <div class="col-4">
          <div class="card text-center mb-3" style="width: 18rem">
            <h5 class="card-title"><%=item.getName()%></h5>
            <div class="card-body">
              <h5 class="card-title"><%=item.getPrice()%></h5>
              <p class="card-text"><%=item.getDescription()%></p>
              <a href="/details?id=<%=item.getId()%>" class="btn btn-primary">Details</a>
            </div>
          </div>
        </div>
        <%
          }
        %>
      </div>


    </div>
  </div>

</body>
</html>
