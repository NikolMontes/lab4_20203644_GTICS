package com.proyect.lab4_20203644.Entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "flor")
public class Flor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idflor")
    private Integer idflor;

    @Column(name = "nombre")
    private String nombre;

    @Column(name = "imagen")
    private String imagen;

    @Column(name = "precio")
    private String precio;

    @Column(name = "cantidad")
    private Integer cantidad;

    @Column(name = "color")
    private String color;

    @Column(name = "ocasion")
    private String ocasion;

    @Column(name = "tipo")
    private String tipo;

    @Column(name = "descripcion")
    private String descripcion;

    @ManyToOne
    @JoinColumn(name = "juego_idjuego")
    private Juego juego;


}
