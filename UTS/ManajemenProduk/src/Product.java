/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author kaganim1
 */
public class Product {
    String nama;
    String kategori;
    int harga;

    public Product(String nama, String kategori, int harga) {
        this.nama = nama;
        this.kategori = kategori;
        this.harga = harga;
    }

    @Override
    public String toString() {
        return nama + " | " + kategori + " | " + harga;
    }
}