<?php
require_once("./dbconfig.php");

class Student {
    private $db_conn;
    private $state;
    private $error_message;

    public function __construct() {
        try{
            $db = new Database();
            if($db->getState()){
                $this->db_conn = $db->getDb();
                $this->state = true;
                $this->error_message = "Connected";
            }else{
                $this->state = false;
                $this->error_message = $db->getErrMsg();
            }
        }
        catch(Exception $e){
            $this->state = false;
            $this->error_message = $e->getMessage();
        }
    }

    public function insert_student($student) {
        $sql = "CALL sp_insert_student(:first_name, :last_name, :email, :department, :password, :role)";

        $stmt = $this->db_conn->prepare($sql);
        $stmt->bindParam(':first_name',$student['first_name']);
        $stmt->bindParam(':last_name',$student['last_name']);
        $stmt->bindParam(':email',$student['email']);
        $stmt->bindParam(':department',$student['department']);
        $stmt->bindParam(':password',$student['password']);
        $stmt->bindParam(':role',$student['role']);
        try {
            $stmt->execute();
            if($stmt) {
                return 1;
            } 
            else {
                return 0;
            }
        }
        catch(Exception $ex) {
            $this->error_message = $ex->getMessage();
            echo $ex->getMessage();
            return -1;
        }
    }

    public function getAllStudentsFromModel(){
        $sql = "call sp_getAllStudents()";

        $stmt = $this->db_conn->prepare($sql);
        try {
            $stmt->execute();
            if($stmt) {
                $rows = array();
                while($rw = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    $rows[] = $rw;
                }
            return $rows;
            }
            else {  
                return array();
            }
        }
        catch(PDOException $ex) {
            $this->state = false;
            return $ex->getMessage();
        }
    }

}