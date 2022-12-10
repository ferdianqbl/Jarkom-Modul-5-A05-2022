# Kelompok A05

- 5025201020 - Muhammad Ferdian Iqbal
- 5025201039 - Abd. Wahid
- 5025201197 - Abidjanna Zulfa Hamdika
  <br><br>

### Topologi

![Gambar topologi](./images/topologi.png)

<br>

<hr>
<br>

### Source Code Full

![Gambar Full](./images/full.png)
<br>

<hr>
<br>

### 1. Konfigurasi Strix menggunakan iptables, tetapi Loid tidak ingin menggunakan MASQUERADE.

![Gambar 1](./images/1.png)
<br>

> Pada soal ini, konfigurasi yang terdapat pada node STRIX adalah seperti pada gambar

<hr>
<br>

### 2. Drop semua TCP dan UDP dari luar Topologi kalian pada server yang merupakan DHCP Server demi menjaga keamanan.

![Gambar 2](./images/2.png)
<br>

> Soal tersebut dapat diselesaiakan dengan memasukkan konfigurasi pada gambar.

<hr>
<br>

### 3. Membatasi DHCP dan DNS Server hanya boleh menerima maksimal 2 koneksi ICMP secara bersamaan menggunakan iptables, selebihnya didrop

![Gambar 3.1](./images/3.1.png)
![Gambar 3.2](./images/3.2.png)
<br>

> Soal tersebut dapat diselesaiakan dengan memasukkan konfigurasi pada gambar. Masing - masing konfigurasi berada di **WISE** dan **EDEN**

<hr>
<br>

### 4. Akses menuju Web Server hanya diperbolehkan disaat jam kerja yaitu Senin sampai Jumat pada pukul 07.00 - 16.00.

![Gambar 4.1](./images/4.1.png)
![Gambar 4.2](./images/4.2.png)
![Gambar 4.3](./images/4.3.png)
<br>

> Soal tersebut dapat diselesaiakan dengan memasukkan konfigurasi pada gambar. Masing - masing konfigurasi berada di **GARDEN**, **SSS**, dan **EDEN**

<hr>
<br>

### 5. Loid ingin Ostania diatur sehingga setiap request dari client yang mengakses Garden dengan port 80 akan didistribusikan secara bergantian pada SSS dan Garden secara berurutan dan request dari client yang mengakses SSS dengan port 443 akan didistribusikan secara bergantian pada Garden dan SSS secara berurutan.

![Gambar 5](./images/5.png)
<br>

> Untuk mengerjakan soal nomor ini, diperlukan konfigurasi pada gambar di node **Ostania**.

<hr>
<br>

### 6. setiap node server dan router ditambahkan logging paket yang di-drop dengan standard syslog level.

![Gambar 6.1](./images/6.1.png)
![Gambar 6.2](./images/6.2.png)
![Gambar 6.3](./images/6.3.png)
![Gambar 6.4](./images/6.4.png)
<br>

> Soal tersebut dapat diselesaiakan dengan memasukkan konfigurasi pada gambar. Masing - masing konfigurasi berada di **GARDEN**, **WISE**, **SSS**, dan **EDEN**

<hr>
<br>

> Apabila terdapat code yang belum ada di setiap soal, mungkin terlewat untuk dimasukkan. Sehingga dapat dicek juga di source code full atau dnsnya
