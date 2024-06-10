package tn.iit.projetjee.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tn.iit.projetjee.dao.MatiereDao;
import tn.iit.projetjee.dao.MatiereDaoImp;
import tn.iit.projetjee.entity.Matiere;
import tn.iit.projetjee.entity.User;

import java.io.IOException;
import java.util.List;
@WebServlet("/Matiere")
public class MatiereServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MatiereDao matiereDao;

    public void init() {
        matiereDao = new MatiereDaoImp();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession(false);
        if (session != null) {
            User user = (User) session.getAttribute("user");

            if (user != null) {

                if (action == null) {
                    action = "list";
                }

                switch (action) {
                    case "list":
                        listMatieres(request, response);
                        break;
                    case "edit":
                        showEditForm(request, response);
                        break;
                    case "delete":
                        deleteMatiere(request, response);
                        break;
                    default:
                        response.sendRedirect("Matiere?action=list");
                }
            } else {
                response.sendRedirect("login.jsp");
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "add":
                addMatiere(request, response);
                break;
            case "update":
                updateMatiere(request, response);
                break;
            default:
                response.sendRedirect("Matiere?action=list");
        }
    }

    private void listMatieres(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Matiere> matieres = matiereDao.getAllMatieres();
        request.setAttribute("matieres", matieres);
        request.getRequestDispatcher("matiereList.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Matiere matiere = matiereDao.getMatiereById(id);
        request.setAttribute("matiere", matiere);
        request.getRequestDispatcher("editMatiere.jsp").forward(request, response);
    }

    private void addMatiere(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nom = request.getParameter("nom");
        String description = request.getParameter("description");

        Matiere newMatiere = new Matiere();
        newMatiere.setNom(nom);
        newMatiere.setDescription(description);

        matiereDao.addMatiere(newMatiere);
        response.sendRedirect("Matiere?action=list");
    }

    private void updateMatiere(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nom = request.getParameter("nom");
        String description = request.getParameter("description");

        Matiere matiere = new Matiere();
        matiere.setId(id);
        matiere.setNom(nom);
        matiere.setDescription(description);

        matiereDao.updateMatiere(matiere);
        response.sendRedirect("Matiere?action=list");
    }

    private void deleteMatiere(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        matiereDao.deleteMatiere(id);
        response.sendRedirect("Matiere?action=list");
    }
}
