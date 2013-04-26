package com.vi.usuarios.controller;

import com.vi.comun.controller.GeneralController;
import com.vi.util.FacesUtil;
import com.vi.comun.exceptions.LlaveDuplicadaException;
import com.vi.comun.util.Log;
import com.vi.locator.ComboLocator;
import com.vi.usuarios.dominio.Menu;
import com.vi.usuarios.services.MenusServicesLocal;
import java.util.List;
import java.util.logging.Level;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.model.SelectItem;

/**
 * @author Jerson Viveros
 */
@ManagedBean(name="menusController")
@RequestScoped
public class MenusController {

    private ComboLocator locator;

    private Menu menu;
    private List<Menu> menus;
    private List<SelectItem> items;
    private List<SelectItem> idiomas;


    @EJB
    private MenusServicesLocal menuServices;


    @PostConstruct
    public void init(){
        menu = new Menu();
        menu.setMenuPadre(new Menu(1l));
        locator = ComboLocator.getInstance();
        GeneralController general = (GeneralController)FacesUtil.getManagedBean("#{generalController}");
        setMenus(menuServices.findAll(general.getLocale()));
        setItems(FacesUtil.getSelectsItem(locator.getDataForCombo(ComboLocator.COMB_ID_MENU)));
        idiomas = FacesUtil.getSelectsItem(locator.getDataForCombo(ComboLocator.COMB_ID_IDIOMA));
    }

    public MenusController() {
    }


    public void nuevo(){
        init();
    }

    /**
     * @return the items
     */
    public List<SelectItem> getItems() {
        return items;
    }

    /**
     * @param items the items to set
     */
    public void setItems(List<SelectItem> items) {
        this.items = items;
    }

    /**
     * @return the items
     */
    public List<Menu> getMenus() {
        return menus;
    }

    /**
     * @param items the items to set
     */
    public void setMenus(List<Menu> menus) {
        this.menus = menus;
    }

    /**
     * @return the menu
     */
    public Menu getMenu() {
        return menu;
    }

    /**
     * @param menu the menu to set
     */
    public void setMenu(Menu menu) {
        this.menu = menu;
    }


    public String guardar(){
        try {
            menuServices.edit(getMenu());
            GeneralController general = (GeneralController)FacesUtil.getManagedBean("#{generalController}");
            setMenus(menuServices.findAll(general.getLocale()));
            locator.restartCache();
            FacesUtil.addMessage(FacesUtil.INFO,"Menu guardado con exito!!");
        } catch(LlaveDuplicadaException e){
            FacesUtil.addMessage(FacesUtil.ERROR,e.getMessage());
        } catch (Exception e) {
            FacesUtil.addMessage(FacesUtil.ERROR, "Error al tratar de guardar el menú");
            Log.getLogger().log(Level.SEVERE, e.getMessage(), e);
        }
        return null;
    }

    public void borrar(Menu r){
        try {
            menus.remove(r);
            menuServices.remove(r);
            locator.restartCache();
            FacesUtil.addMessage(FacesUtil.INFO,"Menu borrado con exito!!");
        } catch (Exception e) {
            FacesUtil.addMessage(FacesUtil.ERROR, "Error al tratar de borrar el menú");
            Log.getLogger().log(Level.SEVERE, e.getMessage(), e);
        }
        
    }

    public void actualizar(Menu r){
        locator.restartCache();
        this.menu = r;
    }

    /**
     * @return the lenguajes
     */
    public List<SelectItem> getIdiomas() {
        return idiomas;
    }

    /**
     * @param lenguajes the lenguajes to set
     */
    public void setIdiomas(List<SelectItem> lenguajes) {
        this.idiomas = lenguajes;
    }

}
