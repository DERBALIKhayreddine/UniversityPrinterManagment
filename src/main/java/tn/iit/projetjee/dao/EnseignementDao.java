package tn.iit.projetjee.dao;

import tn.iit.projetjee.entity.Enseignement;

import java.util.List;

public interface EnseignementDao {
    void addEnseignement(Enseignement enseignement);
    List<Enseignement> getEnseignementsByEnseignantId(int enseignantId);
    // Autres méthodes CRUD selon les besoins
    void saveEnsMatieres(int user_id, String[] selectedSubjects);
    List<Integer> getUserMatieresIds(int userId);
}
