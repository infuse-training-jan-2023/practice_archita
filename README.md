## docker commands 

#### Exercise 1
=====
**Create and run a simplepython script with command line arguments, environment variables and some external dependencies like ‘numpy’,  ‘PIL’ etc.**
*Eg. Array manipulation using numpy, screenshot/image operations on images.*
```
docker build -t exercise_01 -f DockerFile .
docker run -it exercise_01
```

#### Exercise 2
=====
**Create and run a simpleruby script with command line arguments, environment variables and some external dependencies like ‘json’, ‘Faker’ etc.**
*Eg. Generate data using Faker, parse or stringify jsondatausingjson library.*
```
docker build -t exercise_02 -f DockerFile .
docker run -it exercise_02
```

#### Exercise 3
=====
**Create and run a simpleruby test script using ‘test-unit’ library and print the test output**
*Eg. Create a class and perform unit testing on the methods.*
```
docker build -t exercise_03 -f DockerFile .
docker run -it exercise_03
```

#### Exercise 4
=====
**Create and run a simple Nodescript using javascript and external dependencies like ‘axios’, ‘moment’ etc.**
*Eg. Take date as an input and print the formatted date using ‘moment’, Log response from an API using ‘axios’.*
```
docker build -t exercise_04 -f DockerFile .
docker run -it exercise_04
```

#### Exercise 5
=====
**Create and run a Node/Express server on a PORT input using environment variable via Dockerfile**
```
docker build -t exercise_05 -f DockerFile .
docker run -p 8080:8080 -it exercise_05
```

#### Exercise 6
=====
**Run a local react frontend server and a backend node server and build & run the development environmentusing docker compose**
*Explore different arguments & config that can be used like*
- *Port mapping*
- *Volume mapping etc.*
```
docker build -t backend -f DockerFile .
docker build -t frontend -f DockerFile .

docker run -p 5000:5000 -it backend 
docker run -p 3000:3000 -it frontend

docker-compose up
```

