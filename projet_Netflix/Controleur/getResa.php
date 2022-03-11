<?php
require("connexion.php");
$request_method = $_SERVER["REQUEST_METHOD"];
  
switch($request_method)
  {
    case 'GET':
      if(!empty($_GET["id"]))
      {
        // Récupérer un seul produit
        getProduct($id);
      }
      else
      {
        // Récupérer tous les produits
        getProducts();
      }
      break;
  }

  function getProducts()
  {
    global $conn;
    $data = json_decode(file_get_contents('php://input'),true);
    $idUser = $data['idUser'];
    $idSeance = $data['idSeance'];
    if($idUser == null){
      $query = "SELECT * FROM reservation r, seance s where r.id_seance = s.id and s.id='$idSeance'";
    }
    else{
      $query = "SELECT * FROM reservation s, user f where s.id_user = f.id and f.id='$idUser'";
    }
    $response = array();
    $result = mysqli_query($conn, $query);
    while($row = mysqli_fetch_assoc($result))
    {
      $response[] = $row;
    }
    echo json_encode($response,JSON_PRETTY_PRINT);
    
  }
?>