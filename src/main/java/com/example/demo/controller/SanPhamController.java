package com.example.demo.controller;


import com.example.demo.entity.DanhMuc;
import com.example.demo.entity.SanPham;
import com.example.demo.service.DanhMucRepo;
import com.example.demo.service.SanPhamRepo;
import jakarta.persistence.criteria.CriteriaBuilder;
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
public class SanPhamController {
    @Autowired
    public SanPhamRepo sanPhamRepo;
    @Autowired
    public DanhMucRepo danhMucRepo;
    @GetMapping("/san-pham")
    public String page(@RequestParam(value = "pageNo", defaultValue = "0") Integer pageNo, Model model){
        Pageable pageable = PageRequest.of(pageNo, 2, Sort.unsorted());
        Page<SanPham> page = sanPhamRepo.findAll(pageable);
        model.addAttribute("page", page);
        model.addAttribute("list",sanPhamRepo.findAll());
        model.addAttribute("listDM",danhMucRepo.findAll());
        return "sanpham";
    }

    @GetMapping("/san-pham/delete")
    public String delete(@RequestParam("id") Integer id){
        sanPhamRepo.deleteById(id);
        return "redirect:/san-pham";
    }
    @GetMapping("/san-pham/edit")
    public String detail(@RequestParam("id") Integer id,Model model){
        SanPham sanPham = sanPhamRepo.findById(id).get();
        model.addAttribute("sp",sanPham);
        model.addAttribute("listDM",danhMucRepo.findAll());
        return "sanphamedit";
    }
    @PostMapping("/san-pham/add")
    public String add(@ModelAttribute("sanPham") SanPham sanPham,@RequestParam("id_danh_muc") Integer id){
        DanhMuc danhMuc =  danhMucRepo.findById(id).get();
        sanPham.setDanhMuc(danhMuc);
        sanPham.setNgay_tao(new Date());
        sanPham.setNgay_sua(new Date());
        sanPhamRepo.save(sanPham);
        return "redirect:/san-pham";
    }
    @PostMapping("/san-pham/update")
    public String update(@ModelAttribute("sanPham") SanPham sanPham,@RequestParam("id_danh_muc") Integer id){
        DanhMuc danhMuc =  danhMucRepo.findById(id).get();
        sanPham.setDanhMuc(danhMuc);
        sanPham.setNgay_tao(new Date());
        sanPham.setNgay_sua(new Date());
        sanPhamRepo.save(sanPham);
        return "redirect:/san-pham";
    }
}
