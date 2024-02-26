<%@ page import="Classes.Items" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

</head>
<body>
    <div class="container">
        <%@include file="navbar.jsp" %>
        <br><br>
        <div style="width: 50%">

            <%
                Items item = (Items) request.getAttribute("detailsItem");
                if (item != null){
            %>

                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Name: </label>
                    <input value="<%=item.getName()%>"  type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" readonly>
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Description: </label>
                    <input value="<%=item.getDescription()%>" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" readonly>
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Price: </label>
                    <input value="<%=item.getPrice()%>" type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" readonly>
                </div>
                <br>

            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModalDelete">
                DELETE
            </button>
            <div class="modal fade" id="exampleModalDelete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Delete item</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form action="/deleteItem" method="post">
                            <div class="modal-body">
                                <input name="id" type="hidden" value="<%=item.getId()%>">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Delete</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                UPDATE
            </button>
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Update Item</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <form action="/updateItem" method="post">
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Name: </label>
                                    <input type="hidden" name="id" value="<%=item.getId()%>">
                                    <input name="name" value="<%=item.getName()%>"  type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" >
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Description: </label>
                                    <input name="desc" value="<%=item.getDescription()%>" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" >
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Price: </label>
                                    <input name="price" value="<%=item.getPrice()%>" type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" >
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
            <%
                }
            %>

        </div>
    </div>
</body>
</html>
