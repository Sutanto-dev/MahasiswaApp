<%-- 
    Document   : mahasiswa.baca
    Created on : 26 May 2025, 15.29.09
    Author     : sutantodwiputra
--%>

<%@ page import="crud.Mahasiswa" %>
<%
    String nim = request.getParameter("nim");
    Mahasiswa m = new Mahasiswa();
    if (nim != null) {
        m.baca(nim); // method baca akan isi properti mahasiswa
        request.setAttribute("mahasiswa", m);
    }
    request.getRequestDispatcher("mahasiswa.baca.view.jsp").forward(request, response);
%>


