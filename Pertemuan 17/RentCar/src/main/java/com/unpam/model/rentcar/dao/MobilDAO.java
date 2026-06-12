package com.unpam.model.rentcar.dao;

import com.unpam.model.rentcar.config.Koneksi;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class MobilDAO {

    public ResultSet getAllMobil() {

        try {

            Connection conn =
                    Koneksi.getConnection();

            Statement st =
                    conn.createStatement();

            return st.executeQuery(
                    "SELECT * FROM mobil");

        } catch (Exception e) {

            e.printStackTrace();

        }

        return null;
    }

}