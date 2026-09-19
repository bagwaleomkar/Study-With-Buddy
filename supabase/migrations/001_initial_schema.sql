-- ==============================================================================
-- STUDY WITH BUDDY — INITIAL DATABASE SCHEMA & ROW LEVEL SECURITY
-- ==============================================================================

-- Enable UUID generation
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- 1. USERS TABLE
-- Mirrors auth.users and holds student profile information
CREATE TABLE IF NOT EXISTS public.users (
    id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    profile_image TEXT,
    college TEXT,
    course TEXT,
    year TEXT,
    bio TEXT,
    created_at TIMESTAMPTZ DEFAULT TIMEZONE('utc'::TEXT, NOW()) NOT NULL,
    updated_at TIMESTAMPTZ DEFAULT TIMEZONE('utc'::TEXT, NOW()) NOT NULL
);

-- Enable RLS on users
ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view any profile" 
    ON public.users FOR SELECT 
    USING (true);

CREATE POLICY "Users can insert their own profile" 
    ON public.users FOR INSERT 
    WITH CHECK (auth.uid() = id);

CREATE POLICY "Users can update their own profile" 
    ON public.users FOR UPDATE 
    USING (auth.uid() = id);

-- 2. BUDDY REQUESTS TABLE
CREATE TABLE IF NOT EXISTS public.buddy_requests (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    sender_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    receiver_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    status TEXT NOT NULL CHECK (status IN ('pending', 'accepted', 'rejected')),
    created_at TIMESTAMPTZ DEFAULT TIMEZONE('utc'::TEXT, NOW()) NOT NULL,
    CONSTRAINT unique_request UNIQUE (sender_id, receiver_id)
);

ALTER TABLE public.buddy_requests ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view buddy requests they sent or received" 
    ON public.buddy_requests FOR SELECT 
    USING (auth.uid() = sender_id OR auth.uid() = receiver_id);

CREATE POLICY "Users can send buddy requests" 
    ON public.buddy_requests FOR INSERT 
    WITH CHECK (auth.uid() = sender_id);

CREATE POLICY "Receiver or sender can update request status" 
    ON public.buddy_requests FOR UPDATE 
    USING (auth.uid() = receiver_id OR auth.uid() = sender_id);

-- 3. BUDDIES TABLE
CREATE TABLE IF NOT EXISTS public.buddies (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    buddy_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    created_at TIMESTAMPTZ DEFAULT TIMEZONE('utc'::TEXT, NOW()) NOT NULL,
    CONSTRAINT unique_buddy_pair UNIQUE (user_id, buddy_id)
);

ALTER TABLE public.buddies ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view their own buddies" 
    ON public.buddies FOR SELECT 
    USING (auth.uid() = user_id OR auth.uid() = buddy_id);

CREATE POLICY "Users can manage buddy relationships" 
    ON public.buddies FOR ALL 
    USING (auth.uid() = user_id OR auth.uid() = buddy_id);

-- 4. MESSAGES TABLE
CREATE TABLE IF NOT EXISTS public.messages (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    sender_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    receiver_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    message TEXT NOT NULL,
    is_read BOOLEAN DEFAULT FALSE NOT NULL,
    created_at TIMESTAMPTZ DEFAULT TIMEZONE('utc'::TEXT, NOW()) NOT NULL
);

ALTER TABLE public.messages ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view messages sent to or by them" 
    ON public.messages FOR SELECT 
    USING (auth.uid() = sender_id OR auth.uid() = receiver_id);

CREATE POLICY "Users can send messages" 
    ON public.messages FOR INSERT 
    WITH CHECK (auth.uid() = sender_id);

CREATE POLICY "Receiver can mark messages as read" 
    ON public.messages FOR UPDATE 
    USING (auth.uid() = receiver_id);

-- 5. NOTES TABLE
CREATE TABLE IF NOT EXISTS public.notes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    subject TEXT,
    file_url TEXT NOT NULL,
    file_type TEXT,
    file_size INTEGER,
    created_at TIMESTAMPTZ DEFAULT TIMEZONE('utc'::TEXT, NOW()) NOT NULL
);

ALTER TABLE public.notes ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view their own notes or notes from buddies" 
    ON public.notes FOR SELECT 
    USING (
        auth.uid() = user_id 
        OR EXISTS (
            SELECT 1 FROM public.buddies 
            WHERE (user_id = auth.uid() AND buddy_id = public.notes.user_id)
               OR (buddy_id = auth.uid() AND user_id = public.notes.user_id)
        )
    );

CREATE POLICY "Users can create their own notes" 
    ON public.notes FOR INSERT 
    WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update or delete their own notes" 
    ON public.notes FOR ALL 
    USING (auth.uid() = user_id);

-- 6. TASKS TABLE
CREATE TABLE IF NOT EXISTS public.tasks (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    created_by UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    assigned_to UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    description TEXT,
    subject TEXT,
    priority TEXT DEFAULT 'medium' CHECK (priority IN ('low', 'medium', 'high')),
    due_date TIMESTAMPTZ,
    status TEXT DEFAULT 'pending' CHECK (status IN ('pending', 'in_progress', 'completed')),
    created_at TIMESTAMPTZ DEFAULT TIMEZONE('utc'::TEXT, NOW()) NOT NULL
);

ALTER TABLE public.tasks ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view tasks created by or assigned to them" 
    ON public.tasks FOR SELECT 
    USING (auth.uid() = created_by OR auth.uid() = assigned_to);

CREATE POLICY "Users can create tasks" 
    ON public.tasks FOR INSERT 
    WITH CHECK (auth.uid() = created_by);

CREATE POLICY "Users can update tasks created by or assigned to them" 
    ON public.tasks FOR UPDATE 
    USING (auth.uid() = created_by OR auth.uid() = assigned_to);

CREATE POLICY "Creator can delete tasks" 
    ON public.tasks FOR DELETE 
    USING (auth.uid() = created_by);

-- 7. NOTIFICATIONS TABLE
CREATE TABLE IF NOT EXISTS public.notifications (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    message TEXT NOT NULL,
    type TEXT,
    is_read BOOLEAN DEFAULT FALSE NOT NULL,
    created_at TIMESTAMPTZ DEFAULT TIMEZONE('utc'::TEXT, NOW()) NOT NULL
);

ALTER TABLE public.notifications ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view and manage their own notifications" 
    ON public.notifications FOR ALL 
    USING (auth.uid() = user_id);

-- 8. STUDY SESSIONS TABLE
CREATE TABLE IF NOT EXISTS public.study_sessions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    room_id TEXT NOT NULL,
    subject TEXT,
    host_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    participant_id UUID REFERENCES public.users(id) ON DELETE SET NULL,
    start_time TIMESTAMPTZ DEFAULT TIMEZONE('utc'::TEXT, NOW()) NOT NULL,
    end_time TIMESTAMPTZ,
    study_duration INTEGER DEFAULT 0 NOT NULL, -- in minutes
    break_duration INTEGER DEFAULT 0 NOT NULL, -- in minutes
    created_at TIMESTAMPTZ DEFAULT TIMEZONE('utc'::TEXT, NOW()) NOT NULL
);

ALTER TABLE public.study_sessions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Participants can view their study sessions" 
    ON public.study_sessions FOR SELECT 
    USING (auth.uid() = host_id OR auth.uid() = participant_id);

CREATE POLICY "Host can create study sessions" 
    ON public.study_sessions FOR INSERT 
    WITH CHECK (auth.uid() = host_id);

CREATE POLICY "Participants can update study sessions" 
    ON public.study_sessions FOR UPDATE 
    USING (auth.uid() = host_id OR auth.uid() = participant_id);

-- REALTIME REPLICATION SETUP
ALTER PUBLICATION supabase_realtime ADD TABLE public.messages;
ALTER PUBLICATION supabase_realtime ADD TABLE public.tasks;
ALTER PUBLICATION supabase_realtime ADD TABLE public.buddy_requests;
ALTER PUBLICATION supabase_realtime ADD TABLE public.buddies;
ALTER PUBLICATION supabase_realtime ADD TABLE public.study_sessions;
