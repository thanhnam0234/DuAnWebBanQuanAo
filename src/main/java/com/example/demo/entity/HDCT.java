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
@Table(name = "hdct")
public class HDCT {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @ManyToOne
    @JoinColumn(name = "id_hoa_don")
    private HoaDon hoaDon;
    @ManyToOne
    @JoinColumn(name = "id_ctsp")
    private CTSP ctsp;
    @Column(name = "so_luong_mua")
    private Integer so_luong_mua;
    @Column(name = "gia_ban")
    private Double gia_ban;
    @Column(name = "tong_tien")
    private Double tong_tien;
    @Column(name = "trang_thai")
    private String trang_thai;
    @DateTimeFormat(style = "dd-MM-yyyy")
    @Column(name = "ngay_tao")
    private Date ngay_tao;
    @DateTimeFormat(style = "dd-MM-yyyy")
    @Column(name = "ngay_sua")
    private Date ngay_sua;
}
