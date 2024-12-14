# Variables
IMAGE_NAME=squid-proxy
CONTAINER_NAME=squid-proxy
HOST_PORT=3128
CONFIG_FILE=$(shell pwd)/squid.conf
CONTAINER_CONFIG_PATH=/etc/squid/squid.conf

# Build the Docker image
it_build:
	docker build -t $(IMAGE_NAME) .

# Run the Docker container
it_run: it_stop
	docker run -d --name $(CONTAINER_NAME) \
		-p $(HOST_PORT):3128 \
		-v $(CONFIG_FILE):$(CONTAINER_CONFIG_PATH) \
		$(IMAGE_NAME)

# Stop and remove the container if it exists
it_stop:
	@docker rm -f $(CONTAINER_NAME) 2>/dev/null || true

# Run interactively
it_run_interactive: it_stop
	docker run -it --rm --name $(CONTAINER_NAME) \
		-p $(HOST_PORT):3128 \
		-v $(CONFIG_FILE):$(CONTAINER_CONFIG_PATH) \
		$(IMAGE_NAME)

it_a_terminal:
	docker run -it --rm --name $(CONTAINER_NAME) \
		-p $(HOST_PORT):3128 \
		-v $(CONFIG_FILE):$(CONTAINER_CONFIG_PATH) \
		$(IMAGE_NAME) /bin/bash

logs:
	docker logs -f $(CONTAINER_NAME)