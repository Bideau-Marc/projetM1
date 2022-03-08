<?php
require("connexion.php");
$request_method = $_SERVER["REQUEST_METHOD"];
  
switch($request_method)
  {
    case 'GET':
      if(!empty($_GET["id"]))
      {
        // Récupérer un seul produit
        $id = $_GET["id"];
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
    $query = "SELECT * FROM serie ";
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
    $query = "SELECT * FROM serie";
    if($id != '')
    {
      str_replace("%20", " ", $id, $id2);
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