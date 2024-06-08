package tn.iit.projetjee.controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tn.iit.projetjee.dao.*;
import tn.iit.projetjee.entity.Group;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import com.fasterxml.jackson.databind.ObjectMapper; /// json serilazation

@WebServlet("/admindasboard")
public class DashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private GroupDao groupDao;
    private UserDao userDao;
    private ImpressionDao impressionDao;

    public void init() {
        groupDao = new GroupDaoImp();
        userDao = new UserDaoImp();
        impressionDao = new ImpressionDaoImp();
    }

    public DashboardServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            List<Group> groups = groupDao.getAllGroups();
            request.setAttribute("totalGroups", groups.size());

            int totalStudents = 0;
            for (Group group : groups) {
                totalStudents += group.getNbetudiants();
            }
            request.setAttribute("totalStudents", totalStudents);

            int totalEnseignants = userDao.getUsersCountByRole("enseignant");
            request.setAttribute("totalEnseignants", totalEnseignants);

            int totalAgents = userDao.getUsersCountByRole("agent");
            request.setAttribute("totalAgents", totalAgents);

            List<Map<String, Object>> impressionsByMonth = impressionDao.getImpressionsByMonth();

            // Convert impressionsByMonth to JSON using Jackson
            ObjectMapper objectMapper = new ObjectMapper();
            String impressionsByMonthJson = objectMapper.writeValueAsString(impressionsByMonth);
            System.out.println(impressionsByMonthJson);

            request.setAttribute("impressionsByMonthJson", impressionsByMonthJson);
            RequestDispatcher dispatcher = request.getRequestDispatcher("adminDashboard.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
