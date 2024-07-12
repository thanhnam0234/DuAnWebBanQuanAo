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
@Table(name = "hoa_don")
public class HoaDon {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @ManyToOne
    @JoinColumn(name = "id_khach_hang")
    private KhachHang khachHang;
    @Column(name = "dia_chi")
    private String dia_chi;
    @Column(name = "so_dien_thoai")
    private String so_dien_thoai;
    @Column(name = "trang_thai")
    private String trang_thai;
    @DateTimeFormat(style = "dd-MM-yyyy")
    @Column(name = "ngay_tao")
    private Date ngay_tao;
    @DateTimeFormat(style = "dd-MM-yyyy")
    @Column(name = "ngay_sua")
    private Date ngay_sua;
}
