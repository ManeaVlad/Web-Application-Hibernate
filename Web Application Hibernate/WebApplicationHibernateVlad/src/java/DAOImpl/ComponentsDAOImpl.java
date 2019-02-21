package DAOImpl;
import java.util.List;
import java.util.ArrayList;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Components;
import DAO.ComponentsDAO;

public class ComponentsDAOImpl implements ComponentsDAO{

    @Override
    public void adaugaComponent(Components component) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(component);
        transaction.commit();
        session.close();
    }

    @Override
    public List<Components> afiseazaComponents() {
        List<Components> listaComponents = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        org.hibernate.Query query = session.createQuery("From Components");
        listaComponents = query.list();
        return listaComponents;
    }

    @Override
    public void modificaComponent(int idComponents, String name, String model, String manufacturer, Integer costs, String parameters) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Components detaliiComponents = (Components) session.load(Components.class, idComponents);
        detaliiComponents.setName(name);
        detaliiComponents.setModel(model);
        detaliiComponents.setManufacturer(manufacturer);
        detaliiComponents.setCosts(costs);
        detaliiComponents.setParameters(parameters);
        session.update(detaliiComponents);
        transaction.commit();
        session.close();
    }

    @Override
    public void stergeComponent(Components component) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(component);
        transaction.commit();
        session.close();
    }
}
