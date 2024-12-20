# log-archive-tool

#Cara Menggunakan
Simpan script ini sebagai log-archive.sh.
Berikan izin eksekusi:
chmod +x log-archive.sh

#Jalankan script dengan memberikan direktori log sebagai argumen:
./log-archive.sh /var/log

#Output
File terkompresi: File log akan disimpan di /var/log/archives dengan nama format logs_archive_YYYYMMDD_HHMMSS.tar.gz.
Log operasional: Informasi pengarsipan akan dicatat di /var/log/log-archive.log.

#Fitur
Mengecek keberadaan direktori log sebelum melanjutkan.
Membuat direktori arsip (/var/log/archives) jika belum ada.
Menyediakan informasi operasi ke pengguna melalui terminal dan log file.

https://roadmap.sh/projects/log-archive-tool


