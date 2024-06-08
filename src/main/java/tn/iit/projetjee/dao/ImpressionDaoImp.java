package tn.iit.projetjee.dao;

import tn.iit.projetjee.entity.Impression;
import tn.iit.projetjee.utilis.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class ImpressionDaoImp implements ImpressionDao {

    private static final String SELECT_IMPRESSION_BY_ID = "SELECT * FROM impressions WHERE id=?";
    private static final String INSERT_IMPRESSION = "INSERT INTO impressions (id_enseignant, id_groupe, id_matiere, date_impression, document, etat, nombreDePages) VALUES (?, ?, ?, ?, ?, ?, ?)";
    private static final String UPDATE_IMPRESSION = "UPDATE impressions SET id_enseignant=?, id_groupe=?, id_matiere=?, date_impression=?, document=?, etat=?, nombre_de_pages=? WHERE id=?";
    private static final String DELETE_IMPRESSION = "DELETE FROM impressions WHERE id=?";
    private static final String SELECT_IMPRESSIONS_BY_ENSEIGNANT_ID =
            "SELECT imp.*, users.nom AS enseignant_nom, group_table.nom AS groupe_nom, mat.nom AS matiere_nom " +
                    "FROM impressions imp " +
                    "JOIN users ON imp.id_enseignant = users.user_id " +
                    "JOIN groups group_table ON imp.id_groupe = group_table.id " +
                    "JOIN matieres mat ON imp.id_matiere = mat.id " +
                    "WHERE id_enseignant = ?";

    private static final String SELECT_ALL_IMPRESSIONS = "SELECT imp.*, users.nom AS enseignant_nom, group_table.nom AS groupe_nom, mat.nom AS matiere_nom " +
            "FROM impressions imp " +
            "JOIN users ON imp.id_enseignant = users.user_id " +
            "JOIN groups group_table ON imp.id_groupe = group_table.id " +
            "JOIN matieres mat ON imp.id_matiere = mat.id " + "WHERE imp.etat = 'En attente'";
    private static final String SELECT_ALL_IMPRESSIONS_LOG = "SELECT imp.*, users.nom AS enseignant_nom, group_table.nom AS groupe_nom, mat.nom AS matiere_nom " +
            "FROM impressions imp " +
            "JOIN users ON imp.id_enseignant = users.user_id " +
            "JOIN groups group_table ON imp.id_groupe = group_table.id " +
            "JOIN matieres mat ON imp.id_matiere = mat.id " + "WHERE imp.etat = 'Complete'";
    private static final String UPDATE_IMPRESSION_STATE = "UPDATE impressions SET etat=? WHERE id=?";



    @Override
    public Impression getImpressionById(int id) {
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_IMPRESSION_BY_ID)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return extractImpressionFromResultSet(resultSet);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Impression getImpressionByIdfordonw(int id) {
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_IMPRESSION_BY_ID)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    int idEnseignant = resultSet.getInt("id_enseignant");
                    int idGroupe = resultSet.getInt("id_groupe");
                    int idMatiere = resultSet.getInt("id_matiere");
                    Date dateImpression = resultSet.getDate("date_impression");
                    String document = resultSet.getString("document");
                    String etat = resultSet.getString("etat");
                    int nombreDePages = resultSet.getInt("nombreDePages");


                    return new Impression(id, idEnseignant, idGroupe, idMatiere, dateImpression, document, etat, nombreDePages);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void addImpression(Impression impression) {
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(INSERT_IMPRESSION)) {
            statement.setInt(1, impression.getIdEnseignant());
            statement.setInt(2, impression.getIdGroupe());
            statement.setInt(3, impression.getIdMatiere());
            statement.setDate(4, new java.sql.Date(impression.getDateImpression().getTime()));
            statement.setString(5, impression.getDocument());
            statement.setString(6, impression.getEtat());
            statement.setInt(7, impression.getNombreDePages());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateImpression(Impression impression) {
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_IMPRESSION)) {
            statement.setInt(1, impression.getIdEnseignant());
            statement.setInt(2, impression.getIdGroupe());
            statement.setInt(3, impression.getIdMatiere());
            statement.setDate(4, new java.sql.Date(impression.getDateImpression().getTime()));
            statement.setString(5, impression.getDocument());
            statement.setString(6, impression.getEtat());
            statement.setInt(7, impression.getNombreDePages());
            statement.setInt(8, impression.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteImpression(int id) {
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_IMPRESSION)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }



    @Override
    public List<Impression> getImpressionsByEnseignantId(int enseignantId) {
        List<Impression> impressions = new ArrayList<>();
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_IMPRESSIONS_BY_ENSEIGNANT_ID)) {
            statement.setInt(1, enseignantId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    impressions.add(extractImpressionFromResultSet(resultSet));

                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return impressions;
    }

    private Impression extractImpressionFromResultSet(ResultSet resultSet) throws SQLException {
        int id = resultSet.getInt("id");
        int idEnseignant = resultSet.getInt("id_enseignant");
        int idGroupe = resultSet.getInt("id_groupe");
        int idMatiere = resultSet.getInt("id_matiere");
        Date dateImpression = resultSet.getDate("date_impression");
        String document = resultSet.getString("document");
        String etat = resultSet.getString("etat");
        int nombreDePages = resultSet.getInt("nombreDePages");
        String enseignantNom = resultSet.getString("enseignant_nom");
        String groupeNom = resultSet.getString("groupe_nom");
        String matiereNom = resultSet.getString("matiere_nom");


        Impression impression = new Impression(id, idEnseignant, idGroupe, idMatiere, dateImpression, document, etat, nombreDePages);

        // Set the names
        impression.setEnseignantNom(enseignantNom);
        impression.setGroupeNom(groupeNom);
        impression.setMatiereNom(matiereNom);

        return impression;
    }

    @Override
    public List<Impression> getAllImpressions() {
        List<Impression> impressions = new ArrayList<>();
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_ALL_IMPRESSIONS);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Impression impression = extractImpressionFromResultSet(resultSet);
                impressions.add(impression);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return impressions;
    }

    @Override
    public List<Impression> getAllImpressionslog() {
        List<Impression> impressions = new ArrayList<>();
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_ALL_IMPRESSIONS_LOG);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Impression impression = extractImpressionFromResultSet(resultSet);
                impressions.add(impression);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return impressions;
    }

    @Override
    public void updateImpressionState(int id, String state) {
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_IMPRESSION_STATE)) {
            statement.setString(1, state);
            statement.setInt(2, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Map<String, Object>> getImpressionsByMonth() {
        List<Map<String, Object>> impressionsByMonth = new ArrayList<>();
        String query = "SELECT MONTH(date_impression) AS month, COUNT(*) AS count FROM impressions GROUP BY MONTH(date_impression)";
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                int month = resultSet.getInt("month");
                int count = resultSet.getInt("count");
                Map<String, Object> monthData = new HashMap<>();
                monthData.put("month", month);
                monthData.put("count", count);
                impressionsByMonth.add(monthData);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return impressionsByMonth;
    }

}
