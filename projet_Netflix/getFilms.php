<?php

$mysqli = new mysqli("localhost", "root", "", "projet_netflix");
if ($mysqli->connect_errno) {
    echo "Échec lors de la connexion à MySQL : (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}
$res = $mysqli->query("SELECT *  FROM film");
for ($row_no = $res->num_rows - 1; $row_no >= 0; $row_no--) {
    $res->data_seek($row_no);
    $row = $res->fetch_assoc();
    $titre = $row['titre'];
    echo "titre : ". $row['titre'] . " <br/> lien : "."<a href='".$row['lien']."'>".$row['lien']."</a>";
    $res2 =  $mysqli->query("SELECT *  FROM reservation where titre ='$titre'");
    for ($row_no2 = $res2->num_rows - 1; $row_no >= 0; $row_no--) {
        $res2->data_seek($row_no2);
        $row2 = $res2->fetch_assoc();
        echo "<br/> dates disponibles pour reservations : ". "<div id='".$row2['date']."'>".$row2['date']."</div>";
    }
}
?>