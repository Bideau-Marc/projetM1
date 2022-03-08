<?php
    require('connexion.php');
    global $conn;
    $data = json_decode(file_get_contents('php://input'),true);
    $titre = $data['titre'];
    $lien_vid = $data['lien_vid'];
    $cat = $data['cat'];
    $res = $data['res'];
    $lien = $data['lien'];

    $request = "INSERT INTO `film`(`titre`, `lien_video`, `categorie`, `resume`, `lien`) VALUES ('$titre','$lien_vid','$cat','$cat','$lien')";
    $response = array();
    if ($result=mysqli_query($conn,$request)) {
        echo '{"state":"film créé"}';
    } 
    else echo '{"state":"film déja existant"}';


?>
