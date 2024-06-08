package tn.iit.projetjee.dao;

import tn.iit.projetjee.entity.Enseignement;
import tn.iit.projetjee.utilis.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EnseignementDaoImp implements EnseignementDao {
    private static final String INSERT_ENSEIGNEMENT = "INSERT INTO enseignement (enseignant_id, matiere_id) VALUES (?, ?)";
    private static final String SELECT_ENSEIGNEMENTS_BY_ENSEIGNANT_ID = "SELECT * FROM enseignement WHERE enseignant_id=?";
    private static final String INSERT_USER_SUBJECT = "INSERT INTO enseignementMatieres (user_id, matiere_id) VALUES (?, ?)";
    private static final String GET_USER_MATIERES_IDS = "SELECT matiere_id FROM enseignementMatieres WHERE user_id=?";
    private static final String DELETE_USER_SUBJECT = "DELETE FROM enseignementMatieres WHERE user_id=? AND matiere_id=?";
    @Override
    public void addEnseignement(Enseignement enseignement) {
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(INSERT_ENSEIGNEMENT)) {
            statement.setInt(1, enseignement.getEnseignantId());
            statement.setInt(2, enseignement.getMatiereId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Enseignement> getEnseignementsByEnseignantId(int enseignantId) {
        List<Enseignement> enseignements = new ArrayList<>();
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_ENSEIGNEMENTS_BY_ENSEIGNANT_ID)) {
            statement.setInt(1, enseignantId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Enseignement enseignement = new Enseignement();
                    enseignement.setEnseignantId(resultSet.getInt("enseignant_id"));
                    enseignement.setMatiereId(resultSet.getInt("matiere_id"));
                    enseignements.add(enseignement);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return enseignements;
    }

    @Override
    public List<Integer> getUserMatieresIds(int userId) {
        List<Integer> matiereIds = new ArrayList<>();
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(GET_USER_MATIERES_IDS)) {
            statement.setInt(1, userId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    matiereIds.add(resultSet.getInt("matiere_id"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return matiereIds;
    }

    @Override
    public void saveEnsMatieres(int user_id, String[] selectedSubjects) {
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement save = connection.prepareStatement(INSERT_USER_SUBJECT);
             PreparedStatement delete = connection.prepareStatement(DELETE_USER_SUBJECT)) {


            List<Integer> associatedSubjectIds = getUserMatieresIds(user_id);


            for (Integer subjectId : associatedSubjectIds) {

                delete.setInt(1, user_id);
                delete.setInt(2, subjectId);
                delete.addBatch();

            }
            delete.executeBatch();


            for (String matiere_id : selectedSubjects) {
                save.setInt(1, user_id);
                save.setInt(2, Integer.parseInt(matiere_id));
                save.addBatch();
            }
            save.executeBatch();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


}
