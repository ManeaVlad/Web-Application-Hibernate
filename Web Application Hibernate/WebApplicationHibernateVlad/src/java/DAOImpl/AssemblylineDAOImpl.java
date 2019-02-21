package DAOImpl;
import java.util.List;
import java.util.ArrayList;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Assemblyline;
import DAO.AssemblylineDAO;
import pojo.Components;
import pojo.Products;

public class AssemblylineDAOImpl implements AssemblylineDAO{

    @Override
    public void adaugaAssemblyline(Assemblyline assemblyline) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(assemblyline);
        transaction.commit();
        session.close();
    }

    @Override
    public List<Assemblyline> afiseazaAssemblyline() {
        List<Assemblyline> listaAssemblyline = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        org.hibernate.Query query = session.createQuery("From Assemblyline");
        listaAssemblyline = query.list();
        return listaAssemblyline;
    }
    @Override
    public void modificaAssemblyline(Integer idAssemblyline, Products product, Components component, int validation) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Assemblyline detaliiAssemblyline;
        detaliiAssemblyline = (Assemblyline) session.load(Assemblyline.class, idAssemblyline);
        detaliiAssemblyline.setProducts(product);
        detaliiAssemblyline.setComponents(component);
        detaliiAssemblyline.setValidation(validation);
        session.update(detaliiAssemblyline);
        transaction.commit();
        session.close();
    }

    @Override
    public void stergeAssemblyline(Assemblyline assemblyline) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(assemblyline);
        transaction.commit();
        session.close();
    }
}
