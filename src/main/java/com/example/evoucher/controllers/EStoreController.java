package com.example.evoucher.controllers;

import com.example.evoucher.entities.EVoucher;
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
    private CMSService eVoucherService;

    @GetMapping
    public List<EVoucher> getAllEVouchers() {
        return eVoucherService.getAllEVouchers();
    }

    @GetMapping("/{id}")
    public EVoucher getEVoucherDetail(@RequestParam Long id) {
        return eVoucherService.getEVoucherDetail(id);
    }

}
