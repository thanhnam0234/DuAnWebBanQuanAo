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
<h1 class="text-center">Khach hang</h1>
<form action="/khach-hang/add" method="post">
    <div>
        <label class="form-label">Ho ten</label>
        <input type="text" name="ho_ten" class="form-control">
    </div>
    <div>
        <label class="form-label">Dia chi</label>
        <input type="text" name="dia_chi" class="form-control">
    </div>
    <div>
        <label class="form-label">So dien thoai</label>
        <input type="number" name="sdt" class="form-control">
    </div>
    <div>
        <label class="form-label">Trang thai</label>
        <input type="radio" name="trang_thai" value="Kha dung">
        <label>Kha dung</label>
        <input type="radio" name="trang_thai" value="Khong kha dung">
        <label>Khong kha dung</label>
    </div>
    <button class="btn btn-success">ADD</button>
</form>
<table class="table">
    <thead>
    <tr>
        <td>ID</td>
        <td>Ho ten</td>
        <td>Dia chi</td>
        <td>So dien thoai</td>
        <td>Trang thai</td>
        <td>Ngay tao</td>
        <td>Ngay sua</td>
        <td>Action</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="kh" items="${list}">
        <tr>
            <td>${kh.id}</td>
            <td>${kh.ho_ten}</td>
            <td>${kh.dia_chi}</td>
            <td>${kh.sdt}</td>
            <td>${kh.trang_thai}</td>
            <td>${kh.ngay_tao}</td>
            <td>${kh.ngay_sua}</td>
            <td>
                <a href="/khach-hang/delete?id=${kh.id}" class="btn btn-dark">DELETE</a>
                <a href="/khach-hang/edit?id=${kh.id}" class="btn btn-dark">EDIT</a>
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