<%-- 
    Document   : customer
    Created on : 12 Jun 2026, 17.09.19
    Author     : kaganim1
--%>

<%@page import="com.unpam.model.Customer"%>
<%@page import="com.unpam.model.rentcar.dao.CustomerDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Rent Car - Data Customer</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        nav { margin-bottom: 20px; }
        nav a { margin-right: 15px; text-decoration: none; color: blue; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        table, th, td { border: 1px solid #aaa; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        .form-section { background: #f9f9f9; padding: 15px; border: 1px solid #ddd; width: 300px; }
        .form-group { margin-bottom: 10px; }
        .form-group label { display: block; margin-bottom: 5px; }
        .form-group input, .form-group textarea { width: 100%; padding: 5px; }
    </style>
</head>
<body>

    <nav>
        <a href="index.jsp">Home</a> | 
        <a href="mobil.jsp">Data Mobil</a> | 
        <a href="customer.jsp">Data Customer</a> | 
        <a href="sewa.jsp">Penyewaan</a> | 
        <a href="kembali.jsp">Pengembalian</a> | 
        <a href="laporan.jsp">Laporan</a>
    </nav>

    <h2>Kelola Data Customer</h2>

    <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String nama = request.getParameter("nama_customer");
            String noHp = request.getParameter("no_hp");
            String alamat = request.getParameter("alamat");

            if (nama != null && !nama.trim().isEmpty()) {
                Customer c = new Customer();
                c.setNamaCustomer(nama);
                c.setNoHp(noHp);
                c.setAlamat(alamat);

                CustomerDAO dao = new CustomerDAO();
                if (dao.insertCustomer(c)) {
                    out.print("<script>alert('Customer berhasil ditambah!'); window.location='customer.jsp';</script>");
                } else {
                    out.print("<script>alert('Gagal menambah customer.');</script>");
                }
            }
        }
    %>

    <div class="form-section">
        <h3>Tambah Customer</h3>
        <form action="customer.jsp" method="POST">
            <div class="form-group">
                <label>Nama Customer:</label>
                <input type="text" name="nama_customer" required />
            </div>
            <div class="form-group">
                <label>No HP:</label>
                <input type="text" name="no_hp" required />
            </div>
            <div class="form-group">
                <label>Alamat:</label>
                <textarea name="alamat" required></textarea>
            </div>
            <button type="submit">Simpan Customer</button>
        </form>
    </div>

    <h3>Daftar Customer</h3>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nama Customer</th>
                <th>No HP</th>
                <th>Alamat</th>
            </tr>
        </thead>
        <tbody>
            <%
                CustomerDAO dao = new CustomerDAO();
                List<Customer> list = dao.getAllCustomer();
                for (Customer cust : list) {
            %>
            <tr>
                <td><%= cust.getId() %></td>
                <td><%= cust.getNamaCustomer() %></td>
                <td><%= cust.getNoHp() %></td>
                <td><%= cust.getAlamat() %></td>
            </tr>
            <%
                }
                if(list.isEmpty()){
                    out.print("<tr><td colspan='4'>Belum ada data customer.</td></tr>");
                }
            %>
        </tbody>
    </table>

</body>
</html>