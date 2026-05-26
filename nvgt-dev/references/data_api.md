# NVGT Data Persistence & Management Master Guide

Master guide for managing persistent game data (Saves, Settings, RPG Databases).

## Core Data Management

### `class sqlite`
High-performance database management for RPG stats, item libraries, and persistent worlds.
- `bool open(string filename)`: Opens or creates a database.
- `void close()`: Closes the database.
- `bool execute(string query)`: Runs a SQL command.
- `sqlite_result@ query(string query)`: Executes a query and returns result handles.
- `int last_insert_rowid` (property): ID of the last inserted row.

### `class db_props`
Specialized key-value storage layer on top of SQLite. Perfect for simple saves.
- `bool open(string filename, string tablename = "properties")`: Opens a property set.
- `void set(string key, string value)`: Writes a value.
- `string get(string key)`: Reads a value.
- `bool exists(string key)`: Checks if a key exists.
- `void remove(string key)`: Deletes a key.

### `class ini`
Standard configuration file management.
- `bool load(string filename)`: Loads an INI file.
- `bool save(string filename)`: Saves the current INI data.
- `string read(string section, string key, string default_value = "")`: Reads a value.
- `void write(string section, string key, string value)`: Writes a value.

## Best Practices
1.  **Safety**: Always use `db_props` or `ini` for settings and small saves to avoid SQL injection or logic bugs.
2.  **Performance**: For high-volume stats (e.g., thousands of RPG items), use `sqlite` with raw queries for speed.
3.  **Cross-Platform**: Use `get_user_data_path()` to find a safe location for save files on Windows, Mac, and Linux.
