package com.clh.base.dao;

import com.clh.base.entity.Menu;

import java.util.List;

public interface MenuDao
{
    Menu getMenuById(Long menuId);

    List<Menu> getAllMenus();

    void updateMenuByKey(Menu menu1);

    List<Menu> checkNameSameLevel(Menu menus);

    void insMenu(Menu menus);

    void updateMenu(Menu menus);

    List<Menu> getMenuByParentId(Long menuId);

    void delMenuById(Long menuId);
}
