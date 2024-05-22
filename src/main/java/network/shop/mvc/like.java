package network.shop.mvc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import network.shop.common.ShopDAO;

/**
 * Servlet implementation class Like
 */
@WebServlet("/Like")
public class like extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public like() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String UserID = request.getParameter("Name");
		String imageId = request.getParameter("imageId");
		ShopDAO dao = new ShopDAO();		
		int imgCode = Integer.parseInt(imageId);
		dao.ShoppingLike(imgCode);		 // 상품에 대한 좋아요 수
		dao.like(UserID, imgCode); // 유저에 한 좋아요
		System.out.println(UserID);
		System.out.println(imageId);
	}

}
