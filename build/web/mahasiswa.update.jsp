<%-- 
    Document   : mahasiswa.update
    Created on : 26 May 2025, 15.28.40
    Author     : sutantodwiputra
--%>

<%@ page import="crud.Mahasiswa" %>
<%
    Mahasiswa m = new Mahasiswa();
    m.nim = request.getParameter("nim");
    m.nama = request.getParameter("nama");
    m.nilai = Integer.parseInt(request.getParameter("nilai"));

    if (m.update()) {
        response.sendRedirect("mahasiswa.list.jsp");
    } else {
        out.println("Update gagal");
    }
%>

