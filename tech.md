# Study With Buddy — Technology Stack

## 1. Project Overview

**Study With Buddy** is a collaborative mobile application that helps students connect with study partners, communicate, share notes, create tasks, study together, and track collaborative study time.

The MVP is designed to be developed with **free-tier technologies** wherever possible.

---

# 2. Technology Stack

| Layer                | Technology                     | Purpose                           |
| -------------------- | ------------------------------ | --------------------------------- |
| Mobile App           | Flutter                        | Cross-platform mobile application |
| Programming Language | Dart                           | Flutter development               |
| Backend              | Supabase                       | Backend-as-a-Service              |
| Database             | PostgreSQL                     | Store application data            |
| Authentication       | Supabase Auth                  | Login and registration            |
| Real-time            | Supabase Realtime              | Real-time chat and updates        |
| File Storage         | Supabase Storage               | Notes, PDFs, images               |
| Notifications        | Local Notifications            | Task and study reminders          |
| Video/Audio          | WebRTC / Free-tier Meeting SDK | Study meetings                    |
| Version Control      | Git + GitHub                   | Source code management            |
| IDE                  | VS Code / Android Studio       | Development                       |

---

# 3. Mobile Application

## Flutter

Flutter will be used to build the mobile application.

### Why Flutter?

* Free and open source
* Single codebase
* Android support
* iOS support
* Fast UI development
* Large package ecosystem
* Good integration with Supabase

### Language

**Dart**

Flutter applications are written in Dart.

---

# 4. Backend

## Supabase

Supabase will be the main backend platform for the MVP.

Supabase provides:

* Authentication
* PostgreSQL database
* Realtime communication
* File storage
* Edge Functions
* Row Level Security

The free tier will be used during development and MVP testing.

---

# 5. Database

## PostgreSQL

Supabase uses PostgreSQL as its database.

Main tables:

```text
users
buddy_requests
buddies
messages
notes
tasks
notifications
study_sessions
```

### Example

```text
users
-------------------------
id
name
email
profile_image
college
course
year
created_at
```

---

# 6. Authentication

## Supabase Auth

Authentication will be handled using Supabase Auth.

### MVP Authentication

* Register
* Login
* Logout
* Password reset

### Authentication Flow

```text
User
 ↓
Flutter Login Screen
 ↓
Supabase Auth
 ↓
Authenticated User
 ↓
User Profile
```

Each user receives a unique user ID.

---

# 7. Real-Time Chat

## Supabase Realtime

Supabase Realtime will be used for one-to-one messaging.

### Flow

```text
Omkar
   ↓
Flutter
   ↓
Supabase
   ↓
Realtime
   ↓
Rahul
```

### Message Structure

```text
messages
-------------------------
id
sender_id
receiver_id
message
created_at
is_read
```

Messages should appear without requiring the user to refresh the application.

---

# 8. Buddy System

The buddy system will be implemented using PostgreSQL tables.

### Buddy Request Flow

```text
User A
  ↓
Search User B
  ↓
Send Request
  ↓
buddy_requests
  ↓
User B
  ↓
Accept
  ↓
buddies
```

### Buddy Request

```text
buddy_requests
-------------------------
id
sender_id
receiver_id
status
created_at
```

### Status

```text
pending
accepted
rejected
```

---

# 9. Notes & File Sharing

## Supabase Storage

Supabase Storage will be used to store:

* PDF files
* Images
* Study notes
* Documents

### Storage Structure

```text
study-notes/
│
├── java/
├── dbms/
├── dsa/
└── ai/
```

The actual files are stored in Supabase Storage.

File metadata is stored in PostgreSQL.

### Notes Table

```text
notes
-------------------------
id
user_id
title
subject
file_url
file_type
created_at
```

---

# 10. Task Management

Tasks will be stored in PostgreSQL.

### Task Structure

```text
tasks
-------------------------
id
created_by
assigned_to
title
description
subject
priority
due_date
status
created_at
```

### Task Status

```text
pending
in_progress
completed
```

---

# 11. Notifications & Reminders

The initial MVP will use **local notifications** to minimize infrastructure and cost.

Examples:

```text
⏰ Task Reminder

Complete DBMS Unit 3
Due in 1 hour
```

```text
📚 Study Reminder

Your study session starts at 8:00 PM.
```

Push notifications can be added later when required.

---

# 12. Study Meet

The Study Meet allows two students to study together.

### MVP Meeting Features

* Join meeting
* Video
* Audio
* Mute/unmute
* Camera on/off
* Leave meeting

### Technology

Use:

**WebRTC or a suitable video meeting SDK with a free/developer tier.**

The application should not build its own video infrastructure for the MVP.

### Meeting Flow

```text
Omkar
  ↓
Create Study Room
  ↓
Room ID
  ↓
Rahul joins
  ↓
Video + Audio
```

---

# 13. Shared Study Timer

The study timer will be implemented inside the Flutter application.

### Example

```text
25 Minutes Study
       ↓
5 Minutes Break
       ↓
25 Minutes Study
```

The session state will be synchronized using Supabase.

### Study Session Table

```text
study_sessions
-------------------------
id
room_id
subject
participants
start_time
end_time
study_duration
break_duration
created_at
```

---

# 14. Collaborative Study-Time Tracking

The application should track **actual study time**, not just meeting duration.

### Example

```text
Meeting Duration = 90 minutes

Break = 10 minutes

Actual Study Time = 80 minutes
```

The application records:

```text
Omkar + Rahul
DSA
80 minutes
```

---

# 15. Dashboard

The Flutter dashboard will display:

* Today's study time
* Study time with buddy
* Pending tasks
* Completed tasks
* Upcoming deadlines
* Recent study sessions

Example:

```text
Today's Study
2h 15m

With Buddy
55m

Tasks
4 / 5 Completed
```

---

# 16. Security

Supabase **Row Level Security (RLS)** will be used to protect user data.

Users should only be able to access:

* Their own profile
* Their own tasks
* Their buddy conversations
* Files shared with them
* Their study sessions

Example:

```text
User A
  ↓
Can access User A data

User B
  ↓
Can access User B data
```

Private chat and files should not be publicly accessible.

---

# 17. Development Tools

### IDE

Use either:

* VS Code
* Android Studio

### Version Control

```text
Git
   ↓
GitHub
```

### Testing

Initial testing:

* Android emulator
* Physical Android device

---

# 18. Environment Variables

Sensitive configuration should not be hardcoded.

Example:

```text
.env
```

Possible variables:

```text
SUPABASE_URL=
SUPABASE_ANON_KEY=
MEETING_API_KEY=
```

The `.env` file should be added to `.gitignore`.

---

# 19. Architecture

The MVP follows a simple architecture:

```text
┌─────────────────────────────┐
│       Flutter Mobile App    │
│                             │
│ UI + Business Logic         │
└──────────────┬──────────────┘
               │
               ↓
┌─────────────────────────────┐
│          Supabase           │
│                             │
│ Auth                        │
│ PostgreSQL                  │
│ Realtime                    │
│ Storage                     │
│ Edge Functions              │
└──────────────┬──────────────┘
               │
               ↓
┌─────────────────────────────┐
│     Video Meeting Service   │
│                             │
│ Video + Audio               │
└─────────────────────────────┘
```

---

# 20. Free-Tier Strategy

The project should initially avoid unnecessary paid services.

### Use Free Options

```text
Flutter              → Free
Dart                 → Free
VS Code              → Free
Android Studio       → Free
Git                  → Free
GitHub               → Free
Supabase             → Free tier
PostgreSQL           → Included
Supabase Realtime    → Free tier
Supabase Storage     → Free tier
Local Notifications  → Free
```

### Important

Free tiers have usage limits.

The MVP should be designed for:

* Development
* Testing
* Demonstration
* College project
* Small initial user base

It should not assume unlimited free infrastructure.

---

# 21. MVP Technology Flow

```text
                    USER
                     │
                     ↓
              Flutter Mobile App
                     │
        ┌────────────┼────────────┐
        ↓            ↓            ↓
   Supabase Auth  PostgreSQL   Storage
        │            │            │
        │       ┌────┼─────┐      │
        │       ↓    ↓     ↓      ↓
        │     Chat Tasks Sessions Notes
        │
        ↓
      Profile
      Buddies

                     │
                     ↓
              Study Meeting
                     │
                Video + Audio
                     │
                     ↓
              Shared Timer
                     │
                     ↓
           Study Time Analytics
```

---

# 22. Recommended Development Order

Build the application in this order:

### Phase 1 — Foundation

1. Flutter project
2. Supabase project
3. Authentication
4. User profile

### Phase 2 — Buddy

5. User search
6. Buddy requests
7. Buddy list

### Phase 3 — Communication

8. One-to-one chat
9. File/note sharing

### Phase 4 — Productivity

10. Tasks
11. Deadlines
12. Local reminders

### Phase 5 — Study Together

13. Study room
14. Video/audio meeting
15. Shared study timer
16. Study-time tracking

### Phase 6 — Dashboard

17. Study history
18. Basic statistics
19. Final MVP dashboard

---

# 23. Final MVP Stack

```text
Frontend
└── Flutter + Dart

Backend
└── Supabase

Database
└── PostgreSQL

Authentication
└── Supabase Auth

Realtime Chat
└── Supabase Realtime

File Storage
└── Supabase Storage

Notifications
└── Local Notifications

Video Meeting
└── WebRTC / Free-tier Meeting SDK

Version Control
└── Git + GitHub
```

## Core Principle

Keep the technology simple.

> **Flutter handles the mobile app. Supabase handles the backend, database, authentication, realtime chat, and storage. A dedicated meeting service handles video/audio.**

This keeps the initial **Study With Buddy MVP inexpensive, manageable, and easy to develop.**
