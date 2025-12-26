# 🚀 UPLINK : Network Fixer

![Uplink Thumbnail](thumbnail.png)

> **Automated Network Repair Tool for Kali Linux (Live & Installed)**
> *Created by: The Matrix*

---

## 📖 About The Project
**Uplink** is a powerful Bash script designed specifically for **Kali Linux Live** users who face issues with missing Wi-Fi or Bluetooth drivers. 

It automates the boring process of:
* Installing missing Firmware/Drivers (Realtek, Intel, Atheros).
* Fixing "No Wi-Fi Adapter Found" errors.
* Fixing "Bluetooth Adapter Not Detected" errors.
* Restarting & Unblocking Network Services.

**Best for:** Fresh Kali Linux Live boots where Wi-Fi/Bluetooth is missing after restart.

---

## ✨ Features
* ✅ **Auto-Detect Internet:** Prevents crashes if no internet is available.
* ✅ **One-Click Driver Install:** Installs `firmware-realtek`, `firmware-iwlwifi`, `blueman`, etc.
* ✅ **Service Reset:** Refreshes NetworkManager & Bluetooth services instantly.
* ✅ **Interactive Menu:** Simple 1-2-3-4 option selection.
* ✅ **The Matrix Theme:** Cool Hacker-style UI.

---

## ⚙️ Installation & Usage

**Note:** For the first run (Option 1), ensure you are connected via **USB Tethering** or Ethernet to download drivers.

### Step 1: Clone the Repository
```bash
git clone [https://github.com/YourUsername/Uplink.git](https://github.com/YourUsername/Uplink.git)
```

### Step 2: Navigate to Directory
```bash
cd Uplink
```

### Step 3: Give Permission
```bash
chmod +x uplink.sh
```

### Step 4: Run the Tool
```bash
sudo ./uplink.sh
```

---

## 🖥️ Menu Options

* **[1] Fresh Setup:** Downloads drivers & fixes services (Requires Internet).
* **[2] Fix Wi-Fi Only:** Restarts Wi-Fi services (No Internet needed).
* **[3] Fix Bluetooth Only:** Restarts Bluetooth & wakes up controller.
* **[4] Quit:** Exit the tool.

---

## 🛠️ Created By
**The Matrix**
*Project: Uplink*
