import java.io.Serializable;

public class Staff implements Serializable {
    private int staff_id;
    private String ime;
    private int broj_godina;
    private String adresa;
    private int visina_dohotka;

    public Staff() {}
    public Staff(String ime, int broj_godina, String adresa, int visina_dohotka) {
        this.ime = ime;
        this.broj_godina = broj_godina;
        this.adresa = adresa;
        this.visina_dohotka = visina_dohotka;
    }

    public int getStaff_id() {
        return staff_id;
    }
    public void setStaff_id(int staff_id) {
        this.staff_id = staff_id;
    }

    public String getIme() { return ime; }
    public void setIme(String ime){ this.ime = ime; }

    public int getBroj_godina() { return broj_godina; }
    public void setBroj_godina(int broj_godina) { this.broj_godina = broj_godina; }

    public String getAdresa() { return adresa; }
    public void setAdresa(String adresa) { this.adresa = adresa; }

    public int getVisina_dohotka() { return visina_dohotka; }
    public void setVisina_dohotka(int visina_dohotka) { this.visina_dohotka = visina_dohotka; }


    public String toString() {
        return  ime + broj_godina + adresa + visina_dohotka;
    }
}