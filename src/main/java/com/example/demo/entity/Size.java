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
@Table(name = "size")
public class Size {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "ma_size")
    private String ma_size;
    @Column(name = "ten_size")
    private String ten_size;
    @Column(name = "trang_thai")
    private String trang_thai;
    @DateTimeFormat(style = "dd-MM-yyyy")
    @Column(name = "ngay_tao")
    private Date ngay_tao;
    @DateTimeFormat(style = "dd-MM-yyyy")
    @Column(name = "ngay_sua")
    private Date ngay_sua;
}
