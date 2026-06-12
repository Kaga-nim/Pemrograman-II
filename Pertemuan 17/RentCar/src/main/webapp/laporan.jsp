<%-- 
    Document   : laporan
    Created on : 12 Jun 2026, 17.09.45
    Author     : kaganim1
--%>

<%@page import="com.unpam.model.rentcar.config.Koneksi"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Rent Car - Laporan Transaksi</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        nav { margin-bottom: 20px; }
        nav a { margin-right: 15px; text-decoration: none; color: blue; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        table, th, td { border: 1px solid #aaa; padding: 10px; text-align: left; }
        th { background-color: #f2f2f2; }
        .status-belum { color: red; font-weight: bold; }
        .status-sudah { color: green; font-weight: bold; }
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

    <h2>Laporan Semua Transaksi Penyewaan</h2>

    <table>
        <thead>
            <tr>
                <th>ID Transaksi</th>
                <th>Nama Customer</th>
                <th>Mobil</th>
                <th>Plat Nomor</th>
                <th>Tanggal Sewa</th>
                <th>Lama Sewa</th>
                <th>Total Harga</th>
                <th>Tanggal Kembali</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                try {
                    conn = Koneksi.getKoneksi();
                    String sql = "SELECT t.id, c.nama_customer, m.nama_mobil, m.plat_nomor, " +
                                 "t.tanggal_sewa, t.lama_sewa, t.total_harga, t.tanggal_kembali " +
                                 "FROM transaksi t " +
                                 "JOIN customer c ON t.customer_id = c.id " +
                                 "JOIN mobil m ON t.mobil_id = m.id " +
                                 "ORDER BY t.id DESC";
                    ps = conn.prepareStatement(sql);
                    rs = ps.executeQuery();
                    
                    boolean adaData = false;
                    while(rs.next()) {
                        adaData = true;
                        String tglKembali = rs.getString("tanggal_kembali");
                        String statusStr = (tglKembali == null) ? "<span class='status-belum'>Masih Disewa</span>" : "<span class='status-sudah'>Selesai</span>";
                        if(tglKembali == null) { tglKembali = "-"; }
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("nama_customer") %></td>
                <td><%= rs.getString("nama_mobil") %></td>
                <td><%= rs.getString("plat_nomor") %></td>
                <td><%= rs.getString("tanggal_sewa") %></td>
                <td><%= rs.getInt("lama_sewa") %> Hari</td>
                <td>Rp <%= rs.getDouble("total_harga") %></td>
                <td><%= tglKembali %></td>
                <td><%= statusStr %></td>
            </tr>
            <%
                    }
                    if(!adaData) {
                        out.print("<tr><td colspan='9'>Belum ada transaksi terjadi.</td></tr>");
                    }
                } catch(Exception e) {
                    e.printStackTrace();
                } finally {
                    if(rs != null) rs.close();
                    if(ps != null) ps.close();
                    if(conn != null) conn.close();
                }
            %>
        </tbody>
    </table>

</body>
</html>