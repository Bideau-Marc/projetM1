<?php
require("connexion.php");
$request_method = $_SERVER["REQUEST_METHOD"];
  

    global $conn;
    $data = json_decode(file_get_contents('php://input'),true);
    $idSeance = $data['idSeance'];
    
    $query = "SELECT *, r.id as id_reservation,u.id as id_user FROM reservation r, seance s, user u, film fi where s.id_seance = '$idSeance' and r.id_user = u.id and fi.id=s.id_film and r.id_seance = s.id_seance";   
    $response = array();
    $result = mysqli_query($conn, $query);
    while($row = mysqli_fetch_assoc($result))
    {
      $response[] = $row;
    }
    echo json_encode($response,JSON_PRETTY_PRINT);
    
?>