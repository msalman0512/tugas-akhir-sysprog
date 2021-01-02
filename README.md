# Tugas Akhir Sysprog

Proyek ini dibuat sebagai proyek untuk tugas akhir mata kuliah Pemrograman Sistem. Pada proyek ini kami membuat *Snapshot* yang bisa digunakan untuk mengambil foto dan video, live stream video, dan melakukan pengambilan foto dengan status. Terdapat program CLI, yang akan menampilkan pemilihan fitur yang akan digunakan. Kemudian program akan tereksekusi sesuai dengan pilihan pengguna. 

Berikut adalah cara penggunaannya:
1. Unduh program yang terdapat pada github https://github.com/msalman0512/tugas-akhir-sysprog 
2. Membuka VM Box dan melakukan kompilasi serta instalasi kernel menggunakan konfigurasi yang diunduh pada https://drive.google.com/drive/u/0/folders/1fGx67ULcu9uGeFuKSuonI-8E8Jsvaw7t
3. (Jika belum ada webcam yang ter-attach) Ketik command “VBoxManage controlvm <nama ova> webcam attach .1” pada file location Oracle VM VirtualBox.
4. Untuk menjalankan program ini, user disarankan berada dalam mode ‘root’
5. Jalankan program install.sh untuk mengunduh package yang diperlukan
6. Gunakan command ‘xinit’ agar dapat menampilkan GUI
7. Run file app.sh untuk mulai menggunakan program
