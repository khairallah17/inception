# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mkhairal <mkhairal@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/29 10:29:03 by mkhairal          #+#    #+#              #
#    Updated: 2024/03/29 14:02:28 by mkhairal         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: up

create:
	mkdir -p /home/mkhairal/data/wordpress
	mkdir -p /home/mkhairal/data/mariadb
	
build: create
	docker-compose -f ./srcs/docker-compose.yml build

up:
	docker-compose -f ./srcs/docker-compose.yml up -d

down:
	docker-compose -f ./srcs/docker-compose.yml down

stop:
	docker-compose -f ./srcs/docker-compose.yml stop
	
clean:
	docker-compose -f ./srcs/docker-compose.yml down
	rm -rf /home/mkhairal/data/wordpress/*
	rm -rf /home/mkhairal/data/mariadb/*
	
re: clean all