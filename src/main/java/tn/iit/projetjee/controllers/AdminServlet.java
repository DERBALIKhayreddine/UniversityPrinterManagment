package tn.iit.projetjee.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tn.iit.projetjee.dao.*;
import tn.iit.projetjee.entity.Enseignement;
import tn.iit.projetjee.entity.Matiere;
import tn.iit.projetjee.entity.Role;
import tn.iit.projetjee.entity.User;

import java.io.IOException;
import java.util.List;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserDao userDao;

    public void init() {
        userDao = new UserDaoImp();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            User user = (User) session.getAttribute("user");

            if (user != null) {
                String action = request.getParameter("action");

                if (action == null || action.isEmpty()) {
                    action = "list"; // Default: list users
                }

                switch (action) {
                    case "list":
                        listUsers(request, response);
                        break;
                    case "add":
                        showAddForm(request, response);
                        break;
                    case "edit":
                        showEditForm(request, response);
                        break;
                    case "delete":
                        deleteUser(request, response);
                        break;
                    default:
                        listUsers(request, response);
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

        if (action == null || action.isEmpty()) {
            action = "list"; // Default: list users
        }

        switch (action) {
            case "add":
                addUser(request, response);
                break;
            case "edit":
                updateUser(request, response);
                break;
            default:
                listUsers(request, response);
        }
    }

    private void listUsers(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<User> userList = userDao.getAllUsers();
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("userList.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MatiereDao matiereDao = new MatiereDaoImp();
        List<Matiere> matieres = matiereDao.getAllMatieres();

        // Passer la liste des matières à la JSP
        request.setAttribute("matieres", matieres);

        RoleDao roleDao = new RoleDaoImp();
        List<Role> roles = roleDao.getAllRoles();

        // Passer la liste des matières à la JSP
        request.setAttribute("roles", roles);

        request.getRequestDispatcher("addUser.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        User user = userDao.getUserById(userId);
        request.setAttribute("user", user);
        MatiereDao matiereDao = new MatiereDaoImp();
        List<Matiere> matieres = matiereDao.getAllMatieres();

        // Passer la liste des matières à la JSP
        request.setAttribute("matieres", matieres);

        RoleDao roleDao = new RoleDaoImp();
        List<Role> roles = roleDao.getAllRoles();

        // Passer la liste des matières à la JSP
        request.setAttribute("roles", roles);
        request.getRequestDispatcher("editUser.jsp").forward(request, response);
    }

    private void addUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérez les paramètres de la requête pour créer un nouvel utilisateur
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String role = request.getParameter("role");
        boolean active = Boolean.parseBoolean(request.getParameter("active"));
        if (role == null) {
            // Handle the case where role is null (e.g., show an error message)
            request.setAttribute("error", "Le rôle est requis");
            request.getRequestDispatcher("addUser.jsp").forward(request, response);
            return;
        }

        if (userDao.getUserByEmail(email) != null) {
            // Si un utilisateur avec le même nom d'utilisateur existe déjà, affichez un message d'erreur
            request.setAttribute("error", "Adresse Email est déjà utilisé");
            RoleDao roleDao = new RoleDaoImp();
            List<Role> roles = roleDao.getAllRoles();

            // Passer la liste des matières à la JSP
            request.setAttribute("roles", roles);
            // Redirigez l'utilisateur vers la page d'ajout d'utilisateur avec le message d'erreur
            request.getRequestDispatcher("addUser.jsp").forward(request, response);

            return; // Sortez de la méthode pour éviter d'ajouter l'utilisateur
        }

        // Créez un nouvel utilisateur avec les paramètres récupérés
        User newUser = new User();
        newUser.setNom(nom);
        newUser.setPrenom(prenom);
        newUser.setPassword(password);
        newUser.setPassword(password);
        newUser.setEmail(email);
        newUser.setRole(role);
        newUser.setActive(active);

        // Ajoutez l'utilisateur à la base de données
        userDao.addUser(newUser);

        // Redirigez l'utilisateur vers la page d'accueil
        response.sendRedirect("AdminServlet");

        // Si le rôle de l'utilisateur est "enseignant"
        if (role.equals("enseignant")|| role.equals("Enseignant")) {
            // Récupérez les matières enseignées sélectionnées depuis le formulaire
            String[] matieresEnseigneesIds = request.getParameterValues("matieres");

            // Si des matières ont été sélectionnées
            if (matieresEnseigneesIds != null) {
                // Initialisez le DAO pour les matières
                MatiereDao matiereDao = new MatiereDaoImp();
                // Initialisez le DAO pour les enseignements
                EnseignementDao enseignementDao = new EnseignementDaoImp();

                // Pour chaque matière sélectionnée
                for (String matiereId : matieresEnseigneesIds) {
                    // Créez un nouvel enseignement pour associer l'enseignant à la matière
                    Enseignement enseignement = new Enseignement();
                    enseignement.setEnseignantId(newUser.getUserId());
                    enseignement.setMatiereId(Integer.parseInt(matiereId));

                    // Ajoutez l'enseignement à la base de données
                    enseignementDao.addEnseignement(enseignement);
                }
            }
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        int userId = Integer.parseInt(request.getParameter("userId"));
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String role = request.getParameter("role");
        boolean active = Boolean.parseBoolean(request.getParameter("active"));
        System.out.println(active);
        // Create a new user with the parameters
        User user = new User();

        user.setNom(nom);
        user.setPrenom(prenom);
        user.setPassword(password);
        user.setEmail(email);
        user.setRole(role);
        user.setActive(active);
        user.setUserId(userId);

        // Update the user in the database
        userDao.updateUser(user);

        // Redirect to the list of users
        response.sendRedirect("AdminServlet");
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        userDao.deleteUser(userId);
        response.sendRedirect("AdminServlet");
    }
}
