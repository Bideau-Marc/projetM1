<?php
require('connexion.php');
$idUser = $data['idUser'];
$idSeance = $data['idSeance'];
$idF = $data['idFilm'];
    global $conn;
    $query = "SELECT * FROM favori where (id_serie='$idSeance'or id_film = '$idF') and idUtilisateur = '$idUser' order by saison ASC";
    $response = array();
    $result = mysqli_query($conn, $query);
    while($row = mysqli_fetch_assoc($result))
    {
      $response[] = $row;
    }
      echo json_encode($response);

?>