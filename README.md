# DevSecOps Trial

## Overview

This repository is a hands-on trial for implementing a full DevSecOps pipeline using GitHub Actions. It demonstrates how to integrate static and dynamic analysis, container security, semantic versioning, and automated deployment into a single CI/CD flow.

## CI/CD Workflow

The GitHub Actions workflow automates the following steps:

### 1. 🔍 SonarQube Code Scanning
- **Purpose**: Performs Static Application Security Testing (SAST).
- **Tool**: SonarQube.
- **Outcome**: Detects bugs, code smells, and security vulnerabilities before build.

### 2. ✅ Application Testing and Linting
- **Includes**:
  - **Run application tests** (unit/integration tests).
  - **Hadolint scanning**: Lints Dockerfiles to ensure best practices.
  - **Code standards**: Enforces formatting/linting rules (e.g., ESLint/Prettier).

### 3. 🛠 Build Phase
- **Steps**:
  - `Build container`: Builds Docker image of the application.
  - `Build application`: Compiles or bundles the application if necessary.

### 4. 🚀 Semantic Release
- **Purpose**: Automatically generates version numbers and changelogs based on commit messages (using [semantic-release](https://github.com/semantic-release/semantic-release)).

### 5. 📦 Deploy to VM
- **Action**: Deploys the Docker container to a virtual machine (e.g., using SSH or cloud-specific CLI).
- **Infrastructure**: Typically configured with Ansible or remote Docker deployment.

### 6. 🧹 Cleanup Actions
- **Purpose**: Clears temporary resources, artifacts, or sensitive files from the runner.

## Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/tukangk3tik/devsecops-trial.git
   cd devsecops-trial
   ```

2. **Add Secrets** in GitHub:
   - `SONAR_TOKEN`
   - `PAT_GITHUB_TOKEN`
   - `SONAR_HOST_URL`
   - `VM_HOST`
   - `VM_SSH_KEY`
   - `VM_SSH_PORT`
   - `VM_USER`

3. **Add Vars** in GitHub:
   - `NODE_VERSION`
   - `PROJECT_NAME`

4. **Configure your `.github/workflows/ci.yml`** file to match your tools and infra.

## Technologies Used

- GitHub Actions
- SonarQube
- Hadolint
- Docker
- Semantic Release
- Ansible (optional for VM deployment)

## License

This project is licensed under the [MIT License](LICENSE).
