# JustCars

## Setup

```
docker-compose build
docker-compose run --rm app bin/setup
```

## Running tests

```
docker-compose run --rm app bin/rails test
```

## Running development server

```
docker-compose run --rm --service-ports app
```

## Running bash console

```
docker-compose run --rm app /bin/bash
```

