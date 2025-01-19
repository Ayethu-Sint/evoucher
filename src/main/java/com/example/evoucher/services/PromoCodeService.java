package com.example.evoucher.services;

import com.example.evoucher.common.QRCodeGenerator;
import com.example.evoucher.common.RandomStringGenerator;
import com.example.evoucher.entities.EVoucher;
import com.example.evoucher.entities.PromoCode;
import com.example.evoucher.repositories.PromoCodeRepository;
import com.google.zxing.WriterException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class PromoCodeService {
    @Autowired
    private PromoCodeRepository promoCodeRepository;

    // Generate Promo Codes for the eVoucher
    public List<PromoCode> generatePromoCodes(EVoucher evoucher, int quantity) throws IOException, WriterException {
        List<PromoCode> codeList = new ArrayList<>();
        for (int i = 0; i < quantity; i++) {
            String promoCode = generatePromoCode();
            PromoCode promo = new PromoCode();
            promo.setPromoCode(promoCode);
            promo.setVoucherId(evoucher.getId());
            promo.setPhoneNumber(evoucher.getPhoneNumber());
            promo.setUsed(false);
            promo.setQrCodeImageUrl(QRCodeGenerator.generateQRCodeImage(promoCode));//generateQRCode(promoCode));
            promoCodeRepository.save(promo);
            codeList.add(promo);
        }
        return codeList;
    }

    public List<PromoCode> getPromoCodes(Long evoucherId) throws IOException, WriterException {
        List<PromoCode> codeList = new ArrayList<>();
        codeList = promoCodeRepository.findByVoucherId(evoucherId);
        return codeList;
    }

    // Generate a unique Promo Code (11 AlphaNumeric)
    private String generatePromoCode() {
        String promoCode = RandomStringGenerator.generateRandomNumeric(6) +
                RandomStringGenerator.generateRandomAlphabetic(5);
        while (promoCodeRepository.existsByPromoCode(promoCode)) {
            promoCode = RandomStringGenerator.generateRandomNumeric(6) +
                    RandomStringGenerator.generateRandomAlphabetic(5);
        }
        return promoCode;
    }

    // Generate QR Code image URL for the promo code
    private String generateQRCode(String promoCode) {
        // Use a library to generate QR code
        return "http://example.com/qr-codes/" + promoCode + ".png";
    }

}
