-- Planned production schema. Apply only after adding authenticated backend endpoints.
CREATE TABLE users (id UUID PRIMARY KEY, email TEXT UNIQUE NOT NULL, password_hash TEXT NOT NULL, created_at TIMESTAMPTZ DEFAULT NOW());
CREATE TABLE mailboxes (id UUID PRIMARY KEY, user_id UUID NOT NULL REFERENCES users(id), address TEXT UNIQUE NOT NULL, created_at TIMESTAMPTZ DEFAULT NOW());
CREATE TABLE messages (id UUID PRIMARY KEY, mailbox_id UUID NOT NULL REFERENCES mailboxes(id), internet_message_id TEXT, sender TEXT NOT NULL, recipients JSONB NOT NULL DEFAULT '[]', subject TEXT NOT NULL DEFAULT '', body_text TEXT NOT NULL DEFAULT '', folder TEXT NOT NULL DEFAULT 'Inbox', is_starred BOOLEAN NOT NULL DEFAULT FALSE, received_at TIMESTAMPTZ DEFAULT NOW());
CREATE INDEX messages_mailbox_folder_received ON messages(mailbox_id,folder,received_at DESC);
CREATE TABLE contacts (id UUID PRIMARY KEY, user_id UUID NOT NULL REFERENCES users(id), display_name TEXT NOT NULL, email TEXT NOT NULL);
CREATE TABLE events (id UUID PRIMARY KEY, user_id UUID NOT NULL REFERENCES users(id), title TEXT NOT NULL, starts_at TIMESTAMPTZ NOT NULL, ends_at TIMESTAMPTZ NOT NULL);
CREATE TABLE tasks (id UUID PRIMARY KEY, user_id UUID NOT NULL REFERENCES users(id), title TEXT NOT NULL, done BOOLEAN NOT NULL DEFAULT FALSE, due_at TIMESTAMPTZ);
