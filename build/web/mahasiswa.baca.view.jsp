<%-- 
    Document   : mahasiswa.baca.view
    Created on : 26 May 2025, 15.30.17
    Author     : sutantodwiputra
--%>

<%@ page import="crud.Mahasiswa" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Edit Mahasiswa</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
     <!-- Font Awesome untuk ikon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="assets/css/style.css">

</head>
<body class="container mt-4">
        <!-- Header -->
        <div class="page-header" style="text-align: center;">
            <img src="assets/univ-logo.png" alt="Logo" style="height: 80px; margin-bottom: 10px;">
            <h1 class="text-uppercase">Sistem Manajemen Mahasiswa</h1>
            <p>Kelola data mahasiswa dengan mudah dan efisien</p>
        </div>    <%
        Mahasiswa m = (Mahasiswa) request.getAttribute("mahasiswa");
        if (m == null) {
    %>
        <div class="alert alert-warning">Data mahasiswa tidak ditemukan.</div>
    <%
        } else {
    %>
        <div class="form-section">
            <h4><i class="fas fa-user-edit me-2" style="color: #892b30;"></i>Edit Mahasiswa</h4>
            <form action="mahasiswa.update.jsp" method="post" class="mt-3">
                <div class="row">
                    <div class="col-md-4 mb-3">
                        <label for="nim" class="form-label">NIM</label>
                        <input type="text" name="nim" id="nim" class="form-control" value="<%= m.nim %>" readonly>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="nama" class="form-label">Nama Lengkap</label>
                        <input type="text" name="nama" id="nama" class="form-control" value="<%= m.nama %>" required>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="nilai" class="form-label">Nilai</label>
                        <input type="number" name="nilai" id="nilai" class="form-control" value="<%= m.nilai %>" required>
                    </div>
                </div>

                <div class="d-flex gap-2 justify-content-end">
                    <button type="submit" class="btn btn-sm ms-3" style="color: #ffffff; background-color: #282f49; border: none;">
                        <i class="fas fa-save me-3"></i>Update
                    </button>
                    <a href="mahasiswa.list.jsp" class="btn btn-secondary ml-2">Batal</a>
                </div>
            </form>
        </div>

    <%
        }
    %>

</body>
</html>


