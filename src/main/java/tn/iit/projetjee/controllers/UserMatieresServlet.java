package tn.iit.projetjee.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tn.iit.projetjee.dao.EnseignementDao;
import tn.iit.projetjee.dao.EnseignementDaoImp;
import tn.iit.projetjee.dao.MatiereDao;
import tn.iit.projetjee.dao.MatiereDaoImp;
import tn.iit.projetjee.entity.Matiere;
import tn.iit.projetjee.entity.User;

import java.io.IOException;
import java.util.List;

@WebServlet("/usermatiere")
public class UserMatieresServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MatiereDao matiereDao;

    private EnseignementDao enseignementDao;



    public void init() {
        matiereDao = new MatiereDaoImp();
        enseignementDao = new EnseignementDaoImp();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null) {
            User user = (User) session.getAttribute("user");

            if (user != null) {


                List<Matiere> matieres = matiereDao.getAllMatieres();


                List<Integer> matiereIds = enseignementDao.getUserMatieresIds(user.getUserId());


                request.setAttribute("matiereIds", matiereIds);
                request.setAttribute("matieres", matieres);
                request.getRequestDispatcher("usermatiere.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            System.out.println("gg" );
            int user_id = user.getUserId();


            String[] selectedSubjects = request.getParameterValues("subject");


            enseignementDao.saveEnsMatieres(user_id, selectedSubjects);


            response.sendRedirect("Impression");
        } else {

            response.sendRedirect("login.jsp");
        }
    }

}
