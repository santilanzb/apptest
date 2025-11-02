# Supabase Setup Instructions

## Database Schema Setup

### Step 1: Access Supabase SQL Editor
1. Go to https://supabase.com/dashboard/project/bitefljsazvmwejahapc
2. Navigate to **SQL Editor** in the left sidebar
3. Create a new query

### Step 2: Run the Schema
1. Copy the entire contents of `schema.sql`
2. Paste into the SQL Editor
3. Click **Run** to execute

This will create:
- All database tables with proper relationships
- Row Level Security (RLS) policies
- Automated triggers for:
  - Auto-creating user profiles on signup
  - Auto-creating chat rooms when orders are assigned
  - Updating timestamps automatically
- Performance indexes

### Step 3: Get Your Supabase Keys
After running the schema, you'll need:

1. **Supabase URL**: `https://bitefljsazvmwejahapc.supabase.co`
2. **Anon/Public Key**: Found in Settings > API

### Step 4: Configure Flutter App
Create a `.env` file in the project root:

```env
SUPABASE_URL=https://bitefljsazvmwejahapc.supabase.co
SUPABASE_ANON_KEY=your_anon_key_here
STRIPE_PUBLISHABLE_KEY=your_stripe_key_here
```

## Storage Buckets Setup (Optional)

For file uploads (chat files, avatars, product images):

1. Go to **Storage** in Supabase Dashboard
2. Create these buckets:
   - `avatars` (public)
   - `chat-files` (private)
   - `product-images` (public)

3. Set bucket policies for each as needed

## Testing the Setup

After running the schema, you can test with sample data:

```sql
-- Create a test admin user (you'll need to sign up first, then run this with that user's ID)
UPDATE profiles 
SET role = 'admin' 
WHERE email = 'your-email@example.com';

-- Insert sample products
INSERT INTO products (name, description, price, category, is_active) VALUES
  ('Consultation Package', 'Full health assessment and personalized plan', 199.99, 'Services', true),
  ('Nutrition Supplement A', 'Premium vitamin complex', 49.99, 'Supplements', true),
  ('Nutrition Supplement B', 'Protein powder blend', 59.99, 'Supplements', true);
```

## Key Features

### Automatic Chat Creation
When an order is assigned to health professionals and logistics advisors, a group chat is automatically created with all participants.

### Role-Based Access
- **Clients**: View their own orders, chat, appointments
- **Health Professionals**: View assigned clients and orders
- **Logistics Advisors**: Manage order fulfillment
- **Admins**: Full access to all data

### Real-time Subscriptions
The app uses Supabase Realtime for:
- Live chat messages
- Order status updates
- New notifications
