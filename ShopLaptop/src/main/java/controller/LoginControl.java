package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccountDAO;
import model.Account;
@WebServlet(urlPatterns = {"/login"})
public class LoginControl extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("views/account/Login.jsp");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("user");
		String password = req.getParameter("pass");
		AccountDAO accountDAO = new AccountDAO();
		Account account = accountDAO.checkLogin(username, password);
		if(account == null) {
			req.setAttribute("mess", "Sai tài khoản hoặc mật khẩu");
			req.getRequestDispatcher("views/account/Login.jsp").forward(req, resp);
		}else {
			HttpSession session = req.getSession();
			session.setAttribute("acc", account);
			resp.sendRedirect("Home");
		}
	}
}
