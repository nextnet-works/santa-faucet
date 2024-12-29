.PHONY: build run stop clean

# Docker image name
IMAGE_NAME = santa-faucet
CONTAINER_NAME = santa-faucet

# Build the Docker image
build:
	docker build -t $(IMAGE_NAME) .

# Run the container
run:
	docker run -d \
		--name $(CONTAINER_NAME) \
		-p 80:80 \
		$(IMAGE_NAME)

# Stop the container
stop:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)

# Clean up
clean:
	docker rmi $(IMAGE_NAME)

# Show container logs
logs:
	docker logs -f $(CONTAINER_NAME)

# All-in-one: rebuild and restart
restart: stop build run