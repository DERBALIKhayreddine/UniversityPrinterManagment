package tn.iit.projetjee.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tn.iit.projetjee.dao.RoleDao;
import tn.iit.projetjee.dao.RoleDaoImp;
import tn.iit.projetjee.entity.Role;
import tn.iit.projetjee.entity.User;

import java.io.IOException;
import java.util.List;

@WebServlet("/Role")
public class RoleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private RoleDao roleDao;

    public void init() {
        roleDao = new RoleDaoImp();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            User user = (User) session.getAttribute("user");

            if (user != null) {
                String action = request.getParameter("action");

                if (action == null) {
                    listRoles(request, response);
                } else if (action.equals("edit")) {
                    showEditForm(request, response);
                } else if (action.equals("delete")) {
                    deleteRole(request, response);
                } else {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action non valide");
                }
            } else {
                response.sendRedirect("login.jsp");
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("add")) {
            addRole(request, response);
        } else if (action.equals("update")) {
            updateRole(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action non valide");
        }
    }

    private void listRoles(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Role> roles = roleDao.getAllRoles();
        request.setAttribute("roles", roles);
        request.getRequestDispatcher("roleList.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int roleId = Integer.parseInt(request.getParameter("roleId"));
        Role role = roleDao.getRoleById(roleId);
        request.setAttribute("role", role);
        request.getRequestDispatcher("editRole.jsp").forward(request, response);
    }

    private void addRole(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String roleName = request.getParameter("roleName");
        Role newRole = new Role();
        newRole.setName(roleName);
        roleDao.addRole(newRole);
        response.sendRedirect("RoleServlet");
    }

    private void updateRole(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int roleId = Integer.parseInt(request.getParameter("roleId"));
        String roleName = request.getParameter("roleName");
        Role role = new Role();
        role.setId(roleId);
        role.setName(roleName);
        roleDao.updateRole(role);
        response.sendRedirect("RoleServlet");
    }

    private void deleteRole(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int roleId = Integer.parseInt(request.getParameter("roleId"));
        roleDao.deleteRole(roleId);
        response.sendRedirect("RoleServlet");
    }
}

