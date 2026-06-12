package com.unpam.model.rentcar.dao;

import com.unpam.model.rentcar.config.Koneksi;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import com.unpam.model.Mobil;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

public class MobilDAO {

    public ResultSet getAllMobil() {

        try {

            Connection conn =
                    Koneksi.getKoneksi();

            Statement st =
                    conn.createStatement();

            return st.executeQuery(
                    "SELECT * FROM mobil");

        } catch (Exception e) {

            e.printStackTrace();

        }

        return null;
    }
    
    public List<Mobil> getMobilTersedia() {
        List<Mobil> list = new ArrayList<>();
        String sql = "SELECT * FROM mobil WHERE status = 'Tersedia' OR status = 'tersedia'";
        try (Connection conn = com.unpam.model.rentcar.config.Koneksi.getKoneksi();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Mobil m = new Mobil();
                m.setId(rs.getInt("id"));
                m.setNamaMobil(rs.getString("nama_mobil"));
                m.setPlatNomor(rs.getString("plat_nomor"));
                m.setHargaPerHari(rs.getDouble("harga_per_hari"));
                m.setStatus(rs.getString("status"));
                list.add(m);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

}