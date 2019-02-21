package DAOImpl;
import java.util.List;
import java.util.ArrayList;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Products;
import DAO.ProductsDAO;
import java.util.Date;

public class ProductsDAOImpl implements ProductsDAO{

    @Override
    public void adaugaProduct(Products product) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(product);
        transaction.commit();
        session.close();
    }

    @Override
    public List<Products> afiseazaProducts() {
        List<Products> listaProducts = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        org.hibernate.Query query = session.createQuery("From Products");
        listaProducts = query.list();
        return listaProducts;
    }

    @Override
    public void modificaProduct(int idProducts, String name, String code, Date date, Integer price) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Products detaliiProducts = (Products) session.load(Products.class, idProducts);
        detaliiProducts.setName(name);
        detaliiProducts.setCode(code);
        detaliiProducts.setDate(date);
        detaliiProducts.setPrice(price);
        session.update(detaliiProducts);
        transaction.commit();
        session.close();
    }

    @Override
    public void stergeProduct(Products product) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(product);
        transaction.commit();
        session.close();
    }
}
