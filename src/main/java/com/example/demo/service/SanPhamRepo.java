package com.example.demo.service;


import com.example.demo.entity.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SanPhamRepo extends JpaRepository<SanPham, Integer> {
}
