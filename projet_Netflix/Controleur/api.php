<?php
require("connexion.php");

$api = new Api();

switch ($_GET['entity']) {
    case 'film':
        $api-> film();
        break;
    case 'serie':
        $api-> serie();
        break; 
    case 'reco':
        $api-> recomendation();
        break;
    case 'recoserie':
        $api-> recoserie();
        break;
    case 'getEpisodE':
        $api-> getEpisodE();
        break;
    case 'getResa':
        $api-> getResa();
        break;
    case 'cancelResa':
        $api-> cancelResa();
        break;
    case 'getSeance':
        $api-> getSeance();
        break;
    case 'addResa':
        $api-> addResa();
        break;
    case 'getComm':
        $api-> getComm();
        break;
    case 'getFav':
        $api-> getFav();
        break;
    case 'addComm':
        $api-> addComm();
        break;
    case 'addFavori':
        $api-> addFavori();
        break;
    case 'removeFavori':
        $api-> removeFavori();
        break;
    case 'getEpisodes':
        $api-> getEpisodes();
        break;
    case 'creerFilm':
        $api-> creerFilm();
        break;
    case 'inscription':
        $api-> inscription();
        break;
    case 'connexionUser':
        $api-> connexionUser();
        break;
    default:
        # code...
        break;
}

class Api { 

    function film() {
       require ("./getFilms.php");
    }
    function serie() {
        require ("./getSeries.php");
    }
    function recomendation() {
        require ("./Recomendation.php");
    }
    function recoserie() {
        require ("./recommendationSeries.php");
    }
    function getEpisodE() {
        require ("./getEpisodE.php");
    }
    function getResa() {
        require ("./getResa.php");
    }
    function cancelResa() {
        require ("./cancelResa.php");
    }
    function getSeance() {
        require ("./getSeance.php");
    }
    function addResa() {
        require ("./addResa.php");
    }
    function getComm() {
        require ("./getComm.php");
    }
    function getFav() {
        require ("./getFav.php");
    }
    function addComm() {
        require ("./addComm.php");
    }
    function addFavori() {
        require ("./addFavori.php");
    }
    function removefavori() {
        require ("./removefavori.php");
    }
    function getEpisodes() {
        require ("./getEpisodes.php");
    }
    function creerFilm() {
        require ("./creerFilm.php");
    }
    function inscription() {
        require ("./inscription.php");
    }
    function connexionUser() {
        require ("./connexionUser.php");
    }
}

?>