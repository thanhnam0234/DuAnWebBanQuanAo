<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Document</title>
</head>
<body>
<div class="row">
    <div class="col-7">
        <h2>Danh sach hoa don</h2>
        <table class="table">
            <thead>
            <tr>
                <td>STT</td>
                <td>ID</td>
                <td>Ten khach hang</td>
                <td>Ngay tao</td>
                <td>Tong tien</td>
                <td>Trang Thai</td>
                <td>Chuc nang</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listHD}" varStatus="i" var="hd">
                <tr>
                    <td>${i.index +1}</td>
                    <td>${hd.id}</td>
                    <td>${hd.khachHang.ho_ten}</td>
                    <td>${hd.ngay_tao}</td>
                    <td>0</td>
                    <td>${hd.trang_thai}</td>
                    <td><a href="/ban-hang/hdct?id=${hd.id}" class="btn btn-primary">Chon</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <h2>Danh sach hoa don chi tiet</h2>
        <table class="table">
            <thead>
            <tr>
                <td>STT</td>
                <td>ID</td>
                <td>Ten san pham</td>
                <td>So luong</td>
                <td>Gia ban</td>
                <td>Tong tien</td>
                <td>Chuc nang</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listHDCT}" varStatus="i" var="hdct">
                <tr>
                    <td>${i.index +1}</td>
                    <td>${hdct.id}</td>
                    <td>${hdct.ctsp.sanPham.ten_san_pham}</td>
                    <td>${hdct.so_luong_mua}</td>
                    <td>${hdct.gia_ban}</td>
                    <td>${hdct.tong_tien}</td>
                    <td><a href="/ban-hang/delete?id=${hdct.id}" class="btn btn-primary">Xoa</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="col-5">
        <h2>Tao hoa don</h2>
        <div class="row">
            <div>
                <div>
                    <label class="mb-3 col-3">So dien thoai</label>
                    <input type="text" class="col-7" name="sdt">
                </div>
                <button class="btn btn-primary">Search</button>
            </div>
            <form action="/hoa-don/add" method="post">
                <div class="mb-3">
                    <label class="col-3">Ten Khach hang</label>
                    <input type="text" class="col-7" name="id_khach_hang" readonly value="${datahd.khachHang.ho_ten}">
                </div>
                <div class="mb-3">
                    <label class="col-3">ID Hoa don</label>
                    <input type="text" class="col-7" readonly name="id" value="${datahd.id}">
                </div>
                <div class="mb-3">
                    <label class="col-3">Tong tien</label>
                    <input type="text" class="col-7" readonly name="tongtien" value="${tongtien}">
                </div>
                <div>
                    <a href="/ban-hang/addhoadon" class="btn btn-primary">Tao hoa don</a>
                    <a href="/ban-hang/thanhtoan?id=${datahd.id}" class="btn btn-primary">Thanh toan</a>
                </div>
            </form>
        </div>
    </div>
</div>
<div>
    <h2>Danh sach chi tiet san pham</h2>
    <table class="table">
        <thead>
        <tr>
            <td>STT</td>
            <td>ID CTSP</td>
            <td>Ten san pham</td>
            <td>Mau sac</td>
            <td>Size</td>
            <td>Gia ban</td>
            <td>So luong ton</td>
            <td>Trang Thai</td>
            <td>Chuc nang</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listCTSP}" var="ctsp" varStatus="i">
            <tr>
                <td>${i.index +1}</td>
                <td>${ctsp.id}</td>
                <td>${ctsp.sanPham.ten_san_pham}</td>
                <td>${ctsp.mauSac.ten_mau}</td>
                <td>${ctsp.size.ten_size}</td>
                <td>${ctsp.gia_ban}</td>
                <td>${ctsp.so_luong_ton}</td>
                <td>${ctsp.trang_thai}</td>
                <td>
                    <a href="/ban-hang/addhdct?id=${ctsp.id}&idHD=${datahd.id}" class="btn btn-primary">Mua</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>