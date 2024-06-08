package tn.iit.projetjee.dao;

import tn.iit.projetjee.entity.Matiere;

import java.util.List;

public interface MatiereDao {

    List<Matiere> getAllMatieres();
    Matiere getMatiereById(int id);
    void addMatiere(Matiere matiere);
    void updateMatiere(Matiere matiere);
    void deleteMatiere(int id);
    List<Matiere> getMatieresByEnseignantId(int enseignantId);
}
