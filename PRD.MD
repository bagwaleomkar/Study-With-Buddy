# Study With Buddy

## Product Requirements Document (PRD)

**Product Name:** Study With Buddy
**Product Type:** Mobile Application
**Version:** 1.0 MVP
**Purpose:** Collaborative study, accountability, communication, and study-time tracking platform

---

# 1. Product Overview

**Study With Buddy** is a mobile application designed to help students study together with their friends, classmates, or study partners.

The application combines:

* Study partner collaboration
* Real-time chat
* Notes and file sharing
* Task management
* Reminders
* Shared study sessions
* Video/voice meetings
* Pomodoro/focus sessions
* Study-time tracking
* Goals and progress tracking
* Notifications
* Gamification

The main idea is:

> **Plan → Study Together → Stay Accountable → Track Progress → Achieve Goals**

Unlike a normal notes or chat application, Study With Buddy focuses on **accountability and measurable collaborative study time**.

---

# 2. Problem Statement

Students often study with friends using multiple applications:

* WhatsApp/Telegram for communication
* Google Meet for calls
* Google Drive for notes
* Calendar for deadlines
* Separate timer applications for study sessions
* Notion/Trello for tasks

This creates a fragmented experience.

Students also have difficulty knowing:

* What they need to study
* What their study partner needs to complete
* Whether their partner completed a task
* How much time they actually studied together
* Whether they are maintaining their study goals
* When they should remind their partner

**Study With Buddy brings these activities into one platform.**

---

# 3. Product Goals

## Primary Goals

1. Allow students to connect with study partners.
2. Allow partners to communicate through chat.
3. Allow users to share study notes and resources.
4. Allow users to create and assign study tasks.
5. Allow users to set deadlines and reminders.
6. Allow partners to conduct study meetings.
7. Track actual collaborative study time.
8. Provide individual and buddy progress analytics.
9. Encourage consistent study through streaks and goals.

## Secondary Goals

* Make studying more social.
* Reduce dependency on multiple apps.
* Encourage accountability.
* Make study sessions measurable and engaging.

---

# 4. Target Users

## Primary Users

### College Students

Students preparing for:

* University examinations
* Placements
* Competitive exams
* Assignments
* Projects
* Certifications

### Secondary Users

* School students
* Study groups
* Coding partners
* Project teammates
* Exam preparation groups

---

# 5. Core User Flow

```text
Register / Login
       ↓
Create Profile
       ↓
Find / Add Study Buddy
       ↓
Create Study Goal
       ↓
Create Tasks
       ↓
Share Notes / Resources
       ↓
Chat with Buddy
       ↓
Start Study Meet
       ↓
Start Focus Session
       ↓
Track Study Time
       ↓
Complete Tasks
       ↓
View Progress
       ↓
Maintain Study Streak
```

---

# 6. Main Application Modules

## 6.1 Authentication

Users should be able to:

* Register
* Login
* Logout
* Reset password
* Verify email
* Update profile

### User Profile

Fields:

* Name
* Profile picture
* Email
* College
* Course
* Year
* Subjects
* Study preferences
* Bio

---

# 7. Home Dashboard

The home screen provides a quick overview of the student's study activity.

### Dashboard Components

```text
Good Morning, Omkar 👋

🔥 7 Day Streak

Today's Study
2h 15m

Study With Buddy
1h 05m

Tasks
4 / 5 Completed

Upcoming
Java Assignment
Due Tomorrow

[ Start Study Meet ]

Today's Goal
████████░░ 80%
```

### Dashboard should show:

* Today's study time
* Buddy study time
* Pending tasks
* Completed tasks
* Upcoming deadlines
* Current streak
* Daily goal
* Upcoming study sessions

---

# 8. Study Buddy Module

Users can:

* Search users
* Send buddy request
* Accept/reject request
* Remove buddy
* View buddy profile
* Start chat
* Start study meet
* Assign tasks
* View shared progress

### Buddy Profile

Display:

* Name
* Profile picture
* Subjects
* Study goals
* Study streak
* Total shared study time
* Completed shared goals

---

# 9. Chat Module

Real-time communication between study partners.

### Features

* Text messages
* Emoji
* Image sharing
* File sharing
* Notes sharing
* Task sharing
* Reminder messages
* Message timestamps
* Read/unread status

### Example

```text
Omkar:
Let's complete DBMS Unit 3 today.

Rahul:
Yes 👍

Omkar:
I'll send you the notes.

📄 DBMS_Unit_3.pdf
```

---

# 10. Notes & Resource Sharing

Users can upload and share study resources.

### Supported Resources

* PDF
* Images
* Documents
* Links
* Handwritten notes

### Features

* Upload
* Download
* Preview
* Delete
* Share with buddy
* Organize by subject

### Subject Structure

```text
📚 Java

├── Notes
├── PDFs
├── Important Questions
├── Resources
└── Previous Year Papers
```

---

# 11. Task Management

Users can create personal or shared tasks.

### Task Fields

* Task title
* Description
* Subject
* Assigned user
* Priority
* Due date
* Due time
* Status

### Task Status

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

Assigned to: Rahul
Deadline: 8:00 PM
Priority: High

Status: In Progress
```

---

# 12. Reminder System

Users can create reminders for themselves or their study partner.

### Reminder Types

* Task deadline
* Study session
* Exam
* Assignment
* Daily study goal
* Buddy reminder

### Buddy Reminder

Example:

> 🔔 "Rahul, your DBMS task is due in 1 hour."

Users should be able to choose:

* Date
* Time
* Reminder message

---

# 13. Study Meet Module

This is one of the main features of the application.

Users can create a private study meeting with their buddy.

### Meeting Features

* Video call
* Voice call
* Mute/unmute
* Camera on/off
* Participant list
* In-meeting chat
* Screen sharing
* Leave meeting

### Meeting Screen

```text
┌─────────────────────────┐
│     📚 DSA Study Meet   │
│                         │
│   👤 Omkar   👤 Rahul   │
│                         │
│       01:25:30          │
│                         │
│ 🎤  📹  🖥️  💬  📞      │
└─────────────────────────┘
```

---

# 14. Focus Study Session

A meeting can contain one or more focused study sessions.

### Example

```text
Study Meet
    ↓
Start Focus Session
    ↓
25 min Study
    ↓
5 min Break
    ↓
25 min Study
    ↓
Session Complete
```

### Supported Modes

* 25/5 Pomodoro
* 50/10
* Custom timer

---

# 15. Collaborative Study-Time Tracking

The application must distinguish between:

**Meeting duration** and **actual study duration**.

Example:

```text
Meeting duration = 90 minutes

Break = 10 minutes
Chat = 5 minutes

Actual study time = 75 minutes
```

The application records:

> 👥 You and Rahul studied together for **75 minutes**.

### Study Session Data

Store:

* Start time
* End time
* Study duration
* Break duration
* Participants
* Subject
* Goal
* Completed tasks

---

# 16. Study History

Users can view previous sessions.

Example:

```text
Study History

Today
📚 DSA
1h 20m

Yesterday
📚 Java
45m

Sep 16
📚 DBMS
1h 10m
```

Users should be able to filter by:

* Day
* Week
* Month
* Subject
* Buddy

---

# 17. Study Analytics

The application provides statistics about study activity.

### Personal Analytics

```text
This Week

Total Study
12h 40m

Average Daily
1h 48m

Tasks Completed
18

Current Streak
7 Days
```

### Buddy Analytics

```text
Study Together

Total Time
8h 35m

Sessions
12

Average Session
43m

Longest Session
2h 15m
```

---

# 18. Goals

Users can create study goals.

### Goal Example

```text
Goal:
Complete DSA

Deadline:
October 15

Progress:
████████░░ 80%

Tasks:
18 / 22 completed
```

### Goal Types

* Daily
* Weekly
* Monthly
* Exam-based
* Subject-based
* Custom

---

# 19. Shared Goals

Two or more users can work toward the same goal.

Example:

```text
🎯 Complete DBMS

Omkar: 80%
Rahul: 70%

Overall Progress: 75%
```

The goal should contain:

* Goal name
* Description
* Members
* Deadline
* Tasks
* Progress
* Status

---

# 20. Study Streak

The application tracks consecutive study days.

Example:

```text
🔥 7 Day Study Streak

Mon ✅
Tue ✅
Wed ✅
Thu ✅
Fri ✅
Sat ✅
Sun 🔥
```

Buddy streaks can also be tracked.

```text
🤝 Buddy Streak

You + Rahul
12 Days 🔥
```

---

# 21. Gamification

Users receive XP for productive activities.

### XP System

| Activity               |  XP |
| ---------------------- | --: |
| Complete task          | +20 |
| Complete study session | +10 |
| Complete daily goal    | +30 |
| Complete quiz          | +10 |
| Help buddy             | +15 |
| Maintain streak        |  +5 |

### Badges

Examples:

* 🥇 First Study Session
* 🔥 7 Day Streak
* 📚 10 Hours Studied
* 👥 Study Partner
* 🎯 Goal Crusher
* 🧠 Quiz Master

---

# 22. Nudge Buddy

A quick way to remind your partner without typing a message.

### Nudge Options

```text
📚 Time to study!

⏰ Your task is due soon

🔥 Don't break the streak!

🎯 Let's start our session

📝 Complete your assignment

☕ Take a break
```

---

# 23. Notifications

The application should support push notifications.

### Notification Types

* New buddy request
* New message
* Task assigned
* Task deadline approaching
* Reminder
* Study meeting invitation
* Study session started
* Goal completed
* Streak notification
* Buddy nudge

---

# 24. Calendar / Timeline

A calendar should show:

* Exams
* Assignments
* Tasks
* Study meetings
* Reminders
* Goals

Example:

```text
September

18 — Java Task
19 — DSA Study Meet
20 — DBMS Assignment
21 — Group Study
22 — AI Test
```

---

# 25. AI Study Assistant — Phase 2

An AI assistant can be integrated after the MVP.

### AI Features

#### Notes Summarization

Upload PDF → AI generates summary.

#### Question Generation

```text
Generate 10 questions from this chapter.
```

#### Quiz Generation

```text
Generate MCQs from my notes.
```

#### AI Study Planner

```text
I have 5 days to complete 4 subjects.
Create a study plan.
```

#### Ask Questions

Users can ask questions about uploaded notes.

---

# 26. Quiz / Buddy Challenge — Phase 2

Users can challenge their buddy.

```text
🧠 QUIZ BATTLE

Omkar       Rahul

8 / 10      7 / 10
```

Possible features:

* Subject quiz
* MCQ
* Daily challenge
* 1v1 challenge
* Shared quiz

---

# 27. Group Study — Phase 3

Users can create larger study groups.

Example:

```text
👥 Java Placement Group

25 Members

📚 Notes
💬 Group Chat
📅 Events
🎯 Goals
📝 Tasks
🎥 Group Study
```

---

# 28. User Roles

## Student

Can:

* Create profile
* Add buddies
* Chat
* Share notes
* Create tasks
* Join meetings
* Create goals
* Track study time

## Group Admin

Can:

* Create group
* Remove members
* Manage group resources
* Create group events
* Manage group tasks

---

# 29. Suggested Mobile Navigation

Use a simple bottom navigation:

```text
┌─────────────────────────────┐
│                             │
│       Application Content   │
│                             │
├─────────────────────────────┤
│ 🏠     👥     📚     📊     👤 │
│Home  Buddies Notes  Stats Profile
└─────────────────────────────┘
```

Chat can be accessed from Buddy profiles.

A prominent **“Start Study Meet”** button can appear on the Buddy screen.

---

# 30. Recommended Tech Stack

For a student project, a practical architecture would be:

## Mobile App

**Flutter**

Benefits:

* Android + iOS
* Single codebase
* Good UI capabilities
* Firebase integration

Alternative:

**Android Studio + Java**

if the goal is specifically Android development.

---

## Backend

### Option A — Firebase

Recommended for the MVP.

Use:

* Firebase Authentication
* Cloud Firestore
* Firebase Storage
* Firebase Cloud Messaging
* Firebase Cloud Functions

This simplifies:

* Authentication
* Real-time chat
* Database
* File storage
* Notifications

---

## Video Meetings

Use a third-party video communication SDK/API rather than building video infrastructure from scratch.

Possible architecture:

```text
Mobile App
    ↓
Backend
    ↓
Meeting Service
    ↓
Video / Audio
```

The exact provider can be selected during implementation based on pricing, SDK support, and project requirements.

---

# 31. High-Level Database Structure

### Users

```text
users
 ├── id
 ├── name
 ├── email
 ├── profileImage
 ├── college
 ├── course
 ├── year
 ├── createdAt
 └── streak
```

### Buddies

```text
buddies
 ├── id
 ├── userId
 ├── buddyId
 ├── status
 └── createdAt
```

### Messages

```text
messages
 ├── id
 ├── senderId
 ├── receiverId
 ├── message
 ├── fileUrl
 ├── timestamp
 └── read
```

### Tasks

```text
tasks
 ├── id
 ├── title
 ├── description
 ├── subject
 ├── createdBy
 ├── assignedTo
 ├── dueDate
 ├── priority
 ├── status
 └── createdAt
```

### Study Sessions

```text
studySessions
 ├── id
 ├── roomId
 ├── participants
 ├── subject
 ├── startTime
 ├── endTime
 ├── studyDuration
 ├── breakDuration
 └── createdAt
```

### Goals

```text
goals
 ├── id
 ├── title
 ├── description
 ├── ownerId
 ├── members
 ├── deadline
 ├── progress
 └── status
```

---

# 32. MVP Scope

The first version should NOT contain every feature.

### MVP Features

**Priority 1**

* Authentication
* User profile
* Add study buddy
* Buddy list
* One-to-one chat
* Notes/file sharing
* Task creation
* Task assignment
* Deadline
* Notifications
* Study Meet
* Focus timer
* Collaborative study-time tracking
* Basic dashboard

### Version 2

* Goals
* Streaks
* Analytics
* Gamification
* Calendar
* Shared goals
* Nudge Buddy

### Version 3

* AI Study Assistant
* AI summarization
* AI quiz generation
* Quiz battles
* Group study
* Leaderboards
* Advanced analytics

---

# 33. Non-Functional Requirements

## Performance

* Chat messages should appear in near real-time.
* App screens should load quickly.
* Study timer should remain accurate even if the app goes into the background.

## Security

* Secure authentication
* Users can access only their own private data.
* Buddy-only resources should not be publicly accessible.
* Uploaded files should use secure access rules.
* Meeting credentials/tokens should not be exposed to unauthorized users.

## Reliability

Study session data should not be lost if:

* App is minimized
* Internet temporarily disconnects
* User reconnects

The app should synchronize the session when connectivity returns.

---

# 34. Privacy

The application should clearly communicate:

* What user information is stored
* Who can view shared notes
* Who can see study statistics
* Who can send buddy requests
* Whether study sessions are recorded

**Video/audio meetings should not be recorded by default.**

---

# 35. Success Metrics

The MVP can measure:

### User Engagement

* Daily active users
* Weekly active users
* Number of buddies added
* Number of study sessions
* Average study session duration

### Collaboration

* Messages sent
* Notes shared
* Tasks assigned
* Tasks completed
* Buddy sessions completed

### Productivity

* Total study hours
* Average daily study time
* Goal completion rate
* Study streak length

---

# 36. Future Vision

The long-term vision is to make **Study With Buddy** a complete collaborative student productivity platform.

```text
                 STUDY WITH BUDDY
                         │
        ┌────────────────┼────────────────┐
        ↓                ↓                ↓
   COLLABORATION     PRODUCTIVITY         AI
        │                │                │
     Chat             Tasks             Tutor
     Notes            Goals             Summary
     Groups           Calendar          Quiz
     Meet             Reminders         Planner
        │                │                │
        └────────────────┼────────────────┘
                         ↓
                 📊 STUDY ANALYTICS
                         ↓
                🎯 BETTER STUDY HABITS
```

---

# 37. Product Vision Statement

> **Study With Buddy helps students turn studying from a solo activity into a collaborative, accountable, and measurable experience.**

The application brings together **study partners, communication, notes, tasks, meetings, reminders, focus sessions, and study analytics** in one platform.

The core experience should always remain simple:

> **Find your buddy → Set a goal → Study together → Track your time → Complete your tasks → Grow together.**
