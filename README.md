# Docker Project 1 - Makefile Workflow

This repository contains a containerized Python application managed with a Makefile for streamlined development and deployment.

## Prerequisites
1. Install Docker.
2. Install Git.
3. Ensure `pip` is installed.

## Features
The Makefile automates the following steps:
1. Initializes and syncs the Git repository.
2. Installs Python dependencies.
3. Builds the Docker image.
4. Runs the Docker container.
5. Pushes changes to the GitHub repository.
6. Cleans up Docker artifacts.

## Usage
### Commands
Run the following commands in the project root:

1. **Run the entire workflow:**
   ```bash
   make all
   ```
   This command:
   - Initializes the Git repository.
   - Pulls the latest changes.
   - Installs dependencies.
   - Builds and runs the Docker container.
   - Pushes changes to the `main` branch.

2. **Install dependencies:**
   ```bash
   make install-requirements
   ```

3. **Build the Docker image:**
   ```bash
   make docker-build
   ```

4. **Run the Docker container:**
   ```bash
   make docker-run
   ```

5. **Initialize Git repository:**
   ```bash
   make git-init
   ```

6. **Pull latest changes:**
   ```bash
   make git-pull
   ```

7. **Push changes to GitHub:**
   ```bash
   make git-push
   ```

8. **Clean Docker artifacts:**
   ```bash
   make clean
   ```

## Project Structure
```
Docker-project-1/
├── .dockerignore       # Docker ignore file
├── .env                # Environment variables
├── app.py              # Application source code
├── Dockerfile          # Docker build instructions
├── Makefile            # Automation script
├── requirements.txt    # Python dependencies
└── README.md           # Project documentation
```

## Notes
- Ensure `requirements.txt` contains the necessary Python dependencies.
- Replace the GitHub repository URL in the Makefile if using a different remote.

## License
This project is open-source and available under the MIT License.

