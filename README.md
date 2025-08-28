
# Personal Finance Advisor Portal 💰📊

A **Java-based console application** to help users manage their **income, expenses, and investments** efficiently. The system provides both **User** and **Admin** functionalities with features like financial history reports, investment tracking, and secure login.

---

## 🚀 Features

### 👤 User Panel

* Add income with source & date
* Add expense with category, description & date
* Add and track investments (Mutual Funds, Stocks, Gold, FD, etc.)
* Generate personalized **financial history & reports**
* Get advice based on financial data

### 👨‍💻 Admin Panel

* View all registered users
* Delete users
* View all financial advice
* Find **maximum income** using **Stack**
* Search user by username using **Binary Search Tree (BST)**

---

## 🛠️ Tech Stack

* **Language**: Java
* **Concepts Used**:

  * Object-Oriented Programming (OOP)
  * File I/O (to store user data)
  * Data Structures → **Stack, BST**
  * Console-based UI

---

## 📂 Project Structure

```
/PersonalFinanceAdvisor
│── src/
│   ├── Main.java
│   ├── User.java
│   ├── Admin.java
│   ├── Income.java
│   ├── Expense.java
│   ├── Investment.java
│   ├── ReportGenerator.java
│   └── DataStructures/
│       ├── Stack.java
│       └── BST.java
│── data/   (stores user financial data)
│── README.md
```

---

## 🔑 Sample Workflows

### User Registration & Login

* Register with username, password, email, and full name
* Secure login with captcha

### Add Expense

```
Amount: 67000
Category: Maintenance
Description: flate
Date: 2025-02-01
Expense added successfully!
```

### Admin - Find Maximum Income

```
=== MAXIMUM INCOME ===
Maximum Income: ₹500000.00
```

### Admin - Search User (BST)

```
Enter username to search: ram
Username 'ram' found in the BST.
```

---

## 🎯 Learning Outcomes

✔ Understanding **file handling** in Java
✔ Applying **OOP concepts** to real-world problems
✔ Using **Stacks & BSTs** for finance-related operations
✔ Building a **realistic console-based project**

---

## 📌 Future Improvements

* Add database support (MySQL/PostgreSQL) instead of file storage
* Create GUI/Web-based version
* Add AI-based financial advice

---

## 📷 Screenshots

(Add screenshots from your project execution here – like the ones you uploaded)

---

## 🤝 Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

---

## 📜 License

This project is licensed under the MIT License.
