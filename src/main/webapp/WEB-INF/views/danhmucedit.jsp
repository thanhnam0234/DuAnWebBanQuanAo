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
</html>
<body>
<h1 class="text-center">Danh muc</h1>
<form action="/danh-muc/update?id=${dm.id}" method="post">
    <div>
        <label class="form-label">Ma danh muc</label>
        <input type="text" name="ma_danh_muc" class="form-control" value="${dm.ma_danh_muc}">
    </div>
    <div>
        <label class="form-label">Ten danh muc</label>
        <input type="text" name="ten_danh_muc" class="form-control" value="${dm.ten_danh_muc}">
    </div>
    <div>
        <label>Trang thai</label>
        <input type="radio" value="Kha dung" name="trang_thai" <c:if test="${dm.trang_thai == 'Kha dung'}">checked</c:if>>
        <label>Kha dung</label>
        <input type="radio" value="Khong kha dung" name="trang_thai" <c:if test="${dm.trang_thai == 'Khong kha dung'}">checked</c:if>>
        <label>Khong kha dung</label>
    </div>
    <button class="btn btn-success" type="submit">Update</button>
</form>