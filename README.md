# 📱 CalculatorSwiftUI

This is a simple **String Calculator** built using **SwiftUI** and follows the principles of **Test-Driven Development (TDD)**.

The calculator takes a string of numbers (with various delimiters) and returns their sum. It also includes a clean user interface for interactive input and result display.

---

## ✅ What is TDD?

**Test-Driven Development (TDD)** is a software development practice where tests are written **before** the actual implementation code. It ensures your code is:

- Correct
- Modular
- Easy to maintain and extend

---

## 🔄 TDD Cycle: Red → Green → Refactor

1. **Red – Write a Failing Test:**
   - Write a test for a small feature.
   - Run it → it fails because the code doesn’t exist yet.

2. **Green – Write Minimum Code:**
   - Implement the **simplest code** to make the test pass.

3. **Refactor – Improve Code:**
   - Clean up the implementation.
   - Remove duplication, improve naming, and structure.
   - Ensure all tests still pass.

---

## 🧪 Example TDD Flow (for `add(_:)` function)

- **Test 1:**  
  Input: `""` → Output: `0`  
  ➤ Write test → it fails  
  ➤ Implement: `return 0` → test passes

- **Test 2:**  
  Input: `"1"` → Output: `1`  
  ➤ Write test → update code to parse single number

- **Test 3:**  
  Input: `"1,2"` → Output: `3`  
  ➤ Extend logic to handle comma-separated values

- And so on...

---

## 🛠 Features Implemented

- Add numbers from comma-separated strings
- Support for newline `\n` as a delimiter
- Support for custom delimiters using syntax like `//;\n1;2`
- Error handling for negative numbers
- Exception shows all negative numbers in the message
- Minimal SwiftUI interface to take input and show result

---

## 📷 UI Overview

> Include screenshots here if possible (optional)

---

## ✅ Running the Project

- Open the Xcode project
- Run the app on the simulator
- Go to the test navigator (⌘ + 6) and run all tests

---

## 📂 Folder Structure

- `CalculatorSwiftUI.swift` – Contains the core logic
- `CalculatorSwiftUITests.swift` – All unit tests using TDD
- `ContentView.swift` – SwiftUI view with input, button, and output

