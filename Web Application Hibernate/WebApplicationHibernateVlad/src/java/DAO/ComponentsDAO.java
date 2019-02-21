package DAO;
import java.util.List;
import pojo.Components;

public interface ComponentsDAO {
    public void adaugaComponent (Components component);
    public List<Components> afiseazaComponents();
    public void modificaComponent (int idComponents, String name, String model, String manufacturer, Integer costs, String parameters);
    public void stergeComponent (Components component);
}
