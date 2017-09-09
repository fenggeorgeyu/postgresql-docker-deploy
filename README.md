# `PostgreSQL` and `pgAdmin` docker deploy 

Before start use docker to pull the images of mysql and phpmyadmin

    docker pull postgres
    docker pull fenglc/pgadmin4

To create the containers of postgresql and pgadmin run

    make create

To login to psql for postgresql in command line

    make psql

To stop containers

    make stop

To start containers

    make start

To delete containers

    make delete


## `pgAdmin` login

Then you can hit http://localhost:5050 in your browser.

Use default administrator account to log in:

    user: pgadmin4@pgadmin.org
    password: admin

After login, create a new connection

    host: db_server (this is the --link container alias of the postgreSQL database server)
    username: postgres
    database: postgres
    password: ysu123 (default, change in makefile passwd)



