package org.gzac.sys.controller;

import org.gzac.sys.entity.Book;
import org.gzac.sys.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by zhf on 2017-1-13.
 */

@RestController
@RequestMapping(value = "/conBook")
public class BookController {
    @Autowired
    private BookService bookService;

   /* @RequestMapping(value = "/index")
    public String index(Model model) {
        List<Book> bookList = bookService.findAll();
        model.addAttribute("bookList", bookList);
        return "index";
    }*/

    @RequestMapping(value = "/addBook", method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8")
    public Map saveBook(String name, String price, String author) {
        System.out.println(name);
        Book book = new Book();
        book.setName(name);
        book.setPrice(price);
        book.setAuthor(author);
        Map map = new HashMap();
        if(bookService.save(book)!=null){
            map.put("rs","success");
        }else{
            map.put("rs","error");
        }
        return map;
    }
    @RequestMapping(value = "/updateBook", method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8")
    public Map updateBook(Long id, String name, String price, String author) {
        Book book = new Book();
        book.setId(id);
        book.setName(name);
        book.setPrice(price);
        book.setAuthor(author);
        Map map = new HashMap();
        if(bookService.update(book)!=null){
            map.put("rs","success");
        }else{
            map.put("rs","error");
        }
        return map;
    }
    @RequestMapping(value = "/deleteBook", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8")
    public String deleteBook(Long id) {
        bookService.delete(id);
        return "success";
    }
}
