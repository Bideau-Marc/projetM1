<?php
require("connexion.php");
$request_method = $_SERVER["REQUEST_METHOD"];
ECHO empty($_GET["admin"]);
  
switch($request_method)
  {
    case 'GET':
      if(!empty($_GET["admin"]))
      {
        // Récupérer un seul produit
        $id = $_GET["admin"];
        inscriptonAdmin($id);
      }
      else
      {
        // Récupérer tous les produits
        inscriptionUser();
      }
      break;
  }




function inscriptionUser(){
    global $conn;
  echo'la';
    $data = json_decode(file_get_contents('php://input'),true);
    $username = $data['name'];
    $mdp = $data['mdp'];
    $request = "INSERT INTO `user`(`login`, `mot_de_passe`) VALUES ('$username', '$mdp')";
    $response = array();
    if ($result=mysqli_query($conn,$request)) {
        echo '{"state":"inscrit"}';
    } 
    else echo '{"state":"déja existant"}';
    
}

function inscriptonAdmin($admin=''){
    global $conn;
    $data = json_decode(file_get_contents('php://input'),true);
    $username = $data['name'];
    $mdp = $data['mdp'];
    $request = "INSERT INTO `user`(`login`, `mot_de_passe`, `admin`) VALUES ('$username', '$mdp',true)";
    $response = array();
    if ($result=mysqli_query($conn,$request)) {
        echo '{"state":"inscrit"}';
    } 
    else echo '{"state":"déja existant"}';

}

?>