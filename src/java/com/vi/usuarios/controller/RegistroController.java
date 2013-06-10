
package com.vi.usuarios.controller;

import com.vi.comun.util.Log;
import com.vi.usuarios.dominio.Users;
import com.vi.usuarios.services.UsuariosServicesLocal;
import com.vi.util.FacesUtil;
import com.vi.util.SpringUtils;
import com.vi.utils.UsuarioEstados;
import java.util.logging.Level;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

/**
 * @author Jerson Viveros
 */
@ManagedBean(name="registroController")
@SessionScoped
public class RegistroController {
    @EJB
    private UsuariosServicesLocal service;
    private Users usuarioRegistrar;
    
    private boolean linkIngreso = false;

    
    
    @PostConstruct
    public void init(){
        usuarioRegistrar = new Users();
    }

    
    public String registrar(){
        try {
            usuarioRegistrar.setPwd(SpringUtils.getPasswordEncoder().encodePassword(usuarioRegistrar.getClave(), null));
            service.registrar(usuarioRegistrar, "USUARIOS", UsuarioEstados.ACTIVO );
            FacesUtil.addMessage(FacesUtil.INFO,"Usuario registrado, ya puede ingresar");
            setLinkIngreso(true);
        } catch (Exception e) {
            FacesUtil.addMessage(FacesUtil.ERROR,"Error al crear el usuario!");
            Log.getLogger().log(Level.SEVERE, e.getMessage(), e);
            return "/registro.xhtml";
        }
        return "/registro.xhtml";
    }
    
    
    public void dispUsuario(){
        FacesContext fc = FacesContext.getCurrentInstance();
        if(!service.isUsuarioDisponible(usuarioRegistrar.getUsr())){
            System.out.println("Email previamente registrado");
            FacesMessage fm = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error", "Este email ya se encuentra registrado!");
            fc.addMessage("form1:mail", fm);
        }
    }
    
    

    /**
     * @return the usuarioRegistrar
     */
    public Users getUsuarioRegistrar() {
        return usuarioRegistrar;
    }

    /**
     * @param usuarioRegistrar the usuarioRegistrar to set
     */
    public void setUsuarioRegistrar(Users usuarioRegistrar) {
        this.usuarioRegistrar = usuarioRegistrar;
    }


    /**
     * @return the linkIngreso
     */
    public boolean isLinkIngreso() {
        return linkIngreso;
    }

    /**
     * @param linkIngreso the linkIngreso to set
     */
    public void setLinkIngreso(boolean linkIngreso) {
        this.linkIngreso = linkIngreso;
    }

    
    
}

/*public void dispUsuario(){
    FacesContext fc = FacesContext.getCurrentInstance();
    if(!service.isUsuarioDisponible(usuarioRegistrar.getEmail())){
        System.out.println("Usuario ya está registrado!!!");
        FacesMessage fm = new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Este email ya se encuentra registrado!");
        fc.addMessage("form1:mail", fm);
    }
}*/