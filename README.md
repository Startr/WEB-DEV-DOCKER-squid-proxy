# WEB-DEV-DOCKER-squid-proxy
A Simple proxy that works to cache files needed simplifying and speeding builds

run the following commands to start the proxy:
```
make build
make it_a_terminal
#now from in the docker container that started run the following
./start.sh
```

Alternatively you can run the following commands to start the proxy:
```
make build
make it_run
```

This will start the proxy in the background and you can see the logs by running the following command:
```
make logs
```