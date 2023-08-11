package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Account;
import model.Categories;
import model.Product;

public class ProductDAO {
	public List<Product> getAll() {
		List<Product> products = new ArrayList<Product>();
		Connection conn = DBConnect.getConnection();
		String sql = "select * from product";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt(1));
				product.setName(rs.getString(2));
				product.setImage(rs.getString(3));
				product.setPrice(rs.getDouble(4));
				product.setTitle(rs.getString(5));
				product.setDescription(rs.getString(6));
				products.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return products;
	}

	public List<Categories> getAllCategories() {
		List<Categories> category = new ArrayList<Categories>();
		Connection conn = DBConnect.getConnection();
		String sql = "select * from categories";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Categories categories = new Categories();
				categories.setId(rs.getInt(1));
				categories.setName(rs.getString(2));
				category.add(categories);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return category;
	}

	public List<Product> getLast() {
		List<Product> last = new ArrayList<Product>();
		Connection conn = DBConnect.getConnection();
		String sql = "select * from product order by id desc limit 1;";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt(1));
				product.setName(rs.getString(2));
				product.setImage(rs.getString(3));
				product.setPrice(rs.getDouble(4));
				product.setTitle(rs.getString(5));
				product.setDescription(rs.getString(6));
				last.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return last;
	}

	public List<Product> getById(String id) {
		List<Product> products = new ArrayList<Product>();
		Connection conn = DBConnect.getConnection();
		String sql = "SELECT * FROM product WHERE CategoryId = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt(1));
				product.setName(rs.getString(2));
				product.setImage(rs.getString(3));
				product.setPrice(rs.getDouble(4));
				product.setTitle(rs.getString(5));
				product.setDescription(rs.getString(6));
				products.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return products;
	}

	public List<Product> getProductById(String id) {
		List<Product> detail = new ArrayList<Product>();
		Connection conn = DBConnect.getConnection();
		String sql = "SELECT * FROM product WHERE id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt(1));
				product.setName(rs.getString(2));
				product.setImage(rs.getString(3));
				product.setPrice(rs.getDouble(4));
				product.setTitle(rs.getString(5));
				product.setDescription(rs.getString(6));
				detail.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return detail;
	}
	

	public List<Product> getSearchByName(String txtSearch) {
		List<Product> search = new ArrayList<Product>();
		Connection conn = DBConnect.getConnection();
		String sql = "SELECT * FROM product WHERE name like ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+txtSearch+"%");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt(1));
				product.setName(rs.getString(2));
				product.setImage(rs.getString(3));
				product.setPrice(rs.getDouble(4));
				product.setTitle(rs.getString(5));
				product.setDescription(rs.getString(6));
				search.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return search;
	}
	public List<Product> getProductSellId(int id) {
		List<Product> sellProduct = new ArrayList<Product>();
		Connection conn = DBConnect.getConnection();
		String sql = "SELECT * FROM product WHERE sellId = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt(1));
				product.setName(rs.getString(2));
				product.setImage(rs.getString(3));
				product.setPrice(rs.getDouble(4));
				product.setTitle(rs.getString(5));
				product.setDescription(rs.getString(6));
				sellProduct.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sellProduct;
	}
	public void deleteProduct(String pid) {
		Connection conn = DBConnect.getConnection();
		String sql = "delete from product where id= ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);			
			ps.setString(1, pid);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void insertProduct(String name, String image, String price, String title, String description, String category, int sid) {
		Connection conn = DBConnect.getConnection();
		String sql = "INSERT INTO product (name, image, price, title, description, CategoryId, sellId) VALUES (?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);			
			ps.setString(1, name);
			ps.setString(2, image);
			ps.setString(3, price);
			ps.setString(4, title);
			ps.setString(5, description);
			ps.setString(6, category);
			ps.setInt(7, sid);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public static Product getAllProduct(int id){
		Product product = null;
		Connection conn = DBConnect.getConnection();
		String sql = "select * from product where id=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				product = new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setImage(rs.getString("image"));
				product.setPrice(rs.getDouble("price"));
				product.setTitle(rs.getString("title"));
				product.setDescription(rs.getString("description"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return product;
	}
	
	public boolean update(Product product) {
		boolean check = false;
		Connection conn = DBConnect.getConnection();
		String sql = "update product set name=?,image=?,price=?,title=?,description=? where id=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);			
			ps.setString(1,product.getName());
			ps.setString(1,product.getImage());
			ps.setDouble(1,product.getPrice());
			ps.setString(1,product.getTitle());
			ps.setString(2,product.getDescription());
			ps.setInt(3, product.getId());
			int row = ps.executeUpdate();
			if(row>0)
				check = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return check;
	}
	
}
