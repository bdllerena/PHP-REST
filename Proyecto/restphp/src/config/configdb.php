<?php
	class configdb
	{ 
		private $host = 'localhost';
		private $user = 'root';
		private $password = 'qwerty123';
		private $database = 'peliculas';
		
		public function connect()
		{
			$connection_mysql = "mysql:host=$this->host;dbname=$this->database";
			$connectionDB = new PDO($connection_mysql, $this->user, $this->password);
			$connectionDB->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			$connectionDB -> exec("set names UTF8");
			return $connectionDB;
		}
	}
?>