<?php
    require('connexion.php');
    global $conn;
    $data = json_decode(file_get_contents('php://input'),true);
    $id_film = $data['idF'];
    $id_user = $data['idU'];
    $id_serie =$data['idS'];
    $request = "INSERT INTO `favori`(`id_film`, `idUtilisateur`, `id_serie`) VALUES ($id_film,$id_user,$id_serie)";
    $response = array();
    echo $request;
    if ($result=mysqli_query($conn,$request)) {
        echo '{"state":"film ou série Liké"}';
    } 
    else echo '{"state":"pas marché xD"}';


?>