/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/ empleados /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE empleados;

DROP TABLE IF EXISTS empleados;
CREATE TABLE `empleados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4;
INSERT INTO empleados(id,nombre,correo) VALUES(65,'Oscar','oscaruh@develoteca.com'),(74,'Yoan!!','yoanestrada01@gmail.com');