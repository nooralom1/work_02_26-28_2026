# Daraz-style Product Listing Screen (Flutter)

## Overview

This project implements a **Daraz-style product listing screen** in Flutter with a focus on **scroll architecture and gesture coordination**.

The screen includes:

- Collapsible Header (Banner + Search Bar)
- Sticky TabBar
- Product Lists (FakeStore API)
- Horizontal Tab Navigation
- Single Vertical Scroll Architecture
- Login & User Profile Screen

This implementation prioritizes **clean architecture, predictable gestures, and single scroll ownership**, as required.

---

## Features

### Layout

✔ Collapsible Header (Banner + Search Bar)  
✔ Sticky TabBar (Pinned)

✔ 3 Tabs:
- All Products
- Electronics
- Jewelery

✔ Product list from FakeStore API

---

## API Used
https://fakestoreapi.com/products
https://fakestoreapi.com/users/1
https://fakestoreapi.com/auth/login

---

## Architecture

### Project Structure
lib/
│
├── common_widgets/
│
├── constants/
│
├── feature/
│ ├── authentication/
│ │ └── login/
│ │ ├── data/
│ │ ├── model/
│ │ └── presentation/
│ │
│ ├── home/
│ │ ├── data/
│ │ ├── model/
│ │ ├── presentation/
│ │ └── widget/
│ │
│ └── profile/
│ ├── data/
│ ├── model/
│ ├── presentation/
│ └── widget/
│
├── helpers/
│
├── networks/
│
├── providers/
│
├── loading_screen.dart
├── welcome_screen.dart
├── navigation.dart
└── main.dart

---

## Architecture Style

This project follows a **Feature-Based Modular Architecture**

### Each Feature Contains
feature/
feature_name/
data/
model/
presentation/
widget/

### Explanation

#### data/
- API calls

#### model/
- JSON models

#### presentation/
- Screens

#### widget/
- Feature-specific reusable widgets

---

## Separation of Responsibilities

### UI Layer

Responsible for:
- SliverAppBar
- TabBar
- Product Cards
- Profile Screen

---

## Scroll Ownership
Vertical scroll is owned by:
NestedScrollView

### Reason
- Allows collapsible header
- Supports pinned TabBar
- Supports pull-to-refresh
- Maintains single scrollable behavior

---

## Single Vertical Scroll Implementation

There is **exactly ONE vertical scrollable**:
NestedScrollView

Inside tabs:

```dart
ListView.builder(
 physics: NeverScrollableScrollPhysics(),
 shrinkWrap: true
)

Result
✔ No duplicate scrolling
✔ No jitter
✔ No scroll conflict

Vertical Scroll Flow
NestedScrollView
   -> SliverAppBar
   -> SliverPersistentHeader(TabBar)
   -> TabBarView Content

Sticky TabBar
Implemented using:
SliverPersistentHeader
pinned: true

Result
✔ TabBar remains visible
✔ Works smoothly with collapsing header

Horizontal Swipe Implementation
Horizontal swipe implemented using:
TabBarView

Supports
✔ Horizontal swipe between tabs
✔ Tap navigation between tabs

Example:
TabBarView(
 controller: _tabController,
 children: [
   ProductListTab(),
   ElectronicsTab(),
   JeweleryTab(),
 ]
)


Login Implementation
Login API
https://fakestoreapi.com/auth/login

credentials:
username: johnd
password: m38rmF$


After login:
✔ User profile shown
Profile API
https://fakestoreapi.com/users/1

Displayed Information
 Name
 Email
 Phone
 Address

State Management
Simple state approach used:
Provider
StatefulWidget
setState()
Reason
✔ Lightweight
✔ Easy to understand
✔ Suitable for small project

Run Instructions
1 Install dependencies
flutter pub get

2 Run project
flutter run

Flutter Version
Tested with:
Flutter 3.24+
Dart 3+

Important Notes
This implementation strictly follows:
✔ Single vertical scroll
✔ Sliver architecture
✔ Sticky tabs
✔ Pull to refresh
✔ Scroll position preserved
✔ No scroll jitter
✔ Clean gesture handling

Author
Md Noor-Alom Siddik
Flutter Developer