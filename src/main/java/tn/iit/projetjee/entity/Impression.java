package tn.iit.projetjee.entity;

import java.util.Date;

public class Impression {
    private int id;
    private int idEnseignant;
    private int idGroupe;
    private int idMatiere;
    private Date dateImpression;
    public String document;
    private String etat;
    private int nombreDePages;
    private Group group;
    private Matiere matiere;


    private String enseignantNom;
    private String groupeNom;
    private String matiereNom;


    public Impression(int id, int idEnseignant, int idGroupe, int idMatiere, Date dateImpression, String document,
                      String etat, int nombreDePages) {

        this.id = id;
        this.idEnseignant = idEnseignant;
        this.idGroupe = idGroupe;
        this.idMatiere = idMatiere;
        this.dateImpression = dateImpression;
        this.document = document;
        this.etat = etat;
        this.nombreDePages = nombreDePages;
    }


    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getIdEnseignant() {
        return idEnseignant;
    }
    public void setIdEnseignant(int idEnseignant) {
        this.idEnseignant = idEnseignant;
    }
    public int getIdGroupe() {
        return idGroupe;
    }
    public void setIdGroupe(int idGroupe) {
        this.idGroupe = idGroupe;
    }
    public int getIdMatiere() {
        return idMatiere;
    }
    public void setIdMatiere(int idMatiere) {
        this.idMatiere = idMatiere;
    }
    public Date getDateImpression() {
        return dateImpression;
    }
    public void setDateImpression(Date dateImpression) {
        this.dateImpression = dateImpression;
    }
    public String getDocument() {
        return document;
    }
    public void setDocument(String document) {
        this.document = document;
    }
    public String getEtat() {
        return etat;
    }
    public void setEtat(String etat) {
        this.etat = etat;
    }
    public int getNombreDePages() {
        return nombreDePages;
    }
    public void setNombreDePages(int nombreDePages) {
        this.nombreDePages = nombreDePages;
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }

    public Matiere getMatiere() {
        return matiere;
    }

    public void setMatiere(Matiere matiere) {
        this.matiere = matiere;
    }

    public String getEnseignantNom() {
        return enseignantNom;
    }


    public void setEnseignantNom(String enseignantNom) {
        this.enseignantNom = enseignantNom;
    }


    public String getGroupeNom() {
        return groupeNom;
    }


    public void setGroupeNom(String groupeNom) {
        this.groupeNom = groupeNom;
    }


    public String getMatiereNom() {
        return matiereNom;
    }


    public void setMatiereNom(String matiereNom) {
        this.matiereNom = matiereNom;
    }


}
