package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;

@WebServlet(urlPatterns = {"/delete"})
public class DeleteControl extends HttpServlet{
 @Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	String pid = req.getParameter("pid");
	try {
		int id = Integer.parseInt(pid);
		ProductDAO productDAO = new ProductDAO();
		productDAO.deleteProduct(pid);
		resp.sendRedirect("manager");
	} catch (Exception e) {
		// TODO: handle exception
	}
	
}
}
