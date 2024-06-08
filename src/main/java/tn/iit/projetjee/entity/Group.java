package tn.iit.projetjee.entity;

public class Group {
    private int id;
    private String nom;
    private int nbetudiants;



    public Group() {
        super();
    }

    public Group(int id, String nom, int nbetudiants) {
        super();
        this.id = id;
        this.nom = nom;
        this.nbetudiants = nbetudiants;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getNom() {
        return nom;
    }
    public void setNom(String nom) {
        this.nom = nom;
    }

    public int getNbetudiants() {
        return nbetudiants;
    }

    public void setNbetudiants(int nbetudiants) {
        this.nbetudiants = nbetudiants;
    }



}
