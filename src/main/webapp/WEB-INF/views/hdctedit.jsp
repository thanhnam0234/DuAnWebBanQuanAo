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
<form action="/hdct/update?id=${hdct.id}" method="post">
    <div>
        <label class="form-label">Ma hoa don</label>
        <select name="id_hoa_don" class="form-control">
            <c:forEach items="${listHD}" var="hd">
            <option value="${hd.id}" <c:if test="${hdct.hoaDon.id == hd.id}">selected</c:if> >${hd.id}</option>
            </c:forEach>
        </select>
    </div>
    <div>
        <label class="form-label">Ma CTSP</label>
        <select name="id_ctsp" class="form-control">
            <c:forEach items="${listCTSP}" var="ctsp">
                <option value="${ctsp.id}" <c:if test="${hdct.ctsp.id == ctsp.id}">selected</c:if>>${ctsp.id}</option>
            </c:forEach>
        </select>
    </div>
    <div>
        <label class="form-label">Gia ban</label>
        <input type="number" name="gia_ban" class="form-control" value="${hdct.gia_ban}">
    </div>
    <div>
        <label class="form-label">So luong mua</label>
        <input type="number" name="so_luong_mua" class="form-control" value="${hdct.so_luong_mua}">
    </div>
    <div>
        <label class="form-label">Tong tien</label>
        <input type="number" name="tong_tien" class="form-control" value="${hdct.tong_tien}">
    </div>
    <div>
        <label class="form-label">Trang thai</label>
        <input type="radio" name="trang_thai" value="Kha dung" <c:if test="${hdct.trang_thai == 'Kha dung'}">checked</c:if> >
        <label>Kha dung</label>
        <input type="radio" name="trang_thai" value="Khong kha dung" <c:if test="${hdct.trang_thai == 'Khong kha dung'}">checked</c:if>>
        <label>Khong kha dung</label>
    </div>
    <button class="btn btn-success">UPDATE</button>
</form>