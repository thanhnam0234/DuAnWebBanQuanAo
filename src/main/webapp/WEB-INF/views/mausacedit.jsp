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
<h1 class="text-center">Mau Sac</h1>
<form action="/mau-sac/update?id=${ms.id}" method="post">
    <div>
        <label class="form-label">Ma mau</label>
        <input type="text" name="ma_mau" class="form-control" value="${ms.ma_mau}">
    </div>
    <div>
        <label class="form-label">Ten mau</label>
        <input type="text" name="ten_mau" class="form-control" value="${ms.ten_mau}">
    </div>
    <div>
        <label class="form-label">Trang thai</label>
        <input type="radio" name="trang_thai" value="Kha dung" <c:if test="${ms.trang_thai == 'Kha dung'}">checked</c:if> >
        <label>Kha dung</label>
        <input type="radio" name="trang_thai" value="Khong kha dung" <c:if test="${ms.trang_thai == 'Khogn kha dung'}">checked</c:if>>
        <label>Khong kha dung</label>
    </div>
    <button class="btn btn-success">UPDATE</button>
</form>