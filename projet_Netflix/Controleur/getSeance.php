<?php
require("connexion.php");

    global $conn;
    $data = json_decode(file_get_contents('php://input'),true);
    $id=$data['id'];
    $type = $data['type'];
    $id_seance = $data['idSeance'];
    if($id_seance){
      $query = "SELECT * FROM seance";
      if($id_seance != '')
      {
        $query .= " WHERE id='".$id_seance."' LIMIT 1";
      }
    }
    else{
      if($id==null){
        if($type == 'serie'){
          $query = "SELECT * FROM seance s, serie se where s.id_serie = se.id";
        }
        else{
          $query = "SELECT * FROM seance s, film f where s.id_film = f.id" ;
        }
      }
      else{
        if($type == 'serie'){
          $query = "SELECT * FROM seance s, serie se where s.id_serie = se.id and se.id='$id'";
        }
        else{
          $query = "SELECT * FROM seance s, film f where s.id_film = f.id and f.id='$id'";
        }
      }
    }
    $response = array();
    $result = mysqli_query($conn, $query);
    while($row = mysqli_fetch_assoc($result))
    {
      $response[] = $row;
    }
    echo json_encode($response,JSON_PRETTY_PRINT);
    


?>