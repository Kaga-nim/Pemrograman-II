<%-- 
    Document   : sewa
    Created on : 12 Jun 2026, 17.09.27
    Author     : kaganim1
--%>

<%@page import="com.unpam.model.Mobil"%>
<%@page import="com.unpam.model.Customer"%>
<%@page import="com.unpam.model.rentcar.dao.MobilDAO"%>
<%@page import="com.unpam.model.rentcar.dao.CustomerDAO"%>
<%@page import="com.unpam.model.rentcar.dao.TransaksiDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Rent Car - Transaksi Penyewaan</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        nav { margin-bottom: 20px; }
        nav a { margin-right: 15px; text-decoration: none; color: blue; }
        .form-section { background: #f9f9f9; padding: 25px; border: 1px solid #ddd; width: 400px; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; }
        .form-group select, .form-group input { width: 100%; padding: 6px; }
        button { padding: 10px 15px; background: green; color: white; border: none; cursor: pointer; }
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

    <h2>Transaksi Penyewaan Mobil</h2>

    <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            int customerId = Integer.parseInt(request.getParameter("customer_id"));
            int mobilId = Integer.parseInt(request.getParameter("mobil_id"));
            String tanggalSewa = request.getParameter("tanggal_sewa");
            int lamaSewa = Integer.parseInt(request.getParameter("lama_sewa"));

            TransaksiDAO dao = new TransaksiDAO();
            if (dao.simpanTransaksi(customerId, mobilId, tanggalSewa, lamaSewa)) {
                out.print("<script>alert('Transaksi Sewa Berhasil Disimpan!'); window.location='sewa.jsp';</script>");
            } else {
                out.print("<script>alert('Gagal memproses transaksi.');</script>");
            }
        }
    %>

    <div class="form-section">
        <form action="sewa.jsp" method="POST">
            
            <div class="form-group">
                <label>Pilih Customer:</label>
                <select name="customer_id" required>
                    <option value="">-- Pilih Customer --</option>
                    <%
                        CustomerDAO custDAO = new CustomerDAO();
                        List<Customer> listCust = custDAO.getAllCustomer();
                        for(Customer c : listCust) {
                    %>
                        <option value="<%= c.getId() %>"><%= c.getNamaCustomer() %> (<%= c.getNoHp() %>)</option>
                    <% } %>
                </select>
            </div>

            <div class="form-group">
                <label>Pilih Mobil (Hanya yang Tersedia):</label>
                <select name="mobil_id" required>
                    <option value="">-- Pilih Mobil --</option>
                    <%
                        MobilDAO mobDAO = new MobilDAO();
                        // Menggunakan method getMobilTersedia()
                        List<Mobil> listMobil = mobDAO.getMobilTersedia(); 
                        for(Mobil m : listMobil) {
                    %>
                        <option value="<%= m.getId() %>"><%= m.getNamaMobil() %> - <%= m.getPlatNomor() %> (Rp <%= m.getHargaPerHari() %>/hari)</option>
                    <% } %>
                </select>
            </div>

            <div class="form-group">
                <label>Tanggal Sewa:</label>
                <input type="date" name="tanggal_sewa" required />
            </div>

            <div class="form-group">
                <label>Lama Sewa (Hari):</label>
                <input type="number" name="lama_sewa" min="1" required />
            </div>

            <button type="submit">Proses Sewa Mobil</button>
        </form>
    </div>

</body>
</html>