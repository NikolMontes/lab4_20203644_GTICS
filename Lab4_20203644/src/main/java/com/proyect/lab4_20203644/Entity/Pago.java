package com.proyect.lab4_20203644.Entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@Entity
@Table(name = "pago")
public class Pago {
    @Id
    @Column(name = "idPagos")
    private Integer idPago;

    @Column(name = "monto")
    private Double monto;

    @Column(name = "tarjeta")
    private String tarjeta;

    @Column(name = "fecha")
    @Temporal(TemporalType.DATE)
    private Date fecha;

    @Column(name = "cvv")
    private String cvv;

    @ManyToOne
    @JoinColumn(name = "usuario_idusuario")
    private Usuario usuario;

}
