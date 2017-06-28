# RevoEnglish backend

## Getting started

### 1. RVM and rails

Install Ruby version manager and rails framework on Linux

```
$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
$ curl -sSL https://get.rvm.io | grep -v __rvm_print_headline | bash -s stable
$ gem install rails
```
Then install SQLite3

### 2. Configure project

```
$ bundle install
```

### 3. Start application
```
$ bin/rails server -p 3001
```

### 4. API specification

- Routes are in api namespace, for example: /api/xxx
- All routes require authentication

```
POST /login: authenticate an user
GET /logout: remove user's authentication from server
POST /forms: submit a form
GET /forms: list student's registration forms
```
