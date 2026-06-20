# TicketGo — Full Stack Ticketing System

A complete online ticket booking system for flights, trains, buses, and cars.

## Tech Stack

- **Frontend**: React 18, React Router v6, Axios
- **Backend**: Node.js, Express.js
- **Database**: MySQL

---

## Setup Instructions

### 1. Database Setup

```bash
# Login to MySQL and run the schema:
mysql -u root -p < database.sql
```

This creates the `ticketing_db` database and seeds all sample data.

---

### 2. Backend Setup

```bash
cd backend
npm install
```

Edit `.env` — set your MySQL password:

```
DB_PASSWORD=your_actual_mysql_password
```

Start backend:

```bash
npm run dev     # development (with nodemon)
npm start       # production
```

Backend runs at: http://localhost:5000

---

### 3. Frontend Setup

```bash
cd frontend
npm install
npm start
```

Frontend runs at: http://localhost:3000

---

## Project Structure

```
ticketing/
├── database.sql              ← Run first in MySQL
├── README.md
├── backend/
│   ├── .env                  ← Set DB credentials here
│   ├── package.json
│   ├── server.js             ← Express app entry
│   ├── config/db.js          ← MySQL connection pool
│   ├── middleware/auth.js    ← JWT middleware
│   └── routes/
│       ├── auth.js           ← Register / Login
│       ├── transport.js      ← Flights, Trains, Buses, Cars
│       └── bookings.js       ← Create & fetch bookings
└── frontend/
    ├── package.json
    └── src/
        ├── App.js            ← Routes
        ├── api.js            ← Axios config
        ├── index.css         ← Global design system
        ├── context/AuthContext.js
        ├── components/Navbar.js
        └── pages/
            ├── AuthPage.js   ← Login / Register
            ├── Dashboard.js  ← Browse all transport
            ├── TransportDetail.js ← Vehicle details
            ├── BookingPage.js ← Booking form
            ├── BookingConfirm.js ← Ticket confirmation
            └── MyBookings.js ← User booking history
```

## API Endpoints

| Method | Endpoint                   | Auth | Description       |
| ------ | -------------------------- | ---- | ----------------- |
| POST   | /api/auth/register         | No   | Register new user |
| POST   | /api/auth/login            | No   | Login user        |
| GET    | /api/transport/flights     | Yes  | List flights      |
| GET    | /api/transport/flights/:id | Yes  | Flight details    |
| GET    | /api/transport/trains      | Yes  | List trains       |
| GET    | /api/transport/trains/:id  | Yes  | Train details     |
| GET    | /api/transport/buses       | Yes  | List buses        |
| GET    | /api/transport/buses/:id   | Yes  | Bus details       |
| GET    | /api/transport/cars        | Yes  | List cars         |
| GET    | /api/transport/cars/:id    | Yes  | Car details       |
| POST   | /api/bookings              | Yes  | Create booking    |
| GET    | /api/bookings/my           | Yes  | My bookings       |
| GET    | /api/bookings/:id          | Yes  | Single booking    |

