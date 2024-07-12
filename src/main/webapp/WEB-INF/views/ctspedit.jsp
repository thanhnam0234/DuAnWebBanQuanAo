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
<form action="/ctsp/update?id=${ctsp.id}" method="post">
    <div>
        <label class="form-label">Ten san pham</label>
        <select name="id_sp" class="form-control">
            <c:forEach items="${listSP}" var="sp">
            <option value="${sp.id}" <c:if test="${ctsp.sanPham.id == sp.id}">selected</c:if> >${sp.ten_san_pham}</option>
            </c:forEach>
        </select>
    </div>
    <div>
        <label class="form-label">Ten mau sac</label>
        <select name="id_mau_sac" class="form-control">
            <c:forEach items="${listMS}" var="ms">
                <option value="${ms.id}" <c:if test="${ctsp.mauSac.id == ms.id}">selected</c:if>>${ms.ten_mau}</option>
            </c:forEach>
        </select>
    </div>
    <div>
        <label class="form-label">Ten size</label>
        <select name="id_size" class="form-control">
            <c:forEach items="${listS}" var="s">
                <option value="${s.id}" <c:if test="${ctsp.size.id == s.id}">selected</c:if> >${s.ten_size}</option>
            </c:forEach>
        </select>
    </div>
    <div>
        <label class="form-label">Gia ban</label>
        <input type="number" name="gia_ban" class="form-control" value="${ctsp.gia_ban}">
    </div>
    <div>
        <label class="form-label">So luong ton</label>
        <input type="number" name="so_luong_ton" class="form-control" value="${ctsp.so_luong_ton}">
    </div>
    <div>
        <label class="form-label">Trang thai</label>
        <input type="radio" name="trang_thai" value="Kha dung" <c:if test="${ctsp.trang_thai == 'Kha dung'}">checked</c:if> >
        <label>Kha dung</label>
        <input type="radio" name="trang_thai" value="Khong kha dung" <c:if test="${ctsp.trang_thai == 'Khong kha dung'}">checked</c:if>>
        <label>Khong kha dung</label>
    </div>
    <button class="btn btn-success">UPDATE</button>
</form>