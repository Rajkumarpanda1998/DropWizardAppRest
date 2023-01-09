package com.app.resources;

import com.app.dao.AuthorDao;
import com.app.dao.BookDao;
import com.app.entity.Author;
import com.app.entity.Book;
import io.dropwizard.hibernate.AbstractDAO;
import io.dropwizard.hibernate.UnitOfWork;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.List;

public class BookResource {
    private BookDao bookDao;

    public BookResource(BookDao bookDao) {
        this.bookDao = bookDao;
    }
    @GET
    @Path("/all")
    @Produces(MediaType.APPLICATION_JSON)
    @UnitOfWork
    public List<Book> getInfo()
    {
        return bookDao.getAll();
    }
    @GET
    @Path("/find/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    @UnitOfWork
    public List<Book> getOne(@PathParam("id") Integer id) {
        return bookDao.getById(id);
    }

    @POST
    @Path("/create")
    @UnitOfWork
    public Integer create(Book book) {
        return bookDao.save(book);
    }
}
