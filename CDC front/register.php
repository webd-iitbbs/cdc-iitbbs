<?php include 'config.php'; ?>
<?php
//database connection
$db=new mysqli("$dbhost","$dbuser","$dbpass");
$db->select_db("$dbname");
?>
<!-- php query section -->
<?php
  if(isset($_POST['register']))
  {
   //geting the values from user input form index
   $name=$_POST['name'];
   $email=$_POST['email'];
   $username=$_POST['username'];
   $password = hash('sha256',$_POST['password']);

    //query
   if ($db->query("INSERT INTO CDC
    (username,email,name,password)
    VALUES ('$username','$email','$name','$password')"))
    print "<script>document.write('Account created :)');</script>";
	
	else {
		echo 'Error :(';
	}
  }
 

//$status=0;
//$activationcode=md5($email.time());
//$query=mysqli_query($con,"INSERT INTO prof
    //(username,email,name,password,status,activationcode)
    //VALUES ('$username','$email','$name','$password','$status','$activationcode')"));
 //if($query)
 //{
//$to=$email;
//$msg= "Thanks for new Registration.";
//$subject="Email verification ";
//$headers .= "MIME-Version: 1.0"."\r\n";
//$headers .= 'Content-type: text/html; charset=iso-8859-1'."\r\n";
//$headers .= 'From:CDC | IIT BHUBANESWAR <xxxx@iitbbs.ac.in>'."\r\n";
//$ms.="<html></body><div><div>Dear $name,</div></br></br>";
//$ms.="<div style='padding-top:8px;'>Please find the below verification code For verifying and activation of your account</div></br>
//<h3>Verification Code is $activationcode </h3>
//</body></html>";
//mail($to,$subject,$ms,$headers);
//echo "<script>alert('Registration successful, please Login to continue');</script>";
//echo "<script>window.location = 'login.php';</script>";;
//}
//else
//{
//echo "<script>alert('Data not inserted');</script>";
//}
//}
//
 ?>