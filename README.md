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

**Note:** The proxy will be running on port 3128 and you can configure your system to use this proxy to cache files needed for builds.

**Note:** At this time you can not all contianers to use this proxy as it is not yet configured to allow this. Use must be configured on a per container basis.

**Note:** On Mac for the time being we recommand usering SquidMan as it is a GUI that allows you to easily configure the proxy settings.

**Note:** On Windows for the time being we recommand usering CCProxy as it is a GUI that allows you to easily configure the proxy settings.