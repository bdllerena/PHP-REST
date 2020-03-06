# Restful PHP

Servicios REST en PHP, usando el framework Slim.

## Prerrequisitos

Los siguientes programas son necesarios:

```
Xampp o cualquier otro stack que incluya php 5.0
```
```
Composer
```
```
Slim framework
```
```
Notepad ++, Atom o cualquier editor de texto
```
Ver la sección de **herramientas** para más información.
## Instalación
### Creando el proyecto
Se necesita ubicarse en la carpeta htdocs en el directorio Xampp (usualmente en el disco C:), donde se creará el proyecto en este caso restphp.

![Paso1](https://i.imgur.com/7M0FmBw.png)

Se ejecutará un cmd donde nos accedemos al proyecto recién creado con el comando cd.
```
cd C:\xampp\htdocs\restphp
```
Luego se ejecutará el comando de instalación slim.
```
composer require slim/slim "^3.0"
```

![Paso2](https://i.imgur.com/kNZ1rRr.png)

Observaremos que hay 3 nuevos archivos creados en nuestro proyecto, además se deberá agregar dos carpetas adicionales llamadas public y src.
Public será la carpeta donde residirá nuestras configuraciones respectivas a la página de inicio de nuestro proyecto.
Mientras que Src será la carpeta que contendrá nuestros archivos .php haciendo referencia a las respectivas funcionalidades RESTful.

![Paso3](https://i.imgur.com/wHJ00Zr.png)

### Configurando un host virtual
Para agregar un host virtual es necesario añadirlo dentro de la carpeta apache/conf/extra/httpd-vhosts.conf
Donde se quitará el comentario de la siguiente línea de código
```
NameVirtualHost *:80
```
Y se agregará un nuevo host virtual de la siguiente manera
```
<VirtualHost *:80>
  DocumentRoot "C:/xampp/htdocs/restphp/public"
  ServerName paphprest
</VirtualHost>
```
Este hostvirtual permitirá el acceso a los URI de manera más corta y ágil.
Terminada la configuración de este host virtual se deberá agregarlo en el listado de host de la máquina donde se trabaja; en el siguiente directorio
```
C:\Windows\System32\drivers\etc
```
Se procede a editar el archivo host agregando el host virtual previamente configurado con la siguiente línea 
```
127.0.0.1 paphprest
```
Finalmente se agregará dos archivos en la carpeta public llamados index.php y .htaccess
Donde el contenido de index.php será una página de bienvenida que recibe un nombre en su uri
```
<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require 'vendor/autoload.php';

$app = new \Slim\App;
$app->get('/hello/{name}', function (Request $request, Response $response) {
    $name = $request->getAttribute('name');
    $response->getBody()->write("Hello, $name");

    return $response;
});
$app->run();
```
Mientras que .htaccess será un archivo de configuración necesario para habilitar nuestro host
```
RewriteEngine on
RewriteCond %{REQUEST_FILENAME} !-d
RewriteCond %{REQUEST_FILENAME} !-f
RewriteRule . index.php [L]
```

![Paso4](https://i.imgur.com/BCuX5PM.png)

## Despliegue

Es necesario ejecutar el script **peliculas.sql** o crear una base de datos películas con una tabla **actor** con los siguientes atributos
```
CREATE TABLE `actor` (
  `actor_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `ACTOR_NAME` varchar(15) NOT NULL,
  `ACTOR_LASTNAME` varchar(15) NOT NULL,
  `ACTOR_TYPE` varchar(15) DEFAULT NULL,
  `ACTOR_BIRTH_DATE` date DEFAULT NULL,
  PRIMARY KEY (`actor_id`)
);
```
### GET (Todos los registros)
**URI**
```
http://paphprest/peliculas/actores
```
**RESPONSE**

![Paso5](https://i.imgur.com/WlDnOPX.png)

### GET (Solo un registro por id)
**URI**
```
http://paphprest/peliculas/actores/{id}
```
**RESPONSE**

![Paso6](https://i.imgur.com/7eaWN1a.png)

### POST 
**URI**
```
http://paphprest/peliculas/actores/
```
**HEADER**
```
Content-Type: application/json
```
**BODY**
```
{
  "ACTOR_NAME":"David",
  "ACTOR_LASTNAME":"Llerena",
  "ACTOR_TYPE":"Auxiliar"
}
```
**RESPONSE**

![Paso7](https://i.imgur.com/svfSRpz.png)

### PUT
**URI**
```
http://paphprest/peliculas/actores/{id}
```
**HEADER**
```
Content-Type: application/json
```
**BODY**
```
{
  "ACTOR_NAME":"David",
  "ACTOR_LASTNAME":"Llerena",
  "ACTOR_TYPE":"Auxiliar"
}
```
**RESPONSE**

![Paso8](https://i.imgur.com/5Yi4kcw.png)

### DELETE
**URI**
```
http://paphprest/peliculas/actores/{id}
```
**RESPONSE**

![Paso9](https://i.imgur.com/X1cwOuz.png)

## Herramientas

* [Slim](https://www.slimframework.com/) - Php framework
* [Xampp](https://www.apachefriends.org/es/download.html) - Web Server/Stack
* [Composer](https://getcomposer.org/download/) - Dependency Manager for PHP 
* [Atom](https://atom.io/) - Text editor

