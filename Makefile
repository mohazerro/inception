all:
	docker compose up -d
clean:
	docker compose down
networks:
	docker network ls
volumes:
	docker volume ls
fclean: clean
	bash -c "docker image prune --force; docker image \
	rm nginx:v1 wordpress:v1 mariadb:v1"

re: fclean all

del_volumes:
	sudo rm -rf /home/mgamil/data/wordpress/*
	sudo rm -rf /home/mgamil/data/mariadb/*
	bash -c "docker volume rm inception_mariadb inception_wordpress"

images:
	bash -c "docker images"
logs:
	bash -c "docker compose logs"