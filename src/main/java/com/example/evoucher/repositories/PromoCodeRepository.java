package com.example.evoucher.repositories;

import com.example.evoucher.entities.PromoCode;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.parameters.P;

import java.util.List;

public interface PromoCodeRepository extends JpaRepository<PromoCode, Long> {
    boolean existsByPromoCode(String promoCode);

    // Use a custom query to fetch PromoCodes by EVoucher ID
    @Query("SELECT p FROM PromoCode p WHERE p.voucherId = :voucherId")
    List<PromoCode> findByVoucherId(@Param("voucherId") Long voucherId);

    // Use a custom query to fetch PromoCodes by EVoucher ID and used
    @Query("SELECT p FROM PromoCode p WHERE p.voucherId = :voucherId and p.used = :used")
    List<PromoCode> findByVoucherIdAndUsed(@Param("voucherId") Long voucherId, @Param("used") Boolean used);
}
