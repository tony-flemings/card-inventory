# 🃏 Trading Card Marketplace

A full-stack web application for buying, selling, and showcasing collectible trading cards. Built with Node.js, Express, MySQL, and Docker Compose, this project features secure user registration, image uploads, and a scalable backend architecture. As a card trader I grow increasingly frustrated with platforms claiming more of the profit YoY. This is my answer to the problem, since they refuse to address it.

---

## 🚀 Features

- 🔐 **User Registration**: Secure signup with frontend validation and OTP's
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

🗂️ Project Structure
├── server/
│   ├── routes/
│   ├── controllers/
│   ├── models/
│   ├── middleware/
│   ├── uploads/
│   └── app.js
├── client/ (optional frontend)
├── docker-compose.yml
├── .env
└── README.md



🛡️ Security & Best Practices
- Environment variables stored in .env
- SQL injection prevention via parameterized queries
- Uploaded files stored securely with MIME type checks
- .sql backups excluded from Git history and .gitignored

📈 Roadmap
- 🔄 Add login and session management
- 🛒 Implement card trading and marketplace features
- 📦 Integrate external APIs (e.g., PriceCharting, SerpAPI)
- 🧠 Add AI-powered card valuation (future)

🤝 Contributing
Pull requests welcome! For major changes, please open an issue first to discuss what you’d like to change.

📄 License
MIT

👤 Author
Tony Flemings
Senior Enterprise Architecture & Data Strategy Professional
LinkedIn | GitHub

---
