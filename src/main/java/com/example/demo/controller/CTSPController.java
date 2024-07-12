package com.example.demo.controller;

import com.example.demo.entity.*;
import com.example.demo.service.*;
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
public class CTSPController {
    @Autowired
    public SanPhamRepo sanPhamRepo;
    @Autowired
    public CTSPRepo ctspRepo;
    @Autowired
    public MauSacRepo mauSacRepo;
    @Autowired
    public SizeRepo sizeRepo;

    @GetMapping("/ctsp")
    public String page(@RequestParam(value = "pageNo", defaultValue = "0") Integer pageNo, Model model){
        Pageable pageable = PageRequest.of(pageNo, 2, Sort.unsorted());
        Page<CTSP> page = ctspRepo.findAll(pageable);
        model.addAttribute("page", page);
        model.addAttribute("list",ctspRepo.findAll());
        model.addAttribute("listSP",sanPhamRepo.findAll());
        model.addAttribute("listMS",mauSacRepo.findAll());
        model.addAttribute("listS",sizeRepo.findAll());
        return "ctsp";
    }
    @GetMapping("/ctsp/delete")
    public String delete(@RequestParam("id") Integer id){
        ctspRepo.deleteById(id);
        return "redirect:/ctsp";
    }
    @GetMapping("/ctsp/edit")
    public String detail(@RequestParam("id") Integer id,Model model){
        CTSP ctsp = ctspRepo.findById(id).get();
        model.addAttribute("ctsp",ctsp);
        model.addAttribute("listSP",sanPhamRepo.findAll());
        model.addAttribute("listMS",mauSacRepo.findAll());
        model.addAttribute("listS",sizeRepo.findAll());
        return "ctspedit";
    }
    @PostMapping("/ctsp/add")
    public String add(@ModelAttribute("ctsp") CTSP ctsp, @RequestParam("id_sp") Integer idSP,@RequestParam("id_mau_sac") Integer idMS,@RequestParam("id_size") Integer idS){
        SanPham sanPham = sanPhamRepo.findById(idSP).get();
        MauSac mauSac = mauSacRepo.findById(idMS).get();
        Size size = sizeRepo.findById(idS).get();
        ctsp.setSize(size);
        ctsp.setSanPham(sanPham);
        ctsp.setMauSac(mauSac);
        ctsp.setNgay_tao(new Date());
        ctsp.setNgay_sua(new Date());
        ctspRepo.save(ctsp);
        return "redirect:/ctsp";
    }
    @PostMapping("/ctsp/update")
    public String update(@ModelAttribute("ctsp") CTSP ctsp, @RequestParam("id_sp") Integer idSP,@RequestParam("id_mau_sac") Integer idMS,@RequestParam("id_size") Integer idS){
        SanPham sanPham =  sanPhamRepo.findById(idSP).get();
        MauSac mauSac = mauSacRepo.findById(idMS).get();
        Size size = sizeRepo.findById(idS).get();
        ctsp.setSanPham(sanPham);
        ctsp.setMauSac(mauSac);
        ctsp.setSize(size);
        ctsp.setNgay_tao(new Date());
        ctsp.setNgay_sua(new Date());
        ctspRepo.save(ctsp);
        return "redirect:/ctsp";
    }
}
