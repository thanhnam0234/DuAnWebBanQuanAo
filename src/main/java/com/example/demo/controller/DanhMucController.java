package com.example.demo.controller;

import com.example.demo.entity.DanhMuc;
import com.example.demo.service.DanhMucRepo;
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
import java.util.Optional;

@Controller
public class DanhMucController {
    @Autowired
    public DanhMucRepo danhMucRepo;

    @GetMapping("/danh-muc")
    public String page(@RequestParam(value = "pageNo", defaultValue = "0") Integer pageNo, Model model){
        Pageable pageable = PageRequest.of(pageNo, 2, Sort.unsorted());
        Page<DanhMuc> page = danhMucRepo.findAll(pageable);
        model.addAttribute("page", page);
        model.addAttribute("list",danhMucRepo.findAll());
        return "danhmuc";
    }

    @GetMapping("/danh-muc/delete")
    public String delete(@RequestParam("id") Integer id){
        danhMucRepo.deleteById(id);
        return "redirect:/danh-muc";
    }
    @GetMapping("/danh-muc/edit")
    public String detail(@RequestParam("id") Integer id,Model model){
        DanhMuc danhMuc = danhMucRepo.findById(id).get();
        model.addAttribute("dm",danhMuc);
        return "danhmucedit";
    }



    @PostMapping("/danh-muc/add")
    public String add(@ModelAttribute("danhMuc") DanhMuc danhMuc){
        danhMuc.setNgay_tao(new Date());
        danhMuc.setNgay_sua(new Date());
        danhMucRepo.save(danhMuc);
        return "redirect:/danh-muc";
    }
    @PostMapping("/danh-muc/update")
    public String update(@ModelAttribute("danhMuc") DanhMuc danhMuc){
        danhMuc.setNgay_tao(new Date());
        danhMuc.setNgay_sua(new Date());
        danhMucRepo.save(danhMuc);
        return "redirect:/danh-muc";
    }
}
