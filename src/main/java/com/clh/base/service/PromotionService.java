package com.clh.base.service;

import com.clh.base.entity.Promotion;
import com.clh.base.util.ResultUtil;

public interface PromotionService {
    ResultUtil getPromotionList(Integer page, Integer limit);

    void insPromotion(Promotion promotion);

    void delPromotionById(Integer promotion_id);
}
