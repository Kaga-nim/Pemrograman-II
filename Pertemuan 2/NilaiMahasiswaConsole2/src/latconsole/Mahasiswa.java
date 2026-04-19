/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package latconsole;
import java.util.Scanner;
/**
 *
 * @author kaganim1
 */
public class Mahasiswa {
    public String nim, nama, grade;
    private float uts, uas;
    public double nilaiakhir;
    
    // Tambahkan metode ini di bagian bawah sebelum kurung kurawal terakhir
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        Mahasiswa mhs = new Mahasiswa();

        System.out.print("Masukkan NIM: ");
        mhs.setNim(input.nextLine());
        System.out.print("Masukkan Nama: ");
        mhs.setNama(input.nextLine());
        System.out.print("Nilai UTS: ");
        mhs.setUts(input.nextFloat());
        System.out.print("Nilai UAS: ");
        mhs.setUas(input.nextFloat());

        System.out.println("\n--- Hasil ---");
        System.out.println("Nama: " + mhs.getNama());
        System.out.println("Nilai Akhir: " + mhs.getNilaiakhir());
        System.out.println("Grade: " + mhs.getGrade());
        
        input.close();
    }

    public String getNim() {
        return nim;
    }

    public void setNim(String nim) {
        this.nim = nim;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public float getUts() {
        return uts;
    }

    public void setUts(float uts) {
        this.uts = uts;
    }

    public float getUas() {
        return uas;
    }

    public void setUas(float uas) {
        this.uas = uas;
    }

    public String getGrade() {
        if (nilaiakhir < 50)
            grade = "E";
        else if (nilaiakhir < 60)
            grade = "D";
        else if (nilaiakhir < 70)
            grade = "C";
        else if (nilaiakhir < 80)
            grade = "B";
        else
            grade = "A";
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public double getNilaiakhir() {
        nilaiakhir = (uts + uas)/2;
        return nilaiakhir;
    }

    public void setNilaiakhir(double nilaiakhir) {
        this.nilaiakhir = nilaiakhir;
    }    
}
