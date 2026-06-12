/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unpam.model.rentcar.dao;

import com.unpam.model.rentcar.config.Koneksi;
import java.sql.*;
import com.unpam.model.rentcar.config.Koneksi; // Pastikan baris ini ada
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TransaksiDAO {
    
    // Fitur Penyewaan
    public boolean simpanTransaksi(int customerId, int mobilId, String tanggalSewa, int lamaSewa) {
        Connection conn = null;
        PreparedStatement psHarga = null;
        PreparedStatement psInsert = null;
        PreparedStatement psUpdateMobil = null;
        ResultSet rs = null;
        
        try {
            conn = Koneksi.getKoneksi();
            // Matikan auto-commit supaya transaksi aman (ACID)
            conn.setAutoCommit(false);
            
            // 1. Ambil harga per hari mobil
            String sqlHarga = "SELECT harga_per_hari FROM mobil WHERE id = ?";
            psHarga = conn.prepareStatement(sqlHarga);
            psHarga.setInt(1, mobilId);
            rs = psHarga.executeQuery();
            
            double hargaPerHari = 0;
            if (rs.next()) {
                hargaPerHari = rs.getDouble("harga_per_hari");
            }
            
            // Hitung total harga
            double totalHarga = hargaPerHari * lamaSewa;
            
            // 2. Insert ke tabel transaksi (tanggal_kembali diisi NULL dulu)
            String sqlInsert = "INSERT INTO transaksi (customer_id, mobil_id, tanggal_sewa, lama_sewa, total_harga, tanggal_kembali) VALUES (?, ?, ?, ?, ?, NULL)";
            psInsert = conn.prepareStatement(sqlInsert);
            psInsert.setInt(1, customerId);
            psInsert.setInt(2, mobilId);
            psInsert.setString(3, tanggalSewa);
            psInsert.setInt(4, lamaSewa);
            psInsert.setDouble(5, totalHarga);
            psInsert.executeUpdate();
            
            // 3. Update status mobil menjadi 'Disewa'
            String sqlUpdateMobil = "UPDATE mobil SET status = 'Disewa' WHERE id = ?";
            psUpdateMobil = conn.prepareStatement(sqlUpdateMobil);
            psUpdateMobil.setInt(1, mobilId);
            psUpdateMobil.executeUpdate();
            
            // Commit semua perubahan jika sukses
            conn.commit();
            return true;
            
        } catch (SQLException e) {
            if (conn != null) {
                try { conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
            }
            e.printStackTrace();
            return false;
        } finally {
            // Tutup resource
            try {
                if (rs != null) rs.close();
                if (psHarga != null) psHarga.close();
                if (psInsert != null) psInsert.close();
                if (psUpdateMobil != null) psUpdateMobil.close();
                if (conn != null) conn.close();
            } catch (SQLException e) { e.printStackTrace(); }
        }
    }
    
    // Fitur Pengembalian: Update tanggal_kembali & Set status mobil menjadi 'Tersedia'
    public boolean prosesPengembalian(int transaksiId, String tanggalKembali) {
        Connection conn = null;
        PreparedStatement psTrans = null;
        PreparedStatement psMobil = null;
        PreparedStatement psGetMobil = null;
        ResultSet rs = null;
        
        try {
            conn = Koneksi.getKoneksi();
            conn.setAutoCommit(false);
            
            // 1. Cari mobil_id berdasarkan transaksiId terlebih dahulu
            String sqlGetMobil = "SELECT mobil_id FROM transaksi WHERE id = ?";
            psGetMobil = conn.prepareStatement(sqlGetMobil);
            psGetMobil.setInt(1, transaksiId);
            rs = psGetMobil.executeQuery();
            
            int mobilId = 0;
            if (rs.next()) {
                mobilId = rs.getInt("mobil_id");
            }
            
            // 2. Update tanggal kembali pada transaksi
            String sqlTrans = "UPDATE transaksi SET tanggal_kembali = ? WHERE id = ?";
            psTrans = conn.prepareStatement(sqlTrans);
            psTrans.setString(1, tanggalKembali);
            psTrans.setInt(2, transaksiId);
            psTrans.executeUpdate();
            
            // 3. Update status mobil kembali jadi 'Tersedia'
            String sqlMobil = "UPDATE mobil SET status = 'Tersedia' WHERE id = ?";
            psMobil = conn.prepareStatement(sqlMobil);
            psMobil.setInt(1, mobilId);
            psMobil.executeUpdate();
            
            conn.commit();
            return true;
            
        } catch (SQLException e) {
            if (conn != null) {
                try { conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
            }
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (rs != null) rs.close();
                if (psGetMobil != null) psGetMobil.close();
                if (psTrans != null) psTrans.close();
                if (psMobil != null) psMobil.close();
                if (conn != null) conn.close();
            } catch (SQLException e) { e.printStackTrace(); }
        }
    }
}
