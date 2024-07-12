package com.example.demo.controller;


import com.example.demo.entity.DanhMuc;
import com.example.demo.entity.MauSac;
import com.example.demo.service.MauSacRepo;
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
public class MauSacController {
    @Autowired
    public MauSacRepo mauSacRepo;
    @GetMapping("/mau-sac")
    public String page(@RequestParam(value = "pageNo", defaultValue = "0") Integer pageNo, Model model){
        Pageable pageable = PageRequest.of(pageNo, 2, Sort.unsorted());
        Page<MauSac> page = mauSacRepo.findAll(pageable);
        model.addAttribute("page", page);
        model.addAttribute("list",mauSacRepo.findAll());
        return "mausac";
    }
    @GetMapping("/mau-sac/delete")
    public String delete(@RequestParam("id") Integer id){
        mauSacRepo.deleteById(id);
        return "redirect:/mau-sac";
    }
    @GetMapping("/mau-sac/edit")
    public String detail(@RequestParam("id") Integer id,Model model){
        MauSac mauSac = mauSacRepo.findById(id).get();
        model.addAttribute("ms",mauSac);
        return "mausacedit";
    }



    @PostMapping("/mau-sac/add")
    public String add(@ModelAttribute("mauSac") MauSac mauSac){
        mauSac.setNgay_tao(new Date());
        mauSac.setNgay_sua(new Date());
        mauSacRepo.save(mauSac);
        return "redirect:/mau-sac";
    }
    @PostMapping("/mau-sac/update")
    public String update(@ModelAttribute("mauSac") MauSac mauSac){
        mauSac.setNgay_tao(new Date());
        mauSac.setNgay_sua(new Date());
        mauSacRepo.save(mauSac);
        return "redirect:/mau-sac";
    }
}
