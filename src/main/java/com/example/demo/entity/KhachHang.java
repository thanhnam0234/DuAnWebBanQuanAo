package com.example.demo.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "khach_hang")
public class KhachHang {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "ho_ten")
    private String ho_ten;
    @Column(name = "dia_chi")
    private String dia_chi;
    @Column(name = "sdt")
    private String sdt;
    @Column(name = "trang_thai")
    private String trang_thai;
    @DateTimeFormat(style = "dd-MM-yyyy")
    @Column(name = "ngay_tao")
    private Date ngay_tao;
    @DateTimeFormat(style = "dd-MM-yyyy")
    @Column(name = "ngay_sua")
    private Date ngay_sua;
}
