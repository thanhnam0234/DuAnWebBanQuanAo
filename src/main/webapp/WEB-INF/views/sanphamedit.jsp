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
<form action="/san-pham/update?id=${sp.id}" method="post">
    <div>
        <label class="form-label">Ma san pham</label>
        <input type="text" name="ma_san_pham" class="form-control" value="${sp.ma_san_pham}">
    </div>
    <div>
        <label class="form-label">Ten san pham</label>
        <input type="text" name="ten_san_pham" class="form-control" value="${sp.ten_san_pham}">
    </div>
    <div>
        <label class="form-label">Ten danh muc</label>
        <select name="id_danh_muc" class="form-control">
            <c:forEach items="${listDM}" var="dm">
            <option value="${dm.id}" <c:if test="${sp.danhMuc.id == dm.id}">selected</c:if> >${dm.ten_danh_muc}</option>
            </c:forEach>
        </select>
    </div>
    <div>
        <label class="form-label">Trang thai</label>
        <input type="radio" name="trang_thai" value="Con hang" <c:if test="${sp.trang_thai == 'Con hang'}">checked</c:if> >
        <label>Con hang</label>
        <input type="radio" name="trang_thai" value="Het hang" <c:if test="${sp.trang_thai == 'Het hang'}">checked</c:if>>
        <label>Het hang</label>
    </div>
    <button class="btn btn-success">UPDATE</button>
</form>