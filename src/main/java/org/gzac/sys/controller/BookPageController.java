package org.gzac.sys.controller;

import org.gzac.sys.entity.Book;
import org.gzac.sys.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by zhf on 2017-1-13.
 */

@Controller
@RequestMapping(value = "/pageBook")
public class BookPageController {
    @Autowired
    private BookService bookService;

    @RequestMapping(value = "/index")
    public String index(Model model) {
        List<Book> bookList = bookService.findAll();
        model.addAttribute("bookList", bookList);
        System.out.println("aaaaaaaaaaaaaaaaaaaabb");
        return "index";
    }


}
