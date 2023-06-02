# Inception

Inception is a project aimed at learning Docker and structuring Docker containers, along with setting up a basic wordpress backend and database using Docker Compose.

## Project Description

The goal of the project wass to set up a small infrastructure composed of different services within a virtual machine. 
The project requires the use of Docker Compose and the creation of Dockerfiles for each service.
The containers could not be pulled from dockerhub, and must be built from a recent stable version of Alpine, or in my case Debian. 

The services included in the project are:

- NGINX container with TLSv1.2 or TLSv1.3 only
- WordPress container with php-fpm (without nginx)
- MariaDB container without nginx
- Volumes for WordPress database and website files
- Docker network to establish connections between containers

The containers must also restart in case of a crash.

## Usage

To run the project, follow these steps:

1. If running on Linux, execute `make linux` to allow access to the host.
2. Run `make`, and follow instructions to build the env file
3. Access the project via "jpfannku.42.fr"
4. You should be able to modify the wordpress using the credentials you provided for the env
5. You should also be able to use make reload to call docker compose up without affecting the volumes or database
6. run `make fclean` to stop the container and remove the volumes

## Experience

I encountered some challenges with root permissions and variable scope, due to much outdated and conflicting information about the various tools involved.
Thankfully, I was able to problem-solve and eventually gained a deeper understanding of all of the services used. 
This project gave me a great foundation for containerization and gave the basic skills for beginning my final project, transcendence (coming soon).
