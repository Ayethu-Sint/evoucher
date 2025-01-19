package com.example.evoucher.services;

import com.example.evoucher.BuyType;
import com.example.evoucher.common.QRCodeGenerator;
import com.example.evoucher.entities.EVoucher;
import com.example.evoucher.entities.PromoCode;
import com.example.evoucher.repositories.CMSRepository;
import com.example.evoucher.repositories.PromoCodeRepository;
import com.google.zxing.WriterException;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class CMSService{
    @Autowired
    private CMSRepository eVoucherRepository;

    @Autowired
    private PromoCodeService promoCodeService;

    @Autowired
    private PromoCodeRepository promoCodeRepository;
    // Create eVoucher
    @Transactional
    public EVoucher createEVoucher(EVoucher evoucher) throws IOException, WriterException {
        boolean newVoucher = evoucher.getId() == null || evoucher.getId() <= 0;
        List<PromoCode> codeList = new ArrayList<>();
        eVoucherRepository.save(evoucher);
        if(newVoucher)
            codeList = promoCodeService.generatePromoCodes(evoucher, evoucher.getQuantity());
        else
            codeList = promoCodeService.getPromoCodes(evoucher.getId());
        evoucher.setPromoCodeList(codeList);
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

    @Transactional
    public void setUsedPromoCode(Long id) {
        if(id != null) {
            Optional<PromoCode> existingPromoCode = promoCodeRepository.findById(id);
            if (existingPromoCode.isPresent()) {
                PromoCode promoCode = existingPromoCode.get();
                promoCode.setUsed(true);
                promoCodeRepository.save(promoCode);
            }
        }
    }

    // Get All eVouchers
    public List<EVoucher> getAllEVouchers() {
        return eVoucherRepository.findAll();
    }

    // Get eVoucher by ID
    public EVoucher getEVoucherDetail(Long id) {
        EVoucher voucher = eVoucherRepository.findById(id).orElseThrow(() -> new RuntimeException("eVoucher not found"));
        List<PromoCode> promoCodeList = promoCodeRepository.findByVoucherId(id);
        voucher.setPromoCodeList(promoCodeList);
        return voucher;
    }

    // Get Total Quantity by Phone Number
    public Integer findTotalQuantityByPhoneNumber(String phoneNumber){
        return eVoucherRepository.findTotalQuantityByPhoneNumber(phoneNumber);
    }

    @Transactional
    public List<EVoucher> getEVouchersWithPromoCodes(List<Long> eVoucherId, Boolean used) throws IOException {
        List<EVoucher> eVouchers = eVoucherRepository.findAllById(eVoucherId);

        for (EVoucher eVoucher : eVouchers) {
            List<PromoCode> promoCodes = promoCodeRepository.findByVoucherIdAndUsed(eVoucher.getId(), used);

            for (PromoCode promoCode : promoCodes) {
                String qrCodeBase64 = Arrays.toString(QRCodeGenerator.getQRCodeImage(promoCode.getQrCodeImageUrl()));
                promoCode.setImageBase64Code(qrCodeBase64); // Assuming the PromoCode has this field
            }

            eVoucher.setPromoCodeList(promoCodes);
        }

        return eVouchers;
    }
}
