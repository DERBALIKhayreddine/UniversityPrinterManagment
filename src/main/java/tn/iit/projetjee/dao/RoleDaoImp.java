package tn.iit.projetjee.dao;

import tn.iit.projetjee.entity.Role;
import tn.iit.projetjee.utilis.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RoleDaoImp implements RoleDao {
    private static final String SELECT_ALL_ROLES = "SELECT * FROM roles";
    private static final String SELECT_ROLE_BY_ID = "SELECT * FROM roles WHERE id=?";
    private static final String SELECT_ROLE_BY_NAME = "SELECT * FROM roles WHERE name=?";
    private static final String INSERT_ROLE = "INSERT INTO roles (name) VALUES (?)";
    private static final String UPDATE_ROLE = "UPDATE roles SET name=? WHERE id=?";
    private static final String DELETE_ROLE = "DELETE FROM roles WHERE id=?";

    @Override
    public List<Role> getAllRoles() {
        List<Role> roles = new ArrayList<>();
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_ALL_ROLES);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Role role = extractRoleFromResultSet(resultSet);
                roles.add(role);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return roles;
    }

    @Override
    public Role getRoleById(int id) {
        Role role = null;
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_ROLE_BY_ID)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    role = extractRoleFromResultSet(resultSet);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return role;
    }

    @Override
    public Role getRoleByName(String name) {
        Role role = null;
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_ROLE_BY_NAME)) {
            statement.setString(1, name);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    role = extractRoleFromResultSet(resultSet);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return role;
    }

    @Override
    public void addRole(Role role) {
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(INSERT_ROLE)) {
            statement.setString(1, role.getName());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateRole(Role role) {
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_ROLE)) {
            statement.setString(1, role.getName());
            statement.setInt(2, role.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteRole(int id) {
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_ROLE)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private Role extractRoleFromResultSet(ResultSet resultSet) throws SQLException {
        Role role = new Role();
        role.setId(resultSet.getInt("id"));
        role.setName(resultSet.getString("name"));
        return role;
    }
}
