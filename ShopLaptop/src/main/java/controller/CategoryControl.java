package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import model.Categories;
import model.Product;

@WebServlet(urlPatterns = {"/category"})
public class CategoryControl extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		ProductDAO productDAO = new ProductDAO();
		List<Product> products = productDAO.getById(id);
		List<Product> last = new ArrayList<Product>();
		List<Categories> category  = new ArrayList<Categories>();
		category  = productDAO.getAllCategories();
		last  = productDAO.getLast();
		
		req.setAttribute("products", products);
		req.setAttribute("category", category);
		req.setAttribute("last", last);
		req.setAttribute("tag", id);
		req.getRequestDispatcher("/views/client/Home.jsp").forward(req, resp);
		
	}
}
