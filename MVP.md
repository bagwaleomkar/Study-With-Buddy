# Study With Buddy — MVP

## 1. MVP Goal

Build a simple mobile application that allows students to connect with a study buddy, communicate, share study material, create tasks, study together through a meeting, and track collaborative study time.

### Core Idea

> **Connect → Plan → Study Together → Track → Complete**

---

# 2. MVP Features

## 2.1 Authentication

* Register
* Login
* Logout
* Forgot password
* Basic user profile

---

## 2.2 Home Dashboard

Display:

* Today's study time
* Pending tasks
* Completed tasks
* Upcoming deadlines
* Connected buddy
* Start Study Meet button

Example:

```text
Good Morning 👋

📚 Today's Study
2h 15m

✅ Tasks
4 / 5 Completed

👥 Study Buddy
Rahul

[ Start Study Meet ]
```

---

# 3. Study Buddy

Users can:

* Search for users
* Send buddy request
* Accept/reject request
* View buddies
* Remove buddy
* Open buddy profile

Buddy profile shows:

* Name
* Profile picture
* Subjects
* Study time
* Tasks
* Shared study sessions

---

# 4. Chat

Basic one-to-one chat between buddies.

### Features

* Send text messages
* Real-time messages
* Message timestamp
* Unread message indicator
* Share files/notes

Example:

```text
You:
Let's study DBMS today.

Buddy:
Yes 👍

You:
I'll send the notes.

📄 DBMS_Unit3.pdf
```

---

# 5. Notes & File Sharing

Users can:

* Upload notes
* Share notes with buddy
* View notes
* Download notes
* Delete notes

### Supported Files

* PDF
* JPG
* PNG
* DOC/DOCX

Notes can be organized by subject.

---

# 6. Study Tasks

Users can create personal or buddy tasks.

### Task Information

```text
Title
Description
Subject
Assigned To
Priority
Due Date
Due Time
Status
```

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
📚 Complete Java Unit 3

Assigned To: Rahul
Due: Today, 8:00 PM
Priority: High

Status: In Progress
```

---

# 7. Reminders & Notifications

Users receive notifications for:

* Buddy requests
* New messages
* New task assigned
* Task deadline
* Study meeting invitation
* Study meeting starting
* Buddy reminder

Users can send a quick reminder to their buddy.

Examples:

```text
📚 Time to study!

⏰ Your task is due soon!

🎯 Let's start studying!

🔥 Don't break the streak!
```

---

# 8. Study Meet

Users can start a private study meeting with their buddy.

### MVP Features

* Join meeting
* Video
* Audio
* Mute/unmute
* Camera on/off
* Leave meeting
* Basic meeting timer

Example:

```text
┌─────────────────────┐
│   📚 Study Meet     │
│                     │
│  You       Buddy    │
│                     │
│     01:25:30        │
│                     │
│ 🎤  📹  💬  📞      │
└─────────────────────┘
```

---

# 9. Focus Study Timer

Inside a Study Meet, users can start a shared focus session.

### Default

```text
25 min Study
     ↓
5 min Break
     ↓
25 min Study
```

Users can:

* Start timer
* Pause timer
* Resume timer
* Stop timer

Both buddies should see the same study timer.

---

# 10. Collaborative Study-Time Tracking

The application tracks the actual time spent studying together.

### Important

Meeting duration and study duration are different.

Example:

```text
Meeting Duration = 90 min
Break = 10 min
Actual Study = 80 min
```

The application records:

> 👥 You studied together for **80 minutes**.

### Store

* Start time
* End time
* Study duration
* Break duration
* Participants
* Subject
* Study session ID

---

# 11. Study History

Users can view previous study sessions.

Example:

```text
Study History

Today
📚 DSA       1h 20m

Yesterday
📚 Java      45m

Sep 16
📚 DBMS      1h 10m
```

Users can see:

* Date
* Subject
* Study duration
* Buddy
* Session

---

# 12. Basic Analytics

Show simple statistics.

### Personal

```text
This Week

📚 Total Study
12h 40m

⏱️ Average Daily
1h 48m

✅ Tasks Completed
18
```

### Buddy

```text
Study Together

👥 Total Time
8h 35m

📚 Sessions
12

⏱️ Average Session
43m
```

---

# 13. MVP Navigation

Use simple bottom navigation:

```text
┌─────────────────────────────┐
│                             │
│        App Content          │
│                             │
├─────────────────────────────┤
│ 🏠     👥     💬     📊     👤 │
│Home  Buddies  Chat  Stats Profile
└─────────────────────────────┘
```

---

# 14. MVP Screens

The first version should contain:

```text
1. Splash Screen
2. Login
3. Register
4. Home Dashboard
5. Buddy List
6. Search Users
7. Buddy Profile
8. Chat
9. Notes
10. Upload Note
11. Tasks
12. Create Task
13. Study Meet
14. Focus Timer
15. Study History
16. Basic Analytics
17. Profile
18. Settings
```

---

# 15. MVP User Flow

```text
Register
   ↓
Create Profile
   ↓
Find Buddy
   ↓
Send Request
   ↓
Buddy Accepts
   ↓
Chat
   ↓
Share Notes
   ↓
Create Study Task
   ↓
Set Deadline
   ↓
Start Study Meet
   ↓
Start Focus Timer
   ↓
Study Together
   ↓
End Session
   ↓
Save Study Time
   ↓
Complete Task
   ↓
View Progress
```

---

# 16. MVP Tech Stack

### Mobile

* Flutter
* Dart

### Backend

* Firebase

### Firebase Services

* Firebase Authentication
* Cloud Firestore
* Firebase Storage
* Firebase Cloud Messaging

### Study Meet

Use a third-party video meeting SDK/service.

---

# 17. MVP Database Collections

```text
users
buddies
buddy_requests
messages
notes
tasks
notifications
study_sessions
```

---

# 18. Out of Scope for MVP

The following features should be added later:

* AI Study Assistant
* AI PDF summarization
* AI quiz generation
* Quiz battles
* Group study
* Leaderboards
* XP system
* Badges
* Advanced gamification
* AI study planner
* Public study communities
* Advanced analytics
* Whiteboard
* Meeting recording

---

# 19. MVP Success Criteria

The MVP is considered successful when a user can:

* Create an account
* Create a profile
* Find a study buddy
* Connect with the buddy
* Chat with the buddy
* Share notes
* Create and assign tasks
* Set deadlines
* Receive reminders
* Start a study meeting
* Study together using the focus timer
* Track collaborative study time
* Complete tasks
* View basic study statistics

---

# 20. Core MVP Principle

Keep the first version simple.

The main experience should be:

> **Find your buddy → Set a task → Start a Study Meet → Study together → Track your time → Complete the task.**

Everything else can be added after this core experience works properly.
