<%-- 
    Document   : mahasiswa.tambah.view
    Created on : 26 May 2025, 15.31.07
    Author     : sutantodwiputra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <body>
        <h2>Tambah Mahasiswa</h2>
        <% Boolean status = (Boolean) request.getAttribute("status"); %>
        <% if (status != null && status) { %>
            <p>Data berhasil ditambahkan</p>
        <% } else { %>
            <p>Data gagal ditambahkan</p>
        <% } %>
    </body>
</html>

