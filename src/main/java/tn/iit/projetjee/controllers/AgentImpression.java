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

import java.io.*;
import java.util.List;
@WebServlet("/agentimpressions")
public class AgentImpression extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ImpressionDao impressionDao;

    public void init() {
        impressionDao = new ImpressionDaoImp();
    }

    public AgentImpression() {
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
                        response.sendRedirect("agentimpressions?action=list");
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

                List<Impression> impressions = impressionDao.getAllImpressions();

                request.setAttribute("impressions", impressions);
                request.getRequestDispatcher("agentimpressionlist.jsp").forward(request, response);
            } else {
                response.sendRedirect("login.jsp");
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    private void imprime(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        impressionDao.updateImpressionState(id, "Complete");
        Impression impression = impressionDao.getImpressionByIdfordonw(id);
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
            // Si l'impression n'existe pas, rediriger vers la page d'impressions
            response.sendRedirect("agentimpressions?action=list");
        }
    }

    private void deleteImpression(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        impressionDao.deleteImpression(id);
        response.sendRedirect("agentimpressions?action=list");
    }

    private String getFileNameById(int id) {
        // Implement this method to get the file name based on the ID
        // For example, querying a database to get the file name by ID
        // Replace this placeholder implementation with your actual logic
        return "file_" + id + ".pdf";
    }


}

