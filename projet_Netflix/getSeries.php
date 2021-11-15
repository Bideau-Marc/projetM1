<?php

$mysqli = new mysqli("localhost", "root", "", "projet_netflix");
if ($mysqli->connect_errno) {
    echo "Échec lors de la connexion à MySQL : (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}
$res = $mysqli->query("SELECT *  FROM serie");
for ($row_no = $res->num_rows - 1; $row_no >= 0; $row_no--) {
    $res->data_seek($row_no);
    $row = $res->fetch_assoc();
    echo "titre : ". $row['titre'] . " <br/> lien : "."<a href='".$row['lien']."'>".$row['lien']."</a>";
}
?>