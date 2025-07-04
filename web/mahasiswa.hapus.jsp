<%-- 
    Document   : mahasiswa.hapus
    Created on : 26 May 2025, 15.47.14
    Author     : sutantodwiputra
--%>

<%@ page import="crud.Mahasiswa" %>
<%
    String nim = request.getParameter("nim");
    if (nim != null) {
        Mahasiswa m = new Mahasiswa();
        m.nim = nim;
        if (m.hapus()) {
            response.sendRedirect("mahasiswa.list.jsp");
        } else {
            out.println("Gagal hapus data.");
        }
    } else {
        out.println("NIM tidak ditemukan.");
    }
%>

