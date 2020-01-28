package proyectocs;

import controller.UserController;
import model.Persistence;
import model.User;
import model.UserQueries;
import view.Login;

public class ProyectoCs {
    public static void main(String[] args){
        Persistence persistence = new Persistence();
        User user = new User();
        UserQueries userQueries = new UserQueries();
        Login login = new Login();
        UserController userController = new UserController(persistence, user, userQueries, login);
        userController.start();
        login.setVisible(true);
    }
}
