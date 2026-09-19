# Study With Buddy — Development Phases

## Project Goal

Build **Study With Buddy**, a mobile application that allows students to:

* Connect with study buddies
* Chat with each other
* Share study notes
* Create and assign study tasks
* Set deadlines and reminders
* Start study meetings
* Study together using a shared timer
* Track collaborative study time
* View basic study progress

### Core Product Flow

```text
Connect
   ↓
Communicate
   ↓
Plan
   ↓
Study Together
   ↓
Track
   ↓
Complete
```

---

# Technology Stack

```text
Mobile App
└── Flutter + Dart

Backend
└── Supabase

Database
└── PostgreSQL

Authentication
└── Supabase Auth

Realtime
└── Supabase Realtime

File Storage
└── Supabase Storage

Notifications
└── Local Notifications

Study Meet
└── WebRTC / Free-tier Meeting SDK

Version Control
└── Git + GitHub
```

---

# Project Development Phases

```text
Phase 0  → Project Setup
Phase 1  → App Foundation
Phase 2  → Authentication
Phase 3  → User Profile
Phase 4  → Buddy System
Phase 5  → Real-Time Chat
Phase 6  → Notes & File Sharing
Phase 7  → Task Management
Phase 8  → Reminders & Notifications
Phase 9  → Study Meet
Phase 10 → Shared Study Timer
Phase 11 → Study-Time Tracking
Phase 12 → Dashboard & History
Phase 13 → Security & Validation
Phase 14 → Testing & Bug Fixing
Phase 15 → UI/UX Polish
Phase 16 → Final MVP Release
```

---

# PHASE 0 — Project Setup

## Goal

Prepare the development environment and create the project repository.

### Tasks

* Install Flutter
* Install Dart
* Install Android Studio or VS Code
* Configure Android emulator/device
* Create Flutter project
* Initialize Git
* Create GitHub repository
* Connect local project to GitHub
* Create `.gitignore`
* Create `.env` strategy
* Create basic project documentation

### Initial Structure

```text
study-with-buddy/
│
├── lib/
├── assets/
├── test/
│
├── PRD.md
├── MVP.md
├── TECH.md
├── PHASE.md
├── README.md
│
├── pubspec.yaml
└── .gitignore
```

### Completion Criteria

* Flutter project runs successfully.
* App opens on Android emulator/device.
* Git repository is working.
* Initial code is pushed to GitHub.

---

# PHASE 1 — App Foundation

## Goal

Create the basic Flutter application structure.

### Tasks

Create:

```text
lib/
│
├── main.dart
│
├── app/
│   ├── app.dart
│   ├── routes.dart
│   └── theme.dart
│
├── screens/
├── widgets/
├── models/
├── services/
└── utils/
```

### Implement

* App theme
* Colors
* Typography
* Navigation
* Splash screen
* Basic reusable buttons
* Text fields
* Loading indicator
* Error message component

### Completion Criteria

* App starts correctly.
* Navigation works.
* Theme is applied consistently.
* No unnecessary UI duplication.

---

# PHASE 2 — Supabase Setup

## Goal

Connect Flutter with Supabase.

### Tasks

Create Supabase project.

Configure:

* Supabase URL
* Supabase anonymous/public key
* Flutter Supabase package
* Environment configuration

### Create Initial Database

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

### Security

Enable Row Level Security where required.

### Completion Criteria

* Flutter connects successfully to Supabase.
* Database connection works.
* Basic read/write operation works.

---

# PHASE 3 — Authentication

## Goal

Allow students to create and access accounts.

### Screens

```text
Splash
   ↓
Login
   ↓
Register
   ↓
Home
```

### Features

* Register
* Login
* Logout
* Password reset
* Authentication state
* Session persistence

### User Table

```text
users
├── id
├── email
├── name
├── profile_image
├── college
├── course
├── year
└── created_at
```

### Completion Criteria

* New user can register.
* Existing user can log in.
* User remains logged in after reopening the app.
* Logout works.
* Unauthorized users cannot access protected screens.

---

# PHASE 4 — User Profile

## Goal

Allow students to create their study profile.

### Features

* Profile picture
* Name
* College
* Course
* Year
* Subjects
* Bio

### Screens

```text
Profile
Edit Profile
```

### Completion Criteria

* User can create profile.
* User can edit profile.
* Profile data persists in Supabase.
* Profile is visible to connected users.

---

# PHASE 5 — Study Buddy System

## Goal

Allow students to find and connect with study partners.

### Features

* Search users
* View user profile
* Send buddy request
* Accept request
* Reject request
* View buddies
* Remove buddy

### Flow

```text
Search User
    ↓
View Profile
    ↓
Send Request
    ↓
Pending
    ↓
Accept
    ↓
Study Buddy
```

### Tables

```text
buddy_requests
buddies
```

### Completion Criteria

* User can search another user.
* User can send request.
* Receiver sees request.
* Receiver can accept/reject.
* Accepted users appear in buddy list.

---

# PHASE 6 — Real-Time Chat

## Goal

Allow two connected buddies to communicate.

### Features

* One-to-one chat
* Send message
* Receive message in real time
* Message timestamp
* Unread indicator
* Basic message history

### Flow

```text
Buddy List
    ↓
Select Buddy
    ↓
Chat Screen
    ↓
Send Message
    ↓
Supabase Realtime
    ↓
Buddy receives message
```

### Message Table

```text
messages
├── id
├── sender_id
├── receiver_id
├── message
├── is_read
└── created_at
```

### Completion Criteria

* Buddy A can send a message.
* Buddy B receives it without refreshing.
* Both users can send messages.
* Previous messages remain available.

---

# PHASE 7 — Notes & File Sharing

## Goal

Allow buddies to share study material.

### Features

* Upload note
* Select subject
* Add title
* Share with buddy
* View note
* Download note
* Delete own note

### Supported Files

Initially:

```text
PDF
JPG
PNG
DOC/DOCX
```

### Storage

Use:

**Supabase Storage**

### Flow

```text
Select File
    ↓
Upload
    ↓
Supabase Storage
    ↓
Save File Metadata
    ↓
Share with Buddy
```

### Completion Criteria

* User can upload a file.
* File is stored successfully.
* Buddy can access shared file.
* User can delete their own file.

---

# PHASE 8 — Task Management

## Goal

Create accountability between study partners.

### Features

* Create task
* Assign task
* Subject
* Description
* Priority
* Due date
* Due time
* Update status
* Complete task

### Status

```text
Pending
   ↓
In Progress
   ↓
Completed
```

### Example

```text
Complete DBMS Unit 3

Assigned To:
Rahul

Due:
Today, 8:00 PM

Status:
In Progress
```

### Completion Criteria

* User can create task.
* User can assign task to buddy.
* Buddy can see task.
* Buddy can update status.
* Creator can see updated status.

---

# PHASE 9 — Reminders & Notifications

## Goal

Help students remember tasks and study sessions.

### MVP Notifications

* Buddy request
* New task
* Task deadline
* Study meeting
* Study reminder

### Initial Approach

Use **local notifications** wherever possible to keep the MVP simple and inexpensive.

### Completion Criteria

* Task reminders trigger correctly.
* Meeting reminders work.
* Notifications open the relevant screen.

---

# PHASE 10 — Study Meet

## Goal

Allow two students to study together through a private meeting.

### Features

* Create study room
* Join study room
* Video
* Audio
* Mute
* Camera on/off
* Leave meeting

### Meeting Flow

```text
Buddy Profile
    ↓
Start Study Meet
    ↓
Create Room
    ↓
Generate Room ID
    ↓
Send Invitation
    ↓
Buddy Joins
    ↓
Video + Audio
```

### Technology

Use:

**WebRTC or a suitable free/developer-tier meeting SDK.**

Do not build a video infrastructure server from scratch for the MVP.

### Completion Criteria

* User can create a room.
* Buddy can join.
* Both users can see/hear each other.
* Microphone controls work.
* Camera controls work.
* Users can leave the meeting.

---

# PHASE 11 — Shared Study Timer

## Goal

Allow both students to start a synchronized study session.

### Default Timer

```text
25 Minutes Study
        ↓
5 Minutes Break
        ↓
25 Minutes Study
```

### Features

* Start
* Pause
* Resume
* Stop
* Study mode
* Break mode
* Shared timer state

### Flow

```text
Study Meet
    ↓
Start Focus Session
    ↓
Both users see timer
    ↓
Study
    ↓
Break
    ↓
Study
    ↓
Stop
```

### Completion Criteria

* Both users see the same session.
* Timer remains synchronized.
* Pause/resume works.
* Session can be stopped.
* Session data is saved.

---

# PHASE 12 — Collaborative Study-Time Tracking

## Goal

Track how much time two students actually studied together.

### Important Rule

Do not count the entire video meeting as study time.

Example:

```text
Meeting = 90 minutes

Break = 10 minutes

Actual Study = 80 minutes
```

### Study Session Table

```text
study_sessions
├── id
├── room_id
├── participants
├── subject
├── start_time
├── end_time
├── study_duration
├── break_duration
└── created_at
```

### Completion Criteria

* Session start is recorded.
* Session end is recorded.
* Break time is excluded.
* Study duration is calculated.
* Both participants receive the session record.

---

# PHASE 13 — Dashboard & Study History

## Goal

Give students a simple overview of their productivity.

### Dashboard

Show:

```text
Today's Study
2h 15m

Study With Buddy
55m

Tasks
4 / 5

Upcoming Task
DBMS Unit 3
```

### Study History

Show:

```text
Today
DSA       1h 20m

Yesterday
Java      45m

Sep 16
DBMS      1h 10m
```

### Statistics

* Total study time
* Buddy study time
* Number of sessions
* Completed tasks

### Completion Criteria

* Dashboard displays real database data.
* Study history displays previous sessions.
* Statistics update after completing a session.

---

# PHASE 14 — Security & Data Validation

## Goal

Protect user data.

### Implement

* Supabase Row Level Security
* Authentication checks
* Input validation
* File access rules
* Buddy-only chat access
* Buddy-only file access
* Task authorization

### Important Rules

A user should NOT be able to:

* Read another user's private chat.
* Modify another user's tasks.
* Delete another user's notes.
* Access unauthorized study sessions.
* Modify another user's profile.

### Completion Criteria

Security policies are tested using multiple accounts.

---

# PHASE 15 — Testing

## Goal

Test the entire MVP.

### Authentication Testing

* Register
* Login
* Logout
* Invalid password
* Password reset

### Buddy Testing

* Search
* Request
* Accept
* Reject
* Remove

### Chat Testing

* Send
* Receive
* Reconnect
* Message history

### Notes Testing

* Upload
* Download
* Share
* Delete

### Task Testing

* Create
* Assign
* Update
* Complete
* Deadline

### Meeting Testing

* Create room
* Join
* Video
* Audio
* Leave

### Timer Testing

* Start
* Pause
* Resume
* Stop
* Synchronization

### Study Tracking Testing

* Correct duration
* Break exclusion
* Session history

---

# PHASE 16 — UI/UX Polish

## Goal

Make the application feel like a finished product.

### Improve

* Loading states
* Empty states
* Error messages
* Animations
* Buttons
* Icons
* Typography
* Spacing
* Navigation
* Responsive layouts

### Empty States

Example:

```text
👥 No Study Buddies Yet

Find a friend and start studying together.

[ Find Buddy ]
```

### Error States

Example:

```text
Something went wrong.

Please check your internet connection.

[ Try Again ]
```

---

# PHASE 17 — Final MVP Release

## Goal

Prepare the application for demonstration and initial users.

### Final Checklist

```text
☐ Authentication works
☐ Profile works
☐ Buddy system works
☐ Chat works
☐ Notes work
☐ Tasks work
☐ Reminders work
☐ Study Meet works
☐ Shared timer works
☐ Study time tracking works
☐ Dashboard works
☐ Security rules work
☐ No critical bugs
☐ GitHub repository updated
☐ README updated
☐ App tested on physical device
```

---

# Recommended Development Order

Follow this exact order:

```text
1. Project Setup
        ↓
2. Flutter Foundation
        ↓
3. Supabase Connection
        ↓
4. Authentication
        ↓
5. Profile
        ↓
6. Buddy System
        ↓
7. Chat
        ↓
8. Notes
        ↓
9. Tasks
        ↓
10. Notifications
        ↓
11. Study Meet
        ↓
12. Shared Timer
        ↓
13. Study Tracking
        ↓
14. Dashboard
        ↓
15. Security
        ↓
16. Testing
        ↓
17. UI Polish
        ↓
18. MVP Release
```

---

# MVP Scope Control

Do **NOT** add these before the core MVP is working:

```text
❌ AI Study Assistant
❌ AI PDF Summarizer
❌ AI Quiz Generator
❌ Quiz Battles
❌ Leaderboards
❌ XP
❌ Badges
❌ Public Groups
❌ Advanced Gamification
❌ AI Study Planner
❌ Meeting Recording
❌ Advanced Analytics
❌ Whiteboard
```

These belong in future versions.

---

# Version 2 — Future Features

After the MVP is stable:

```text
Version 2
│
├── 🎯 Goals
├── 🔥 Study Streaks
├── 🏆 Gamification
├── 📅 Calendar
├── 👥 Group Study
├── 🧠 Quiz
└── 📊 Advanced Analytics
```

---

# Version 3 — AI Features

```text
Version 3
│
├── 🤖 AI Study Assistant
├── 📄 PDF Summarization
├── 🧠 AI Quiz Generation
├── 📅 AI Study Planner
├── ❓ Ask Questions From Notes
└── 🎯 Personalized Study Recommendations
```

---

# Final Product Architecture

```text
                         STUDY WITH BUDDY
                                │
                                ↓
                         Flutter Mobile App
                                │
                ┌───────────────┴───────────────┐
                ↓                               ↓
            Supabase                    Meeting Service
                │                               │
       ┌────────┼────────┐                 Video/Audio
       ↓        ↓        ↓
     Auth   PostgreSQL  Storage
              │           │
       ┌──────┼──────┐    │
       ↓      ↓      ↓    ↓
     Chat   Tasks  Sessions Notes
              │
              ↓
        Study Analytics
```

---

# Definition of Done

The **Study With Buddy MVP is complete** when two real students can perform this entire journey without manual intervention:

```text
Student A registers
        ↓
Student B registers
        ↓
A finds B
        ↓
A sends buddy request
        ↓
B accepts
        ↓
A and B chat
        ↓
A shares study notes
        ↓
A creates a task for B
        ↓
B receives the task
        ↓
A starts a Study Meet
        ↓
B joins
        ↓
Both start the shared study timer
        ↓
Both study
        ↓
Timer ends
        ↓
Actual study time is calculated
        ↓
Session is saved
        ↓
Task is completed
        ↓
Dashboard updates
```

## Core Principle

> **Build the smallest version that proves the core idea.**

The first goal is not to build a huge student platform.

The first goal is to prove:

> **Two students can connect, communicate, study together, and see how much they actually studied together.**
