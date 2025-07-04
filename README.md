# 🎓 MahasiswaApp - Sistem Manajemen Data Mahasiswa

Aplikasi web untuk pengelolaan data mahasiswa menggunakan **Java EE**, **JSP**, **Servlet**, dan **MySQL** dengan arsitektur **MVC (Model-View-Controller)**.

## ✨ Fitur Utama

- **CRUD Data Mahasiswa** - Tambah, lihat, edit, dan hapus data mahasiswa
- **Pencarian & Filter** - Cari berdasarkan nama atau NIM
- **Dashboard Sederhana** - Ringkasan data mahasiswa
- **Responsive Design** - Dapat diakses dari berbagai perangkat

## 🛠️ Teknologi yang Digunakan

- **Java EE** - Backend framework
- **JSP & Servlet** - Web layer
- **MySQL** - Database
- **Apache Tomcat** - Web server

## 💻 Kebutuhan Sistem

- **JDK 8+**
- **Apache Tomcat 9+**
- **MySQL 8+**
- **NetBeans IDE** (opsional)

## 🚀 Instalasi

### 1. Clone Repository
```bash
git clone https://github.com/Sutanto-dev/MahasiswaApp.git
cd MahasiswaApp
```

### 2. Setup Database
```sql
CREATE DATABASE db_mahasiswa;
USE db_mahasiswa;
SOURCE database/schema.sql;
```

### 3. Konfigurasi Database
Edit file `src/java/utils/DatabaseConnection.java`:
```java
private static final String URL = "jdbc:mysql://localhost:3306/db_mahasiswa";
private static final String USERNAME = "your_username";
private static final String PASSWORD = "your_password";
```

### 4. Tambahkan Dependencies
Pastikan file JAR berikut ada di `web/WEB-INF/lib/`:
- `mysql-connector-j-9.0.0.jar`
- `jstl-1.2.jar`
- `servlet-api.jar`

### 5. Build & Run
```bash
# Build dengan Ant
ant clean build

# Atau langsung run dari NetBeans
# Klik kanan proyek → Run
```

## 📱 Penggunaan

Akses aplikasi di browser:
```
http://localhost:8080/MahasiswaApp/
```

**Halaman Utama:**
- `/` - Dashboard
- `/mahasiswa/tambah` - Form tambah mahasiswa
- `/mahasiswa/daftar` - Daftar mahasiswa
- `/mahasiswa/edit?id=xxx` - Edit data

## 🐛 Troubleshooting

**Database Connection Error:**
- Pastikan MySQL server berjalan
- Cek username/password database

**ClassNotFoundException:**
- Pastikan MySQL connector ada di folder `lib/`
- Restart Tomcat

**Port 8080 sudah digunakan:**
```bash
netstat -tulpn | grep :8080
kill -9 <PID>
```

## 🤝 Kontribusi

1. Fork repository
2. Buat branch baru: `git checkout -b feature/fitur-baru`
3. Commit changes: `git commit -m "Add fitur baru"`
4. Push ke branch: `git push origin feature/fitur-baru`
5. Buat Pull Request

## 📄 Lisensi

Proyek ini dilisensikan di bawah [MIT License](LICENSE).

---

## 👨‍💻 Developer Info

**Sutanto Dwi Putra**  
NIM: 22110233 | Kelas: L2022  
📧 sutantodputra@gmail.com  
🔗 [GitHub](https://github.com/Sutanto-dev)

---
