package com.proyect.lab4_20203644.Entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "orden")
public class Orden {
    @Id
    @Column(name = "idorden")
    private Integer idorden;

    @Column(name = "monto")
    private String monto;

    @ManyToOne
    @JoinColumn(name = "flor_idflor",nullable = false)
    private Flor flor;
}
