//  Created by Htet Moe Phyu on 4/9/25.

# Countries App

CountriesApp is an iOS application that allows users to view a list of countries and search for them by name or capital. It follows the **Clean Architecture** pattern, leveraging **MVVM** (Model-View-ViewModel) and **Dependency Injection** to promote maintainability, scalability, and testability. The app fetches data from a remote API and displays it in a `UITableView`, providing an efficient and seamless user experience.

---

<p align="center">
  <img src="Countries.gif" alt="Countries Animation" width="250">
</p>

## Features
- Fetches a list of countries from a remote API.
- Allows users to search countries by name or capital.
- Implements **Clean Architecture** for better code organization and separation of concerns.
- Supports real-time search and updates the UI as the user types.
- Built with **MVVM** to separate business logic from UI code.

## Architecture
The project follows the **Clean Architecture** pattern, where the code is divided into several layers:

- **Data Layer**: Handles networking and data fetching.
- **Domain Layer**: Contains business logic and use cases.
- **Presentation Layer**: Manages UI and user interactions using **MVVM**.

## **Project Structure**
```plaintext
CountriesApp/
│── AppDelegates/               # App lifecycle management
│── Data/                       
│   ├── Dependency Injection/   # Dependency Injection setup
│   ├── Network Service/       # Handles API requests and networking
│   ├── Repository/            # Repository pattern for data management
│   └── Endpoint/              # API endpoint configurations
│── Domain/                     
│   ├── Entities/              # Data models representing entities (e.g., Country)
│   └── Usecases/              # Business logic use cases (e.g., fetch countries)
│── Presentation/              
│   ├── View Models/           # ViewModel layer for data binding and state management
│   └── Views/                 # View layer for UI components
└── Resources/                 # App resources (images, fonts, etc.)


```

## Technologies Used
- **Swift**: The programming language used for development.
- **Combine**: For reactive programming and handling asynchronous tasks.
- **Alamofire**: For networking and making API calls.
- **UIKit**: For building the user interface and interacting with users.
- **Clean Architecture**: Provides a clear separation of concerns, making the codebase easier to maintain and test.
- **MVVM**: Separates business logic from UI logic for better code organization and maintainability.

---

## API Integration

The app communicates with a remote API to fetch country data. The base URL and endpoints are defined in `Endpoint.swift`, and API requests are made using **Alamofire**.

- **Base URL**: `https://gist.githubusercontent.com/peymano-wmt/.../countries.json`
- **Endpoint**:
  - `/countries.json`: Retrieves a list of countries.

---

## Setup Instructions

1. Open the `CountriesApp.xcodeproj` file in Xcode.

2. Run the app:
    - Select a simulator or connected device.
    - Press `Cmd + R` to build and run the project.
---









