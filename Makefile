APP_NAME=docker-project-1
DOCKER_IMAGE=$(APP_NAME)
GIT_REPO=https://github.com/Athithya-Sakthivel/Docker1.git
GIT_BRANCH=main

# Phony targets to avoid naming conflicts
.PHONY: all docker-build docker-run install-requirements git-init git-pull git-push clean

# Define the order of execution for "all"
all: git-init git-pull install-requirements docker-build docker-run git-push

# Install Python dependencies if requirements.txt exists
install-requirements:
	@if [ -f requirements.txt ]; then \
		echo "Installing Python dependencies..."; \
		pip install -r requirements.txt; \
	else \
		echo "No requirements.txt found, skipping..."; \
	fi

# Build the Docker image specific to this project
docker-build:
	@echo "Building Docker image: $(DOCKER_IMAGE)..."
	docker build -t $(DOCKER_IMAGE) .

# Run the Docker container for this project
docker-run:
	@echo "Running Docker container for $(DOCKER_IMAGE)..."
	docker run -d -p 8000:8000 $(DOCKER_IMAGE)

# Initialize Git repository for the project
git-init:
	@if [ ! -d .git ]; then \
		echo "Initializing Git repository and setting remote to $(GIT_REPO)..."; \
		git init; \
		git remote add origin $(GIT_REPO); \
		git branch -M $(GIT_BRANCH); \
		git add .; \
		git commit -m "Initial commit for $(APP_NAME)"; \
		git push -u origin $(GIT_BRANCH); \
	else \
		echo "Git repository already initialized."; \
	fi

# Pull latest changes from remote to prevent conflicts
git-pull:
	@echo "Pulling latest changes from remote branch $(GIT_BRANCH)..."
	@git fetch origin $(GIT_BRANCH)
	@git pull --rebase origin $(GIT_BRANCH) || echo "Rebase conflict. Please resolve conflicts manually."

# Push all files of this project to the specified GitHub repository
git-push:
	@echo "Pushing project files to GitHub repository $(GIT_REPO)..."
	git add .
	git commit -m "Automated commit via Makefile" || echo "No changes to commit."
	@git push origin $(GIT_BRANCH) || echo "Push failed. Please resolve conflicts and try again."

# Clean up Docker artifacts specific to this project
clean:
	@echo "Cleaning up Docker containers and images for $(DOCKER_IMAGE)..."
	-docker rm -f $$(docker ps -aq --filter "ancestor=$(DOCKER_IMAGE)") || true
	-docker rmi -f $$(docker images -q $(DOCKER_IMAGE)) || true
