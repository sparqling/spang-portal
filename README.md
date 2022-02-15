# SPANG Portal

The SPANG Portal is an integrated web service including SPANG libraries and a web interface to the SPANG command functionalities.

It will include SPANG repository as a sub-module in the future.

## Getting Started
### With Docker
    $ docker-compose up --build -d
    $ docker-compose exec app bash
    (in the container)
    $ cd ../app
    $ bundle
    $ exit

After the container started, access localhost:7070 by a web browser.

To check if a query is processed correctly,
```
$ docker-compose exec app spang2 library/disgenet/disease_gene.rq  --prefix spang/etc/prefix,spang/user_prefix -q
```

To see the log,
```
docker-compose logs app
```
or 
```
docker-compose logs -f app
```
to follow the output.

### Without Docker (ruby 2.5.1 is required)
    $ bundle 
    $ bundle exec rails s

### Deploy in subdirectory
In config/application.rb, add a line like the following.

    config.relative_url_root = "/subdirectory_name"

Copyright (c) 2019 Hirokazu Chiba <br>
Released under the MIT license <br>
http://opensource.org/licenses/mit-license.php
