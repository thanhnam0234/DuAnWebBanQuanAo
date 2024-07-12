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
</head>
<body>
<h1 class="text-center">Danh muc</h1>
<form action="/danh-muc/add" method="post">
    <div>
        <label class="form-label">Ma danh muc</label>
        <input type="text" name="ma_danh_muc" class="form-control">
    </div>
    <div>
        <label class="form-label">Ten danh muc</label>
        <input type="text" name="ten_danh_muc" class="form-control">
    </div>
    <div>
        <label>Trang thai</label>
        <input type="radio" value="Kha dung" name="trang_thai">
        <label>Kha dung</label>
        <input type="radio" value="Khong kha dung" name="trang_thai">
        <label>Khong kha dung</label>
    </div>
    <button class="btn btn-success" type="submit">Add</button>
</form>
<table class="table">
    <thead>
    <tr>
        <td>ID</td>
        <td>Ma danh muc</td>
        <td>Ten danh muc</td>
        <td>Trang thai</td>
        <td>Ngay tao</td>
        <td>Ngay sua</td>
        <td>Action</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="dm">
        <tr>
            <td>${dm.id}</td>
            <td>${dm.ma_danh_muc}</td>
            <td>${dm.ten_danh_muc}</td>
            <td>${dm.trang_thai}</td>
            <td>${dm.ngay_tao}</td>
            <td>${dm.ngay_sua}</td>
            <td>
                <a class="btn btn-dark" href="/danh-muc/delete?id=${dm.id}">Xoa</a>
                <a class="btn btn-dark" href="/danh-muc/edit?id=${dm.id}">Edit</a>
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