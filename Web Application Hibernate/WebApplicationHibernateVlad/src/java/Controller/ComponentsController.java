package Controller;
import java.io.IOException;
import java.util.List;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pojo.Components;
import DAOImpl.ComponentsDAOImpl;


public class ComponentsController extends HttpServlet {

    Components component = new Components();
    ComponentsDAOImpl componentDaoImpl = new ComponentsDAOImpl();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("adaugaComponent") != null) {
            String name = request.getParameter("name");
            String model = request.getParameter("model");
            String manufacturer = request.getParameter("manufacturer");
            Integer costs = java.lang.Integer.parseInt(request.getParameter("costs"));
            String parameters = request.getParameter("parameters");
            component.setName(name);
            component.setModel(model);
            component.setManufacturer(manufacturer);
            component.setCosts(costs);
            component.setParameters(parameters);
            componentDaoImpl.adaugaComponent(component);
            RequestDispatcher rd = request.getRequestDispatcher("adauga_Component.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("afiseazaComponents") != null) {
            List<Components> listaComponents = new ArrayList();
            listaComponents = componentDaoImpl.afiseazaComponents();
            request.setAttribute("listaComponents", listaComponents);
            RequestDispatcher rd = request.getRequestDispatcher("tabela_Components.jsp");
            rd.forward(request, response);
        }

        if (request.getParameter("modificaComponent") != null) {
            int id1 = Integer.parseInt(request.getParameter("idComponents"));
            String name = request.getParameter("name");
            String model = request.getParameter("model");
            String manufacturer = request.getParameter("manufacturer");
            Integer costs = java.lang.Integer.parseInt(request.getParameter("costs"));
            String parameters = request.getParameter("parameters");
            componentDaoImpl.modificaComponent(id1, name, model, manufacturer, costs, parameters);
            RequestDispatcher rd = request.getRequestDispatcher("adauga_Component.jsp");
            rd.forward(request, response);

        }

        if (request.getParameter("stergeComponent") != null) {
            int id2 = Integer.parseInt(request.getParameter("idComponents"));
            component.setIdComponents(id2);
            componentDaoImpl.stergeComponent(component);
            RequestDispatcher rd = request.getRequestDispatcher("adauga_Component.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
