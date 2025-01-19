package com.example.evoucher.models;

import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
@Builder
public class PurchaseRequest {
    private Boolean used;
    private List<Long> eVoucherId;
}
