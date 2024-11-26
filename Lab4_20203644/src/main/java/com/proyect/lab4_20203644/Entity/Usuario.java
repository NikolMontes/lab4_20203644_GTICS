package com.proyect.lab4_20203644.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "usuario")
public class Usuario {
    @Id
    @Column(name = "idusuario")
    private Integer idusuario;

    @Column(name = "puntaje")
    private Integer puntaje;

    @Column(name = "nombre")
    private String nombre;

    @Column(name = "compra")
    private String compra;

}
