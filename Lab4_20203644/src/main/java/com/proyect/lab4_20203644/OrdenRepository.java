package com.proyect.lab4_20203644;

import com.proyect.lab4_20203644.Entity.Orden;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrdenRepository extends JpaRepository<Orden,Integer> {
}
