<?php
	use \Psr\Http\Message\ServerRequestInterface as Request;
	use \Psr\Http\Message\ResponseInterface as Response;
	
	require 'vendor/autoload.php';
	require 'config/configdb.php';
	
	$app = new \Slim\App;
	//Leer
	
	$app->get('/peliculas/actores', function(Request $request, Response $response)
	{
		$read = 'SELECT * FROM actor';
		try
		{
			$database = new configdb();
			$database = $database->connect();
			$execute = $database->query($read);
			$actores = $execute->fetchAll(PDO::FETCH_OBJ);
			$database = null;
			header('Access-Control-Allow-Origin: *');
			header("Content-Type: application/json;charset=utf-8");
			echo json_encode($actores);
			
		}catch(PDOException $e)
		{
			echo '{"error": {"text": '.$e->getMessage().'}';
		}
	});
	//Leer 1 solo
	$app->get('/peliculas/actores/{id}', function(Request $request, Response $response)
	{
		$id = $request->getAttribute('id');
		$read = "SELECT * FROM actor WHERE ACTOR_ID ='$id'";
		try
		{
			$database = new configdb();
			$database = $database->connect();
			$execute = $database->query($read);
			$actor = $execute->fetchAll(PDO::FETCH_OBJ);
			$database = null;
			header('Access-Control-Allow-Origin: *');
			header("Content-Type: application/json;charset=utf-8");
			echo json_encode($actor);
		}catch(PDOException $e)
		{
			echo '{"error": {"text": '.$e->getMessage().'}';
		}
	});
	//Leer cantidad especifica
	$app->get('/peliculas/actores/quantity/{quantity}', function(Request $request, Response $response)
	{
		$quantity = $request->getAttribute('quantity');
		$read = "SELECT * FROM actor LIMIT $quantity";
		try
		{
			$database = new configdb();
			$database = $database->connect();
			$execute = $database->query($read);
			$actor = $execute->fetchAll(PDO::FETCH_OBJ);
			$database = null;
			header('Access-Control-Allow-Origin: *');
			header("Content-Type: application/json;charset=utf-8");
			echo json_encode($actor);
		}catch(PDOException $e)
		{
			echo '{"error": {"text": '.$e->getMessage().'}';
		}
	});
	//empieza nombre con
	$app->get('/peliculas/actores/filter_by_name/{name}', function(Request $request, Response $response)
	{
		$name = $request->getAttribute('name');
		$read = "SELECT * FROM actor WHERE actor_name LIKE '$name%'";
		try
		{
			$database = new configdb();
			$database = $database->connect();
			$execute = $database->query($read);
			$actor = $execute->fetchAll(PDO::FETCH_OBJ);
			$database = null;
			header('Access-Control-Allow-Origin: *');
			header("Content-Type: application/json;charset=utf-8");
			echo json_encode($actor);
		}catch(PDOException $e)
		{
			echo '{"error": {"text": '.$e->getMessage().'}';
		}
	});

	//Crear actor
	$app->post('/api/peliculas/actores/agregar', function(Request $request, Response $response)
	{
		$nombre = $request->getParam('ACTOR_NAME');
		$apellido = $request->getParam('ACTOR_LASTNAME');
		$tipo = $request->getParam('ACTOR_TYPE');
		
		$read = "INSERT INTO actor(ACTOR_NAME,ACTOR_LASTNAME,ACTOR_TYPE)VALUES(:ACTOR_NAME,:ACTOR_LASTNAME,:ACTOR_TYPE)";
		try
		{
			$database = new configdb();
			$database = $database->connect();
			$statement = $database->prepare($read);
			$statement->bindParam(':ACTOR_NAME',$nombre);
			$statement->bindParam(':ACTOR_LASTNAME',$apellido);
			$statement->bindParam(':ACTOR_TYPE',$tipo);
			$statement->execute();
			echo '{"mensaje": {"text": "Actor añadido"}';
		}catch(PDOException $e)
		{
			echo '{"error": {"text": '.$e->getMessage().'}';
		}
	});

	//Actualizar actor
	$app->put('/api/peliculas/actores/actualizar/{id}', function(Request $request, Response $response)
	{
		$id = $request->getAttribute('id');
		$nombre = $request->getParam('ACTOR_NAME');
		$apellido = $request->getParam('ACTOR_LASTNAME');
		$tipo = $request->getParam('ACTOR_TYPE');
		
		$read = "UPDATE actor SET ACTOR_NAME = :ACTOR_NAME, 
		ACTOR_LASTNAME = :ACTOR_LASTNAME, 
		ACTOR_TYPE = :ACTOR_TYPE 
		WHERE ACTOR_ID = $id";
		try
		{
			$database = new configdb();
			$database = $database->connect();
			$statement = $database->prepare($read);
			$statement->bindParam(':ACTOR_NAME',$nombre);
			$statement->bindParam(':ACTOR_LASTNAME',$apellido);
			$statement->bindParam(':ACTOR_TYPE',$tipo);
			$statement->execute();
			echo '{"mensaje": {"text": "Actor actualizado"}';
		}catch(PDOException $e)
		{
			echo '{"error": {"text": '.$e->getMessage().'}';
		}
	});

	//Borrar actor
	$app->delete('/api/peliculas/actores/borrar/{id}', function(Request $request, Response $response)
	{
		$id = $request->getAttribute('id');
		$read = "DELETE FROM actor WHERE ACTOR_ID = $id";
		try
		{
			$database = new configdb();
			$database = $database->connect();
			$statement = $database->prepare($read);
			$statement->execute();
			echo '{"mensaje": {"text": "Actor eliminado"}';
		}catch(PDOException $e)
		{
			echo '{"error": {"text": '.$e->getMessage().'}';
		}
	});
	
	$app->run();
?>
