package tn.iit.projetjee.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tn.iit.projetjee.dao.ImpressionDao;
import tn.iit.projetjee.dao.ImpressionDaoImp;
import tn.iit.projetjee.entity.Impression;
import tn.iit.projetjee.entity.User;

import java.io.IOException;
import java.util.List;

@WebServlet("/listimpressions")
public class ImpressionListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ImpressionDao impressionDao;

    public void init() {
        impressionDao = new ImpressionDaoImp();
    }

    public ImpressionListServlet() {
        super();

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
                        listimpression(request, response);
                        break;
                    case "delete":
                        deleteImpression(request, response);
                        break;
                    default:
                        response.sendRedirect("listimpressions?action=list");
                }


            } else {
                response.sendRedirect("login.jsp");
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

    private void listimpression(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);


        if (session != null) {
            User user = (User) session.getAttribute("user");
            if (user != null) {
                int idEnseignant = user.getUserId();

                List<Impression> impressions = impressionDao.getImpressionsByEnseignantId(idEnseignant);

                request.setAttribute("impressions", impressions);
                request.getRequestDispatcher("impressionlist.jsp").forward(request, response);
            } else {
                response.sendRedirect("login.jsp");
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    private void deleteImpression(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        impressionDao.deleteImpression(id);
        response.sendRedirect("listimpressions?action=list");
    }



}
