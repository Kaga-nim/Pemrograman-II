/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unpam.model.rentcar.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class Koneksi {
    private static Connection conn;

    public static Connection getConnection() {

        try {

            if (conn == null) {

                Class.forName("com.mysql.cj.jdbc.Driver");

                conn = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/rentcar",
                        "root",
                        ""
                );

                System.out.println("Koneksi berhasil");
            }

        } catch (Exception e) {

            System.out.println("Koneksi gagal");
            System.out.println(e.getMessage());

        }

        return conn;
    }
}
