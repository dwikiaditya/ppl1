<?php

include 'components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
};

if(isset($_POST['submit'])){
   $name = $_POST['name'];
   $name = filter_var($name, FILTER_SANITIZE_STRING);
   $email = $_POST['email'];
   $email = filter_var($email, FILTER_SANITIZE_STRING);
   $number = $_POST['number'];
   $number = filter_var($number, FILTER_SANITIZE_STRING);
   $pass = sha1($_POST['pass']);
   $pass = filter_var($pass, FILTER_SANITIZE_STRING);
   $cpass = sha1($_POST['cpass']);
   $cpass = filter_var($cpass, FILTER_SANITIZE_STRING);

   // Create address string
   $address = $_POST['flat'] .', '.$_POST['building'].', '.$_POST['area'].', '.$_POST['town'] .', '. $_POST['city'] .', '. $_POST['state'] .', '. $_POST['country'] .' - '. $_POST['pin_code'];
   $address = filter_var($address, FILTER_SANITIZE_STRING);

   $select_user = $conn->prepare("SELECT * FROM `users` WHERE email = ? OR number = ?");
   $select_user->execute([$email, $number]);
   $row = $select_user->fetch(PDO::FETCH_ASSOC);

   if($select_user->rowCount() > 0){
      $message[] = 'email or number already exists!';
   }else{
      if($pass != $cpass){
         $message[] = 'confirm password not matched!';
      }else{
         $insert_user = $conn->prepare("INSERT INTO `users`(name, email, number, password, address) VALUES(?,?,?,?,?)");
         $insert_user->execute([$name, $email, $number, $cpass, $address]);
         $select_user = $conn->prepare("SELECT * FROM `users` WHERE email = ? AND password = ?");
         $select_user->execute([$email, $pass]);
         $row = $select_user->fetch(PDO::FETCH_ASSOC);
         if($select_user->rowCount() > 0){
            $_SESSION['user_id'] = $row['id'];
            header('location:home.php');
         }
      }
   }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>register</title>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
   <link rel="stylesheet" href="css/style.css">
</head>
<body>
   
<?php include 'components/user_header.php'; ?>

<section class="form-container">
   <form action="" method="post">
      <h3>Daftar Sekarang</h3>
      
      <!-- Personal Information -->
      <input type="text" name="name" required placeholder="Masukkan Nama Anda" class="box" maxlength="50">
      <input type="email" name="email" required placeholder="Masukkan Email Anda" class="box" maxlength="50" oninput="this.value = this.value.replace(/\s/g, '')">
      <input type="number" name="number" required placeholder="Masukkan No. Hp Anda" class="box" min="0" max="9999999999" maxlength="10">
      <input type="password" name="pass" required placeholder="Password" class="box" maxlength="50" oninput="this.value = this.value.replace(/\s/g, '')">
      <input type="password" name="cpass" required placeholder="Konfirmasi Password" class="box" maxlength="50" oninput="this.value = this.value.replace(/\s/g, '')">
      
      <!-- Address Information -->
      <h4 style="margin-top: 20px;">Alamat Anda</h4>
      <input type="text" class="box" placeholder="Nama gedung/perumahan" required maxlength="50" name="flat">
      <input type="text" class="box" placeholder="Nama jalan" required maxlength="50" name="building">
      <input type="text" class="box" placeholder="No. rumah" required maxlength="50" name="area">
      <input type="text" class="box" placeholder="No. RT/RW" required maxlength="50" name="town">
      <input type="text" class="box" placeholder="Kelurahan" required maxlength="50" name="city">
      <input type="text" class="box" placeholder="Kecamatan" required maxlength="50" name="state">
      <input type="text" class="box" placeholder="Kota/Kabupaten" required maxlength="50" name="country">
      <input type="number" class="box" placeholder="Kode Pos" required max="999999" min="0" maxlength="6" name="pin_code">
      
      <input type="submit" value="Daftar" name="submit" class="btn">
      <p>Sudah punya akun? <a href="login.php">login</a></p>
   </form>
</section>

<?php include 'components/footer.php'; ?>

<script src="js/script.js"></script>

</body>
</html>