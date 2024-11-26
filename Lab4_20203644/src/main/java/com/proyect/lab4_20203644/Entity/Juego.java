package com.proyect.lab4_20203644.Entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity(name="juego")
public class Juego {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idjuego")
    private Integer idjuego;

    @Column(name = "tamanio")
    private Integer tamanio;

    @ManyToOne
    @JoinColumn(name = "usuario_idusuario")
    private Usuario usuario;



}
