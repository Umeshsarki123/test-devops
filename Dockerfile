# 1️⃣ Use Python base image
FROM python:3.11-slim

# 2️⃣ Set working directory
WORKDIR /app

# 3️⃣ Copy Python file
COPY app.py .

# 4️⃣ Run the Python file
CMD ["python", "main.py"]
