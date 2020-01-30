# Freeradius server with web interface (daloradius) for using with separated mysql database



## Quick reference
Freeradius server with web interface, - best decision fore manage a lot of hotspots and public wifi access points

## How to use:
### Start freeradius container:
```console
	docker run --name freeradius -d -p 1812:1812/udp -p 1813:1813/udp -p 80:80 -e CLIENT_SECRET=<Radius secret> -e CLIENT_NET=<client net> RADIUS_DB_SERVER=<MYSQL SERVER> -e RADIUS_DB_USER=<MYSQL USER> -e RADIUS_DB_PWD=<MYSQL PASSWD>  asdaru/freeradius-mysql-daloradius
```
#### `CLIENT_SECRET`
Radius secret fo NAS devices
#### `CLIENT_NET`
Netwok where your NAS devices were installed (for example 192.168.0.0/16)
By default was set unlimited access 0.0.0.0/0

## For mysql database you can use docker to
```
    docker run --name db -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:latest
	docker run --name freeradius -d -p 1812:1812/udp -p 1813:1813/udp -p 80:80 -e CLIENT_SECRET=<Radius secret> -e CLIENT_NET=<client net> --link db:db RADIUS_DB_SERVER=db -e RADIUS_DB_USER=root> -e RADIUS_DB_PWD=my-secret-pw  asdaru/freeradius-mysql-daloradius
```


### Manage clients nets by web interface
1. Set CLIENT_NET="" (-e CLIENT_NET="")
2. Manage Nas devices via web interface -p <addr servers where container run>/mng-rad-nas.php 
 
## Web interface
Information about web interface you can find on [daloradius github](https://github.com/lirantal/daloradius)
### Default login and password for web interface
Login: administrator
Password: radius   

## The FreeRadius log is available through Docker's container log:
```console
$ docker logs freeradius
```