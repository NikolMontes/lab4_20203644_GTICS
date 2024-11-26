package com.proyect.lab4_20203644;

import com.proyect.lab4_20203644.Entity.Flor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping({"/","lista"})
public class VistaController {
    private final UsuarioRepository usuarioRepository;
    private final FlorRepository florRepository;
    private final OrdenRepository ordenRepository;
    public VistaController(UsuarioRepository usuarioRepository,FlorRepository florRepository, OrdenRepository ordenRepository){
        this.usuarioRepository = usuarioRepository;
        this.florRepository = florRepository;
        this.ordenRepository=ordenRepository;
    }
    @GetMapping("/html")
    public String vista(){
        return "lista";
    }
    @GetMapping("/flores")
    public String lista_productos(@RequestParam(value="busqueda",required = false) String busqueda, Model model){
        List<Flor> flores= florRepository.findAll();
        if(busqueda!= null && !busqueda.isEmpty()){
            flores = florRepository.findByNombreContaining(busqueda);
        }else {
            flores = florRepository.findAll();
        }
        model.addAttribute("flores", flores);
        return "lista";
    }

}
