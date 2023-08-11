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

@WebServlet(urlPatterns = { "/search" })
public class SearchControl extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String txtSearch = req.getParameter("txt");
		ProductDAO productDAO = new ProductDAO();
				
		List<Product> search = productDAO.getSearchByName(txtSearch);
		List<Product> last = new ArrayList<Product>();
		List<Categories> category  = new ArrayList<Categories>();
		
		category  = productDAO.getAllCategories();
		last  = productDAO.getLast();
		
		req.setAttribute("category", category);
		req.setAttribute("last", last);
		req.setAttribute("products", search);
		req.getRequestDispatcher("/views/client/Home.jsp").forward(req, resp);
	}
}
