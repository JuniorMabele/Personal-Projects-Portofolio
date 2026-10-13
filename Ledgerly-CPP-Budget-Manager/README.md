# Ledgerly — C++ Personal Finance Manager

A command-line budgeting application for recording income and expenses, calculating balances, and understanding spending by category.

## Features
- Add income and expense transactions
- CSV file persistence between sessions
- Calculate total income, spending, and balance
- Summarise expenses by category
- List a complete transaction ledger
- Demonstrates structs, vectors, file I/O, parsing, formatting, and exception handling

## Build and run

```bash
g++ -std=c++17 -Wall -Wextra main.cpp -o ledgerly
./ledgerly
```

On Windows with MinGW:

```powershell
g++ -std=c++17 -Wall -Wextra main.cpp -o ledgerly.exe
.\ledgerly.exe
```
