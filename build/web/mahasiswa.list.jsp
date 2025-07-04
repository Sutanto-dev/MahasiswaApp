<%-- 
    Document   : mahasiswa.list
    Created on : 26 May 2025, 15.33.48
    Author     : sutantodwiputra
--%>

<%@page import="java.sql.*, java.util.*, crud.Mahasiswa"%>
<%
    List<Mahasiswa> daftar = new ArrayList<>();

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_mahasiswa", "root", "");
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM mahasiswa");

        while (rs.next()) {
            Mahasiswa m = new Mahasiswa();
            m.nim = rs.getString("nim");
            m.nama = rs.getString("nama");
            m.nilai = rs.getInt("nilai");
            daftar.add(m);
        }

        rs.close();
        st.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    request.setAttribute("daftarMahasiswa", daftar);
    request.getRequestDispatcher("mahasiswa.list.view.jsp").forward(request, response);
%>

