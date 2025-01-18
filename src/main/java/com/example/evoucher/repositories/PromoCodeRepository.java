package com.example.evoucher.repositories;

import com.example.evoucher.entities.PromoCode;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PromoCodeRepository extends JpaRepository<PromoCode, Long> {
    boolean existsByPromoCode(String promoCode);
}
