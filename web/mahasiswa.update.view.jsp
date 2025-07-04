<%-- 
    Document   : mahasiswa.update.view
    Created on : 26 May 2025, 15.29.38
    Author     : sutantodwiputra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <body>
        <h2>Update Mahasiswa</h2>
        <% Boolean status = (Boolean) request.getAttribute("status"); %>
        <% if (status != null && status) { %>
            <p>Data berhasil diupdate</p>
        <% } else { %>
            <p>Data gagal diupdate</p>
        <% } %>
    </body>
</html>
