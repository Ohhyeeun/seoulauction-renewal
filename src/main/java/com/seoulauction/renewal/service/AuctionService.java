package com.seoulauction.renewal.service;

import com.seoulauction.renewal.domain.CommonMap;
import com.seoulauction.renewal.exception.SAException;
import com.seoulauction.renewal.mapper.kt.AuctionMapper;
import com.seoulauction.renewal.mapper.kt.LoginMapper;
import lombok.RequiredArgsConstructor;
import org.apache.commons.collections.MapUtils;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AuctionService {
    private final AuctionMapper auctionMapper;
}
