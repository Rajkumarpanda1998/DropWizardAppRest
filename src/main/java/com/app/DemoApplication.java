package com.app;

import com.app.config.MyConfiguration;
import com.app.dao.AuthorDao;
import com.app.dao.BookDao;
import com.app.entity.Author;
import com.app.entity.Book;
import com.app.resources.AuthorResource;
import io.dropwizard.Application;
import io.dropwizard.db.DataSourceFactory;

import io.dropwizard.hibernate.HibernateBundle;
import io.dropwizard.setup.Bootstrap;
import io.dropwizard.setup.Environment;

public class DemoApplication extends Application<MyConfiguration> {

    public static void main(String[] args)  {
        try {
            new DemoApplication().run(args);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void run(MyConfiguration configuration, Environment environment) throws Exception {
        final AuthorDao authorDao=new AuthorDao(hibernateAuthor.getSessionFactory());
        environment.jersey().register(new AuthorResource(authorDao));
        final BookDao bookDao=new BookDao(hibernateBook.getSessionFactory());
        environment.jersey().register(bookDao);
    }

    private final HibernateBundle<MyConfiguration> hibernateAuthor = new HibernateBundle<MyConfiguration>(Author.class) {
        @Override
        public DataSourceFactory getDataSourceFactory(MyConfiguration configuration) {
            return configuration.getDataSourceFactory();
        }

    };
    private final HibernateBundle<MyConfiguration> hibernateBook = new HibernateBundle<MyConfiguration>(Book.class){
        @Override
        public DataSourceFactory getDataSourceFactory(MyConfiguration configuration) {
            return configuration.getDataSourceFactory();
        }
    };
    @Override
    public void initialize(Bootstrap<MyConfiguration> bootstrap) {
        bootstrap.addBundle(hibernateAuthor);
    }
}
