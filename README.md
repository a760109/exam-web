# React Web Exam

## Getting started

```
yarn install
yarn start
```

## build with docker

```
docker build -t exam-web:latest .
```

## run with docker

```
docker run -d -p 3000:80 -e PORT=3000 -e REACT_APP_HOSTNAME=prod exam-web
```
