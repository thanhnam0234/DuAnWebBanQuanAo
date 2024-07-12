package com.example.demo.service;


import com.example.demo.entity.HDCT;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.ArrayList;
import java.util.List;

public interface HDCTRepo extends JpaRepository<HDCT, Integer> {
    public default List<HDCT> hienthiHDCT(Integer id, List<HDCT> list){
        List<HDCT> listHDCT = new ArrayList<>();
        for(HDCT hdct : list){
            if(hdct.getHoaDon().getId().equals(id)){
                listHDCT.add(hdct);
            }
        }
        return listHDCT;
    }
}
