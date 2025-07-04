<%-- 
    Document   : mahasiswa.list.view
    Created on : 26 May 2025, 15.34.07
    Author     : sutantodwiputra
--%>
<%@ page import="java.util.*, crud.Mahasiswa" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistem Manajemen Mahasiswa</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome untuk ikon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/style.css">

</head>
<body>
    <div class="container">
        <!-- Header -->
        <div class="page-header" style="text-align: center;">
            <img src="assets/univ-logo.png" alt="Logo" style="height: 80px; margin-bottom: 10px;">
            <h1 class="text-uppercase">Sistem Manajemen Mahasiswa</h1>
            <p>Kelola data mahasiswa dengan mudah dan efisien</p>
        </div>


        
        <!-- Stats Cards -->
        <div class="stats-grid">
            <div class="stat-card">
                <div class="icon">
                    <i class="fas fa-users" style="color: #892b30;"></i>
                </div>
                <div class="value" id="totalMahasiswa">0</div>
                <div class="label">Total Mahasiswa</div>
            </div>
            <div class="stat-card">
                <div class="icon">
                    <i class="fas fa-chart-line" style="color: #892b30;"></i>
                </div>
                <div class="value" id="rataRata">0</div>
                <div class="label">Rata-rata Nilai</div>
            </div>
            <div class="stat-card">
                <div class="icon">
                    <i class="fas fa-trophy" style="color: #892b30;"></i>
                </div>
                <div class="value" id="nilaiTertinggi">0</div>
                <div class="label">Nilai Tertinggi</div>
            </div>
        </div>
        
        <!-- Search Section -->
        <div class="search-section">
          <h4><i class="fas fa-user-graduate me-2" style="color: #892b30;"></i>Data Mahasiswa</h4>

            <div class="search-input mb-4">
                <i class="fas fa-search"></i>
                <input type="text" id="searchInput" placeholder="Cari berdasarkan NIM atau nama mahasiswa...">
            </div>
            
                   <!-- Table Section -->
        <div class="table-section">
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>NIM</th>
                            <th>Nama Mahasiswa</th>
                            <th>Nilai</th>
                            <th>Grade</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody id="mahasiswaTable">
                    <%
                        List<Mahasiswa> daftar = (List<Mahasiswa>) request.getAttribute("daftarMahasiswa");
                        if (daftar != null && !daftar.isEmpty()) {
                            for (Mahasiswa m : daftar) {
                                String grade = "";
                                String gradeClass = "";
                                int nilai = m.nilai;
                                if (nilai >= 85) { grade = "A"; gradeClass = "grade-a"; }
                                else if (nilai >= 70) { grade = "B"; gradeClass = "grade-b"; }
                                else if (nilai >= 60) { grade = "C"; gradeClass = "grade-c"; }
                                else { grade = "D"; gradeClass = "grade-d"; }
                    %>
                        <tr>
                            <td><%= m.nim %></td>
                            <td>
                                <div class="student-info text-center">
                                    <div class="student-avatar">
                                        <i class="fas fa-user" ></i>
                                    </div>
                                    <%= m.nama %>
                                </div>
                            </td>
                            <td><%= m.nilai %></td>
                            <td><span class="grade-badge <%= gradeClass %>"><%= grade %></span></td>
                            <td>
                                <a href="mahasiswa.baca.jsp?nim=<%= m.nim %>" 
                                    class="btn btn-sm" 
                                    style="color: #ffffff; background-color: #282f49; border: none;">
                                    <i class="fas fa-edit me-1"></i>Edit
                                 </a>

                                 <a href="mahasiswa.hapus.jsp?nim=<%= m.nim %>" 
                                    class="btn btn-sm" 
                                    style="color: #ffffff; background-color: #892b30; border: none;"
                                    onclick="return confirm('Yakin ingin menghapus data <%= m.nama %>?')">
                                    <i class="fas fa-trash me-1"></i>Hapus
                                 </a>

                            </td>
                        </tr>
                    <%
                            }
                        } else {
                    %>
                        <tr>
                            <td colspan="5">
                                <div class="empty-state">
                                    <i class="fas fa-user-slash"></i>
                                    <h4>Belum ada data mahasiswa</h4>
                                    <p>Silakan tambahkan data mahasiswa baru menggunakan form di bawah</p>
                                </div>
                            </td>
                        </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
        
        </div>
        
 
        <!-- Form Section -->
        <div class="form-section">
            <h4><i class="fas fa-user-plus me-2" style="color: #892b30;"></i>Tambah Mahasiswa Baru</h4>
            <form action="mahasiswa.tambah.jsp" method="post" id="formTambah">
                <div class="row">
                    <div class="col-md-4 mb-3">
                        <label for="nim" class="form-label">NIM</label>
                        <input type="text" name="nim" id="nim" class="form-control" placeholder="Masukkan NIM" required>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="nama" class="form-label">Nama Lengkap</label>
                        <input type="text" name="nama" id="nama" class="form-control" placeholder="Masukkan nama lengkap" required>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="nilai" class="form-label">Nilai</label>
                        <input type="number" name="nilai" id="nilai" class="form-control" 
                               placeholder="0-100" min="0" max="100" required>
                    </div>
                </div>
                <div class="d-flex gap-2 justify-content-end">
                    <button type="reset" class="btn btn-outline-secondary">
                        <i class="fas fa-undo me-1"></i>Reset
                    </button>
                    <button type="submit" class="btn btn-sm" style="color: #ffffff; background-color: #282f49; border: none;">
                        <i class="fas fa-plus me-1"></i>Tambah Mahasiswa
                    </button>
                </div>
            </form>
        </div>
    </div>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Calculate and display statistics
        document.addEventListener('DOMContentLoaded', function() {
            const rows = document.querySelectorAll('#mahasiswaTable tr:not(:last-child)');
            const totalElement = document.getElementById('totalMahasiswa');
            const avgElement = document.getElementById('rataRata');
            const maxElement = document.getElementById('nilaiTertinggi');
            
            if (rows.length > 0 && !document.querySelector('.empty-state')) {
                let total = rows.length;
                let sum = 0;
                let max = 0;
                
                rows.forEach(row => {
                    const nilaiText = row.cells[2].textContent.trim();
                    const nilai = parseInt(nilaiText);
                    if (!isNaN(nilai)) {
                        sum += nilai;
                        max = Math.max(max, nilai);
                    }
                });
                
                totalElement.textContent = total;
                avgElement.textContent = total > 0 ? Math.round(sum / total) : 0;
                maxElement.textContent = max;
            }
            
            // Form validation
            const form = document.getElementById('formTambah');
            form.addEventListener('submit', function(e) {
                const nim = document.getElementById('nim').value.trim();
                const nama = document.getElementById('nama').value.trim();
                const nilai = parseInt(document.getElementById('nilai').value);
                
                if (!nim || !nama || isNaN(nilai) || nilai < 0 || nilai > 100) {
                    e.preventDefault();
                    alert('Mohon isi semua field dengan benar!');
                    return;
                }
            });
            
            // Search functionality
            const searchInput = document.getElementById('searchInput');
            const tableRows = document.querySelectorAll('#mahasiswaTable tr:not(:last-child)');
            
            searchInput.addEventListener('input', function() {
                const searchTerm = this.value.toLowerCase().trim();
                let visibleCount = 0;
                
                if (!document.querySelector('.empty-state')) {
                    tableRows.forEach(row => {
                        const nim = row.cells[0].textContent.toLowerCase();
                        const nama = row.cells[1].textContent.toLowerCase();
                        
                        if (nim.includes(searchTerm) || nama.includes(searchTerm)) {
                            row.classList.remove('hidden');
                            row.style.display = '';
                            visibleCount++;
                        } else {
                            row.classList.add('hidden');
                            row.style.display = 'none';
                        }
                    });
                    
                    // Update total count in stats
                    if (searchTerm) {
                        document.getElementById('totalMahasiswa').textContent = visibleCount;
                    } else {
                        document.getElementById('totalMahasiswa').textContent = tableRows.length;
                    }
                }
            });
        });
    </script>
</body>
</html>