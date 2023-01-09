package com.app.dao;

import com.app.entity.Author;
import com.app.entity.Book;
import io.dropwizard.hibernate.AbstractDAO;
import org.hibernate.SessionFactory;

import java.util.List;

public class BookDao extends AbstractDAO<Book> {


    /**
     * Creates a new DAO with a given session provider.
     *
     * @param sessionFactory a session provider
     */
    public BookDao(SessionFactory sessionFactory) {
        super(sessionFactory);
    }

    public List<Book> getAll(){
        return query("SELECT * FROM Bok").getResultList();
    }

    public List<Book> getById(Integer id){
        return query("select * from Book where authId"+id).getResultList();
    }
    public Integer save(Book book) {
        return persist(book).getBookId();
    }
}
