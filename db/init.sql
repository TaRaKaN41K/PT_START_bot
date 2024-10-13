-- Создание пользователя, если он не существует
DO
$do$
BEGIN
   IF NOT EXISTS (
      SELECT 1
      FROM   pg_catalog.pg_roles
      WHERE  rolname = 'postgres') THEN

      CREATE ROLE your_db_user WITH LOGIN PASSWORD 'postgres';
   END IF;
END
$do$;

-- Создание базы данных, если она не существует
DO
$do$
BEGIN
   IF NOT EXISTS (
      SELECT 1 FROM pg_database
      WHERE datname = 'bot_phon_numbers_and_emails_db') THEN
      CREATE DATABASE your_db_name;
   END IF;
END
$do$;

-- Присваиваем права пользователю на созданную базу данных
GRANT ALL PRIVILEGES ON DATABASE your_db_name TO your_db_user;

-- Переключаемся на базу данных
\c your_db_name

-- Создание таблицы emails
CREATE TABLE IF NOT EXISTS emails (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255)
);

-- Создание таблицы phone_numbers
CREATE TABLE IF NOT EXISTS phone_numbers (
    id SERIAL PRIMARY KEY,
    phone_number VARCHAR(255)
);
