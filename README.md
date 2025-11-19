# 🧮 Calculator App

A **modern, feature-rich calculator** built with **Flutter** for cross-platform excellence. Perform seamless arithmetic operations with an elegant UI, intelligent chaining, and robust error handling.

---

## ✨ Features

### Core Functionality
- ✅ **Basic Arithmetic Operations** – Add, subtract, multiply, and divide with precision
- ✅ **Chained Operations** – Perform sequential calculations without pressing equals (e.g., `1 + 2 + 3 =`)
- ✅ **Smart Decimal Input** – Prevents multiple decimal points in a single number
- ✅ **Safe Parsing** – Uses `double.tryParse` to handle invalid input gracefully
- ✅ **Result Formatting** – Automatically strips trailing zeros and displays clean output

### User Experience
- 🎨 **Dark Theme UI** – Easy on the eyes with a professional black background
- 🎯 **Intuitive Button Layout** – Numeric keypad with color-coded operators (gray for numbers, yellow for operators)
- 🚀 **One-Tap Clear** – Reset the entire calculator state instantly
- 📱 **Responsive Design** – Adapts seamlessly to any screen size

---

## 🛠️ Technical Stack

- **Framework**: [Flutter](https://flutter.dev) – Multi-platform native development
- **Language**: [Dart](https://dart.dev) – Fast, scalable, and intuitive
- **State Management**: Flutter's native `StatefulWidget` with `setState()`
- **Architecture**: Clean widget-based structure with modular button handling

---

## 📦 Getting Started

### Prerequisites
- Flutter SDK (>= 3.0.0)
- Dart SDK (included with Flutter)
- An IDE: VS Code, Android Studio, or IntelliJ

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Manoranjith46/Calculator_App-flutter-.git
   cd calculator_app
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the app**:
   ```bash
   flutter run
   ```

### Supported Platforms
- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

---

## 🎮 Usage

1. **Enter Numbers**: Tap numeric buttons (0–9) and decimal point (.)
2. **Perform Operations**: Tap an operator (+, −, ×, ÷)
3. **Chain Calculations**: Press another operator to auto-compute and continue
4. **Get Results**: Tap `=` to see the final answer
5. **Clear**: Tap `Clear` to reset everything

### Example
```
Tap: 1 → + → 2 → + → 3 → =
Result: 6
```

---

## 🔧 Key Implementation Details

- **State Persistence**: Class-level `temp` and `op` fields store operands across taps
- **Chained Operations**: When pressing an operator with an existing pending operation, the app auto-computes the intermediate result
- **Input Validation**: Regex patterns prevent invalid inputs (e.g., multiple dots)
- **Formatting**: Custom `formatResult()` removes trailing zeros and rounds appropriately

---

## 📋 Future Enhancements

- ➕ Divide-by-zero error handling with user feedback
- ➕ History panel to review past calculations
- ➕ Keyboard support for desktop platforms
- ➕ Memory functions (M+, M−, MR, MC)
- ➕ Scientific calculator mode with advanced functions

---

## 📄 License

This project is open-source and available under the **MIT License**.

---

## 👨‍💻 Author

**Manoranjith46** – [GitHub Profile](https://github.com/Manoranjith46)

---

## 🤝 Contributing

Contributions are welcome! Feel free to open issues or submit pull requests to improve the app.

---

**Enjoy calculating! 🎉**
