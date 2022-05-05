<?php
require('connexion.php');
    $id=$_GET['id'];
    global $conn;
    $query = "SELECT top* FROM `commentaire` c, user u  WHERE u.id = c.id_user limit 2";
    $response = array();
    $result = mysqli_query($conn, $query);
    while($row = mysqli_fetch_assoc($result))
    {
      $response[] = $row;
    }
      echo json_encode($response);

?>