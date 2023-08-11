package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDAO;
import model.Account;
import model.Categories;
import model.Product;

@WebServlet(urlPatterns = {"/manager"})
public class ManagerControl extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Account a = (Account) session.getAttribute("acc");
		int id = a.getId();
		ProductDAO productDAO = new ProductDAO();
		List<Product> sellProduct = productDAO.getProductSellId(id);
		List<Categories> category  = new ArrayList<Categories>();
		category  = productDAO.getAllCategories();
		
		req.setAttribute("category", category);
		req.setAttribute("listP", sellProduct);
		req.getRequestDispatcher("views/admin/ManagerProduct.jsp").forward(req, resp);
	}
}
