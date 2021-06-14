<?php

use Slim\App;
use Slim\Http\Request;
use Slim\Http\Response;
use Slim\Http\UploadedFile;

return function (App $app) {
$container = $app->getContainer();

//----------------------------------------PTR-------------------------------------------
//mhs
//CREATE
$app->post("/mahasiswa/", function (Request $request, Response $response){

    $mhs = $request->getParsedBody();

    $sql = "INSERT INTO mahasiswa (nim,nama_mhs, email,jenis_kelamin,no_hp) 
            VALUE (:nim,:nama_mhs,:email,:jenis_kelamin,:no_hp)";
    $stmt = $this->db->prepare($sql);

    $data = [
        ":nim" => $mhs["nim"],
        ":nama_mhs" => $mhs["nama_mhs"],
        ":email" => $mhs["email"],
        ":jenis_kelamin" => $mhs["jenis_kelamin"],
        ":no_hp" => $mhs["no_hp"],
    ];

    if($stmt->execute($data))
    return $response->withJson(["Mhs created succesfully"], 200);
    
    return $response->withJson(["status" => "failed", "data" => "0"], 200);
});

//READ
$app->get("/mahasiswa/", function (Request $request, Response $response){
    $sql = "SELECT * FROM mahasiswa";
    $stmt = $this->db->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll();
    return $response->withJson(["status" => "success", "data" => $result], 200);
});

//UPDATE
$app->put("/mahasiswa/{id}", function (Request $request, Response $response, $args){
    $mhs_id = $args["id"];
    $mhs = $request->getParsedBody();
    $sql = "UPDATE mahasiswa SET nama_mhs=:nama_mhs, email=:email, jenis_kelamin=:jenis_kelamin, no_hp=:no_hp
            WHERE nim=:nim";
    $stmt = $this->db->prepare($sql);
    
    $data = [
        ":nim" => $mhs_id,
        ":nama_mhs" => $mhs["nama_mhs"],
        ":email" => $mhs["email"],
        ":jenis_kelamin" => $mhs["jenis_kelamin"],
        ":no_hp" => $mhs["no_hp"],
    ];

    if($stmt->execute($data))
    return $response->withJson(["Mhs Updated succesfully"], 200);
    
    return $response->withJson(["status" => "failed", "data" => "0"], 200);
});

//DELETE
$app->delete("/mahasiswa/{id}", function (Request $request, Response $response, $args){
    $id = $args["id"];
    $sql = "DELETE FROM mahasiswa WHERE nim=:nim";
    $stmt = $this->db->prepare($sql);
    
    $data = [
        ":nim" => $id
    ];

    if($stmt->execute($data))
        return $response->withJson(["status" => "success", "data" => "1"], 200);
    
    return $response->withJson(["status" => "failed", "data" => "0"], 200);
});

//Konsul
//CREATE
$app->post("/konsul/", function (Request $request, Response $response){

    $konsul = $request->getParsedBody();

    $sql = "INSERT INTO konsul (nim,nidn,topik,hari,tgl, jam, status_konsul) 
            VALUE (:nim,:nidn,:topik,:hari,:tgl,:jam,:status_konsul)";
    $stmt = $this->db->prepare($sql);

    $data = [
        ":nim" => $konsul["nim"],
        ":nidn" => $konsul["nidn"],
	":topik" => $konsul["topik"],
        ":hari" => $konsul["hari"],
        ":tgl" => $konsul["tgl"],
        ":jam" => $konsul["jam"],
        ":status_konsul" => $konsul["status_konsul"],

    ];

    if($stmt->execute($data))
        return $response->withJson(["status" => "success", "data" => "1", "idKonsul" => $this->db->lastInsertId()], 200);
    
    return $response->withJson(["status" => "failed", "data" => "0"], 200);
});

//READ
$app->get("/konsul/", function (Request $request, Response $response){
    $sql = "SELECT * FROM konsul";
    $stmt = $this->db->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll();
    return $response->withJson(["status" => "success", "data" => $result], 200);
});

//UPDATE
$app->put("/konsul/{id}", function (Request $request, Response $response, $args){
    $konsul_id = $args["id"];
    $ks = $request->getParsedBody();
    $sql = "UPDATE konsul SET nim=:nim, nidn=:nidn, topik=:topik, hari=:hari, tgl=:tgl, jam=:jam,
            status_konsul=:status_konsul WHERE idKonsul=:idKonsul";
    $stmt = $this->db->prepare($sql);
    
    $data = [
        ":idKonsul" => $konsul_id,
        ":nim" => $ks["nim"],
        ":nidn" => $ks["nidn"],
	":topik" => $ks["topik"],
        ":hari" => $ks["hari"],
        ":tgl" => $ks["tgl"],
        ":jam" => $ks["jam"],
        ":status_konsul" => $ks["status_konsul"],
    ];

    if($stmt->execute($data))
    return $response->withJson(["Konsultasi Updated succesfully"], 200);
    
    return $response->withJson(["status" => "failed", "data" => "0"], 200);
});

//DELETE
$app->delete("/konsul/{id}", function (Request $request, Response $response, $args){
    $id = $args["id"];
    $sql = "DELETE FROM konsul WHERE idKonsul=:idKonsul";
    $stmt = $this->db->prepare($sql);
    
    $data = [
        ":idKonsul" => $id
    ];

    if($stmt->execute($data))
        return $response->withJson(["status" => "success", "data" => "1"], 200);
    
    return $response->withJson(["status" => "failed", "data" => "0"], 200);
});

//Dosen
//CREATE
$app->post("/dosen/", function (Request $request, Response $response){

    $dsn = $request->getParsedBody();

    $sql = "INSERT INTO dosen (nidn,nama_dsn, email,jenis_kelamin,no_hp) 
            VALUE (:nidn,:nama_dsn,:email,:jenis_kelamin,:no_hp)";
    $stmt = $this->db->prepare($sql);

    $data = [
        ":nidn" => $dsn["nidn"],
        ":nama_dsn" => $dsn["nama_dsn"],
        ":email" => $dsn["email"],
        ":jenis_kelamin" => $dsn["jenis_kelamin"],
        ":no_hp" => $dsn["no_hp"],
    ];

    if($stmt->execute($data))
    return $response->withJson(["Dosen created succesfully"], 200);
    
    return $response->withJson(["status" => "failed", "data" => "0"], 200);
});

//READ
$app->get("/dosen/", function (Request $request, Response $response){
    $sql = "SELECT * FROM dosen";
    $stmt = $this->db->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll();
    return $response->withJson(["status" => "success", "data" => $result], 200);
});

//UPDATE
$app->put("/dosen/{id}", function (Request $request, Response $response, $args){
    $dsn_id = $args["id"];
    $dsn = $request->getParsedBody();
    $sql = "UPDATE dosen SET nama_dsn=:nama_dsn, email=:email, jenis_kelamin=:jenis_kelamin, no_hp=:no_hp
            WHERE nidn=:nidn";
    $stmt = $this->db->prepare($sql);
    
    $data = [
        ":nidn" => $dsn_id,
        ":nama_dsn" => $dsn["nama_dsn"],
        ":email" => $dsn["email"],
        ":jenis_kelamin" => $dsn["jenis_kelamin"],
        ":no_hp" => $dsn["no_hp"],
    ];

    if($stmt->execute($data))
    return $response->withJson(["Dosen Updated succesfully"], 200);
    
    return $response->withJson(["status" => "failed", "data" => "0"], 200);
});

//DELETE
$app->delete("/dosen/{id}", function (Request $request, Response $response, $args){
    $id = $args["id"];
    $sql = "DELETE FROM dosen WHERE nidn=:nidn";
    $stmt = $this->db->prepare($sql);
    
    $data = [
        ":nidn" => $id
    ];

    if($stmt->execute($data))
        return $response->withJson(["status" => "success", "data" => "1"], 200);
    
    return $response->withJson(["status" => "failed", "data" => "0"], 200);
});




//----------------------------------------END-------------------------------------------



};
