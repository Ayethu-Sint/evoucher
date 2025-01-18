package com.example.evoucher.controllers;

import com.example.evoucher.entities.EVoucher;
import com.example.evoucher.entities.PaymentType;
import com.example.evoucher.repositories.PaymentTypeRepository;
import com.example.evoucher.services.CMSService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/estore")
public class EStoreController {
    @Autowired
    private PaymentTypeRepository pRepository;

    @Autowired
    private CMSService eVoucherService;

    @GetMapping
    public List<EVoucher> getAllEVouchers() {
        return eVoucherService.getAllEVouchers();
    }

    @GetMapping("/{id}")
    public EVoucher getEVoucherDetail(@PathVariable Long id) {
        return eVoucherService.getEVoucherDetail(id);
    }

    @PostMapping("/savePaymentType")
    public ResponseEntity<?> savePaymentType(PaymentType p) {
        pRepository.save(p);
        return ResponseEntity.status(HttpStatus.CREATED).body(p);
    }
}
