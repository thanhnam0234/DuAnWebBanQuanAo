package com.example.demo.controller;

import com.example.demo.entity.DanhMuc;
import com.example.demo.entity.HoaDon;
import com.example.demo.entity.KhachHang;
import com.example.demo.entity.SanPham;
import com.example.demo.service.HoaDonRepo;
import com.example.demo.service.KhachHangRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.List;

@Controller
public class HoaDonController {
    @Autowired
    public HoaDonRepo hoaDonRepo;
    @Autowired
    public KhachHangRepo khachHangRepo;
    @GetMapping("/hoa-don")
    public String page(@RequestParam(value = "pageNo", defaultValue = "0") Integer pageNo, Model model){
        Pageable pageable = PageRequest.of(pageNo, 2, Sort.unsorted());
        Page<HoaDon> page = hoaDonRepo.findAll(pageable);
        model.addAttribute("page", page);
        model.addAttribute("list",hoaDonRepo.findAll());
        model.addAttribute("listKH",khachHangRepo.findAll());
        return "hoadon";
    }
    @GetMapping("/hoa-don/delete")
    public String delete(@RequestParam("id") Integer id){
        hoaDonRepo.deleteById(id);
        return "redirect:/hoa-don";
    }
    @GetMapping("/hoa-don/edit")
    public String detail(@RequestParam("id") Integer id,Model model){
        HoaDon hoaDon = hoaDonRepo.findById(id).get();
        model.addAttribute("hd",hoaDon);
        model.addAttribute("listKH",khachHangRepo.findAll());
        return "hoadonedit";
    }
    @PostMapping("/hoa-don/add")
    public String add(@ModelAttribute("hoaDon") HoaDon hoaDon, @RequestParam("id_khach_hang") Integer id){
        KhachHang khachHang =  khachHangRepo.findById(id).get();
        hoaDon.setKhachHang(khachHang);
        hoaDon.setNgay_tao(new Date());
        hoaDon.setNgay_sua(new Date());
        hoaDonRepo.save(hoaDon);
        return "redirect:/hoa-don";
    }
    @PostMapping("/hoa-don/update")
    public String update(@ModelAttribute("hoaDon") HoaDon hoaDon, @RequestParam("id_khach_hang") Integer id){
        KhachHang khachHang =  khachHangRepo.findById(id).get();
        hoaDon.setKhachHang(khachHang);
        hoaDon.setNgay_tao(new Date());
        hoaDon.setNgay_sua(new Date());
        hoaDonRepo.save(hoaDon);
        return "redirect:/hoa-don";
    }
}
