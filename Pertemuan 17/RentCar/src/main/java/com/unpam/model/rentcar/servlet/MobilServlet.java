package com.unpam.model.rentcar.servlet;

import com.unpam.model.rentcar.config.Koneksi;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/MobilServlet")
public class MobilServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String nama =
                    request.getParameter("nama");

            String plat =
                    request.getParameter("plat");

            double harga =
                    Double.parseDouble(
                            request.getParameter("harga"));

            String status =
                    request.getParameter("status");

            Connection conn =
                    Koneksi.getConnection();

            PreparedStatement ps =
                    conn.prepareStatement(
                            "INSERT INTO mobil(nama_mobil,plat_nomor,harga_per_hari,status) VALUES(?,?,?,?)");

            ps.setString(1, nama);
            ps.setString(2, plat);
            ps.setDouble(3, harga);
            ps.setString(4, status);

            ps.executeUpdate();

            response.sendRedirect("mobil.jsp");

        } catch (Exception e) {

            e.printStackTrace();

        }

    }

}