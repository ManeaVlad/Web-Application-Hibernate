package DAO;
import java.util.List;
import java.util.Date;
import pojo.Products;

public interface ProductsDAO {
    public void adaugaProduct (Products product);
    public List<Products> afiseazaProducts();
    public void modificaProduct (int idProducts, String name, String code, Date date, Integer price);
    public void stergeProduct (Products product);
}
