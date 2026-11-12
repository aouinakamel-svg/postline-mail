# Postline Mail

Independent Outlook-style application starter. **Current status: frontend prototype only.**

## Run

Requires Node.js 20+. From repository root:

```bash
npm install
npm run dev
```

Open http://localhost:3000.

## Implemented

- Responsive mail interface with Inbox, Sent, Drafts, Starred and Trash views.
- Search demonstration messages, view message content, star and move to trash.
- Compose and save a draft **in current browser memory only**.
- Basic in-memory task entry.
- PostgreSQL schema design for production backend.

## Not yet implemented

- Persistent backend, user registration/authentication, actual SMTP/IMAP delivery, MIME parsing, attachments, spam protection, calendar/contacts persistence, desktop/mobile builds, and production deployment.
- Do not deploy as a production mail service or store sensitive information in this prototype.

## Production roadmap

1. Add server-side authentication with password hashing, rate limiting and secure sessions.
2. Connect PostgreSQL with per-user authorization and migrations.
3. Integrate proven mail transport (SMTP submission, inbound MTA, IMAP/JMAP); configure MX, SPF, DKIM, DMARC, TLS, queue/retry and spam/abuse controls.
4. Add MIME, threading, attachment object storage and search indexing.
5. Implement calendar (including invitations), contacts, tasks, notifications and synchronization.
6. Package desktop via Electron and mobile via Expo/React Native using shared typed API.
7. Add automated tests, monitoring, backup/restore, and security review before launch.

## Demo persistence

Messages, drafts, stars, trash, tasks, contacts and events persist in browser localStorage only. Not secure for real email. SMTP, IMAP, authentication and server persistence are not yet implemented.
