package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAO;
import dao.ProductDAO;
import model.Product;

@WebServlet(urlPatterns = { "/update" })
public class LoadProductControl extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String sId = req.getParameter("id");
		try {
			int id = Integer.parseInt(sId);
			ProductDAO productDAO = new ProductDAO();
			Product product = ProductDAO.getAllProduct(id);
			req.setAttribute("product", product);
			req.getRequestDispatcher("/views/admin/Edit.jsp").forward(req, resp);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String sId = req.getParameter("id");
		String name = req.getParameter("name");
		String image = req.getParameter("image");
		String priceS = req.getParameter("price");
		String title = req.getParameter("title");
		String description = req.getParameter("description");
		try {
			Double price = Double.parseDouble(priceS);
			int id = Integer.parseInt(sId);
			Product product = new Product(id, name,image,price,title, description);
			ProductDAO productDAO = new ProductDAO();
			productDAO.update(product);
			resp.sendRedirect("manager");
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
