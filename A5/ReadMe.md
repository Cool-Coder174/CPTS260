# README: Assignment 5 – CptS260 MIPS Assembly

## Contents

* Fibonacci (Iterative & Recursive) - MIPS Assembly
* Binary Search - MIPS Assembly

---

## How to Compile & Run MIPS Assembly Code

### 1. Install a MIPS Simulator (MARS or QtSPIM)

#### **A. QtSPIM (Recommended for Classes)**

* **Mac:**

  ```bash
  brew install --cask qtspim
  ```
* **Linux:**

  ```bash
  sudo apt-get install qtspim
  ```
* **Windows:**
  Download and install from: [QtSPIM SourceForge](https://sourceforge.net/projects/spimsimulator/)

#### **B. MARS (Java-based, All OS)**

* Download `MARS.jar` from:
  [MARS Download Page](http://courses.missouristate.edu/KenVollmar/mars/)

---

### 2. Running Your Program from the Terminal

#### **A. Using QtSPIM (Command Line)**

```bash
qtspim -file fib_iter.asm
qtspim -file fib_rec.asm
qtspim -file binary_search.asm
```

*This opens the QtSPIM GUI with your program loaded. Click “Run” to execute.*

#### **B. Using MARS (Java-based, Command Line)**

```bash
java -jar MARS.jar fib_iter.asm
java -jar MARS.jar fib_rec.asm
java -jar MARS.jar binary_search.asm
```

*This opens MARS GUI. You can also run `java -jar MARS.jar` and open files through the interface.*

---

### 3. Tips & Troubleshooting

* Make sure your `.asm` files are in the current working directory.
* If Java is not installed (for MARS), install it first:

  ```bash
  java -version
  ```
* For Mac, if you get permission errors with MARS:

  ```bash
  chmod +x MARS.jar
  ```
* To install Homebrew (for Mac), use:

  ```bash
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew install --cask qtspim
  ```

---

### How to Take a Screenshot (for Submission)

* **Mac:** `Cmd + Shift + 4`
* **Windows:** `Win + Shift + S` or use Snipping Tool
* **Linux:** `Shift + PrtSc` or `gnome-screenshot`

---

## **A Special Thank You**

I want to give a huge thank you to you Professor AJ for being so understanding and granting me an extension on this assignment. I really appreciate your support and flexibility—it truly makes a difference. Thanks for looking out for your students!

---

