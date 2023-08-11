
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="${url }/ShopLaptop/views/admin/assetss/css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
    
        <div class="container">
        <a href="/ShopLaptop/manager" class="btn btn-danger" data-toggle="modal"> <span> < Back</span></a>
            <form action="edit" method="post">
								<h3 class="mt-3">Cập nhật loại sản phẩm</h3>
								<c:set var="prod" value="${requestScope.product}"></c:set>
								<div class="mt-3">
									<label>Mã loại SP</label>
									<input type="number" name="id" readonly="readonly" class="form-control" value="${product.id}"/>
								</div>
								<div class="mt-3">
									<label>Tên loại SP</label>
									<input type="text" name="name" class="form-control" value="${product.name}"/>
								</div>
								<div class="mt-3">
									<label>Tên loại SP</label>
									<input type="text" name="image" class="form-control" value="${product.image}"/>
								</div>
								<div class="mt-3">
									<label>Tên loại SP</label>
									<input type="text" name="price" class="form-control" value="${product.price}"/>
								</div>
								 <div class="mt-3">
                                    <label>Title</label>
                                    <textarea name="title" class="form-control" required>${product.title}</textarea>
                                </div>
                                <div class="mt-3">
                                    <label>Description</label>
                                    <textarea name="description" class="form-control" required>${product.description}</textarea>
                                </div>
                                <div class="mt-3">
							<label>Category</label> <select name="category"
								class="form-select" aria-label="Default select example">
								<c:forEach items="${category}" var="c">
									<option value="${c.id}">${c.name}</option>
								</c:forEach>
							</select>
							</div>
								<div class="mt-3">
									<input type="submit" value="Cập nhật" class="btn btn-primary"/>
								</div>
							</form>


        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>