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
<h1 class="text-center">CHI TIET SAN PHAM</h1>
<form action="/ctsp/add" method="post">
    <div>
        <label class="form-label">Ten san pham</label>
        <select name="id_sp" class="form-control">
            <c:forEach items="${listSP}" var="sp">
                <option value="${sp.id}">${sp.ten_san_pham}</option>
            </c:forEach>
        </select>
    </div>
    <div>
        <label class="form-label">Ten mau sac</label>
        <select name="id_mau_sac" class="form-control">
            <c:forEach items="${listMS}" var="ms">
                <option value="${ms.id}">${ms.ten_mau}</option>
            </c:forEach>
        </select>
    </div>
    <div>
        <label class="form-label">Ten size</label>
        <select name="id_size" class="form-control">
            <c:forEach items="${listS}" var="s">
                <option value="${s.id}">${s.ten_size}</option>
            </c:forEach>
        </select>
    </div>
    <div>
        <label class="form-label">Gia ban</label>
        <input type="number" name="gia_ban" class="form-control">
    </div>
    <div>
        <label class="form-label">So luong ton</label>
        <input type="number" name="so_luong_ton" class="form-control">
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
        <td>Ten san pham</td>
        <td>Ten mau sac</td>
        <td>Ten size</td>
        <td>Gia ban</td>
        <td>So luong ton</td>
        <td>Trang thai</td>
        <td>Ngay tao</td>
        <td>Ngay sua</td>
        <td>Action</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="ctsp" items="${list}">
        <tr>
            <td>${ctsp.id}</td>
            <td>${ctsp.sanPham.ten_san_pham}</td>
            <td>${ctsp.mauSac.ten_mau}</td>
            <td>${ctsp.size.ten_size}</td>
            <td>${ctsp.gia_ban}</td>
            <td>${ctsp.so_luong_ton}</td>
            <td>${ctsp.trang_thai}</td>
            <td>${ctsp.ngay_tao}</td>
            <td>${ctsp.ngay_sua}</td>
            <td>
                <a href="/ctsp/delete?id=${ctsp.id}" class="btn btn-dark">DELETE</a>
                <a href="/ctsp/edit?id=${ctsp.id}" class="btn btn-dark">EDIT</a>
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