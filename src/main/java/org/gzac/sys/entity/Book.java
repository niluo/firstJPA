package org.gzac.sys.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by zhf on 2017-1-13.
 */
@Entity
@Table(name="boook")
public class Book implements Serializable{
    @Id
    @SequenceGenerator(name="boookSeq",sequenceName = "sequence_boook")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "boookSeq")

    private Long Id;
    private String name;
    private String price;
    private Date prodDate;

    public Long getId() {
        return Id;
    }

    public void setId(Long id) {
        Id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public Date getProdDate() {
        return prodDate;
    }

    public void setProdDate(Date prodDate) {
        this.prodDate = prodDate;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    private String author;




}
