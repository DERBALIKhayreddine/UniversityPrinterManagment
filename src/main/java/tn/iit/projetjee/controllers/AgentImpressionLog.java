package tn.iit.projetjee.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tn.iit.projetjee.dao.ImpressionDao;
import tn.iit.projetjee.dao.ImpressionDaoImp;
import tn.iit.projetjee.entity.Impression;
import tn.iit.projetjee.entity.User;

import java.io.*;
import java.util.List;

public class AgentImpressionLog extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ImpressionDao impressionDao;

    public void init() {
        impressionDao = new ImpressionDaoImp();
    }

    public AgentImpressionLog() {
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
                    case "imprime":
                        imprime(request, response);
                        break;
                    case "delete":
                        deleteImpression(request, response);
                        break;
                    default:
                        response.sendRedirect("agentimpressionslog?action=list");
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
        doGet(request, response);
    }

    private void listimpression(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);


        if (session != null) {
            User user = (User) session.getAttribute("user");
            if (user != null) {
                int idEnseignant = user.getUserId();

                List<Impression> impressions = impressionDao.getAllImpressionslog();

                request.setAttribute("impressions", impressions);
                request.getRequestDispatcher("agentimpressionlistLog.jsp").forward(request, response);
            } else {
                response.sendRedirect("login.jsp");
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    private void imprime(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");
        int id = Integer.parseInt(idParam);
        System.out.println("hi");
        System.out.println("id"+id);
        // Update the impression state to "Complete"
        // impressionDao.updateImpressionState(id, "Complete");
        System.out.println("hello");
        Impression impression = impressionDao.getImpressionByIdfordonw(id);
        System.out.println("hello1");
        System.out.println(impression);
        if (impression != null) {
            // Obtenir le chemin du fichier
            String uploadPath = getServletContext().getRealPath("/uploads/");
            String filePath = uploadPath + impression.getDocument();
            System.out.println(filePath);
            File file = new File(filePath);
            if (file.exists()) {
                // Set response headers
                response.setContentType("application/octet-stream");
                response.setHeader("Content-Disposition", "attachment; filename=\"" + file.getName() + "\"");

                // Créer les flux pour lire le fichier et écrire dans la réponse
                FileInputStream fis = new FileInputStream(file);
                BufferedInputStream bis = new BufferedInputStream(fis);
                OutputStream os = response.getOutputStream();

                // Lire le fichier et écrire dans la réponse
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = bis.read(buffer)) != -1) {
                    os.write(buffer, 0, bytesRead);
                }

                // Fermer les flux
                os.close();
                bis.close();
                fis.close();
            } else {
                // Si le fichier n'existe pas, afficher un message d'erreur
                response.getWriter().println("Fichier non trouvé");
            }
        } else {
            // If impression not found, handle it accordingly
            response.sendRedirect("agentimpressionslog?action=list");
        }
    }

    private void deleteImpression(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        impressionDao.deleteImpression(id);
        response.sendRedirect("agentimpressionslog?action=list");
    }



}
