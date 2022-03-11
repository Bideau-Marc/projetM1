<?php
    require('connexion.php');
    global $conn;
    $data = json_decode(file_get_contents('php://input'),true);
    $idUser = $data['idUser'];
    $idSeance = $data['idSeance'];
    $nbPlaceRes = $data['nbPlaceRes'];
    $request = "INSERT INTO `reservation`( `id_user`, `nombre_place_reserve`, `id_seance`) VALUES ($idUser,$nbPlaceRes,$idSeance)";
    $response = array();
    if ($result=mysqli_query($conn,$request)) {
        echo '{"state":"resa créé"}';
    } 
    else echo '{"state":"resa déja existant"}';


?>
