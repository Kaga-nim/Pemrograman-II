<%-- 
    Document   : kembali
    Created on : 12 Jun 2026, 17.09.37
    Author     : kaganim1
--%>

<%@page import="com.unpam.model.rentcar.config.Koneksi"%>
<%@page import="com.unpam.model.rentcar.dao.TransaksiDAO"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Rent Car - Pengembalian Mobil</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        nav { margin-bottom: 20px; }
        nav a { margin-right: 15px; text-decoration: none; color: blue; }
        .form-section { background: #f9f9f9; padding: 25px; border: 1px solid #ddd; width: 450px; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; }
        .form-group select, .form-group input { width: 100%; padding: 6px; }
        button { padding: 10px 15px; background: orange; color: black; font-weight: bold; border: none; cursor: pointer; }
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

    <h2>Pengembalian Mobil</h2>

    <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            int transaksiId = Integer.parseInt(request.getParameter("transaksi_id"));
            String tanggalKembali = request.getParameter("tanggal_kembali");

            TransaksiDAO dao = new TransaksiDAO();
            if (dao.prosesPengembalian(transaksiId, tanggalKembali)) {
                out.print("<script>alert('Mobil Berhasil Dikembalikan!'); window.location='kembali.jsp';</script>");
            } else {
                out.print("<script>alert('Gagal memproses pengembalian.');</script>");
            }
        }
    %>

    <div class="form-section">
        <form action="kembali.jsp" method="POST">
            
            <div class="form-group">
                <label>Pilih Transaksi Aktif (Belum Kembali):</label>
                <select name="transaksi_id" required>
                    <option value="">-- Pilih Transaksi --</option>
                    <%
                        // Menggunakan JDBC direct query di JSP untuk efisiensi load dropdown data join
                        Connection conn = null;
                        PreparedStatement ps = null;
                        ResultSet rs = null;
                        try {
                            conn = Koneksi.getKoneksi();
                            String sql = "SELECT t.id, c.nama_customer, m.nama_mobil, m.plat_nomor, t.tanggal_sewa " +
                                         "FROM transaksi t " +
                                         "JOIN customer c ON t.customer_id = c.id " +
                                         "JOIN mobil m ON t.mobil_id = m.id " +
                                         "WHERE t.tanggal_kembali IS NULL";
                            ps = conn.prepareStatement(sql);
                            rs = ps.executeQuery();
                            while(rs.next()) {
                    %>
                        <option value="<%= rs.getInt("id") %>">
                            ID Transaksi: <%= rs.getInt("id") %> | <%= rs.getString("nama_customer") %> - <%= rs.getString("nama_mobil") %> (<%= rs.getString("plat_nomor") %>) - Sewa: <%= rs.getString("tanggal_sewa") %>
                        </option>
                    <%
                            }
                        } catch(Exception e) { e.printStackTrace(); } 
                        finally {
                            if(rs != null) rs.close();
                            if(ps != null) ps.close();
                            if(conn != null) conn.close();
                        }
                    %>
                </select>
            </div>

            <div class="form-group">
                <label>Tanggal Dikembalikan:</label>
                <input type="date" name="tanggal_kembali" required />
            </div>

            <button type="submit">Proses Pengembalian</button>
        </form>
    </div>

</body>
</html>