# SPANG Portal

The SPANG Portal is an integrated web service including SPANG libraries and a web interface to the SPANG command functionalities.

It will include SPANG repository as a sub-module in the future.

Copyright (c) 2019 Hirokazu Chiba 

## Getting Started
### With Docker
    $ docker-compose up --build -d
    $ docker-compose exec app bash
    (in the container)
    $ cd ../app
    $ bundle
    $ exit

After the container started, access localhost:8080 by a web browser.

### Without Docker (ruby 2.5.1 is required)
    $ bundle 
    $ bundle exec rails s

