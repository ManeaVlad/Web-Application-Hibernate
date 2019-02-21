package DAO;
import java.util.List;
import pojo.Assemblyline;
import pojo.Components;
import pojo.Products;

public interface AssemblylineDAO {
    public void adaugaAssemblyline (Assemblyline assemblyline);
    public List<Assemblyline> afiseazaAssemblyline();
    public void modificaAssemblyline (Integer idAssemblyline, Products product, Components component, int Validation);
    public void stergeAssemblyline (Assemblyline assemblyline);
}
