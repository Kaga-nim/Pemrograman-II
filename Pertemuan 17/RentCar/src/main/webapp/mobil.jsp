<%-- 
    Document   : mobil
    Created on : 12 Jun 2026, 17.09.00
    Author     : kaganim1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.unpam.model.rentcar.dao.MobilDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.unpam.model.rentcar.config.Koneksi"%>
<%
if(request.getParameter("simpan") != null){

    try{

        Connection conn = Koneksi.getConnection();

        PreparedStatement ps =
            conn.prepareStatement(
            "INSERT INTO mobil(nama_mobil,plat_nomor,harga_per_hari,status) VALUES(?,?,?,?)");

        ps.setString(1, request.getParameter("nama"));
        ps.setString(2, request.getParameter("plat"));
        ps.setDouble(3,
            Double.parseDouble(
                request.getParameter("harga")));

        ps.setString(4,
            request.getParameter("status"));

        ps.executeUpdate();

    }catch(Exception e){

        out.println(e.getMessage());

    }
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Data Mobil</title>
</head>

<body>

<h1>Data Mobil</h1>

<table border="1" cellpadding="10">
    
    <h2>Tambah Mobil</h2>

<form method="post">

    Nama Mobil :
    <input type="text"
           name="nama"
           required>

    <br><br>

    Plat Nomor :
    <input type="text"
           name="plat"
           required>

    <br><br>

    Harga :
    <input type="number"
           name="harga"
           required>

    <br><br>

    Status :

    <select name="status">

        <option>Tersedia</option>
        <option>Disewa</option>

    </select>

    <br><br>

    <button type="submit" name="simpan">
        Simpan
    </button>

</form>

<hr>

<tr>
    <th>ID</th>
    <th>Nama Mobil</th>
    <th>Plat Nomor</th>
    <th>Harga</th>
    <th>Status</th>
</tr>

<%

MobilDAO dao = new MobilDAO();

ResultSet rs = dao.getAllMobil();

while(rs.next()){

%>

<tr>

<td><%= rs.getInt("id") %></td>

<td><%= rs.getString("nama_mobil") %></td>

<td><%= rs.getString("plat_nomor") %></td>

<td><%= rs.getDouble("harga_per_hari") %></td>

<td><%= rs.getString("status") %></td>

</tr>

<%
}
%>

</table>

<br>

<a href="index.jsp">Kembali</a>

</body>
</html>