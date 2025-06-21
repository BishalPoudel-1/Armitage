<h1 align="center">⚔️ Armitage & Metasploit Auto Setup Script</h1>



<p align="center">
  🚀 Automate the full setup of <strong>Armitage</strong>, <strong>Metasploit</strong>, and <strong>PostgreSQL</strong> on Arch Linux or BlackArch.
</p>

# Start script image
![image](https://github.com/user-attachments/assets/5c2e0635-b42c-48d6-b893-13df7c24b5ce)

---

## 📦 Features

✅ One-command setup for:
- 🧰 **Metasploit Framework**
- 💾 **PostgreSQL database**
- ☠️ **Armitage GUI frontend**
- 🔐 Secure user credentials (entered at runtime)
- 📂 Auto-generated `database.yml`
- 🔌 `msfrpcd` service launch with custom credentials

---

## 🖥️ System Requirements

- 🐧 Arch Linux or BlackArch
- 🔐 Sudo/root access
- 🌐 Internet connection
- 🖼️ GUI environment for Armitage

---

## ⚙️ Installation & Usage

```bash
# 1. Download the script
git clone https://github.com/BishalPoudel-1/Armitage.git

# 2. Make it executable
chmod +x setup_armitage.sh

# 3. Run it with sudo
sudo ./setup_armitage.sh
````

📝 During execution, you will be prompted to enter:

* PostgreSQL **username**, **password**, and **database name**
* msfrpcd **username** and **password**

---

## 📁 Output Example

### `~/.msf4/database.yml`

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

---

## 💡 What the Script Does

1. Installs `armitage` and dependencies via `pacman`
2. Initializes PostgreSQL with secure user input
3. Creates PostgreSQL roles and DB for Metasploit
4. Generates `.msf4/database.yml` config file
5. Launches `msfrpcd` with chosen login credentials
6. Opens the Armitage GUI and connects to Metasploit

---

## 🛡️ Security Notice

⚠️ This script is for **testing and ethical use only**.

* Never use default credentials on production systems
* Protect `.msf4/database.yml` from unauthorized access
* Avoid running in unsecured or public environments

---

## 🖥️ Supported Platforms

| OS            | Supported             |
| ------------- | --------------------- |
| Arch Linux    | ✅                     |
| BlackArch     | ✅                     |
| Kali Linux    | ❌ (Use `apt` instead) |
| Ubuntu/Debian | ❌ (Use `apt` instead) |

---

## 📜 License

This project is licensed under the **MIT License**. Use responsibly and ethically.

---

## 👨‍💻 Author

**Bishal Poudel**

💼 Cybersecurity & Systems Automation


