package com.example.demo.controller;



import com.example.demo.entity.Size;
import com.example.demo.service.SizeRepo;
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
public class SizeController {
    @Autowired
    public SizeRepo sizeRepo;
    @GetMapping("/size")
    public String page(@RequestParam(value = "pageNo", defaultValue = "0") Integer pageNo, Model model){
        Pageable pageable = PageRequest.of(pageNo, 2, Sort.unsorted());
        Page<Size> page = sizeRepo.findAll(pageable);
        model.addAttribute("page", page);
        model.addAttribute("list",sizeRepo.findAll());
        return "size";
    }
    @GetMapping("/size/delete")
    public String delete(@RequestParam("id") Integer id){
        sizeRepo.deleteById(id);
        return "redirect:/size";
    }
    @GetMapping("/size/edit")
    public String detail(@RequestParam("id") Integer id,Model model){
        Size size = sizeRepo.findById(id).get();
        model.addAttribute("s",size);
        return "sizeedit";
    }



    @PostMapping("/size/add")
    public String add(@ModelAttribute("size") Size size){
        size.setNgay_tao(new Date());
        size.setNgay_sua(new Date());
        sizeRepo.save(size);
        return "redirect:/size";
    }
    @PostMapping("/size/update")
    public String update(@ModelAttribute("size") Size size){
        size.setNgay_tao(new Date());
        size.setNgay_sua(new Date());
        sizeRepo.save(size);
        return "redirect:/size";
    }
}
