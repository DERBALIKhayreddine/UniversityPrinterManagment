package tn.iit.projetjee.entity;

public class User {
    private int userId;
    private String nom;
    private String prenom;
    private String password;
    private String email;
    private String role;
    private boolean active;

    public User() {
        super();
    }

    public User(int userId, String nom, String prenom, String password, String email,String role,Boolean active) {
        super();
        this.userId = userId;
        this.nom = nom;
        this.prenom = prenom;
        this.password = password;
        this.email = email;
        this.role = role;
        this.active = active;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public int getUserId() {
        return userId;
    }


    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }


}