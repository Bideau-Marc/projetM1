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
    $id=$data['id'];
    $type = $data['type'];
    if($type == 'serie'){
      $query = "SELECT * FROM seance s, serie se where s.id_serie = se.id and se.id='$id'";
    }
    else{
      $query = "SELECT * FROM seance s, film f where s.id_film = f.id and f.id='$id'";
    }
    $response = array();
    $result = mysqli_query($conn, $query);
    while($row = mysqli_fetch_assoc($result))
    {
      $response[] = $row;
    }
    echo json_encode($response,JSON_PRETTY_PRINT);
    
  }
  function getProduct($id="")
  {
    global $conn;
    $query = "SELECT * FROM seance";
    if($id != '')
    {
      $query .= " WHERE id='".$id."' LIMIT 1";
    }
    $response = array();
    $result = mysqli_query($conn, $query);
    while($row = mysqli_fetch_assoc($result))
    {
      $response[] = $row;
    }
      echo json_encode($response);
  }
?>