---
title: "Development of NGINX Dynamic Modules"
date: 2018-06-19T16:54:29-04:00
draft: true
tags: ["nginx", "c", "networking", "software"]
categories: ["Software", "Nginx"]
---

# NGINX Dynamic Module Development Guide

The purpose of this guide is to teach basic [NGINX](https://www.nginx.com/) dynamic module development and usage.

# Table of Contents
TODO: Generate TOC when complete

## Development Setup

First, we need to set up a development environment for our NGINX module. 

Follow the steps below to set it up.

### 0: Install NGINX open source

- Follow the [NGINX documentation](https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-open-source/) 
to install NGINX open source
    - Recommend to install on linux

- **Take note** of the version of your NGINX installation
    - We'll use `nginx/1.16.0` in this guide

```bash
nginx -v
> nginx version: nginx/1.16.0
```

### 1: Download NGINX source

Download the NGINX package corresponding to your NGINX version at [nginx.org/download](nginx.org/download).

```bash
wget http://nginx.org/download/nginx-1.16.0.tar.gz
tar xzvf nginx-1.16.0.tar.gz
```

### 2: Install Development Dependencies

Install development dependencies needed to compile the NGINX dynamic module

Example of installing NGINX development dependencies on linux with apt-get package manager.
```bash
apt-get install -y \
        gnupg2 \
        libpcre3 \
        libpcre3-dev \
        zlib1g \
        zlib1g-dev \
        libssl-dev
```

### 3: Create the NGINX module source

To begin writing an Nginx module, we'll create a directory and two files.

Create a directory for the module and change into it
```bash
mkdir ngx_example_module
cd ngx_example_module
```

Create the module `config` file
```bash
touch config
```

Add the following contents to the `config` file
```bash
ngx_addon_name=ngx_example_module

if test -n "$ngx_module_link"; then
    ngx_module_type=HTTP
    ngx_module_name=ngx_example_module
    ngx_module_srcs="$ngx_addon_dir/ngx_example_module.c"
    . auto/module
else
    HTTP_MODULES="$HTTP_MODULES ngx_example_module"
    NGX_ADDON_SRCS="$NGX_ADDON_SRCS $ngx_addon_dir/ngx_example_module.c"
fi
```

Create the C source file
```bash
touch ngx_example_module.c
```

You should now have a directory structure similar to
```bash
ngx_example_module/
├── config
└── ngx_example_module.c
```

## Write a basic module

NGINX modules are written in C. You'll need to be comfortable with C to use this guide.

NGINX modules have three roles:
- handlers
- filters
- load-balancers

The "core" of Nginx simply takes care of all the network and application protocols and sets up the sequence of modules that are eligible to process a request.



## Compile the module

Compile the module by first running the configure script with the --with-compat argument, which creates a standard 
build environment supported by both open source NGINX and NGINX Plus. Then run make modules to build the module
```bash
cd nginx-1.16.0
./configure --with-compat --add-dynamic-module=../ngx_example_module
make modules
```

Copy the module shared object library (.so file) to `/etc/nginx/modules`
```bash
sudo cp objs/ngx_example_module.so /etc/nginx/modules
```

## Use the Module
To load the module into NGINX Plus, add the load_module directive in the top‑level (main) context of your nginx.conf 
configuration file (not within the http or stream context):

```bash
vi /etc/nginx/nginx.conf
```

```bash
load_module modules/ngx_example_module.so;
```

In the http context, add a location block with the hello_world directive provided by the Hello World module. 
Requests to the location return the response hello world.

```bash
vi /etc/nginx/conf.d/default.conf
```

```text
location /hello {
     hello_world;
}
```

Reload your NGINX configuration and test it with a simple request:
```bash
nginx -s reload
curl http://localhost/hello
hello, NGINX
```
