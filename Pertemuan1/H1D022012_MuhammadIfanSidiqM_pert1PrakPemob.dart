// Kelas Anggota
class Anggota {
  String nama;
  double uang;

  // Konstruktor
  Anggota(this.nama, this.uang);
}

// Kelas Arisan
class Arisan {
  List<Anggota> daftarAnggota = [];
  double totalUang = 0;

  // Fungsi untuk menambah anggota ke arisan
  void tambahAnggota(Anggota anggota) {
    daftarAnggota.add(anggota);
    totalUang += anggota.uang;
    print('Anggota "${anggota.nama}" berhasil ditambahkan.');
  }

  // Fungsi untuk menentukan pemenang
  void tentukanPemenang() {
    if (daftarAnggota.isEmpty) {
      throw Exception('Tidak ada anggota dalam arisan.');
    }
    int pemenangIndex =
        DateTime.now().millisecondsSinceEpoch % daftarAnggota.length;
    Anggota pemenang = daftarAnggota[pemenangIndex];
    print('Pemenang arisan kali ini adalah: ${pemenang.nama}');
  }

  // Fungsi untuk menampilkan informasi arisan
  void tampilkanInfo() {
    print('--- Informasi Arisan ---');
    for (var anggota in daftarAnggota) {
      print(
          'Nama Anggota: ${anggota.nama}, Uang: Rp ${anggota.uang.toStringAsFixed(2)}');
    }
    print('Total Uang: Rp ${totalUang.toStringAsFixed(2)}');
  }
}

// Fungsi utama
void main() {
  // Membuat objek arisan
  Arisan arisan = Arisan();

  // Menambahkan anggota ke arisan
  arisan.tambahAnggota(Anggota('Stephen', 100000.0));
  arisan.tambahAnggota(Anggota('Iman', 150000.0));
  arisan.tambahAnggota(Anggota('Alam', 200000.0));

  // Menampilkan informasi arisan
  arisan.tampilkanInfo();
  print('---');

  // Menentukan pemenang
  try {
    arisan.tentukanPemenang();
  } catch (e) {
    print('Error: ${e.toString()}');
  }
}
