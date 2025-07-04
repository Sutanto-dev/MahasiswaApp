/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package crud;

/**
 *
 * @author sutantodwiputra
 */

import java.sql.*;

public class Mahasiswa {

    public String nim;
    public String nama;
    public Integer nilai;

    public boolean tambah()  {
        String DBDRIVER = "com.mysql.cj.jdbc.Driver";
        String DBCONNECTION = "jdbc:mysql://localhost:3306/db_mahasiswa";
        String DBUSER = "root";
        String DBPASS = "";
        
        Connection conn = null;
        PreparedStatement st;

        try {
            Class.forName(DBDRIVER);
            conn = DriverManager.getConnection(DBCONNECTION, DBUSER, DBPASS);

            // prepare select statement
            String sql = "INSERT INTO mahasiswa (nim,nama,nilai) values (?,?,?)";
            st = conn.prepareStatement(sql);
            st.setString(1, this.nim);
            st.setString(2, this.nama);
            st.setInt(3, this.nilai);
            st.executeUpdate();
            conn.close();
            return true;
        } catch (Exception ex) {
            return false;
        }

    }
    
    public boolean update() {
        String DBDRIVER = "com.mysql.cj.jdbc.Driver";
        String DBCONNECTION = "jdbc:mysql://localhost:3306/db_mahasiswa";
        String DBUSER = "root";
        String DBPASS = "";

        Connection conn = null;
        PreparedStatement st = null;

        try {
            Class.forName(DBDRIVER);
            conn = DriverManager.getConnection(DBCONNECTION, DBUSER, DBPASS);

            String sql = "UPDATE mahasiswa SET nama = ?, nilai = ? WHERE nim = ?";
            st = conn.prepareStatement(sql);
            st.setString(1, this.nama);
            st.setInt(2, this.nilai);
            st.setString(3, this.nim);

            int affectedRows = st.executeUpdate();
            conn.close();
            return affectedRows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


    
    public void baca(String nim) {
        String DBDRIVER = "com.mysql.cj.jdbc.Driver";
        String DBCONNECTION = "jdbc:mysql://localhost:3306/db_mahasiswa";
        String DBUSER = "root";
        String DBPASS = "";

        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            Class.forName(DBDRIVER);
            conn = DriverManager.getConnection(DBCONNECTION, DBUSER, DBPASS);
            String sql = "SELECT * FROM mahasiswa WHERE nim = ?";
            st = conn.prepareStatement(sql);
            st.setString(1, nim);
            rs = st.executeQuery();

            if (rs.next()) {
                this.nim = rs.getString("nim");
                this.nama = rs.getString("nama");
                this.nilai = rs.getInt("nilai");
            } else {
                this.nim = null; // data tidak ditemukan
            }

            rs.close();
            st.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean hapus() {
        String DBDRIVER = "com.mysql.cj.jdbc.Driver";
        String DBCONNECTION = "jdbc:mysql://localhost:3306/db_mahasiswa";
        String DBUSER = "root";
        String DBPASS = "";

        Connection conn = null;
        PreparedStatement st = null;

        try {
            Class.forName(DBDRIVER);
            conn = DriverManager.getConnection(DBCONNECTION, DBUSER, DBPASS);

            String sql = "DELETE FROM mahasiswa WHERE nim = ?";
            st = conn.prepareStatement(sql);
            st.setString(1, this.nim);

            int affectedRows = st.executeUpdate();
            conn.close();
            return affectedRows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


}