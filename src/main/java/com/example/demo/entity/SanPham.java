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
@Table(name = "san_pham")
public class SanPham {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "ma_san_pham")
    private String ma_san_pham;
    @Column(name = "ten_san_pham")
    private String ten_san_pham;
    @ManyToOne
    @JoinColumn(name = "id_danh_muc")
    private DanhMuc danhMuc;
    @Column(name = "trang_thai")
    private String trang_thai;
    @DateTimeFormat(style = "dd-MM-yyyy")
    @Column(name = "ngay_tao")
    private Date ngay_tao;
    @DateTimeFormat(style = "dd-MM-yyyy")
    @Column(name = "ngay_sua")
    private Date ngay_sua;

}
