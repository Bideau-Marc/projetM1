<?php
    require('connexion.php');
    global $conn;
    $data = json_decode(file_get_contents('php://input'),true);
    $id_film = $data['idF'];
    $titre = $data['titre'];
    $id_serie =$data['idS'];
    $date = $data['date'];
    $idNbPLACESEDIREHJTREFR = $data['nbplace'];
    $request = "INSERT INTO `seance`( `date`, `titre_seance`, `id_film`, `id_serie`, `nb_place`) VALUES ('$date','$titre',$id_film,$id_serie,$idNbPLACESEDIREHJTREFR)";
    $response = array();
    echo $request;
    if ($result=mysqli_query($conn,$request)) {
        echo '{"state":"film ou série Liké"}';
    } 
    else echo '{"state":"pas marché xD"}';


?>