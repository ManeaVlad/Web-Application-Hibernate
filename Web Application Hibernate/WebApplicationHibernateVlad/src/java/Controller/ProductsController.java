package Controller;
import java.io.IOException;
import java.util.List;
import java.util.Date;
import java.util.ArrayList;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pojo.Products;
import DAOImpl.ProductsDAOImpl;


public class ProductsController extends HttpServlet {

    Products product = new Products();
    ProductsDAOImpl productDaoImpl = new ProductsDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("adaugaProduct") != null) {
            String name = request.getParameter("name");
            String code = request.getParameter("code");
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Date date = null;
            try {
                date = df.parse(request.getParameter("date"));
            } catch (ParseException e) {
                e.printStackTrace();
            }
            Integer price = java.lang.Integer.parseInt(request.getParameter("price"));
            product.setName(name);
            product.setCode(code);
            product.setDate(date);
            product.setPrice(price);
            productDaoImpl.adaugaProduct(product);
            RequestDispatcher rd = request.getRequestDispatcher("adauga_Product.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("afiseazaProducts") != null) {
            List<Products> listaProducts = new ArrayList();
            listaProducts = productDaoImpl.afiseazaProducts();
            request.setAttribute("listaProducts", listaProducts);
            RequestDispatcher rd = request.getRequestDispatcher("tabela_Products.jsp");
            rd.forward(request, response);
        }

        if (request.getParameter("modificaProduct") != null) {
            int id1 = Integer.parseInt(request.getParameter("idProducts"));
            String name = request.getParameter("name");
            String code = request.getParameter("code");
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Date date = null;
            try {
                date = df.parse(request.getParameter("date"));
            } catch (ParseException e) {
                e.printStackTrace();
            }
            Integer price = java.lang.Integer.parseInt(request.getParameter("price"));
            productDaoImpl.modificaProduct(id1, name, code, date, price);
            RequestDispatcher rd = request.getRequestDispatcher("adauga_Product.jsp");
            rd.forward(request, response);

        }

        if (request.getParameter("stergeProduct") != null) {
            int id2 = Integer.parseInt(request.getParameter("idProducts"));
            product.setIdProducts(id2);
            productDaoImpl.stergeProduct(product);
            RequestDispatcher rd = request.getRequestDispatcher("adauga_Product.jsp");
            rd.forward(request, response);
        }
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
