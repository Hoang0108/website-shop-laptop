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
@WebServlet(urlPatterns = {"/Home"})
public class HomeControl extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Product> products  = new ArrayList<Product>();
		List<Product> last = new ArrayList<Product>();
		List<Categories> category  = new ArrayList<Categories>();
		ProductDAO productDAO = new ProductDAO();
		products  = productDAO.getAll();
		category  = productDAO.getAllCategories();
		last  = productDAO.getLast();
		
		req.setAttribute("products", products);
		req.setAttribute("category", category);
		req.setAttribute("last", last);
		req.getRequestDispatcher("/views/client/Home.jsp").forward(req, resp);
	}
}
