package com.app.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Data
@Table(name="book")
public class Book {
    @Id
    @Column(name="book_Id")
    @JsonProperty
    private Integer bookId;

    @Column(name="book_Name")
    @JsonProperty
    private String bookName;
}
