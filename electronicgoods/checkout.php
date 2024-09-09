<?php
session_start();
include 'koneksi.php';
if (!isset($_SESSION["pengguna"])) {
	echo "<script> alert('Anda belum login');</script>";
	echo "<script> location ='login.php';</script>";
}
?>

<?php include 'header.php'; ?>
<div class="kontainer">
	<div class="row mb-3 mt-5 pb-3">
		<div class="kolom-md-12 judulsection animasikontainer">
			<h3 class="mb-4 text-tengah">Checkout</h3>
		</div>
	</div>
</div>
<div class="kontainer">
	<div class="row">
		<div class="kolom-md-12 animasikontainer">
			<div class="cart-list">
				<table class="tabel">
					<thead class="thead-white">
						<tr class="text-tengah">
							<th>No</th>
							<th>Produk</th>
							<th>Harga</th>
							<th>Jumlah Beli</th>
							<th>SubHarga</th>
						</tr>
					</thead>
					<tbody>
						<?php $nomor = 1; ?>
						<?php $totalberat = 0; ?>
						<?php $totalbelanja = 0; ?>
						<?php foreach ($_SESSION["keranjang"] as $idproduk => $jumlah) : ?>
							<?php
							$ambil = $koneksi->query("SELECT * FROM produk 
					WHERE idproduk='$idproduk'");
							$pecah = $ambil->fetch_assoc();
							$totalharga = $pecah["hargaproduk"] * $jumlah;
							$subberat = $pecah["beratproduk"] * $jumlah;
							$totalberat += $subberat;

							?>
							<tr>
								<td><?php echo $nomor; ?></td>
								<td><?php echo $pecah['namaproduk']; ?></td>
								<td>Rp <?php echo number_format($pecah['hargaproduk']); ?></td>
								<td><?php echo $jumlah; ?></td>
								<td>Rp <?php echo number_format($totalharga); ?></td>
							</tr>
							<?php $nomor++; ?>
							<?php $totalbelanja += $totalharga; ?>
						<?php endforeach ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<br><br>
<div class="kontainer mt-4">
	<form method="post">
		<div class="row">
			<div class="kolom-md-12">
				<div class="form-grup">
					<label>Nama</label>
					<input type="text" readonly value="<?php echo $_SESSION["pengguna"]['nama'] ?>" class="bentukform">
				</div>
				<div class="form-grup">
					<label>No. HP</label>
					<input type="text" readonly value="<?php echo $_SESSION["pengguna"]['telepon'] ?>" class="bentukform">
				</div>
				<div class="form-grup">
					<label>Alamat Lengkap</label>
					<input type="hidden" name="totalberatnya" value="<?php echo $totalberat ?>">
					<textarea class="bentukform" name="alamatpengiriman" placeholder="Masukkan Alamat"></textarea>
				</div>
				<div class="form-grup">
					<label>Kota Pengiriman</label>
					<select name="kota" class="bentukform" required id="Sone" onchange="check()">
						<option value="">Pilih Kota</option>
						<option value="Palembang">Palembang</option>
						<option value="Ogan Ilir">Ogan Ilir</option>
						<option value="Ogan Ulu">Ogan Ulu</option>
						<option value="Sekayu">Sekayu</option>
						<option value="Indralaya">Indralaya</option>
						<option value="Betung">Betung</option>
						<option value="Muara Enim">Muara Enim</option>
						<option value="Lahat">Lahat</option>
					</select>
				</div>
				<input type="hidden" id="dua" name="dua" value="<?php echo $totalbelanja ?>">
				<div class="form-grup">
					<label>Ongkos Kirim</label>
					<input class="bentukform" name="ongkir" type="number" value="0" readonly required id="res">
				</div>
				<div class="form-grup">
					<label>Jasa Pemasangan</label>
					<select name="jasapemasangan" class="bentukform" required id="jasapemasangan" onchange="cekjasapemasangan()">
						<option value="">Pilih</option>
						<option value="Ya">Ya</option>
						<option value="Tidak">Tidak</option>
					</select>
				</div>
				<div class="form-grup">
					<label>Harga Pemasangan</label>
					<input class="bentukform" name="hargapemasangan" type="number" value="0" readonly required id="hargapemasangan">
				</div>
				<input type="hidden" id="dua" name="dua" value="<?php echo $totalbelanja ?>">
				<div class="form-grup">
					<label>Grand Total</label>
					<input class="bentukform" id="result" required readonly type="number">
				</div>
				<button class="tombol" name="checkout">Selesaikan Transaksi</button>
			</div>
		</div>
	</form>
</div>
</section>
<?php
if (isset($_POST["checkout"])) {
	$notransaksi = '#TP' . date("Ymdhis");
	$id = $_SESSION["pengguna"]["id"];
	$tanggalbeli = date("Y-m-d");
	$waktu = date("Y-m-d H:i:s");
	$alamatpengiriman = $_POST["alamatpengiriman"];
	$totalbeli = $totalbelanja;
	$totalberatnya = $_POST["totalberatnya"];
	$ongkir = $_POST["ongkir"];
	$kota = $_POST["kota"];
	$hargapemasangan = $_POST["hargapemasangan"];
	$koneksi->query(
		"INSERT INTO pembelian(notransaksi,
				id, tanggalbeli, totalbeli, alamatpengiriman, totalberat, kota, ongkir, statusbeli, waktu,hargapemasangan)
				VALUES('$notransaksi','$id', '$tanggalbeli', '$totalbeli', '$alamatpengiriman','$totalberat','$kota','$ongkir', 'Belum Bayar', '$waktu','$hargapemasangan')"
	);
	$idbeli_barusan = $koneksi->insert_id;
	foreach ($_SESSION['keranjang'] as $idproduk => $jumlah) {
		$ambil = $koneksi->query("SELECT*FROM produk WHERE idproduk='$idproduk'");
		$perproduk = $ambil->fetch_assoc();
		$nama = $perproduk['namaproduk'];
		$harga = $perproduk['hargaproduk'];
		$berat = $perproduk['beratproduk'];

		$subberat = $perproduk['beratproduk'] * $jumlah;
		$subharga = $perproduk['hargaproduk'] * $jumlah;
		$koneksi->query("INSERT INTO pembelianproduk (idbeli, idproduk, nama, harga, berat, subberat, subharga, jumlah)
					VALUES ('$idbeli_barusan','$idproduk', '$nama','$harga','$berat', '$subberat', '$subharga','$jumlah')");

		$koneksi->query("UPDATE produk SET stokproduk=stokproduk -$jumlah
					WHERE idproduk='$idproduk'");
	}
	unset($_SESSION["keranjang"]);
	echo "<script> alert('Pembelian Sukses');</script>";
	echo "<script> location ='riwayat.php';</script>";
}
?>
<?php
include 'footer.php';
?>

<script>
	function check() {
		var val = document.getElementById('Sone').value;
		if (val == 'Lahat') {
			document.getElementById('res').value = "5000";
		} else if (val == 'Palembang') {
			document.getElementById('res').value = "7000";
		} else if (val == 'Ogan Ilir') {
			document.getElementById('res').value = "7000";
		} else if (val == 'Ogan Ulu') {
			document.getElementById('res').value = "7000";
		} else if (val == 'Sekayu') {
			document.getElementById('res').value = "10000";
		} else if (val == 'Indralaya') {
			document.getElementById('res').value = "10000";
		} else if (val == 'Betung') {
			document.getElementById('res').value = "10000";
		} else if (val == 'Muara Enim') {
			document.getElementById('res').value = "10000";
		} else if (val == 'Tanjung Enim') {
			document.getElementById('Tanjung Enim').value = "12000";
		}
		var num1 = document.getElementById("res").value;
		var num2 = document.getElementById("dua").value;
		var num3 = document.getElementById("hargapemasangan").value;
		result = parseInt(num1) + parseInt(num2) + parseInt(num3);
		document.getElementById("result").value = result;

	}

	function cekjasapemasangan() {
		var val = document.getElementById('jasapemasangan').value;
		if (val == 'Ya') {
			document.getElementById('hargapemasangan').value = "100000";
		} else if (val == 'Tidak') {
			document.getElementById('hargapemasangan').value = "0";
		} else {
			document.getElementById('hargapemasangan').value = "0";
		}
		var num1 = document.getElementById("res").value;
		var num2 = document.getElementById("dua").value;
		var num3 = document.getElementById("hargapemasangan").value;
		result = parseInt(num1) + parseInt(num2) + parseInt(num3);
		document.getElementById("result").value = result;

	}
</script>