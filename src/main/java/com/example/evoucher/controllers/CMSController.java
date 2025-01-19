package com.example.evoucher.controllers;

import com.example.evoucher.BuyType;
import com.example.evoucher.entities.EVoucher;
import com.example.evoucher.services.CMSService;
import com.google.zxing.WriterException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.Optional;

@RestController
@RequestMapping("/api/cms")
public class CMSController {
    @Autowired
    private CMSService eVoucherService;

    @PostMapping("/saveEVoucher")
    public ResponseEntity<?> createEVoucher(@RequestBody EVoucher evoucher) throws IOException, WriterException {
        int existingQuantity = Optional.ofNullable(eVoucherService.findTotalQuantityByPhoneNumber(evoucher.getPhoneNumber()))
                .orElse(0);
        int limitPerUser = evoucher.getBuyType().equals(BuyType.Gift_To_Others)
                ? evoucher.getGiftLimitPerUser()
                : evoucher.getMaxLimitPerUser();

        if (evoucher.getQuantity() > limitPerUser || existingQuantity > limitPerUser) {
            int availableQuantity = limitPerUser - existingQuantity;
            return ResponseEntity.ok(String.format("Available quantity is %d.", availableQuantity));
        }
        EVoucher e = eVoucherService.createEVoucher(evoucher);
        return ResponseEntity.status(HttpStatus.CREATED).body(e);
    }

//    @PutMapping("/{id}")
//    public void updateEVoucher(@PathVariable Long id, @RequestBody EVoucher evoucher) {
//        eVoucherService.updateEVoucher(id, evoucher);
//    }

    @GetMapping("/deactivateEVoucher")
    public String deactivateEVoucher(@RequestParam Long id) {
        eVoucherService.deactivateEVoucher(id);
        return "Deleted";
    }

    @GetMapping
    public String setUsedPromoCode(@RequestParam Long promoCodeId) {
        eVoucherService.setUsedPromoCode(promoCodeId);
        return "Used Promo Code";
    }

}
