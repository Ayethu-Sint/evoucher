package com.example.evoucher.services;

import com.example.evoucher.BuyType;
import com.example.evoucher.entities.EVoucher;
import com.example.evoucher.repositories.CMSRepository;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class CMSService{
    @Autowired
    private CMSRepository eVoucherRepository;

    @Autowired
    private PromoCodeService promoCodeService;

    // Create eVoucher
    @Transactional
    public EVoucher createEVoucher(EVoucher evoucher) {
        //boolean newVoucher = evoucher.getId() == null || evoucher.getId() <= 0;
        eVoucherRepository.save(evoucher);
//        if(newVoucher)
//            promoCodeService.generatePromoCodes(evoucher, evoucher.getQuantity());
        return evoucher;
    }

    // Update eVoucher
    @Transactional
    public void updateEVoucher(Long id, EVoucher evoucher) {
        Optional<EVoucher> existingEVoucher = eVoucherRepository.findById(id);
        if (existingEVoucher.isPresent()) {
//            eVoucher evoucher = existingEVoucher.get();
//            evoucher.setTitle(evoucherDto.getTitle());
//            evoucher.setDescription(evoucherDto.getDescription());
//            evoucher.setExpiryDate(evoucherDto.getExpiryDate());
//            evoucher.setImageUrl(evoucherDto.getImageUrl());
//            evoucher.setAmount(evoucherDto.getAmount());
//            evoucher.setPaymentMethod(evoucherDto.getPaymentMethod());
//            evoucher.setDiscount(evoucherDto.getDiscount());
//            evoucher.setQuantity(evoucherDto.getQuantity());
//            evoucher.setBuyType(evoucherDto.getBuyType());
//            evoucher.setMaxLimit(evoucherDto.getMaxLimit());

            eVoucherRepository.save(evoucher);
        }
    }

    // Deactivate eVoucher
    @Transactional
    public void deactivateEVoucher(Long id) {
        Optional<EVoucher> existingEVoucher = eVoucherRepository.findById(id);
        if (existingEVoucher.isPresent()) {
            EVoucher evoucher = existingEVoucher.get();
            evoucher.setIsActive(false);
            eVoucherRepository.save(evoucher);
        }
    }

    // Get All eVouchers
    public List<EVoucher> getAllEVouchers() {
        return eVoucherRepository.findAll();
    }

    // Get eVoucher by ID
    public EVoucher getEVoucherDetail(Long id) {
        return eVoucherRepository.findById(id).orElseThrow(() -> new RuntimeException("eVoucher not found"));
    }

    // Get Total Quantity by Phone Number
    public Integer findTotalQuantityByPhoneNumber(String phoneNumber){
        return eVoucherRepository.findTotalQuantityByPhoneNumber(phoneNumber);
    }
}
