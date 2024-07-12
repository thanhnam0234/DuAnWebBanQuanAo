package com.example.demo.service;

import com.example.demo.entity.HoaDon;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.ArrayList;
import java.util.List;

public interface HoaDonRepo extends JpaRepository<HoaDon, Integer> {
      public default List<HoaDon> hienthihoadon(List<HoaDon> list){
          List<HoaDon> listHD = new ArrayList<>();
          for(HoaDon hoaDon : list){
              if(hoaDon.getTrang_thai().equals("Chua thanh toan")){
                  listHD.add(hoaDon);
              }
          }
          return listHD;
      }
}
