<?php
    require('connexion.php');
    global $conn;
    $data = json_decode(file_get_contents('php://input'),true);
    $idSeance = $data['idSeance'];
    $dateSeance = $data['dateSeance'];
    $titreSeance = $data['titreSeance'];
    $idFilm = $data['idFilm'];
    $idSerie = $data['idSerie'];
    $nbPlace = $data['nbPlace'];
    $request = "UPDATE `seance` SET `date`='$dateSeance',`nb_place`='$nbPlace' WHERE id_seance = '$idSeance'";
    $response = array();
    if ($result=mysqli_query($conn,$request)) {
        echo '{"state":"seance updaté"}';
    } 
    else echo '{"state":"seance non update"}';
?>
