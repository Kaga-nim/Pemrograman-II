/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unpam.model;

public class Customer {
    private int id;
    private String namaCustomer;
    private String noHp;
    private String alamat;

    // Constructor Kosong
    public Customer() {}

    // Constructor Lengkap
    public Customer(int id, String namaCustomer, String noHp, String alamat) {
        this.id = id;
        this.namaCustomer = namaCustomer;
        this.noHp = noHp;
        this.alamat = alamat;
    }

    // Getter dan Setter
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNamaCustomer() { return namaCustomer; }
    public void setNamaCustomer(String namaCustomer) { this.namaCustomer = namaCustomer; }

    public String getNoHp() { return noHp; }
    public void setNoHp(String noHp) { this.noHp = noHp; }

    public String getAlamat() { return alamat; }
    public void setAlamat(String alamat) { this.alamat = alamat; }
}
