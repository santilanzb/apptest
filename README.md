# AppTest - Modern Consulting Platform

A Flutter application with Framer-inspired UI/UX design for consulting businesses, featuring real-time chat, product catalog, order management, and appointment scheduling.

## 🎨 Design Philosophy

- **Soft Blue Palette** - Calming, professional colors
- **Glassmorphism** - Modern, elegant card designs
- **Smooth Animations** - Delightful micro-interactions
- **Intuitive UX** - Contextual help throughout the app

## ✨ Features

### Core Functionality
- 🏠 **Home Dashboard** - Quick actions and activity feed
- 💬 **Real-time Chat** - Group conversations auto-created with orders
- 🛍️ **Product Catalog** - Browse, search, and purchase with Stripe
- 📦 **Order Management** - Track orders from creation to completion
- 📅 **Appointment Scheduling** - Book consultations with health professionals
- 👤 **User Profiles** - Manage account settings and preferences
- ℹ️ **About Us** - Company information and team
- ❓ **Contextual Help** - Tooltips and guided tours

### User Roles
- **Client** - Purchase products, chat with team, book appointments
- **Health Professional** - Manage clients, consultations, chat support
- **Logistics Advisor** - Handle order fulfillment and delivery
- **Admin** - Full platform management and analytics

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (^3.9.2)
- Dart SDK
- Android Studio / VS Code with Flutter extensions
- Supabase account
- Stripe account (for payments)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/santilanzb/apptest.git
   cd apptest
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Set up Supabase**
   - Go to the [Supabase dashboard](https://supabase.com/dashboard/project/bitefljsazvmwejahapc)
   - Navigate to SQL Editor
   - Copy and run the schema from `supabase/schema.sql`
   - See detailed instructions in `supabase/README.md`

4. **Configure environment variables**
   ```bash
   cp .env.example .env
   ```
   
   Edit `.env` and add your keys:
   ```env
   SUPABASE_URL=https://bitefljsazvmwejahapc.supabase.co
   SUPABASE_ANON_KEY=your_supabase_anon_key_here
   STRIPE_PUBLISHABLE_KEY=your_stripe_key_here
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

## 📁 Project Structure

```
lib/
├── core/
│   ├── constants/       # Colors, text styles, app constants
│   ├── theme/          # App theme configuration
│   ├── utils/          # Helper functions and validators
│   └── router/         # Navigation configuration
├── data/
│   ├── models/         # Data models (User, Product, Order, etc.)
│   ├── repositories/   # Data layer logic
│   └── services/       # External services (Supabase, Stripe, etc.)
└── presentation/
    ├── screens/        # All app screens organized by feature
    ├── widgets/        # Reusable UI components
    └── providers/      # State management (Riverpod)
```

## 🛠️ Tech Stack

### Frontend
- **Flutter** - Cross-platform UI framework
- **Riverpod** - State management
- **Go Router** - Navigation
- **Google Fonts** - Typography (Inter font family)

### Backend & Services
- **Supabase** - Backend as a Service
  - PostgreSQL database
  - Real-time subscriptions
  - Authentication
  - File storage
- **Stripe** - Payment processing
- **Firebase** - Push notifications

### UI/UX Libraries
- **flutter_animate** - Smooth animations
- **lottie** - Complex animations
- **shimmer** - Loading states
- **glassmorphism** - Modern card effects
- **flutter_chat_ui** - Chat interface

## 📱 Key Workflows

### Order Creation Flow
1. Client browses products
2. Adds items to cart
3. Completes Stripe checkout
4. Order is created in database
5. **Trigger**: Admin assigns health professional + logistics advisor
6. **Auto**: Group chat is created with all participants
7. Client receives notification

### Chat System
- Real-time messaging powered by Supabase Realtime
- File sharing (images, documents)
- Read receipts and typing indicators
- Archive/delete/mute conversations
- Push notifications for new messages

### Role-Based Access
All database tables use Row Level Security (RLS):
- Clients see only their own data
- Staff see assigned clients/orders
- Admins have full access

## 🎯 Development

### Running Tests
```bash
flutter test
```

### Building for Production

**Android**
```bash
flutter build apk --release
```

**iOS**
```bash
flutter build ios --release
```

**Web**
```bash
flutter build web --release
```

### Code Generation (for Riverpod)
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## 🔐 Security

- All API keys stored in `.env` (never committed)
- Row Level Security enabled on all Supabase tables
- Stripe handles payment processing (PCI compliant)
- Secure authentication with PKCE flow

## 📝 License

This project is private and proprietary.

## 👥 Team

For questions or support, contact the development team.

---

**Project Repository**: https://github.com/santilanzb/apptest.git  
**Supabase Project**: bitefljsazvmwejahapc
