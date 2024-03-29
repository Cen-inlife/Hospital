package com.clh.base.dao;

import com.clh.base.entity.Promotion;

import java.util.List;

public interface PromotionDao {
    List<Promotion> getPromotionList();

    void insPromotion(Promotion promotion);

    void delPromotionById(Integer promotion_id);
}
