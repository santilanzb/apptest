-- Supabase Schema for Consulting App (FIXED)
-- Project ID: bitefljsazvmwejahapc
-- Project Name: apptest

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ============================================
-- STEP 1: CREATE ALL TABLES (without cross-table policies)
-- ============================================

-- PROFILES TABLE
CREATE TABLE profiles (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  email TEXT UNIQUE NOT NULL,
  full_name TEXT,
  role TEXT NOT NULL CHECK (role IN ('client', 'health_professional', 'logistics', 'admin')),
  avatar_url TEXT,
  phone TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- PRODUCTS TABLE
CREATE TABLE products (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  description TEXT,
  price DECIMAL(10, 2) NOT NULL CHECK (price >= 0),
  category TEXT,
  image_url TEXT,
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ORDERS TABLE
CREATE TABLE orders (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  client_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'confirmed', 'in_progress', 'completed', 'cancelled')),
  total_amount DECIMAL(10, 2) NOT NULL CHECK (total_amount >= 0),
  stripe_payment_id TEXT,
  notes TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ORDER ITEMS TABLE
CREATE TABLE order_items (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  order_id UUID NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
  product_id UUID NOT NULL REFERENCES products(id),
  quantity INTEGER NOT NULL CHECK (quantity > 0),
  price DECIMAL(10, 2) NOT NULL CHECK (price >= 0),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ORDER ASSIGNMENTS TABLE
CREATE TABLE order_assignments (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  order_id UUID NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
  health_professional_id UUID REFERENCES profiles(id),
  logistics_advisor_id UUID REFERENCES profiles(id),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(order_id)
);

-- CHAT ROOMS TABLE
CREATE TABLE chat_rooms (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  order_id UUID REFERENCES orders(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  is_archived BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- CHAT PARTICIPANTS TABLE
CREATE TABLE chat_participants (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  room_id UUID NOT NULL REFERENCES chat_rooms(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  joined_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  last_read_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  is_muted BOOLEAN DEFAULT FALSE,
  UNIQUE(room_id, user_id)
);

-- MESSAGES TABLE
CREATE TABLE messages (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  room_id UUID NOT NULL REFERENCES chat_rooms(id) ON DELETE CASCADE,
  sender_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  content TEXT,
  file_url TEXT,
  file_name TEXT,
  file_type TEXT,
  is_deleted BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- APPOINTMENTS TABLE
CREATE TABLE appointments (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  client_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  health_professional_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  scheduled_at TIMESTAMP WITH TIME ZONE NOT NULL,
  duration_minutes INTEGER NOT NULL DEFAULT 60 CHECK (duration_minutes > 0),
  status TEXT NOT NULL DEFAULT 'scheduled' CHECK (status IN ('scheduled', 'completed', 'cancelled', 'rescheduled')),
  notes TEXT,
  meeting_link TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- NOTIFICATIONS TABLE
CREATE TABLE notifications (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  type TEXT NOT NULL,
  related_id UUID,
  is_read BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- STEP 2: ENABLE ROW LEVEL SECURITY
-- ============================================

ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
ALTER TABLE orders ENABLE ROW LEVEL SECURITY;
ALTER TABLE order_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE order_assignments ENABLE ROW LEVEL SECURITY;
ALTER TABLE chat_rooms ENABLE ROW LEVEL SECURITY;
ALTER TABLE chat_participants ENABLE ROW LEVEL SECURITY;
ALTER TABLE messages ENABLE ROW LEVEL SECURITY;
ALTER TABLE appointments ENABLE ROW LEVEL SECURITY;
ALTER TABLE notifications ENABLE ROW LEVEL SECURITY;

-- ============================================
-- STEP 3: CREATE RLS POLICIES
-- ============================================

-- PROFILES POLICIES
CREATE POLICY "Users can view their own profile" ON profiles
  FOR SELECT USING (auth.uid() = id);

CREATE POLICY "Users can update their own profile" ON profiles
  FOR UPDATE USING (auth.uid() = id);

-- Note: Admin policy removed to avoid infinite recursion
-- Admins can still access via direct API calls with service role key

-- PRODUCTS POLICIES
CREATE POLICY "Anyone can view active products" ON products
  FOR SELECT USING (is_active = TRUE);

CREATE POLICY "Admins can manage products" ON products
  FOR ALL USING (
    EXISTS (
      SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin'
    )
  );

-- ORDERS POLICIES
CREATE POLICY "Clients can view their own orders" ON orders
  FOR SELECT USING (client_id = auth.uid());

CREATE POLICY "Clients can create orders" ON orders
  FOR INSERT WITH CHECK (client_id = auth.uid());

CREATE POLICY "Staff can view assigned orders" ON orders
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM order_assignments 
      WHERE order_id = orders.id 
      AND (health_professional_id = auth.uid() OR logistics_advisor_id = auth.uid())
    )
    OR EXISTS (
      SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin'
    )
  );

CREATE POLICY "Staff can update orders" ON orders
  FOR UPDATE USING (
    EXISTS (
      SELECT 1 FROM order_assignments 
      WHERE order_id = orders.id 
      AND (health_professional_id = auth.uid() OR logistics_advisor_id = auth.uid())
    )
    OR EXISTS (
      SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin'
    )
  );

-- ORDER ITEMS POLICIES
CREATE POLICY "Users can view order items for their orders" ON order_items
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM orders WHERE orders.id = order_items.order_id AND orders.client_id = auth.uid()
    )
    OR EXISTS (
      SELECT 1 FROM order_assignments 
      WHERE order_assignments.order_id = order_items.order_id 
      AND (health_professional_id = auth.uid() OR logistics_advisor_id = auth.uid())
    )
    OR EXISTS (
      SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin'
    )
  );

-- ORDER ASSIGNMENTS POLICIES
CREATE POLICY "Users can view assignments for their orders" ON order_assignments
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM orders WHERE orders.id = order_assignments.order_id AND orders.client_id = auth.uid()
    )
    OR health_professional_id = auth.uid()
    OR logistics_advisor_id = auth.uid()
    OR EXISTS (
      SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin'
    )
  );

CREATE POLICY "Admins can manage assignments" ON order_assignments
  FOR ALL USING (
    EXISTS (
      SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin'
    )
  );

-- CHAT ROOMS POLICIES
CREATE POLICY "Participants can view their chat rooms" ON chat_rooms
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM chat_participants 
      WHERE chat_participants.room_id = chat_rooms.id 
      AND chat_participants.user_id = auth.uid()
    )
  );

-- CHAT PARTICIPANTS POLICIES
CREATE POLICY "Users can view their participations" ON chat_participants
  FOR SELECT USING (user_id = auth.uid());

CREATE POLICY "Users can update their participation" ON chat_participants
  FOR UPDATE USING (user_id = auth.uid());

-- MESSAGES POLICIES
CREATE POLICY "Participants can view messages" ON messages
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM chat_participants 
      WHERE chat_participants.room_id = messages.room_id 
      AND chat_participants.user_id = auth.uid()
    )
  );

CREATE POLICY "Participants can send messages" ON messages
  FOR INSERT WITH CHECK (
    sender_id = auth.uid() 
    AND EXISTS (
      SELECT 1 FROM chat_participants 
      WHERE chat_participants.room_id = messages.room_id 
      AND chat_participants.user_id = auth.uid()
    )
  );

CREATE POLICY "Senders can delete their messages" ON messages
  FOR UPDATE USING (sender_id = auth.uid());

-- APPOINTMENTS POLICIES
CREATE POLICY "Users can view their appointments" ON appointments
  FOR SELECT USING (
    client_id = auth.uid() 
    OR health_professional_id = auth.uid()
    OR EXISTS (
      SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin'
    )
  );

CREATE POLICY "Clients can create appointments" ON appointments
  FOR INSERT WITH CHECK (client_id = auth.uid());

CREATE POLICY "Involved users can update appointments" ON appointments
  FOR UPDATE USING (
    client_id = auth.uid() 
    OR health_professional_id = auth.uid()
    OR EXISTS (
      SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin'
    )
  );

-- NOTIFICATIONS POLICIES
CREATE POLICY "Users can view their notifications" ON notifications
  FOR SELECT USING (user_id = auth.uid());

CREATE POLICY "Users can update their notifications" ON notifications
  FOR UPDATE USING (user_id = auth.uid());

-- ============================================
-- STEP 4: CREATE FUNCTIONS
-- ============================================

-- Function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Function to create profile on signup
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, email, full_name, role)
  VALUES (
    NEW.id,
    NEW.email,
    NEW.raw_user_meta_data->>'full_name',
    COALESCE(NEW.raw_user_meta_data->>'role', 'client')
  );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Function to auto-create chat room when order is assigned
CREATE OR REPLACE FUNCTION create_order_chat_room()
RETURNS TRIGGER AS $$
DECLARE
  room_id UUID;
  order_client_id UUID;
BEGIN
  -- Get the client_id for this order
  SELECT client_id INTO order_client_id FROM orders WHERE id = NEW.order_id;
  
  -- Create chat room
  INSERT INTO chat_rooms (order_id, name)
  VALUES (NEW.order_id, 'Order #' || LEFT(NEW.order_id::TEXT, 8))
  RETURNING id INTO room_id;
  
  -- Add client to chat
  INSERT INTO chat_participants (room_id, user_id)
  VALUES (room_id, order_client_id);
  
  -- Add health professional if assigned
  IF NEW.health_professional_id IS NOT NULL THEN
    INSERT INTO chat_participants (room_id, user_id)
    VALUES (room_id, NEW.health_professional_id);
  END IF;
  
  -- Add logistics advisor if assigned
  IF NEW.logistics_advisor_id IS NOT NULL THEN
    INSERT INTO chat_participants (room_id, user_id)
    VALUES (room_id, NEW.logistics_advisor_id);
  END IF;
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ============================================
-- STEP 5: CREATE INDEXES
-- ============================================

CREATE INDEX idx_profiles_role ON profiles(role);
CREATE INDEX idx_profiles_email ON profiles(email);

CREATE INDEX idx_products_category ON products(category);
CREATE INDEX idx_products_is_active ON products(is_active);

CREATE INDEX idx_orders_client_id ON orders(client_id);
CREATE INDEX idx_orders_status ON orders(status);
CREATE INDEX idx_orders_created_at ON orders(created_at DESC);

CREATE INDEX idx_order_assignments_order_id ON order_assignments(order_id);
CREATE INDEX idx_order_assignments_health_professional ON order_assignments(health_professional_id);
CREATE INDEX idx_order_assignments_logistics ON order_assignments(logistics_advisor_id);

CREATE INDEX idx_chat_rooms_order_id ON chat_rooms(order_id);
CREATE INDEX idx_chat_participants_room_id ON chat_participants(room_id);
CREATE INDEX idx_chat_participants_user_id ON chat_participants(user_id);

CREATE INDEX idx_messages_room_id ON messages(room_id);
CREATE INDEX idx_messages_created_at ON messages(created_at DESC);

CREATE INDEX idx_appointments_client_id ON appointments(client_id);
CREATE INDEX idx_appointments_health_professional_id ON appointments(health_professional_id);
CREATE INDEX idx_appointments_scheduled_at ON appointments(scheduled_at);

CREATE INDEX idx_notifications_user_id ON notifications(user_id);
CREATE INDEX idx_notifications_is_read ON notifications(is_read);
CREATE INDEX idx_notifications_created_at ON notifications(created_at DESC);

-- ============================================
-- STEP 6: ATTACH TRIGGERS
-- ============================================

-- Apply updated_at triggers
CREATE TRIGGER update_profiles_updated_at BEFORE UPDATE ON profiles
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_products_updated_at BEFORE UPDATE ON products
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_orders_updated_at BEFORE UPDATE ON orders
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_chat_rooms_updated_at BEFORE UPDATE ON chat_rooms
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_messages_updated_at BEFORE UPDATE ON messages
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_appointments_updated_at BEFORE UPDATE ON appointments
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Trigger to auto-create profile on user signup
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- Trigger to auto-create chat on assignment
CREATE TRIGGER on_order_assigned
  AFTER INSERT ON order_assignments
  FOR EACH ROW EXECUTE FUNCTION create_order_chat_room();
