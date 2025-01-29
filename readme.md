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
git clone https://github.com/ankitpise/docker-dev-env.git
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
   alias node='docker run --rm -it --init -v "$(pwd):/usr/src/app" -w /usr/src/app node-dev node'
   alias npm='docker run --rm -it --init -v "$(pwd):/usr/src/app" -w /usr/src/app node-dev npm'
   alias firebase='docker run --rm -it --init \
   -v "$(pwd):/usr/src/app" \
   -v "$HOME/.config/firebase:/root/.config/configstore" \
   -w /usr/src/app \
   node-dev firebase'
   alias tsc='docker run --rm -it --init -v "$(pwd):/usr/src/app" -w /usr/src/app node-dev tsc'
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
   ```

---

### 3. Logging into Firebase CLI

When using the Firebase CLI inside a Docker container, the standard `firebase login` command may not work directly because it tries to launch a browser on the host machine. To address this, use the `--no-localhost` option, which provides a URL and an authentication code for manual login.

#### Steps to Login to Firebase CLI

1. Run the login command with the `--no-localhost` option:
   ```bash
   firebase login --no-localhost
   ```

2. The CLI will output a URL like this:
   ```
   Visit this URL on any device to log in:
   https://accounts.google.com/o/oauth2/auth?client_id=...
   ```

3. Copy the URL and paste it into your browser on the host machine. Log in with your Google account.

4. After logging in, the browser will display an authorization code. Copy the code.

5. Paste the code into the terminal running in the Docker container:
   ```
   Enter authorization code:
   <paste-code-here>
   ```

6. Once logged in, your credentials will be saved in the mapped volume (`~/.config/firebase` on your host machine). This allows the session to persist across container runs.

#### Verify Your Login

After logging in, verify that the session works by running:
```bash
firebase projects:list
```

This should list all your Firebase projects.

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

---

## Repository Structure

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
```
