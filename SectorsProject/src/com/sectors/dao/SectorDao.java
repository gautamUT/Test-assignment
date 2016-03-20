package com.sectors.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import javax.sql.DataSource;
import com.sectors.model.Sector;

public class SectorDao {

	private DataSource dataSource;
	
	public SectorDao(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public List<Sector> getAllSectors() {
		List<Sector> list= new ArrayList<Sector>();
		
		Connection conn = null;
		Statement stat = null;

		String sql = "SELECT root.id as root_id, root.name as root_name, "
				+ "down1.id as down1_id, down1.name as down1_name, "
				+ "down2.id as down2_id, down2.name as down2_name, "
				+ "down3.id as down3_id, down3.name as down3_name "
				+ "FROM sector as root "
				+ "left outer join sector as down1 on down1.parent = root.id "
				+ "left outer join sector as down2 on down2.parent = down1.id "
				+ "left outer join sector as down3 on down3.parent = down2.id "
				+ "where root.parent is null order by root_name, down1_name, down2_name, down3_name";

		try {
			conn = dataSource.getConnection();
			stat = conn.createStatement();
			ResultSet rs = stat.executeQuery(sql);
			Map<String, String> map = new LinkedHashMap<String,String>();
			
			while (rs.next()) {
				String root_id = rs.getString("root_id");
				String root_name = rs.getString("root_name");
				String down1_id = rs.getString("down1_id");
				String down1_name = rs.getString("down1_name");
				String down2_id = rs.getString("down2_id");
				String down2_name = rs.getString("down2_name");	
				String down3_id = rs.getString("down3_id");
				String down3_name = rs.getString("down3_name");
				if(!map.containsKey(root_id) && root_id != null) {
					map.put(root_id, root_name);
				}
				if(!map.containsKey(down1_id) && down1_id != null) {
					map.put(down1_id, down1_name);
				}
				if(!map.containsKey(down2_id) && down2_id != null) {
					map.put(down2_id, down2_name);
				}
				if(!map.containsKey(down3_id) && down3_id != null) {
					map.put(down3_id, down3_name);
				}
			}
			for (Entry<String, String> entry : map.entrySet()) {
				//System.out.println(entry.getKey() + "    " + entry.getValue());
				list.add(new Sector(Integer.parseInt(entry.getKey()),entry.getValue()));
			}
			

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (stat != null) {
				try {
					stat.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return list;
	}
}
