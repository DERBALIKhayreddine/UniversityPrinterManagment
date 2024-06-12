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
import java.text.SimpleDateFormat;
import java.util.List;

@WebServlet("/calendar")
public class AgentCalendarServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ImpressionDao impressionDao;

    public void init() {
        impressionDao = new ImpressionDaoImp();
    }

    public AgentCalendarServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            User user = (User) session.getAttribute("user");

            if (user != null) {
                List<Impression> impressions = impressionDao.getAllImpressions();

                StringBuilder eventsJson = new StringBuilder("[");
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                for (Impression impression : impressions) {
                    eventsJson.append("{");
                    eventsJson.append("\"title\": \""
                            + impression.getNombreDePages()
                            + " pages pour le "
                            + impression.getGroupeNom()
                            + " pour la matiere "
                            + impression.getMatiereNom()
                            + "\",");
                    eventsJson.append("\"start\": \"" + dateFormat.format(impression.getDateImpression()) + "\"");
                    eventsJson.append("},");
                }
                if (impressions.size() > 0) {
                    eventsJson.deleteCharAt(eventsJson.length() - 1);
                }
                eventsJson.append("]");

                request.setAttribute("eventsJson", eventsJson.toString());
                request.getRequestDispatcher("calendar.jsp").forward(request, response);
            } else {
                response.sendRedirect("login.jsp");
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
