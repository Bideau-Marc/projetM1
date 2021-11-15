<?php
$nom = $_POST['nom'];
$mdp = $_POST['mdp'];
echo 'tesh' .' '. $nom . ' ' . $mdp; 
$mysqli = new mysqli("localhost", "root", "", "projet_netflix");
if ($mysqli->connect_errno) {
    echo "Échec lors de la connexion à MySQL : (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}
echo "SELECT count(*) as compteur FROM user where login='$nom' and mot_de_passe='$mdp'";
$res = $mysqli->query("SELECT count(*) as compteur FROM user where login='$nom' and mot_de_passe='$mdp'     ");
for ($row_no = $res->num_rows - 1; $row_no >= 0; $row_no--) {
    $res->data_seek($row_no);
    $row = $res->fetch_assoc();
        if($row['compteur']==1){
            echo 'fonctionne';
            header('location: accueil.html');
        }
}
?>

