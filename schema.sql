-- Production database foundation. Add migrations as backend implementation grows.
CREATE TABLE users (id BIGSERIAL PRIMARY KEY, player_id VARCHAR(12) UNIQUE NOT NULL, username VARCHAR(32) UNIQUE NOT NULL, email VARCHAR(255) UNIQUE NOT NULL, password_hash TEXT NOT NULL, created_at TIMESTAMPTZ NOT NULL DEFAULT now());
CREATE TABLE characters (id BIGSERIAL PRIMARY KEY, user_id BIGINT NOT NULL REFERENCES users(id), name VARCHAR(64) NOT NULL, appearance JSONB NOT NULL DEFAULT '{}', created_at TIMESTAMPTZ NOT NULL DEFAULT now());
CREATE TABLE servers (id VARCHAR(16) PRIMARY KEY, name VARCHAR(64) NOT NULL, region VARCHAR(32) NOT NULL, capacity INT NOT NULL DEFAULT 700, status VARCHAR(20) NOT NULL DEFAULT 'ONLINE');
CREATE TABLE server_memberships (user_id BIGINT REFERENCES users(id), server_id VARCHAR(16) REFERENCES servers(id), joined_at TIMESTAMPTZ NOT NULL DEFAULT now(), PRIMARY KEY(user_id,server_id));
CREATE TABLE bank_accounts (id BIGSERIAL PRIMARY KEY, character_id BIGINT UNIQUE REFERENCES characters(id), balance BIGINT NOT NULL DEFAULT 0);
CREATE TABLE transactions (id BIGSERIAL PRIMARY KEY, character_id BIGINT REFERENCES characters(id), amount BIGINT NOT NULL, kind VARCHAR(32) NOT NULL, metadata JSONB NOT NULL DEFAULT '{}', created_at TIMESTAMPTZ NOT NULL DEFAULT now());
CREATE TABLE inventory_items (id BIGSERIAL PRIMARY KEY, character_id BIGINT REFERENCES characters(id), item_key VARCHAR(64) NOT NULL, quantity INT NOT NULL DEFAULT 1, weight NUMERIC(10,2) NOT NULL DEFAULT 0);
CREATE TABLE vehicles (id BIGSERIAL PRIMARY KEY, character_id BIGINT REFERENCES characters(id), plate VARCHAR(16) UNIQUE NOT NULL, model VARCHAR(64) NOT NULL, state JSONB NOT NULL DEFAULT '{}');
CREATE TABLE audit_logs (id BIGSERIAL PRIMARY KEY, user_id BIGINT REFERENCES users(id), action VARCHAR(64) NOT NULL, metadata JSONB NOT NULL DEFAULT '{}', created_at TIMESTAMPTZ NOT NULL DEFAULT now());
