package org.gzac.sys.dao;


import org.gzac.sys.entity.Book;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by Administrator on 2017-1-13.
 */
public interface BookDao extends JpaRepository<Book,Long>{

}
