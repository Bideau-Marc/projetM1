<?php
    require('connexion.php');
    $data = json_decode(file_get_contents('php://input'),true);
    $ids= $data['ids'];
    $idF= $data['idf'];
    if($idF==0){
        $query = "SELECT  * FROM `commentaire` c, user u, serie f  WHERE u.id = c.id_user and c.id_serie = f.id and f.id='$ids' limit 2 ";
    }
    else{
        $query = "SELECT  * FROM `commentaire` c, user u, film f  WHERE u.id = c.id_user and c.id_film = f.id and f.id='$idF' limit 2 ";

    }
    global $conn;
    $response = array();
    $result = mysqli_query($conn, $query);
    while($row = mysqli_fetch_assoc($result))
    {
      $response[] = $row;
    }
      echo json_encode($response);

?>