<%-- 
    Document   : index
    Created on : 12 Jun 2026, 17.07.58
    Author     : kaganim1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Rent Car</title>

    <style>

        body{
            font-family: Arial;
            background:#f4f4f4;
            margin:0;
        }

        .header{
            background:#2196F3;
            color:white;
            padding:20px;
        }

        .menu{
            padding:20px;
        }

        .menu a{
            display:block;
            width:200px;
            padding:10px;
            margin-bottom:10px;
            background:#2196F3;
            color:white;
            text-decoration:none;
            text-align:center;
        }

    </style>

</head>

<body>

<div class="header">
    <h1>APLIKASI RENT CAR</h1>
</div>

<div class="menu">

    <a href="mobil.jsp">Data Mobil</a>

    <a href="customer.jsp">Data Customer</a>

    <a href="sewa.jsp">Penyewaan</a>

    <a href="kembali.jsp">Pengembalian</a>

    <a href="laporan.jsp">Laporan</a>

</div>

</body>
</html>