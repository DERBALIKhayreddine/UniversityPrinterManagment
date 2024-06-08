package tn.iit.projetjee.dao;

import tn.iit.projetjee.entity.Matiere;
import tn.iit.projetjee.utilis.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MatiereDaoImp implements MatiereDao {
    private static final String SELECT_ALL_MATIERES = "SELECT * FROM matieres";
    private static final String SELECT_MATIERE_BY_ID = "SELECT * FROM matieres WHERE id=?";
    private static final String INSERT_MATIERE = "INSERT INTO matieres (nom, description) VALUES (?, ?)";
    private static final String UPDATE_MATIERE = "UPDATE matieres SET nom=?, description=? WHERE id=?";
    private static final String DELETE_MATIERE = "DELETE FROM matieres WHERE id=?";

    @Override
    public List<Matiere> getAllMatieres() {
        List<Matiere> matiereList = new ArrayList<>();
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_ALL_MATIERES);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Matiere matiere = extractMatiereFromResultSet(resultSet);
                matiereList.add(matiere);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return matiereList;
    }

    @Override
    public Matiere getMatiereById(int id) {
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_MATIERE_BY_ID)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return extractMatiereFromResultSet(resultSet);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void addMatiere(Matiere matiere) {
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(INSERT_MATIERE)) {
            statement.setString(1, matiere.getNom());
            statement.setString(2, matiere.getDescription());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateMatiere(Matiere matiere) {
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_MATIERE)) {
            statement.setString(1, matiere.getNom());
            statement.setString(2, matiere.getDescription());
            statement.setInt(3, matiere.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteMatiere(int id) {
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_MATIERE)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private Matiere extractMatiereFromResultSet(ResultSet resultSet) throws SQLException {
        Matiere matiere = new Matiere();
        matiere.setId(resultSet.getInt("id"));
        matiere.setNom(resultSet.getString("nom"));
        matiere.setDescription(resultSet.getString("description"));
        return matiere;
    }

    @Override
    public List<Matiere> getMatieresByEnseignantId(int enseignantId) {
        List<Matiere> matieres = new ArrayList<>();
        String query = "SELECT m.id, m.nom, m.description " +
                "FROM matieres m " +
                "INNER JOIN enseignementmatieres em ON m.id = em.matiere_id " +
                "WHERE em.user_id = ?";
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, enseignantId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nom = resultSet.getString("nom");
                String description = resultSet.getString("description");
                Matiere matiere = new Matiere(id, nom, description);
                matieres.add(matiere);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return matieres;
    }
}
