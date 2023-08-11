package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDAO;
import model.Account;

@WebServlet(urlPatterns = {"/Registration"})
public class RegistrationControl extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String user = req.getParameter("user");
		String pass = req.getParameter("pass");
		String re_pass = req.getParameter("repass");
		if(!pass.equals(re_pass)) {
			resp.sendRedirect("Registration");
		}else {
			AccountDAO accountDAO = new AccountDAO();
			Account a = accountDAO.checkExist(user);
			if(a != null) {		
				req.setAttribute("mess", "Tài khoản đã tồn tại");
				req.getRequestDispatcher("views/account/Registration.jsp").forward(req, resp);
			}else {
				accountDAO.registration(user, pass);
				resp.sendRedirect("views/account/Login.jsp");
			}
		}
		//
	}
}
