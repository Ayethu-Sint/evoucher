package com.example.evoucher.controllers;

import com.example.evoucher.entities.EVoucher;
import com.example.evoucher.services.CMSService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/cms")
public class CMSController {
    @Autowired
    private CMSService eVoucherService;

    @PostMapping
    public ResponseEntity<?> createEVoucher(@RequestBody EVoucher evoucher) {
        EVoucher e = eVoucherService.createEVoucher(evoucher);
        return ResponseEntity.status(HttpStatus.CREATED).body(e);
    }

//    @PutMapping("/{id}")
//    public void updateEVoucher(@PathVariable Long id, @RequestBody EVoucher evoucher) {
//        eVoucherService.updateEVoucher(id, evoucher);
//    }

    @DeleteMapping("/{id}")
    public void deactivateEVoucher(@PathVariable Long id) {
        eVoucherService.deactivateEVoucher(id);
    }


}
