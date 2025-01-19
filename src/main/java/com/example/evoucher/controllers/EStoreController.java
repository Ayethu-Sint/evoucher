package com.example.evoucher.controllers;

import com.example.evoucher.entities.EVoucher;
import com.example.evoucher.models.PurchaseRequest;
import com.example.evoucher.services.CMSService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
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

    @PostMapping
    public EVoucher getEVoucherDetail(@RequestParam Long id) {
        return eVoucherService.getEVoucherDetail(id);
    }

    @PostMapping("/getEVoucher")
    public List<EVoucher> getEVoucherList(@RequestBody PurchaseRequest purchaseRequest) throws IOException {
        return eVoucherService.getEVouchersWithPromoCodes(purchaseRequest.getEVoucherId(), purchaseRequest.getUsed());
    }

}
