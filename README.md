# 🃏 Trading Card Marketplace

A full-stack web application for buying, selling, and showcasing collectible trading cards. Built with Node.js, Express, MySQL, and Docker Compose, this project features secure user registration, image uploads, and a scalable backend architecture.

---

## 🚀 Features

- 🔐 **User Registration**: Secure signup with frontend validation and hashed password storage
- 🖼️ **Image Uploads**: Upload card images using Multer and store metadata in MySQL
- 📊 **Database Integration**: Relational schema optimized for performance and scalability
- 🧱 **Dockerized Setup**: Multi-container environment with Node.js, MySQL, and phpMyAdmin
- 🔍 **API Endpoints**: RESTful routes for user actions, card listings, and image handling
- 🧪 **Validation & Error Handling**: Robust input checks and graceful error responses

---

## 🧰 Tech Stack

| Layer         | Technology                  |
|---------------|-----------------------------|
| Backend       | Node.js, Express.js         |
| Database      | MySQL                       |
| Image Upload  | Multer                      |
| Containerization | Docker, Docker Compose   |
| Admin Panel   | phpMyAdmin                  |
| Authentication| bcrypt, express-validator   |

---

## 🐳 Docker Setup

To spin up the environment:

```bash
docker-compose up --build
