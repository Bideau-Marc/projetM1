<?php
    require('connexion.php');
    global $conn;
    $data = json_decode(file_get_contents('php://input'),true);
    $id = $data['id'];
    $cpt = 0;
    $requete = "select  count(case c.id when 1 then 1 else null end) as action, count(case c.id when 2 then 1 else null end ) as fiction, count(case c.id when 3 then 1 else null end) as humour, count(case c.id when 4 then 1 else null end) as horreur, count(case c.id when 5 then 1 else null end) as amour from serie f, favori ff, categorie c, user u where f.categorie = c.id and  f.id = ff.id_serie and u.id ='$id' and u.id = ff.idUtilisateur;";
    $result = mysqli_query($conn, $requete);
    while($row = mysqli_fetch_assoc($result))
    {
      $action = $row['action'];
      $ficntion = $row['fiction'];
      $humour = $row['humour'];
      $horreur = $row['horreur'];
      $amour = $row['amour'];
    }
    if($cpt < $action){
        $categorie = 'action';
        $cpt = $action;
    }
    
    if($cpt < $ficntion){
        $categorie = 'fantastique';
        $cpt = $ficntion;
    }
    if($cpt < $humour){
        $categorie = 'humour';
        $cpt = $humour;
    }
    if($cpt < $horreur){
        $categorie = 'horreur';
        $cpt = $horreur;
    }
    if($cpt < $amour){
        $categorie = 'amour';
        $cpt = $amour;
    }
    if($cpt ==0){
        $categorie = 'action';
    }
    echo $categorie;
    echo $requete;
    $recommendation = "select f.* from serie f , categorie c where c.id = f.categorie and c.nom = '$categorie' and f.id not in (select f2.id from serie f2, vue v , user u where u.id = '$id' and u.id = v.idUser and v.idFilm= f2.id);";
    $result = mysqli_query($conn, $recommendation);
    while($row = mysqli_fetch_assoc($result))
    {
      $response[] = $row;
    }
      echo json_encode($response);
?>

