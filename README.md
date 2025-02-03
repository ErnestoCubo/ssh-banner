# SSH-BANNER

This repository contains a shell script (`sh`) designed to be used as a banner on your ssh server.

## Requirements

- A Unix-based system (Linux/macOS).
- Execution permissions for the script file.
- Have ssh installed.

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/your_username/your_repository.git
   ```

2. Give execute permissions to the script:
   ```bash
   chmod +x banner.sh
   ```

3. Disable actual banner scripts
   ```bash
   chmod -x /etc/update-motd.d/*
   ```
4. Move the script to banner directory
   ```bash
   mv banner.sh /etc/update-motd.d/
   ```
5. Login and enjoy 

## Contributing

If you'd like to contribute to this project, please follow these steps:

1. Fork this repository.
2. Create a new branch for your feature (`git checkout -b feature/new-feature`).
3. Make your changes and commit them (`git commit -am 'Add new feature'`).
4. Push your branch (`git push origin feature/new-feature`).
5. Open a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
