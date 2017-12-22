# Deployment

First, clone this directory. Then...

## Same Server

To use this setup on the same machine as a running Virtuoso instance, change "virtuoso" to the name of Virtuoso's Docker image in `docker-compose.yml`, these lines:

```
  external-links:
   - virtuoso:database  # => - VIRTUOSO_IMAGE_NAME:database
```

then do

```
sudo docker-compose up
```

## Remote Database

To use an external database, modify the IP address in these lines in `docker-compose.remote.yml`:

```
  extra_hosts:
   - "database:143.233.226.60"
```

and then do

```
sudo docker-compose -f docker-compose.remote.yml up
```