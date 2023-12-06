<?php

    header("Access-Control-Allow-Origin: http://localhost:8080");
    header("Content-Type: application/json; charset=UTF-8");
    header("Access-Control-Allow-Methods: POST, GET");
    header("Access-Control-Max-Age: 3600");
    header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

    require_once(__DIR__ . '/Student.php');
    // echo "hey";

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        // Retrieve data sent from the frontend
        $method = isset($_POST['method']) ? $_POST['method'] : '';
        // $method = "getAllStudents";
        if(function_exists($method)) {
            call_user_func($method);
        }
        else {
            exit();
        }
    }
    // $method = "getAllStudents";
    // if(function_exists($method)) {
    //     call_user_func($method);
    // }
    // else {
    //     exit();
    // }

    // $data = json_decode(file_get_contents("php://input"));
    // $method = isset($data->method) ? $data->method : exit();
    // $method = "getAllStudents";
    // echo $method;
    

    function signup(){
        // $data = json_decode(file_get_contents("php://input"));
        // $fname = "Hev";
        // $lname = "Abi";
        // $em = "hev@abi.com";
        // $de = "BSIT";
        // $pa = "asdasd";

        $first_name = $_POST['first_name'];
        $last_name = $_POST['last_name'];
        $email = $_POST['email'];
        $department = $_POST['department'];
        $password = $_POST['password'];
        $role = "student";

        $studArr = array(
            "first_name" => $first_name,
            "last_name" => $last_name,
            "email" => $email,
            "department" => $department,
            "password" => $password,
            "role" => $role
        );
        $student = new Student();
        $ret = $student->insert_student($studArr);
        echo json_encode($ret);
    }

    function signin($user) {
        echo $user;
        return "WHAT THE HELLL";    
    }

    function getAllStudents() {
        $student = new Student();
        echo json_encode($student->getAllStudentsFromModel());
        // echo "bruh";
        // print_r($student->getAllStudentsFromModel());
    }
