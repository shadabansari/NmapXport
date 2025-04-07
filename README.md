# 🔍 Nmap to Excel Converter (Linux Bash Edition)

A simple and efficient Bash script to convert **Nmap scan results** (`nmap -sV`) into a clean **Excel (.xlsx)** report for further analysis, filtering, or documentation.

---

## 📌 Features

✅ Supports parsing Nmap scans from Linux (Ubuntu/Kali)  
✅ Extracts and structures the following fields:
- **Hostname**
- **IP Address**
- **Port**
- **Protocol (TCP/UDP)**
- **State**
- **Service**
- **Version (if available)**

✅ Automatically generates:
- CSV file: `nmap_results.csv`
- Excel file: `nmap_results.xlsx`

✅ Works great with spreadsheet tools like **LibreOffice Calc** or **Microsoft Excel**  
✅ Handles Nmap output with or without hostnames  
✅ Clean separation of **port numbers** and **protocols**

---

## 📂 Example Output

| Hostname       | IP             | Port | Protocol | State | Service  | Version              |
|----------------|----------------|------|----------|-------|----------|-----------------------|
| webserver.local| 192.168.1.10   | 80   | tcp      | open  | http     | Apache httpd 2.4.29   |
|                | 192.168.1.10   | 443  | tcp      | open  | https    | nginx 1.18.0          |

---

## 🛠️ Prerequisites

Make sure the following are installed:

```bash
sudo apt install nmap
pip3 install pandas openpyxl
```

---

## 🚀 Usage

### 1. Run an Nmap scan and save the output:
```bash
nmap -sV 192.168.1.0/24 > nmap_scan.txt
```

### 2. Run the script:
```bash
bash nmap_to_excel.sh
```

### 3. Output Files:
- ✅ `nmap_results.csv` – Raw data in CSV format
- ✅ `nmap_results.xlsx` – Excel-friendly version

---

## 📁 File Structure

```
📁 your-project/
├── nmap_scan.txt         # Your Nmap output (input)
├── nmap_to_excel.sh      # The Bash script
├── nmap_results.csv      # Generated CSV
└── nmap_results.xlsx     # Final Excel report
```

---

## ✨ Enhancements (coming soon or DIY ideas)

- [ ] Auto-detect UDP or TCP scans
- [ ] Add OS detection and MAC address fields
- [ ] Export to PDF summary
- [ ] Combine multiple scans into one Excel
- [ ] Color-coded Excel rows for open/filtered/closed ports

---

## 👨‍💻 Author

Made with ❤️ for pentesters, sysadmins, and network engineers who love clean reporting.

Feel free to fork, enhance, or suggest improvements!

---

## 📜 License

[MIT License](LICENSE)
