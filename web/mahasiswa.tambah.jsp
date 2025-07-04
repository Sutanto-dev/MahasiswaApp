    <%-- 
    Document   : mahasiswa.tambah
    Created on : 26 May 2025, 15.06.23
    Author     : sutantodwiputra
--%>

<%@page import="crud.Mahasiswa"%>
<%
    Mahasiswa m = new Mahasiswa();
    m.nim = request.getParameter("nim");
    m.nama = request.getParameter("nama");
    m.nilai = Integer.parseInt(request.getParameter("nilai"));

    if (m.tambah()) {
        response.sendRedirect("mahasiswa.list.jsp");
    } else {
        out.println("Data gagal ditambahkan");
    }
%>

