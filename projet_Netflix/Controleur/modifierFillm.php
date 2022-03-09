<?php
    require('connexion.php');
    global $conn;
    $data = json_decode(file_get_contents('php://input'),true);
    $id = $data['id'];
    $titre = $data['titre'];
    $lien_vid = $data['lien_vid'];
    $cat = $data['cat'];
    $res = $data['res'];
    $lien = $data['lien'];
    $type = $data['type'];

    if($type == 'serie')
        $request = "UPDATE serie SET titre='$titre', lien_video='$lien_vid',categorie='$cat',resume='$res',lien='$lien' WHERE id='$id'";
    else
        $request = "UPDATE film SET titre='$titre', lien_video='$lien_vid',categorie='$cat',resume='$res',lien='$lien' WHERE id=$id";
    $response = array();
    if ($result=mysqli_query($conn,$request)) {
        echo '{"state":"film updaté"}';
    } 
    else echo '{"state":"film non update"}';
?>
