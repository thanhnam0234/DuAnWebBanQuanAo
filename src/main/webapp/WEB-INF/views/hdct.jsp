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
<h1 class="text-center">HOA DON CHI TIET</h1>
<form action="/hdct/add" method="post">
    <div>
        <label class="form-label">Ma hoa don</label>
        <select name="id_hoa_don" class="form-control">
            <c:forEach items="${listHD}" var="hd">
                <option value="${hd.id}">${hd.id}</option>
            </c:forEach>
        </select>
    </div>
    <div>
        <label class="form-label">Ma CTSP</label>
        <select name="id_ctsp" class="form-control">
            <c:forEach items="${listCTSP}" var="ctsp">
                <option value="${ctsp.id}">${ctsp.id}</option>
            </c:forEach>
        </select>
    </div>
    <div>
        <label class="form-label">Gia ban</label>
        <input type="number" name="gia_ban" class="form-control">
    </div>
    <div>
        <label class="form-label">So luong mua</label>
        <input type="number" name="so_luong_mua" class="form-control">
    </div>
    <div>
        <label class="form-label">Tong tien</label>
        <input type="number" name="tong_tien" class="form-control">
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
        <td>Ma hoa don</td>
        <td>Ma ctsp</td>
        <td>Gia ban</td>
        <td>So luong mua</td>
        <td>Tong tien</td>
        <td>Trang thai</td>
        <td>Ngay tao</td>
        <td>Ngay sua</td>
        <td>Action</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="hdct" items="${list}">
        <tr>
            <td>${hdct.id}</td>
            <td>${hdct.hoaDon.id}</td>
            <td>${hdct.ctsp.id}</td>
            <td>${hdct.so_luong_mua}</td>
            <td>${hdct.gia_ban}</td>
            <td>${hdct.tong_tien}</td>
            <td>${hdct.trang_thai}</td>
            <td>${hdct.ngay_tao}</td>
            <td>${hdct.ngay_sua}</td>
            <td>
                <a href="/hdct/delete?id=${hdct.id}" class="btn btn-dark">DELETE</a>
                <a href="/hdct/edit?id=${hdct.id}" class="btn btn-dark">EDIT</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>