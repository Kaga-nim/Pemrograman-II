package com.unpam.model;

public class Mobil {

    private int id;
    private String namaMobil;
    private String platNomor;
    private double hargaPerHari;
    private String status;

    public Mobil() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNamaMobil() {
        return namaMobil;
    }

    public void setNamaMobil(String namaMobil) {
        this.namaMobil = namaMobil;
    }

    public String getPlatNomor() {
        return platNomor;
    }

    public void setPlatNomor(String platNomor) {
        this.platNomor = platNomor;
    }

    public double getHargaPerHari() {
        return hargaPerHari;
    }

    public void setHargaPerHari(double hargaPerHari) {
        this.hargaPerHari = hargaPerHari;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}