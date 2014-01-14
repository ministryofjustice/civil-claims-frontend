#! /bin/bash

curl -H "Content-Type: application/json" --url 'http://localhost:9393/users' --data '{"user": {"email":"test@user.com", "password":"12345678"}}'

