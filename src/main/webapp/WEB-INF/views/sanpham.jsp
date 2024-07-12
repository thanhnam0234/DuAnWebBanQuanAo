<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<h1 class="text-center">San pham</h1>
<form action="/san-pham/add" method="post">
    <div>
        <label class="form-label">Ma san pham</label>
        <input type="text" name="ma_san_pham" class="form-control">
    </div>
    <div>
        <label class="form-label">Ten san pham</label>
        <input type="text" name="ten_san_pham" class="form-control">
    </div>
    <div>
        <label class="form-label">Ten danh muc</label>
        <select name="id_danh_muc" class="form-control">
            <c:forEach items="${listDM}" var="dm">
                <option value="${dm.id}">${dm.ten_danh_muc}</option>
            </c:forEach>
        </select>
    </div>
    <div>
        <label class="form-label">Trang thai</label>
        <input type="radio" name="trang_thai" value="Con hang">
        <label>Con hang</label>
        <input type="radio" name="trang_thai" value="Het hang">
        <label>Het hang</label>
    </div>
    <button class="btn btn-success">ADD</button>
</form>
<table class="table">
    <thead>
    <tr>
        <td>ID</td>
        <td>Ma san pham</td>
        <td>Ten san pham</td>
        <td>Ten danh muc</td>
        <td>Trang thai</td>
        <td>Ngay tao</td>
        <td>Ngay sua</td>
        <td>Action</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="sp" items="${list}">
        <tr>
            <td>${sp.id}</td>
            <td>${sp.ma_san_pham}</td>
            <td>${sp.ten_san_pham}</td>
            <td>${sp.danhMuc.ten_danh_muc}</td>
            <td>${sp.trang_thai}</td>
            <td>${sp.ngay_tao}</td>
            <td>${sp.ngay_sua}</td>
            <td>
                <a href="/san-pham/delete?id=${sp.id}" class="btn btn-dark">DELETE</a>
                <a href="/san-pham/edit?id=${sp.id}" class="btn btn-dark">EDIT</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div style="display: flex; justify-content: center">
    <nav aria-label="Page navigation example">
        <ul class="pagination">
            <li class="page-item">
                <a class="page-link" href="?page=0">&laquo;&laquo;</a>
            </li>
            <li class="page-item">
                <a class="page-link" href="?pageNo=${page.number -1}">Previous</a>
            </li>
            <li class="page-item">
                <a class="page-link" href="?pageNo=${page.number +1}">Next</a>
            </li>
            <li class="page-item">
                <a class="page-link" href="?pageNo=${page.totalPages -1}">&raquo;&raquo;</a>
            </li>
        </ul>
    </nav>
</div>
</body>
</html>