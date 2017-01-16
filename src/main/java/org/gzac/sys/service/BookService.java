package org.gzac.sys.service;

import org.gzac.sys.dao.BookDao;
import org.gzac.sys.entity.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Administrator on 2017-1-13.
 */

@Service
@Transactional
public class BookService {
    @Autowired
    private BookDao bookDao;


    public Book save(Book book){
        return bookDao.save(book);
    }
    public void delete(Long id){
        bookDao.delete(id);
    }
    public  Book update(Book book){
        return bookDao.saveAndFlush(book);
    }
    public List<Book> findAll(){
        return bookDao.findAll();
    }

}
