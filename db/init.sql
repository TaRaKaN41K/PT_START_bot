-- Создание пользователя, если он не существует
DO
$do$
BEGIN
   IF NOT EXISTS (
      SELECT 1
      FROM   pg_catalog.pg_roles
      WHERE  rolname = 'postgres') THEN

      EXECUTE 'CREATE ROLE postgres WITH LOGIN PASSWORD ''postgres''';
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
      EXECUTE 'CREATE DATABASE bot_phon_numbers_and_emails_db';
   END IF;
END
$do$;

-- Присваиваем права пользователю на созданную базу данных
DO
$do$
BEGIN
   EXECUTE 'GRANT ALL PRIVILEGES ON DATABASE bot_phon_numbers_and_emails_db TO postgres';
END
$do$;

-- Переключаемся на базу данных
\c bot_phon_numbers_and_emails_db

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
