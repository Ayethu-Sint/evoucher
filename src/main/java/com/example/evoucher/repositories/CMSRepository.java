package com.example.evoucher.repositories;

import com.example.evoucher.entities.EVoucher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CMSRepository extends JpaRepository<EVoucher, Long> {
}
