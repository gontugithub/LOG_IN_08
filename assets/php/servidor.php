<?php
require_once("BBDD_CTRLR.php");

if (isset($_REQUEST['peticion'])) {
    switch ($_REQUEST['peticion']) {
        case "EjecutarSelect":
            $sql = $_REQUEST['sql'];
            $datos['datos'] = BBDD_CTRLR::Consultas($sql);
            echo json_encode($datos);
            break;
        case "EjecutarInsert":
            $sql = $_REQUEST['sql'];
            $datos['datos'] = BBDD_CTRLR::CRUD($sql, 'i');
            echo json_encode($datos);
            break;
        case "EjecutarUpdateDelete":
            $sql = $_REQUEST['sql'];
            $datos['datos'] = BBDD_CTRLR::CRUD($sql, '');
            echo json_encode($datos);
            break;

        case "login":
            $alias = $_REQUEST['alias'];
            $password = $_REQUEST['password'];
            $sql = "call login('$alias','$password')";
            $datos['sql'] = $sql;
            $datos['datos'] = BBDD_CTRLR::Consultas($sql);
            echo json_encode($datos);      
            break;
    }        
}
