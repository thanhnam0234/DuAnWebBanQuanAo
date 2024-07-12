package com.example.demo.controller;

import com.example.demo.entity.DanhMuc;
import com.example.demo.entity.KhachHang;
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
public class KhachHangController {
    @Autowired
    public KhachHangRepo khachHangRepo;
    @GetMapping("/khach-hang")
    public String page(@RequestParam(value = "pageNo", defaultValue = "0") Integer pageNo, Model model){
        Pageable pageable = PageRequest.of(pageNo, 2, Sort.unsorted());
        Page<KhachHang> page = khachHangRepo.findAll(pageable);
        model.addAttribute("page", page);
        model.addAttribute("list",khachHangRepo.findAll());
        return "khachhang";
    }
    @GetMapping("/khach-hang/delete")
    public String delete(@RequestParam("id") Integer id){
        khachHangRepo.deleteById(id);
        return "redirect:/khach-hang";
    }
    @GetMapping("/khach-hang/edit")
    public String detail(@RequestParam("id") Integer id,Model model){
        KhachHang khachHang = khachHangRepo.findById(id).get();
        model.addAttribute("kh",khachHang);
        return "khachhangedit";
    }

    @PostMapping("/khach-hang/add")
    public String add(@ModelAttribute("khachHang") KhachHang khachHang){
        khachHang.setNgay_tao(new Date());
        khachHang.setNgay_sua(new Date());
        khachHangRepo.save(khachHang);
        return "redirect:/khach-hang";
    }
    @PostMapping("/khach-hang/update")
    public String update(@ModelAttribute("khachHang") KhachHang khachHang){
        khachHang.setNgay_tao(new Date());
        khachHang.setNgay_sua(new Date());
        khachHangRepo.save(khachHang);
        return "redirect:/khach-hang";
    }
}
