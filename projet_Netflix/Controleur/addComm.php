<?php
    require('connexion.php');
    global $conn;
    $data = json_decode(file_get_contents('php://input'),true);
    $commentaire = $data['com'];
    $id_user = $data['idU'];
    $id_film =$data['idF'];
    $id_serie = $data['ids'];
    $request = "INSERT INTO `commentaire`(`id_film`, `id_serie`, `commentaire`, `id_user`) VALUES ($id_film,$id_serie,'$commentaire',$id_user);";
    $response = array();
    if ($result=mysqli_query($conn,$request)) {
        echo '{"state":"commentaire créé"}';
    } 
    else echo '{"state":"pas marché xD"}';


?>