package com.example.evoucher.repositories;

import com.example.evoucher.entities.EVoucher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CMSRepository extends JpaRepository<EVoucher, Long> {
    @Query("SELECT SUM(e.quantity) FROM EVoucher e WHERE e.phoneNumber = :phoneNumber")
    Integer findTotalQuantityByPhoneNumber(@Param("phoneNumber") String phoneNumber);
}
