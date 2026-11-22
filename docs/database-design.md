# Database design

`vehicles.vehicle_id` and `parking_slots.slot_id` are primary keys. `parking_transactions` references both, preserving immutable visit records. Unique constraints protect license plates and slot numbers. Partial unique indexes enforce one active transaction per vehicle and parking space. Integer monetary values represent centavos. Foreign key enforcement is enabled at connection startup. Slot occupancy is changed inside the same write transaction as entry allocation.
