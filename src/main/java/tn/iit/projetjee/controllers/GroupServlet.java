package tn.iit.projetjee.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tn.iit.projetjee.dao.GroupDao;
import tn.iit.projetjee.dao.GroupDaoImp;
import tn.iit.projetjee.entity.Group;
import tn.iit.projetjee.entity.User;

import java.io.IOException;
import java.util.List;

@WebServlet("/Group")
public class GroupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private GroupDao groupDao;

    public void init() {
        groupDao = new GroupDaoImp();
    }




    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            User user = (User) session.getAttribute("user");

            if (user != null) {
                String action = request.getParameter("action");

                if (action == null) {
                    action = "list";
                }

                switch (action) {
                    case "list":
                        listGroups(request, response);
                        break;
                    case "edit":
                        showEditForm(request, response);
                        break;
                    case "delete":
                        deleteGroup(request, response);
                        break;
                    default:
                        response.sendRedirect("Group?action=list");
                }
            } else {
                response.sendRedirect("login.jsp");
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String action = request.getParameter("action");

        switch (action) {
            case "add":
                addGroup(request, response);
                break;
            case "update":
                updateGroup(request, response);
                break;
            default:
                response.sendRedirect("Group?action=list");
        }
    }

    private void listGroups(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Group> groups = groupDao.getAllGroups();
        request.setAttribute("groups", groups);
        request.getRequestDispatcher("groupList.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Group group = groupDao.getGroupById(id);
        request.setAttribute("group", group);
        request.getRequestDispatcher("editGroup.jsp").forward(request, response);
    }

    private void addGroup(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nom = request.getParameter("nom");
        String nbetudiantsStr = request.getParameter("nbetudiants");
        int nbetudiants = Integer.parseInt(nbetudiantsStr);

        Group newGroup = new Group();
        newGroup.setNom(nom);
        newGroup.setNbetudiants(nbetudiants);

        groupDao.addGroup(newGroup);
        response.sendRedirect("Group?action=list");
    }

    private void updateGroup(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nom = request.getParameter("nom");
        String nbetudiantsStr = request.getParameter("nbetudiants");
        int nbetudiants = Integer.parseInt(nbetudiantsStr);

        Group newGroup = new Group();
        newGroup.setId(id);
        newGroup.setNom(nom);
        newGroup.setNbetudiants(nbetudiants);

        groupDao.updateGroup(newGroup);
        response.sendRedirect("Group?action=list");
    }

    private void deleteGroup(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        groupDao.deleteGroup(id);
        response.sendRedirect("Group?action=list");
    }

}

