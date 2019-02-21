package Controller;
import java.io.IOException;
import java.util.List;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pojo.Products;
import pojo.Components;
import pojo.Assemblyline;
import DAOImpl.AssemblylineDAOImpl;
import DAOImpl.HibernateUtil;
import org.hibernate.Session;


public class AssemblylineController extends HttpServlet {

    Assemblyline assemblyline = new Assemblyline();
    AssemblylineDAOImpl assemblylineDaoImpl = new AssemblylineDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("adaugaAssemblyline") != null) {
            Integer idProducts = java.lang.Integer.parseInt(request.getParameter("idProducts"));
            Integer idComponents = java.lang.Integer.parseInt(request.getParameter("idComponents"));
            Session session = HibernateUtil.getSessionFactory().openSession();
            Products product = (Products) session.get(Products.class, idProducts);
            Components component = (Components) session.get(Components.class, idComponents);
            int validation = java.lang.Integer.parseInt(request.getParameter("validation"));

            assemblyline.setProducts(product);
            assemblyline.setComponents(component);
            assemblyline.setValidation(validation);

            assemblylineDaoImpl.adaugaAssemblyline(assemblyline);
            RequestDispatcher rd = request.getRequestDispatcher("adauga_Assemblyline.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("afiseazaAssemblyline") != null) {
            List<Assemblyline> listaAssemblyline = new ArrayList();
            listaAssemblyline = assemblylineDaoImpl.afiseazaAssemblyline();
            request.setAttribute("listaAssemblyline", listaAssemblyline);
            RequestDispatcher rd = request.getRequestDispatcher("tabela_Assemblyline.jsp");
            rd.forward(request, response);
        }

        if (request.getParameter("modificaAssemblyline") != null) {
            Integer id1 = Integer.parseInt(request.getParameter("idAssemblyline"));
            Integer idProducts = java.lang.Integer.parseInt(request.getParameter("idProducts"));
            Integer idComponents = java.lang.Integer.parseInt(request.getParameter("idComponents"));
            Session session = HibernateUtil.getSessionFactory().openSession();
            Products product = (Products) session.get(Products.class, idProducts);
            Components component = (Components) session.get(Components.class, idComponents);
            int validation = java.lang.Integer.parseInt(request.getParameter("validation"));

            assemblylineDaoImpl.modificaAssemblyline(id1, product, component, validation);
            RequestDispatcher rd = request.getRequestDispatcher("adauga_Assemblyline.jsp");
            rd.forward(request, response);

        }

        if (request.getParameter("stergeAssemblyline") != null) {
            Integer id2 = Integer.parseInt(request.getParameter("idAssemblyline"));
            assemblyline.setIdAssemblyline(id2);
            assemblylineDaoImpl.stergeAssemblyline(assemblyline);
            RequestDispatcher rd = request.getRequestDispatcher("adauga_Assemblyline.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
