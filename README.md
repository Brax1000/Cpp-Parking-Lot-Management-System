# C++ Parking Lot Management System

A C++17 console application for maintaining vehicle registrations, parking inventory, live entries and SQLite persistence. It provides vehicle registration/listing, slot registration/listing, automatic compatible slot allocation, entry/exit and payment, transaction history, revenue summaries, and rate setting storage.

## Architecture and data

The console is in `src/main.cpp`; fee arithmetic is isolated in `FeeCalculator`. SQLite is the source of truth. Vehicles have many parking transactions; each transaction references one slot. Partial unique indexes enforce at most one active session per vehicle and per slot. Entry uses an immediate SQLite transaction so the session and slot status change succeed together. `database/schema.sql` documents the full schema.

## Requirements and build

Requires C++17, CMake 3.16+, and SQLite3 development headers/library.

```powershell
cmake -S . -B build
cmake --build build --config Release
ctest --test-dir build --output-on-failure
```

Run `build\Release\parking-lot.exe` with MSVC, or `build\parking-lot.exe` with MinGW. The database is created at `data/parking.db`.

## Fee rules

The fee calculator uses integer centavos: first started hour is the initial rate; each later started hour uses the additional rate. Configure sample rates in centavos through `FeeCalculator`; persistence and user-facing rate settings are planned.

## Features and current scope

- SQLite storage, unique normalized plates, unique slot numbers, foreign keys, active-session constraints.
- Basic dashboard, registration/listing, automatic slot choice (motorcycle slots for motorcycles, SUV slots for SUVs, car slots for other vehicle types; reserved slots are accepted), and transactional entry and exit.
- Payment confirmation, centavo fee calculations, recent history view, revenue summaries, and persisted rate setting input.
- Fee calculator with an independent CTest executable.

Rate entries are persisted in settings, but currently do not override the sample rates used at exit. Full rates integration, editing/disabling operations, manual assignment, CSV export, backup/restore, and comprehensive integration tests remain future work.

## Project structure

`include/` fee interface; `src/` application and implementation; `database/` schema; `tests/` fee checks; `data/` runtime database.

## Screenshots

Capture a terminal screenshot after building and running the application.

## Future improvements

Complete exit/payment workflow, rate settings, transaction browsing, CSV reports, validation forms, backups, integration tests and polished terminal tables.

## License

MIT. See `LICENSE`.
