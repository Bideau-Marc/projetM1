<?php
//DELETE FROM `reservation` WHERE `id_user`='' and `id_seance`=''
    require('connexion.php');
    global $conn;
    $data = json_decode(file_get_contents('php://input'),true);
    $id = $data['idUser'];
    $idSeance =$data['idSeance'];   
    $request = "DELETE FROM `reservation` WHERE `id_user`='$id' and `id_seance`='$idSeance'";
    $response = array();
    if ($result=mysqli_query($conn,$request)) {
        echo '{"state":"supp"}';
    } 
    else echo '{"state":"pas marché xD"}';

?>