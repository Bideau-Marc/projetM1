<?php
require("connexion.php");
$request_method = $_SERVER["REQUEST_METHOD"];
  

    global $conn;
    $data = json_decode(file_get_contents('php://input'),true);
    $idUser = $data['idUser'];
    $idSeance = $data['idSeance'];
    if($idUser == null){
      $query = "SELECT * FROM reservation r, seance s, film f where r.id_seance = s.id and s.id='$idSeance' and f.id=s.id_film and s.date  >=NOW()";
    }
    else{
        $query = "SELECT * FROM reservation r, seance s, user f, film fi where r.id_user = f.id and f.id='$idUser'and fi.id=s.id_film and r.id_seance = s.id_seance and s.date  >=NOW()";
    }
    $response = array();
    $result = mysqli_query($conn, $query);
    while($row = mysqli_fetch_assoc($result))
    {
      $response[] = $row;
    }
    echo json_encode($response,JSON_PRETTY_PRINT);
    
?>