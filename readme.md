# Mini ERP Backend

A Django REST Framework-based backend system for managing products, orders, and users with JWT authentication, Celery task processing, and PostgreSQL support.

---

## 🚀 Features

- User Registration & JWT Login
- Product CRUD (with delete protection if ordered)
- Order creation with multiple items
- Nested order items in list
- Order total calculation
- Background task processing with Celery + Redis

---

## ⚙️ Tech Stack

- **Python** 3.10+
- **Django** 4.x
- **Django REST Framework**
- **PostgreSQL**
- **JWT (SimpleJWT)**
- **Celery + Redis**

---

## 🛠️ Setup Instructions

### 1. Clone the repository

```bash
git clone https://github.com/your-username/mini-erp-backend.git
cd mini-erp-backend
```

### 2. Create & activate virtual environment

```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

### 3. Install dependencies

```bash
pip install -r requirements.txt
```

### 4. Setup PostgreSQL database

Create a PostgreSQL database and update `DATABASES` in `mini_erp/settings.py`.

```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'your_db',
        'USER': 'your_user',
        'PASSWORD': 'your_password',
        'HOST': 'localhost',
        'PORT': '5432',
    }
}
```

### 5. Run migrations

```bash
python manage.py migrate
```

### 6. Create a superuser

```bash
python manage.py createsuperuser
```

### 7. Run Redis server (in another terminal)

```bash
redis-server
```

### 8. Run Celery worker

```bash
celery -A mini_erp worker --loglevel=info
```

### 9. Run Django server

```bash
python manage.py runserver
```

---

## 🔐 Authentication (JWT)

Use `/api/login/` to get access and refresh tokens:

```json
POST /api/login/
{
  "email": "user@example.com",
  "password": "yourpassword"
}
```

Use the returned `access` token in headers:

```http
Authorization: Bearer <your-access-token>
```

---

## 📦 API Endpoints

### Auth

- `POST /api/register/` – Register user
- `POST /api/login/` – JWT login

### Products

- `GET /api/products/` – List products
- `POST /api/products/` – Create product
- `PUT /api/products/<id>/` – Update product
- `DELETE /api/products/<id>/` – Delete (blocked if ordered)

### Orders

- `GET /api/orders/` – List user orders with items and total
- `POST /api/orders/` – Create new order with items

---

## 🧪 Postman Collection (optional)

Add a `postman_collection.json` file for easy testing (not included here).

---

## 📄 License

MIT - for interview/demo purposes.

---

## 👤 Developed by

Disha Vekariya\
Python & Django Developer

---

