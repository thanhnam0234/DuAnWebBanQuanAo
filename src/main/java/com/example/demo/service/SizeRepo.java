package com.example.demo.service;

import com.example.demo.entity.Size;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SizeRepo extends JpaRepository<Size, Integer> {
}
