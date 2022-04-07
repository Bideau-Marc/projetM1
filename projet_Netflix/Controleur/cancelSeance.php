<?php
    require('connexion.php');
    global $conn;
    $data = json_decode(file_get_contents('php://input'),true);
    $idSeance =$data['idSeance'];
    $request = "DELETE FROM `seance` WHERE `id_seance`='$idSeance'";
    $response = array();
    echo $request;
    if ($result=mysqli_query($conn,$request)) {
        echo '{"state":"supp"}';
    } 
    else echo '{"state":"pas marché xD"}';

?>