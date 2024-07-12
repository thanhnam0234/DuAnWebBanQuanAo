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
public class HDCTController {
    @Autowired
    public HoaDonRepo hoaDonRepo;
    @Autowired
    public CTSPRepo ctspRepo;
    @Autowired
    public HDCTRepo hdctRepo;

    @GetMapping("/hdct")
    public String page(@RequestParam(value = "pageNo", defaultValue = "0") Integer pageNo, Model model){
        Pageable pageable = PageRequest.of(pageNo, 2, Sort.unsorted());
        Page<HDCT> page = hdctRepo.findAll(pageable);
        model.addAttribute("page", page);
        model.addAttribute("listCTSP",ctspRepo.findAll());
        model.addAttribute("list",hdctRepo.findAll());
        model.addAttribute("listHD",hoaDonRepo.findAll());
        return "hdct";
    }
    @GetMapping("/hdct/delete")
    public String delete(@RequestParam("id") Integer id){
        hdctRepo.deleteById(id);
        return "redirect:/hdct";
    }
    @GetMapping("/hdct/edit")
    public String detail(@RequestParam("id") Integer id,Model model){
        HDCT hdct = hdctRepo.findById(id).get();
        model.addAttribute("hdct",hdct);
        model.addAttribute("listCTSP",ctspRepo.findAll());
        model.addAttribute("listHD",hoaDonRepo.findAll());
        return "hdctedit";
    }

    @PostMapping("/hdct/add")
    public String add(@ModelAttribute("hdct") HDCT hdct,@RequestParam("id_hoa_don") Integer idHD, @RequestParam("id_ctsp") Integer idCTSP){
        HoaDon hoaDon = hoaDonRepo.findById(idHD).get();
        CTSP ctsp = ctspRepo.findById(idCTSP).get();
        hdct.setHoaDon(hoaDon);
        hdct.setCtsp(ctsp);
        hdct.setNgay_tao(new Date());
        hdct.setNgay_sua(new Date());
        hdctRepo.save(hdct);
        return "redirect:/hdct";
    }

    @PostMapping("/hdct/update")
    public String update(@ModelAttribute("hdct") HDCT hdct,@RequestParam("id_hoa_don") Integer idHD, @RequestParam("id_ctsp") Integer idCTSP){
        HoaDon hoaDon = hoaDonRepo.findById(idHD).get();
        CTSP ctsp = ctspRepo.findById(idCTSP).get();
        hdct.setHoaDon(hoaDon);
        hdct.setCtsp(ctsp);
        hdct.setNgay_tao(new Date());
        hdct.setNgay_sua(new Date());
        hdctRepo.save(hdct);
        return "redirect:/hdct";
    }
}
