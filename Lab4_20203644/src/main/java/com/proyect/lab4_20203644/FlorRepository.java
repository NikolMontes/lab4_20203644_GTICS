package com.proyect.lab4_20203644;

import com.proyect.lab4_20203644.Entity.Flor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FlorRepository extends JpaRepository<Flor,Integer> {
    List<Flor> findByNombreContaining(String nombre);
}
