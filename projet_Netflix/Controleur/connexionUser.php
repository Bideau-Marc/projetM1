<?php
require("connexion.php");
global $conn;
$data = json_decode(file_get_contents('php://input'),true);
$username = $data['name'];
$mdp = $data['mdp'];
$id;
$request = "select * from user where login ='$username' and mot_de_passe='$mdp'";
$response = array();
$result = mysqli_query($conn, $request);
while($row = mysqli_fetch_assoc($result))
    {
      $id = $row['id'];
      $amdin = $row['admin'];
    }
if ($result=mysqli_query($conn,$request)) {
    $rowcount=mysqli_num_rows($result);
    if($rowcount>0){
        echo '[{ "id":'.$id.',"state":"permited", "amin":'.$amdin.'}]';
    }
    else{
        echo '[{"state":"denied"}]';
    }
} 


 

?>