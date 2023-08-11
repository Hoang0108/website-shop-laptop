package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDAO;
import model.Account;

@WebServlet(urlPatterns = {"/add"})
public class AddControl extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String name = req.getParameter("name");
		String image = req.getParameter("image");
		String price = req.getParameter("price");
		String title = req.getParameter("title");
		String description = req.getParameter("description");
		String category = req.getParameter("category");
		HttpSession session = req.getSession();
		Account a = (Account) session.getAttribute("acc");
		int sid = a.getId();
		
		ProductDAO productDAO = new ProductDAO();
		productDAO.insertProduct(name, image, price, title, description, category, sid);
		resp.sendRedirect("manager");
	}
}
