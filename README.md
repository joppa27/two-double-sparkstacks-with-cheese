# two-double-sparkstacks-with-cheese
got tired of fighting with ops for hardware and access.  Dockerized a spark stack that I can play with to my hearts content!

#Pre-Reqs
1. Docker & Docker Compose. Get it from [https://docker.github.io/engine/installation/](https://docker.github.io/engine/installation/)
2. Windows/OSX users: Docker for Windows/Mac is tres cool, but the networking is not trivial. This sparkstack was tested in a docker machine. I used the following command to create my machine: 
 * `docker-machine create -d virtualbox let-it-spark`
 * `docker-machine ip let-it-spark` ip address, so you can connect to spark master:
   * ex. spark://192.168.99.100:{7077_PORT}
 
#start the stack on OSX
 open your terminal/cmd console and navigate to the root of this repo. The following commands should get you up and running!
 ```
 eval $(docker-machine env let-it-spark)
 docker-compose up -d
 
 #to tail the logs (ctrl-c to close):
 docker-compose logs -f
 
 #to see the port mappings(important for the spark master url, 
 #look for which port 7077 is mapped to
 # if my mapping is this 0.0.0.0:32954->7077/tcp my master URL will look something like this:
 # spark://192.168.99.100:32954
 docker-compose ps
 
 #to scale the worker nodes for more horsepower:
 docker-compose scale worker=3
 
 #to scale the worker nodes for less horsepower: 
 docker-compose scale worker=1
 
 #to take down the stack once you're done:
 docker-compose down
 ```
 
 
