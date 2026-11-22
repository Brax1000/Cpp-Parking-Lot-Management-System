PRAGMA foreign_keys = ON;
CREATE TABLE IF NOT EXISTS parking_slots(slot_id INTEGER PRIMARY KEY, slot_number TEXT NOT NULL UNIQUE, parking_level TEXT NOT NULL, slot_type TEXT NOT NULL, status TEXT NOT NULL DEFAULT 'available' CHECK(status IN ('available','occupied')), is_enabled INTEGER NOT NULL DEFAULT 1 CHECK(is_enabled IN (0,1)));
CREATE TABLE IF NOT EXISTS vehicles(vehicle_id INTEGER PRIMARY KEY, license_plate TEXT NOT NULL UNIQUE, owner_name TEXT NOT NULL, contact_number TEXT NOT NULL, vehicle_type TEXT NOT NULL, vehicle_description TEXT NOT NULL DEFAULT '', registration_date TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE IF NOT EXISTS parking_transactions(transaction_id INTEGER PRIMARY KEY AUTOINCREMENT, vehicle_id INTEGER NOT NULL REFERENCES vehicles(vehicle_id), slot_id INTEGER NOT NULL REFERENCES parking_slots(slot_id), entry_time TEXT NOT NULL, exit_time TEXT, parking_duration INTEGER, parking_fee INTEGER, payment_status TEXT NOT NULL DEFAULT 'unpaid', transaction_status TEXT NOT NULL DEFAULT 'active' CHECK(transaction_status IN ('active','completed')));
CREATE UNIQUE INDEX IF NOT EXISTS one_active_per_vehicle ON parking_transactions(vehicle_id) WHERE transaction_status='active';
CREATE UNIQUE INDEX IF NOT EXISTS one_active_per_slot ON parking_transactions(slot_id) WHERE transaction_status='active';
CREATE INDEX IF NOT EXISTS idx_vehicle_plate ON vehicles(license_plate);
CREATE INDEX IF NOT EXISTS idx_tx_entry ON parking_transactions(entry_time);
CREATE TABLE IF NOT EXISTS settings(setting_id INTEGER PRIMARY KEY, setting_key TEXT NOT NULL UNIQUE, setting_value TEXT NOT NULL);
