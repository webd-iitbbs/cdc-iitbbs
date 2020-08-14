<?php   
 session_start();
 include("config.php"); //include the config
?>
<?php
//create database connection
$db=new mysqli("$dbhost","$dbuser","$dbpass");
$db->select_db("$dbname");
?>

 <?php
 if(isset($_POST['login']))
 {
   $username =$_POST['username'];
   $password=$_POST['password'];
   $query="SELECT * FROM prof WHERE username = '$username' AND password = '$password'"; //quary
   $result=$db->query($query);
   $num_rows=$result->num_rows;
   for($i=0;$i<$num_rows;$i++)
   {   $row=$result->fetch_row();
	}
   if(($username==$row[1])&&($password==$row[6])) //checking the username and password if right
   {
     $_SESSION['username']=$username;
	 Header("location:index.php");
   }
   else
   {
     echo 'Username and Password not Right :P';
   }
}
@mysql_close($con);
?>