package com.sectors.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
import com.sectors.dao.SectorDao;
import com.sectors.dao.UserDao;

@WebListener
public class DatabaseInit implements ServletContextListener {

	private MysqlDataSource dataSource;
	
    public DatabaseInit() {
    }

    public void contextDestroyed(ServletContextEvent servletContextEvent)  { 
    }

    public void contextInitialized(ServletContextEvent servletContextEvent)  { 
		dataSource =  new MysqlDataSource();
		dataSource.setURL("jdbc:mysql://localhost:3306/db");
		dataSource.setUser("root");
		dataSource.setPassword("password");
		
		ServletContext context = servletContextEvent.getServletContext();
		
		UserDao userDao = new UserDao(dataSource);
		context.setAttribute("userDao", userDao);
		SectorDao sectorDao = new SectorDao(dataSource);
		context.setAttribute("sectorDao", sectorDao);
    }
	
}
