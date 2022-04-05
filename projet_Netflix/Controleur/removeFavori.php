<?php
    require('connexion.php');
    global $conn;
    $data = json_decode(file_get_contents('php://input'),true);
    $id = $data['id'];
    $request = "DELETE FROM `favori` WHERE id ='$id'";
    $response = array();
    echo $request;
    if ($result=mysqli_query($conn,$request)) {
        echo '{"state":"supp"}';
    } 
    else echo '{"state":"pas marché xD"}';


?>