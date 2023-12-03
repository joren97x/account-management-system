<?php

    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json; charset=UTF-8");
    header("Access-Control-Allow-Methods: POST, GET");
    header("Access-Control-Max-Age: 3600");
    header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

    require_once(__DIR__ . '/Student.php');
    
    if(isset($_POST['method'])) {
        $method = $_POST['method'];
        if (function_exists($method)) {
            call_user_func($method);
        }
        else {
            exit();
        }
    }

    function signup(){
        $first_name = $_POST['first_name'];
        $last_name = $_POST['last_name'];
        $email = $_POST['email'];
        $department = $_POST['department'];
        $password = $_POST['password'];

        $studArr = array(
            "first_name" => $first_name,
            "last_name" => $last_name,
            "email" => $email,
            "department" => $department,
            "password" => $password
        );
        $student = new Student();
        $ret = $student->insert_student($studArr);
        return 0;
    }

    function signin($user) {
        echo $user;
        return "WHAT THE HELLL";    
    }
