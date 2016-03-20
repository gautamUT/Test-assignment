package com.sectors.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashSet;
import java.util.Set;
import javax.sql.DataSource;

import com.sectors.model.User;

public class UserDao {

	private DataSource dataSource;

	public UserDao(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public User getUserById(int id) {
		Connection conn = null;
		PreparedStatement stat = null;
		User user = null;
		String sql = "SELECT id, name, agreed FROM user where id = ?";
		try {
			conn = dataSource.getConnection();
			stat = conn.prepareStatement(sql);
			stat.setInt(1, id);
			ResultSet rs = stat.executeQuery();
			if (rs.next()) {
				String name = rs.getString("name");
				Boolean agreed = rs.getBoolean("agreed");
				user = new User(id, name, agreed);
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

		if (user != null) {
			user.setSelectedSectors(this.getUserSectors(user.getId()));
		}

		return user;
	}

	public User getUserByName(String name) {
		Connection conn = null;
		PreparedStatement stat = null;
		User user = null;
		String sql = "SELECT id, name, agreed FROM user where name = ?";
		try {
			conn = dataSource.getConnection();
			stat = conn.prepareStatement(sql);
			stat.setString(1, name);
			ResultSet rs = stat.executeQuery();
			if (rs.next()) {
				int id = rs.getInt("id");
				name = rs.getString("name");
				Boolean agreed = rs.getBoolean("agreed");
				user = new User(id, name, agreed);
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

		if (user != null) {
			user.setSelectedSectors(this.getUserSectors(user.getId()));
		}

		return user;
	}

	public int addUser(User user) {
		boolean created = false;
		Connection conn = null;
		PreparedStatement stat = null;
		String sql = "INSERT INTO user" + "(name, agreed) VALUES(?,?)";
		try {
			conn = dataSource.getConnection();
			stat = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			stat.setString(1, user.getName());
			stat.setBoolean(2, user.isAgreed());
			stat.executeUpdate();

			ResultSet generatedKeys = stat.getGeneratedKeys();
			if (generatedKeys.next()) {
				user.setId(generatedKeys.getInt(1));
				created = true;
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
		if (created) {
			this.setUserSectors(user);
			return user.getId();
		}
		return -1;
	}

	public void updateUser(User user) {
		Connection conn = null;
		PreparedStatement stat = null;
		String sql = "UPDATE USER SET NAME = ? WHERE id = ?";
		try {
			conn = dataSource.getConnection();
			stat = conn.prepareStatement(sql);
			stat.setString(1, user.getName());
			stat.setInt(2, user.getId());
			stat.executeUpdate();
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
		this.deleteUserSectors(user);
		this.setUserSectors(user);
	}

	private void deleteUserSectors(User user) {
		Connection conn = null;
		PreparedStatement stat = null;
		String sql = "DELETE from sector_has_user WHERE user_id = ?";
		try {
			conn = dataSource.getConnection();
			stat = conn.prepareStatement(sql);
			stat.setInt(1, user.getId());
			stat.executeUpdate();
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
	}

	private void setUserSectors(User user) {
		Connection conn = null;
		PreparedStatement stat = null;
		String sql = "INSERT INTO sector_has_user" + "(user_id, sector_id) VALUES(?,?)";
		try {
			conn = dataSource.getConnection();
			stat = conn.prepareStatement(sql);
			Set<Integer> sectors = user.getSelectedSectors();
			for (Integer i : sectors) {
				stat.setInt(1, user.getId());
				stat.setInt(2, i);
				stat.executeUpdate();
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
	}

	private Set<Integer> getUserSectors(int id) {
		Set<Integer> set = new HashSet<Integer>();
		Connection conn = null;
		PreparedStatement stat = null;
		String sql = "SELECT sector_id FROM sector_has_user where user_id = ?";
		try {
			conn = dataSource.getConnection();
			stat = conn.prepareStatement(sql);
			stat.setInt(1, id);
			ResultSet rs = stat.executeQuery();
			while (rs.next()) {
				int sector_id = rs.getInt("sector_id");
				set.add(sector_id);
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
		return set;
	}

}
