# Docker Development Environments

This repository provides reusable Docker-based development environments for multiple programming languages and tools, such as Node.js, Python, PHP, and more. The goal is to maintain a clean host machine while offering a consistent setup for your entire team.

---

## Supported Languages and Tools

- **Node.js** (with Firebase CLI)
- **Python** (coming soon)
- **PHP** (coming soon)

Each language or tool has its own Dockerfile, making it easy to build and run commands without installing dependencies on your local system.

---

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/docker-dev-env.git
cd docker-dev-env
```

---

### 2. Build and Use a Docker Environment

Each language or tool has its own directory with a corresponding Dockerfile. Follow the steps below for your desired environment:

#### Node.js
1. Navigate to the Node.js folder:
   ```bash
   cd node
   ```

2. Build the Docker image:
   ```bash
   docker build -t node-dev -f node.Dockerfile .
   ```

3. Add the following aliases to your shell configuration (`~/.zshrc` or `~/.bashrc`):
   ```bash
   alias node='docker run --rm -it -v "$(pwd):/usr/src/app" -w /usr/src/app node-dev node'
   alias npm='docker run --rm -it -v "$(pwd):/usr/src/app" -w /usr/src/app node-dev npm'
   alias firebase='docker run --rm -it -v "$(pwd):/usr/src/app" -w /usr/src/app node-dev firebase'
   ```

4. Reload your shell configuration:
   ```bash
   source ~/.zshrc  # For Zsh users
   source ~/.bashrc # For Bash users
   ```

5. Use the Node.js environment:
   ```bash
   node --version      # Check Node.js version
   npm install         # Install dependencies
   firebase login      # Log in to Firebase
   ```

---

### 3. Add More Environments

#### Python (Example)
- Navigate to the Python folder:
  ```bash
  cd python
  ```

- Build the Docker image:
  ```bash
  docker build -t python-dev -f python.Dockerfile .
  ```

- Add the following alias:
  ```bash
  alias python='docker run --rm -it -v "$(pwd):/usr/src/app" -w /usr/src/app python-dev python'
  alias pip='docker run --rm -it -v "$(pwd):/usr/src/app" -w /usr/src/app python-dev pip'
  ```

---

## Benefits of Using Docker for Development

- **Clean Host Environment**: Avoid cluttering your system with multiple versions of tools or programming languages.
- **Consistency**: Ensure the same development environment across your team.
- **Portability**: Use the same setup across different machines with ease.
- **Flexibility**: Add new Dockerfiles for additional languages or tools as needed.

---

## Contributing

Feel free to add Dockerfiles for other languages or tools! Open a pull request with your changes, and ensure your setup is documented clearly in the README.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
```

---

### Repository Structure

```
docker-dev-env/
├── node/
│   ├── node.Dockerfile
│   ├── README.md
├── python/
│   ├── python.Dockerfile
│   ├── README.md
├── php/
│   ├── php.Dockerfile
│   ├── README.md
└── README.md
