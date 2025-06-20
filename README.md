
### 📄 `README.md`

````markdown
# Armitage and Metasploit Auto Setup Script (Arch Linux / BlackArch)

This script automates the installation and configuration of **Metasploit**, **PostgreSQL**, and **Armitage** on Arch-based systems. It initializes the database, sets up user credentials, configures Metasploit, and launches Armitage with the required services.

## 📦 Features

- Installs Armitage and required dependencies
- Initializes and configures PostgreSQL for Metasploit
- Prompts user to create secure database credentials
- Generates a valid `database.yml` for Metasploit
- Launches the `msfrpcd` RPC service
- Starts the Armitage GUI interface

## ⚙️ Prerequisites

- An Arch Linux or BlackArch system
- Root or sudo privileges
- Internet connection (for package installation)
- GUI environment (for Armitage)

## 🚀 Installation and Usage

1. **Download the script**:
   ```bash
   wget https://yourdomain.com/setup_armitage.sh
````

2. **Make the script executable**:

   ```bash
   chmod +x setup_armitage.sh
   ```

3. **Run the script with sudo**:

   ```bash
   sudo ./setup_armitage.sh
   ```

4. **Follow the interactive prompts** to:

   * Set the PostgreSQL username, password, and database name
   * Set the msfrpcd (Metasploit RPC) service username and password

5. Once complete, Armitage will launch automatically.

## 🛠 What the Script Does

* Installs Armitage and dependencies using `pacman`
* Initializes the PostgreSQL data directory
* Creates a PostgreSQL user and database for Metasploit
* Configures `.msf4/database.yml` with your credentials
* Starts `msfrpcd` with custom credentials
* Exports `MSF_DATABASE_CONFIG` and launches Armitage

## 📁 Example `database.yml`

```yaml
production:
  adapter: postgresql
  database: metasploit4
  username: your_username
  password: your_password
  host: localhost
  port: 5432
  pool: 5
  timeout: 5
```

## 🔒 Security Notice

* Passwords are entered securely via terminal input.
* This script is for **educational or penetration testing environments only**.
* Do **not use weak passwords** in production or network-facing systems.
* Ensure that any stored credentials are secured appropriately.

## ✅ Supported Systems

* Arch Linux
* BlackArch

## 📄 License

This project is provided under the MIT License. Use at your own risk.

---

**Author**: *Your Name*
**Version**: 1.0
**Last Updated**: June 2025

```

