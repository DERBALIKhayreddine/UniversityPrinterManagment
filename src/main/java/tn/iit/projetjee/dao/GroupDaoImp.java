package tn.iit.projetjee.dao;

import tn.iit.projetjee.entity.Group;
import tn.iit.projetjee.utilis.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GroupDaoImp implements GroupDao {
    private static final String SELECT_ALL_Groups = "SELECT * FROM groups";
    private static final String SELECT_Group_BY_ID = "SELECT * FROM groups WHERE id=?";
    private static final String INSERT_Group = "INSERT INTO groups (nom, nbetudiants) VALUES (?, ?)";
    private static final String UPDATE_Group = "UPDATE groups SET nom=?, nbetudiants=? WHERE id=?";
    private static final String DELETE_Group = "DELETE FROM groups WHERE id=?";

    @Override
    public List<Group> getAllGroups() {
        List<Group> groupList = new ArrayList<>();
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_ALL_Groups);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Group group = extractGroupFromResultSet(resultSet);
                groupList.add(group);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return groupList;
    }

    @Override
    public Group getGroupById(int id) {
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_Group_BY_ID)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return extractGroupFromResultSet(resultSet);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void addGroup(Group group) {
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(INSERT_Group)) {
            statement.setString(1, group.getNom());
            statement.setInt(2, group.getNbetudiants());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateGroup(Group group) {
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_Group)) {
            statement.setString(1, group.getNom());
            statement.setInt(2, group.getNbetudiants());
            statement.setInt(3, group.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteGroup(int id) {
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_Group)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private Group extractGroupFromResultSet(ResultSet resultSet) throws SQLException {
        Group group = new Group();
        group.setId(resultSet.getInt("id"));
        group.setNom(resultSet.getString("nom"));
        group.setNbetudiants(resultSet.getInt("nbetudiants"));
        return group;
    }
}
