docker-apache2-php5
================

Base docker image to run PHP applications on Apache 2.


Building the base image
-----------------------

To create the base image `mmorejon/apache2-php5`, execute the following command on the docker-apache2-php5 folder:

    docker build -t mmorejon/apache2-php5 .


Running your Apache+PHP docker image
------------------------------------

Start your image binding the external ports 80 in all interfaces to your container:

    docker run -d -p 80:80 mmorejon/apache2-php5

Test your deployment:

    curl http://localhost/


Enable .htaccess files
------------------------------------

If you app uses .htaccess files you need to pass the ALLOW_OVERRIDE environment variable

    docker run -d -p 80:80 -e ALLOW_OVERRIDE=true mmorejon/apache2-php5


Loading your custom PHP application
-----------------------------------

This image can be used as a base image for your PHP application. Create a new `Dockerfile` in your
PHP application folder with the following contents:

    FROM mmorejon/apache2-php5

After that, build the new `Dockerfile`:

    docker build -t username/my-php-app .

And test it:

    docker run -d -p 80:80 username/my-php-app

Test your deployment:

    curl http://localhost/

That's it!


Loading your custom PHP application
--------------------------------------------------------------

Create a Dockerfile like the following:

    FROM mmorejon/apache2-php5
    RUN rm -fr /app
    ADD . /app

- Add your php application to `/app`

