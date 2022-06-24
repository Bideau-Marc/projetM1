<?php
require("connexion.php");
global $conn;
$idEp = $_GET["id"];
$query = "SELECT * FROM episode where id ='$idEp' ";
$response = array();
$result = mysqli_query($conn, $query);
while($row = mysqli_fetch_assoc($result))
{
    $response[] = $row;
}
echo json_encode($response,JSON_PRETTY_PRINT);
?>