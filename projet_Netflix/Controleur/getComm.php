<?php
require('connexion.php');
    $id=$_GET['id'];
    global $conn;
    $query = "SELECT * FROM `commentaire` c, user u  WHERE u.id = c.id_user";
    $response = array();
    $result = mysqli_query($conn, $query);
    while($row = mysqli_fetch_assoc($result))
    {
      $response[] = $row;
    }
      echo json_encode($response);

?>