<?php
session_start();
include 'koneksi.php';
?>
<?php include 'header.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <script>
        function validateLoginForm() {
            var email = document.forms["loginForm"]["email"].value;
            var password = document.forms["loginForm"]["password"].value;
            if (email == "" || password == "") {
                alert("Email and Password must be filled out");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<div class="kontainer">
    <div class="row mb-3 mt-5 pb-3">
        <div class="kolom-md-12 judulsection animasikontainer">
            <h3 class="mb-4 text-tengah">Login</h3>
        </div>
    </div>
</div>
<div class="kontainer">
    <div class="row">
        <div class="kolom-md-12">
            <div class="kartu">
                <div class="jarakkartu">
                    <form name="loginForm" method="post" onsubmit="return validateLoginForm()">
                        <div class="form-grup">
                            <label>Email</label>
                            <input type="email" name="email" class="bentukform">
                        </div>
                        <div class="form-grup">
                            <label>Password</label>
                            <input type="password" class="bentukform" name="password">
                        </div>
                        <br>
                        <button class="tombol" name="simpan">Masuk</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div style="padding-top:150px"></div>
<?php
if (isset($_POST["simpan"])) {
    $email = $_POST["email"];
    $password = $_POST["password"];
    $ambil = $koneksi->query("SELECT * FROM pengguna WHERE email='$email' AND password='$password' LIMIT 1");
    $akunyangcocok = $ambil->num_rows;
    if ($akunyangcocok == 1) {
        $akun = $ambil->fetch_assoc();
        if ($akun['level'] == "Pelanggan") {
            $_SESSION["pengguna"] = $akun;
            echo "<script>alert('Anda sukses login');</script>";
            echo "<script>location ='index.php';</script>";
        } elseif ($akun['level'] == "Admin") {
            $_SESSION['admin'] = $akun;
            echo "<script>alert('Anda sukses login');</script>";
            echo "<script>location ='admin/index.php';</script>";
        }
    } else {
        echo "<script>alert('Anda gagal login, Cek akun anda');</script>";
        echo "<script>location ='login.php';</script>";
    }
}
?>
<?php include 'footer.php'; ?>
</body>
</html>
