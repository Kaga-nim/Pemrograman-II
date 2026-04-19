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
public class NilaiMhs {
    public static void main (String [] args) {
        Scanner input = new Scanner (System.in);
        String nim, nama, grade;
        double uts, uas, rata;
        
        System.out.println("Data: ");
        System.out.print("NIM\t\t: "); nim = input.next();
        input.nextLine(); 
        System.out.print("Nama\t\t: "); nama = input.nextLine();
        System.out.print("Nilai UTS\t: "); uts = input.nextDouble();
        System.out.print("Nilai UAS\t: "); uas = input.nextDouble();
        
        rata = (uts + uas) / 2;

        if (rata < 50)
            grade = "E";
        else if (rata < 60)
            grade = "D";
        else if (rata < 70)
            grade = "C";
        else if (rata < 80)
            grade = "B";
        else
            grade = "A";

        System.out.println("===============================================================================");
        System.out.println("NIM\t\tNama\t\t\tUTS\tUTS\tRata-Rata\tGrade");
        System.out.println("===============================================================================");
        System.out.println(nim + "\t" + nama + "\t" + uts + "\t" + uas + "\t" + rata + "\t\t" + grade);
        
        System.out.println("");
        System.out.println("===============================================================================");
    }
}
