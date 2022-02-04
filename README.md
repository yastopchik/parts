## Quickstart
1. [Install git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
2. [Install docker](https://docs.docker.com/install/)
3. [Install docker-compose](https://docs.docker.com/compose/install/)
4. Run
```
git clone https://github.com/yastopchik/parts.git
cd parts

docker-compose up -d --build

##доступ в php контейрен
docker-compose exec app bash 

composer install
php console/yii app/setup --interactive=0
```
Add this lines to your hosts file
```
##(Willcard не работает в Windows)
127.0.0.1 parts.lcl
```
Go to [http://parts.lcl](http://parts.lcl)


###Makefile
#####Install for Windows
- [Install cygwin](http://www.cygwin.com/)
- Add folder C:\Program Files (x86)\GnuWin32\bin to PATH
- [Install plugin](https://plugins.jetbrains.com/plugin/9333-makefile-support)
- Go to File -> Settings -> Build, Execution, Deployment -> Make (PHPStorm)
- Set 'Path to make executable' to C:\Program Files (x86)\GnuWin32\bin\make.exe

###Xdebug
Setup PHPStorm [guide](https://blog.denisbondar.com/post/phpstorm_docker_xdebug)

### Connect to  CLickhouse
```
docker-compose exec clickhouse clickhouse-client
```