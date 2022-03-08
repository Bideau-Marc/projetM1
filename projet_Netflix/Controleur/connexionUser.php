<?php
require("connexion.php");
global $conn;
$data = json_decode(file_get_contents('php://input'),true);
$username = $data['name'];
$mdp = $data['mdp'];

$request = "select * from user where login ='$username' and mot_de_passe='$mdp'";
$response = array();
if ($result=mysqli_query($conn,$request)) {
    $rowcount=mysqli_num_rows($result);
    if($rowcount>0){
        echo '[{ "state":"permited"}]';
    }
    else{
        echo '[{"state":"denied"}]';
    }
} 


 

?>