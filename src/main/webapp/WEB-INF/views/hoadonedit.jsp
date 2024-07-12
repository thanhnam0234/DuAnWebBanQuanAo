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
<h1 class="text-center">Hoa Don</h1>
<form action="/hoa-don/update?id=${hd.id}" method="post">
    <div>
        <label class="form-label">Ten khach hang</label>
        <select name="id_khach_hang" class="form-control">
            <c:forEach items="${listKH}" var="kh">
            <option value="${kh.id}" <c:if test="${hd.khachHang.id == kh.id}">selected</c:if> >${kh.ho_ten}</option>
            </c:forEach>
        </select>
    </div>
    <div>
        <label class="form-label">Dia chi</label>
        <input type="text" name="dia_chi" class="form-control" value="${hd.dia_chi}">
    </div>
    <div>
        <label class="form-label">So dien thoai</label>
        <input type="number" name="so_dien_thoai" class="form-control" value="${hd.so_dien_thoai}">
    </div>
    <div>
        <label class="form-label">Trang thai</label>
        <input type="radio" name="trang_thai" value="Da thanh toan" <c:if test="${hd.trang_thai == 'Da thanh toan'}">checked</c:if> >
        <label>Da thanh toan</label>
        <input type="radio" name="trang_thai" value="Chua thanh toan" <c:if test="${hd.trang_thai == 'Chua thanh toan'}">checked</c:if>>
        <label>Chua thanh toan</label>
    </div>
    <button class="btn btn-success">UPDATE</button>
</form>