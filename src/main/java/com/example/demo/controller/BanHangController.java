package com.example.demo.controller;

import com.example.demo.entity.CTSP;
import com.example.demo.entity.HDCT;
import com.example.demo.entity.HoaDon;
import com.example.demo.entity.KhachHang;
import com.example.demo.service.CTSPRepo;
import com.example.demo.service.HDCTRepo;
import com.example.demo.service.HoaDonRepo;
import com.example.demo.service.KhachHangRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.List;

@Controller
public class BanHangController {
    @Autowired
    public HoaDonRepo hoaDonRepo;
    @Autowired
    public KhachHangRepo khachHangRepo;
    @Autowired
    public HDCTRepo hdctRepo;
    @Autowired
    public CTSPRepo ctspRepo;

    public Integer idHD = 0;

    @GetMapping("ban-hang")
    public String hienthi(Model model){
        List<HoaDon> listHD = hoaDonRepo.hienthihoadon(hoaDonRepo.findAll());
        List<CTSP> listCTSP = ctspRepo.findAll();
        model.addAttribute("listHD", listHD);
        model.addAttribute("listCTSP",listCTSP);
        return "banhang";
    }
    @GetMapping("ban-hang/hdct")
    public String hienthiHDCT(Model model, @RequestParam("id") Integer id){
        Double tongtien = 0.0;
        HoaDon hoaDon = hoaDonRepo.findById(id).get();
        List<HoaDon> listHD = hoaDonRepo.hienthihoadon(hoaDonRepo.findAll());
        List<HDCT> list = hdctRepo.findAll();
        List<HDCT> listHDCT = hdctRepo.hienthiHDCT(id,list);
        List<CTSP> listCTSP = ctspRepo.findAll();
        for(HDCT hdct: listHDCT){
            tongtien += hdct.getTong_tien();
        }
        model.addAttribute("datahd",hoaDon);
        model.addAttribute("tongtien",tongtien);
        model.addAttribute("listHD", listHD);
        model.addAttribute("listHDCT",listHDCT);
        model.addAttribute("listCTSP",listCTSP);
        return "banhang";
    }
    @GetMapping("ban-hang/delete")
    public String xoa(@RequestParam("id") Integer id){
        hdctRepo.deleteById(id);
        return "redirect:/ban-hang";
    }
    @GetMapping("ban-hang/addhoadon")
    public String addhoadon(@ModelAttribute("hoaDon") HoaDon hoaDon){
        KhachHang khachHang = khachHangRepo.findById(5).get();
        hoaDon.setKhachHang(khachHang);
        hoaDon.setDia_chi(khachHang.getDia_chi());
        hoaDon.setSo_dien_thoai(khachHang.getSdt());
        hoaDon.setNgay_tao(new Date());
        hoaDon.setNgay_sua(new Date());
        hoaDon.setTrang_thai("Chua thanh toan");
        hoaDonRepo.save(hoaDon);
        return "redirect:/ban-hang";
    }
    @GetMapping("ban-hang/thanhtoan")
    public String thanhtoan(@ModelAttribute("hoaDon") HoaDon hoaDon){
        hoaDon.setNgay_tao(new Date());
        hoaDon.setNgay_sua(new Date());
        hoaDon.setTrang_thai("Da thanh toan");
        hoaDonRepo.save(hoaDon);
        return "redirect:/ban-hang";
    }

    @GetMapping("ban-hang/addhdct")
    public String addhdct(@RequestParam("id") Integer id,@RequestParam("idHD") Integer idHD){
        List<HDCT> listHDCT = hdctRepo.hienthiHDCT(idHD,hdctRepo.findAll());
        boolean check = false;
        for(HDCT hdct : listHDCT) {
            if (hdct.getCtsp().getId().equals(id)) {
                CTSP ctsp = ctspRepo.findById(id).get();
                HoaDon hoaDon = new HoaDon();
                hoaDon.setId(idHD);
                hdct.setHoaDon(hoaDon);
                hdct.setCtsp(ctsp);
                hdct.setGia_ban(ctsp.getGia_ban());
                hdct.setSo_luong_mua(hdct.getSo_luong_mua()+1);
                hdct.setTong_tien(Double.valueOf(ctsp.getGia_ban()) * Double.valueOf(hdct.getSo_luong_mua()+ 1));
                hdct.setNgay_tao(new Date());
                hdct.setNgay_sua(new Date());
                hdct.setTrang_thai("Kha dung");
                ctsp.setSo_luong_ton(ctsp.getSo_luong_ton() -1);
                hdctRepo.save(hdct);
                ctspRepo.save(ctsp);
                check = true;
            }
            if (check) {
                break;
            }
        }
        if(!check){
            CTSP ctsp = ctspRepo.findById(id).get();
            HoaDon hoaDon = hoaDonRepo.findById(idHD).get();
            HDCT hdct = new HDCT();
            hdct.setHoaDon(hoaDon);
            hdct.setCtsp(ctsp);
            hdct.setGia_ban(ctsp.getGia_ban());
            hdct.setSo_luong_mua(1);
            hdct.setTong_tien(ctsp.getGia_ban() *1);
            hdct.setNgay_tao(new Date());
            hdct.setNgay_sua(new Date());
            hdct.setTrang_thai("Kha dung");
            ctsp.setSo_luong_ton(ctsp.getSo_luong_ton() -1);
            hdctRepo.save(hdct);
            ctspRepo.save(ctsp);
        }
        return "redirect:/ban-hang/hdct?id="+idHD;
    }
}
