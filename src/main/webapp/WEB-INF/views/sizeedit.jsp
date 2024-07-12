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
<h1 class="text-center">Size</h1>
<form action="/size/update?id=${s.id}" method="post">
    <div>
        <label class="form-label">Ma size</label>
        <input type="text" name="ma_size" class="form-control" value="${s.ma_size}">
    </div>
    <div>
        <label class="form-label">Ten size</label>
        <input type="text" name="ten_size" class="form-control" value="${s.ten_size}">
    </div>
    <div>
        <label class="form-label">Trang thai</label>
        <input type="radio" name="trang_thai" value="Kha dung" <c:if test="${s.trang_thai == 'Kha dung'}">checked</c:if> >
        <label>Kha dung</label>
        <input type="radio" name="trang_thai" value="Khong kha dung" <c:if test="${s.trang_thai == 'Khong kha dung'}">checked</c:if>>
        <label>Khong kha dung</label>
    </div>
    <button class="btn btn-success">UPDATE</button>
</form>