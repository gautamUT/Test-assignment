package com.sectors.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sectors.dao.SectorDao;
import com.sectors.dao.UserDao;
import com.sectors.model.Sector;
import com.sectors.model.User;

@WebServlet("")
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Home() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String operation = "Add (Login if name already exists)";
		request.setAttribute("operation", operation);
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String operation = "Add (Login if name already exists)";
		User user = new User();
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);
		
		String name = request.getParameter("name").trim();
		if (name == null || "".equalsIgnoreCase(name)) {
			errors.put("name", "Please enter the valid name");
		} else {
			user.setName(name);
		}
		
		String agree = request.getParameter("agree");
		if (!"on".equalsIgnoreCase(agree)) {
			errors.put("agree", "You must agree to the terms");
		} else {
			user.setAgreed(true);
		}
		
		String[] sectorsParams = request.getParameterValues("sectors");
		if (sectorsParams == null) {
			errors.put("sectors", "You must check at least one sector");
		} else {
			Set<Integer> set = new HashSet<Integer>();
			for (String p : sectorsParams) {
				set.add(Integer.parseInt(p));
			}
			user.setSelectedSectors(set);
		}
		String editId = request.getParameter("editId");
		
		if (errors.isEmpty()) {
			ServletContext ctx = request.getServletContext();
			UserDao userDao = (UserDao) ctx.getAttribute("userDao");
			if (editId != null && !"".equalsIgnoreCase(editId)) {
				if (userDao.getUserById(Integer.parseInt(editId)) != null) {
					user.setId(Integer.parseInt(editId));
					userDao.updateUser(user);
				}
			} else {
				User checkUser = userDao.getUserByName(user.getName());
				if (checkUser == null) {
					editId = String.valueOf(userDao.addUser(user));
				} else {
					user = checkUser;
					editId = String.valueOf(checkUser.getId());
				}
			}
			
			operation = "Edit (name, sectors)";
		} else {
			if (editId != null && !"".equalsIgnoreCase(editId)) {
				operation = "Edit (name, sectors)";
			}
		}
		request.setAttribute("editId", editId);
		request.setAttribute("operation", operation);
		request.setAttribute("user", user);
		process(request, response);
		
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		ServletContext ctx = request.getServletContext();
		SectorDao sectorDao = (SectorDao) ctx.getAttribute("sectorDao");
		List<Sector> sectors = sectorDao.getAllSectors();
		request.setAttribute("sectors", sectors);
		
		request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
	}

}
