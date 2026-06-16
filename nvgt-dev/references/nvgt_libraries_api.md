# NVGT Standard Libraries & Plugins API Reference

> **IMPORTANT NOTE:** These syntaxes belong to standard libraries (includes) and plugins. To use them, you MUST include the corresponding file at the top of your script. Example:
> `#include "sound_pool.nvgt"`

---
## Library: `basic_character_controller.nvgt`
**Syntax to use:** `#include "basic_character_controller.nvgt"`

### Global Functions
- `shared abstract class basic_character_controller`
- `shared enum coordinate_handedness`
- `shared float nearest_compass_point(const float deg, const float step = 2.8125)`
- `shared float snap_to_degree(const float deg, const float[] snaps)`
- `shared string translate_yaw_to_direction(const float yaw)`

---
## Library: `bgt_compat.nvgt`
**Syntax to use:** `#include "bgt_compat.nvgt"`

### Global Functions
- `#endif #if_not plugin_legacy_sound pack_file@open_pack(const string&in filename, const string&in key = "", bool force_encryption = false)`
- `#endif bool generate_profile(const string& in filename)`
- `#if plugin_legacy_sound string get_sound_storage()`
- `bool clipboard_copy_text(const string& in text)`
- `bool file_decrypt(const string&in input_file, const string&in output_file, string key)`
- `bool file_encrypt(const string&in input_file, const string&in output_file, string key)`
- `bool hide_game_window()`
- `bool is_game_window_active()`
- `bool screen_reader_is_running(int reader)`
- `bool screen_reader_speak(int reader, const string& in text)`
- `bool screen_reader_speak_interrupt(int reader, const string& in text)`
- `bool screen_reader_stop_speech(int reader)`
- `bool set_sound_decryption_key(const string& in key, bool force_encryption)`
- `bool set_sound_decryption_key(const string& in key, bool force_encryption)`
- `bool set_sound_storage(const string&in filename, bool reset = false)`
- `bool set_sound_storage(const string&in filename, const string&in key = "", bool force_encryption = false, bool reset = false)`
- `bool show_game_window(const string& in title)`
- `bool string_is_alphabetic(const string& in str)`
- `bool string_is_alphanumeric(const string& in str)`
- `bool string_is_digits(const string& in str)`
- `bool string_is_lower_case(const string& in str)`
- `bool string_is_upper_case(const string& in str)`
- `const string get_DIRECTORY_MY_DOCUMENTS() property`
- `double absolute(double x)`
- `double arc_cosine(double x)`
- `double arc_sine(double x)`
- `double arc_tangent(double x)`
- `double ceiling(double x)`
- `double cosine(double r)`
- `double power(double x, double y)`
- `double sine(double r)`
- `double square_root(double value)`
- `double tangent(double x)`
- `pack@open_pack(const string&in filename)`
- `shared double string_to_number(const string& in num)`
- `shared int string_contains(const string& in str, const string& in search, int occurance = 1)`
- `shared string string_to_upper_case(const string& in str)`
- `shared string[]@ string_split(const string& in str, const string& in delim, bool full = true)`
- `string clipboard_read_text()`
- `string file_hash(const string& in filename, int algorithm, bool binary)`
- `string generate_computer_id(const string& in application_id, bool hardware_only)`
- `string get_last_error_text()`
- `string get_sound_storage()`
- `string serialize(dictionary@ the_data)`
- `string string_compress(string str)`
- `string string_decompress(string str)`
- `string string_decrypt(const string& in the_string, const string& in encryption_key)`
- `string string_encrypt(const string& in the_string, const string& in encryption_key)`
- `string string_hash(const string& in data, int algorithm, bool binary)`
- `string string_left(const string& in str, uint count)`
- `string string_mid(const string& in str, uint start, int count)`
- `string string_replace(const string& in str, const string& in search, const string& in replace, bool replace_all)`
- `string string_reverse(const string& in str)`
- `string string_right(const string& in str, uint count)`
- `string string_to_lower_case(const string& in str)`
- `string string_trim_left(const string& in str, uint count)`
- `string string_trim_right(const string& in str, uint count)`
- `uint string_len(const string& in str)`

---
## Library: `bgt_dynamic_menu.nvgt`
**Syntax to use:** `#include "bgt_dynamic_menu.nvgt"`

### Global Functions
- `#include "bgt_compat.nvgt" class dynamic_menu_item`
- `funcdef int menu_callback(dynamic_menu@, string)`

### Classes
#### Class `dynamic_menu`
- `bool allow_escape`
- `bool enable_home_and_end`
- `bool running`
- `bool wrap`
- `dynamic_menu_item[] item_list`
- `int menu_position`
- `int speech_output`
- `int stick_cancel`
- `int stick_ok`
- `joystick@ stick`
- `menu_callback@ callback_handle`
- `sound@ sound_handle`
- `string callback_data`
- `tts_voice@ tts_handle`
- `bool configure_joystick(joystick@ new_stick = null, int ok_button = -1, int cancel_button = -1)`
- `bool is_running()`
- `bool reset(bool completely)`
- `bool set_callback(menu_callback@ callback, string user_data)`
- `bool set_sound_object(sound@ handle)`
- `bool set_speech_mode(int speech_output)`
- `bool set_tts_object(tts_voice@ handle)`
- `dynamic_menu()`
- `int add_item(string filename, string name = "")`
- `int add_item_extended(string filename, bool is_filename, string name = "")`
- `int add_item_tts(string text, string name = "")`
- `int get_item_count()`
- `int get_position()`
- `int run(string intro, bool is_intro_tts)`
- `int run_extended(string intro, bool is_intro_tts, int start_position, bool auto_speak_first)`
- `int[] add_multiple_items(string[][] items)`
- `string get_item_name(int menu_item)`

---
## Library: `clear_compiled_basename.nvgt`
**Syntax to use:** `#include "clear_compiled_basename.nvgt"`

---
## Library: `db_props.nvgt`
**Syntax to use:** `#include "db_props.nvgt"`

### Classes
#### Class `database_bool`
- `private bool val`
- `bool bind(sqlite3statement@ s, int idx)`
- `bool get()`
- `bool opAssign(bool val)`
- `bool opEquals(bool val)`
- `bool opEquals(database_bool@ val)`
- `bool opImplConv()`
- `bool retrieve(sqlite3statement@ s, int idx, sqlite3@ db)`
- `database_bool(const string& in column_name)`
- `database_bool(const string& in column_name, bool default_value)`
- `string get_type() property`
- `string text()`
- `void opAssign(database_property@ other)`

#### Class `database_double`
- `private double val = 0`
- `bool bind(sqlite3statement@ s, int idx)`
- `bool opEquals(double val)`
- `bool retrieve(sqlite3statement@ s, int idx, sqlite3@ db)`
- `database_double(const string& in column_name)`
- `database_double(const string& in column_name, double default_value)`
- `database_double(database_double& other)`
- `double get()`
- `double opAdd(double val)`
- `double opAddAssign(double val)`
- `double opAssign(double val)`
- `double opDiv(double val)`
- `double opDivAssign(double val)`
- `double opImplConv()`
- `double opMod(double val)`
- `double opModAssign(double val)`
- `double opMul(double val)`
- `double opMulAssign(double val)`
- `double opNeg()`
- `double opPostDec()`
- `double opPostInc()`
- `double opPow(double val)`
- `double opPowAssign(double val)`
- `double opPreDec()`
- `double opPreInc()`
- `double opSub(double val)`
- `double opSubAssign(double val)`
- `int opCmp(double val)`
- `private void fetch()`
- `string get_type() property`
- `string opImplConv()`
- `string text()`
- `void opAssign(database_property@ other)`

#### Class `database_int`
- `bool autoincrementing`
- `private int64 val = 0`
- `bool bind(sqlite3statement@ s, int idx)`
- `bool opEquals(int64 val)`
- `bool retrieve(sqlite3statement@ s, int idx, sqlite3@ db)`
- `database_int(const string& in column_name)`
- `database_int(const string& in column_name, const string& in modifier)`
- `database_int(const string& in column_name, int64 default_value)`
- `database_int(database_int& other)`
- `int opCmp(int64 val)`
- `int64 get()`
- `int64 opAdd(int64 val)`
- `int64 opAddAssign(int64 val)`
- `int64 opAnd(int64 val)`
- `int64 opAndAssign(int64 val)`
- `int64 opAssign(int64 val)`
- `int64 opCom()`
- `int64 opDiv(int64 val)`
- `int64 opDivAssign(int64 val)`
- `int64 opImplConv()`
- `int64 opMod(int64 val)`
- `int64 opModAssign(int64 val)`
- `int64 opMul(int64 val)`
- `int64 opMulAssign(int64 val)`
- `int64 opNeg()`
- `int64 opOr(int64 val)`
- `int64 opOrAssign(int64 val)`
- `int64 opPostDec()`
- `int64 opPostInc()`
- `int64 opPow(int64 val)`
- `int64 opPowAssign(int64 val)`
- `int64 opPreDec()`
- `int64 opPreInc()`
- `int64 opShl(int64 val)`
- `int64 opShlAssign(int64 val)`
- `int64 opShr(int64 val)`
- `int64 opShrAssign(int64 val)`
- `int64 opSub(int64 val)`
- `int64 opSubAssign(int64 val)`
- `int64 opUShr(int64 val)`
- `int64 opUShrAssign(int64 val)`
- `int64 opXor(int64 val)`
- `int64 opXorAssign(int64 val)`
- `private void fetch()`
- `string get_type() property`
- `string text()`
- `void opAssign(database_property@ other)`
- `void set_autoincrement_value(int64 v)`

#### Class `database_list`
- `string delimiter = "\x1f"`
- `bool bind(sqlite3statement@ s, int idx)`
- `bool is_empty()`
- `bool opEquals(string[]@ val)`
- `bool retrieve(sqlite3statement@ s, int idx, sqlite3@ db)`
- `database_list(const string& in column_name)`
- `database_list(const string& in column_name, string[]@ default_value)`
- `database_list(database_list& other)`
- `int find(const string& in v)`
- `int find(int start, const string& in v)`
- `private string[] val =`
- `private string[]@ get_value() property`
- `string get_opIndex(int idx) property`
- `string get_type() property`
- `string text()`
- `string[]@ opAssign(string[]@ val)`
- `string[]@ opImplCast()`
- `uint length()`
- `void insert_at(uint pos, const string& in v)`
- `void insert_last(const string& in v)`
- `void opAssign(database_property@ other)`
- `void remove_at(uint pos)`
- `void remove_last()`
- `void remove_range(uint start, uint count)`
- `void reserve(uint count)`
- `void resize(uint count)`
- `void reverse()`
- `void set_opIndex(int idx, const string& in v) property`

#### Class `database_object`
- `database_property@[] properties`
- `dictionary property_names`
- `private bool exists_in_table = false`
- `sqlite3@ database`
- `string _last_query_error = ""`
- `string primary_column`
- `string primary_column_value`
- `string table`
- `bool commit()`
- `bool drop()`
- `database_object(sqlite3@ db, const string& in table, const string& in primary_column = "rowid")`
- `string dump(bool multiline_data = false)`
- `string get_row_filter() property`
- `string get_schema() property`
- `void postconstruct(sqlite3statement@ s = null)`

#### Class `database_property`
- `bool modified = false`
- `bool retrieved = false`
- `string column_name`
- `string type_extra`
- `weakref<database_object> parent`
- `bool bind(sqlite3statement@ s, int idx)`
- `bool retrieve()`
- `bool retrieve(sqlite3statement@ s, int idx)`
- `bool retrieve(sqlite3statement@ s, int idx, database_object@ p)`
- `bool retrieve(sqlite3statement@ s, int idx, sqlite3@ db)`
- `database_property(const string& in column_name)`
- `database_property(database_property& other)`
- `string get_type() property`
- `string text()`
- `void opAssign(database_property@ other)`

#### Class `database_string`
- `bool blob = false`
- `private string val = ""`
- `bool bind(sqlite3statement@ s, int idx)`
- `bool is_alphabetic()`
- `bool is_alphanumeric()`
- `bool is_digits()`
- `bool is_empty()`
- `bool is_lower()`
- `bool is_punctuation()`
- `bool is_upper()`
- `bool opEquals(const string& in val)`
- `bool retrieve(sqlite3statement@ s, int idx, sqlite3@ db)`
- `database_string(const string& in column_name)`
- `database_string(const string& in column_name, const string& in default_value)`
- `database_string(database_string& other)`
- `int find(const string& in text, int start = 0)`
- `int find_first_not_of(const string& in text, int start = 0)`
- `int find_first_of(const string& in text, int start = 0)`
- `int find_last_not_of(const string& in text, int start = 0)`
- `int find_last_of(const string& in text, int start = 0)`
- `int opCmp(const string& in val)`
- `int rfind(const string& in text, int start = 0)`
- `private void fetch()`
- `string get_opIndex(int idx) property`
- `string get_type() property`
- `string lower()`
- `string opAdd(const string& in val)`
- `string opAddAssign(const string& in val)`
- `string opAssign(const string& in val)`
- `string opAssign(database_string@ other)`
- `string opImplConv()`
- `string replace(const string& in search, const string& in replace, bool replace_all = true)`
- `string replace_range(uint start, int count, const string& in text)`
- `string reverse()`
- `string substr(uint start = 0, int count = -1)`
- `string text()`
- `string upper()`
- `string[]@ split(const string& in delim, bool full = true)`
- `uint length()`
- `void erase(uint pos, int count = -1)`
- `void insert(uint pos, const string& in other)`
- `void opAssign(database_property@ other)`
- `void replace_this(const string& in search, const string& in replace, bool replace_all = true)`
- `void resize(uint count)`
- `void set_opIndex(int idx, const string& in char)`

---
## Library: `dget.nvgt`
**Syntax to use:** `#include "dget.nvgt"`

### Global Functions
- `bool dgetb(dictionary@ d, const string& in key, bool def = false)`
- `double dgetn(dictionary@ d, const string& in key, double def = 0.0)`
- `string dgets(dictionary@ d, const string& in key, string def = "")`
- `string[] dgetsl(dictionary@ d, const string& in key, string[] def = dgetsl_default)`

---
## Library: `form.nvgt`
**Syntax to use:** `#include "form.nvgt"`

### Global Functions
- `#include "speech.nvgt" enum clipboard_flags`
- `bool key_repeating(int key, int repeat_delay, int prerepeat_delay)`
- `enum audioform_errorcodes`
- `enum control_event_type`
- `enum control_types`
- `enum text_edit_mode_constants`
- `enum text_entry_speech_flags`
- `interface utility_form`
- `shared int bgt_string_contains(const string& in str, const string& in search, int occurance = 1)`
- `shared string audioform_keyboard_echo_string(int keyboard_echo)`
- `shared uint audioform_change_keyboard_echo(int keyboard_echo, int dir = 1)`
- `string audioform_word_separators = "_ .,!\\\"/[`
- `funcdef bool form_background_callback(audio_form@ f)`
- `funcdef bool kb_echo_update_callback(audio_form@ f, int echo)`
- `funcdef int on_control_event_callback(audio_form@ f, int c, control_event_type event, dictionary@ args)`
- `funcdef void prespeech_callback(audio_form@ f)`

### Classes
#### Class `audio_form`
- `bool active`
- `bool speak_control_attributes_separately`
- `bool subform = false`
- `dictionary utility_form_data`
- `form_background_callback@ background_callback = @audioform_default_background_callback`
- `int default_echo_flag = audioform_keyboard_echo`
- `int subform_control_index = -1`
- `kb_echo_update_callback@kb_echo_update_callback = null`
- `on_control_event_callback@ event_callback = null`
- `private control[] c_form`
- `private int active_controls`
- `private int control_counter`
- `private int control_focus`
- `private int form_error`
- `private int speech_output`
- `private tts_voice@ ui_speech`
- `utility_form@ utility_form = null`
- `audio_form()`
- `audio_form@ get_current_form() property`
- `bool activate_progress_timer(int control_index)`
- `bool add_list_item(int control_index, const string& in option, int position = -1, bool selected = false, bool focus_if_first = true)`
- `bool add_list_item(int control_index, const string& in option, string id, int position = -1, bool selected = false, bool focus_if_first = true)`
- `bool add_text(int control_index, string new_text, int position = -1)`
- `bool check_shortcuts(bool for_subform = false)`
- `bool clear_list(int control_index)`
- `bool clear_slider_text_values(int control_index)`
- `bool delete_control(int control_index)`
- `bool delete_list_item(int control_index, int list_index, bool reset_cursor = true, bool speak_deletion_status = true)`
- `bool delete_list_selections(int control_index, bool reset_cursor = true, bool speak_deletion_status = true)`
- `bool edit_list_item(int control_index, string new_option, int position)`
- `bool edit_list_item_id(int control_index, string new_id, int position)`
- `bool edit_text(int control_index, string new_text, int position, int edit_mode = edit_mode_trim_to_length)`
- `bool focus(int control_id)`
- `bool focus_interrupt(int control_id)`
- `bool focus_silently(int control_id)`
- `bool has_custom_type(int control_index)`
- `bool is_checked(int control_index)`
- `bool is_disallowed_char(int control_index, string char, bool search_all = true)`
- `bool is_enabled(int control_index)`
- `bool is_list_item_checked(int control_index, int item_index)`
- `bool is_multiline(int control_index)`
- `bool is_pressed(int control_index)`
- `bool is_read_only(int control_index)`
- `bool is_visible(int control_index)`
- `bool pause_progress_timer(int control_index)`
- `bool search(int control_index, const string& in text, int dir = 1, bool speak_result = false)`
- `bool select_text(int control_index, int sel_start = -1, int sel_end = -1)`
- `bool set_button_attributes(int control_index, bool primary, bool cancel, bool overwrite = true)`
- `bool set_caption(int control_index, string caption)`
- `bool set_checkbox_mark(int control_index, bool checked)`
- `bool set_clipboard_flags(int control_index, bool copy, bool cut, bool paste)`
- `bool set_custom_type(int control_index, string custom_type)`
- `bool set_default_controls(int primary, int cancel)`
- `bool set_default_keyboard_echo(int keyboard_echo, bool update_controls = true)`
- `bool set_delete_disabled_message(int control_index, string message)`
- `bool set_disallowed_chars(int control_index, string chars, bool use_only_disallowed_chars = false, string char_disallowed_description = "")`
- `bool set_enable_delete(int control_index, bool enabled)`
- `bool set_enable_go_to_index(int control_index, bool enabled)`
- `bool set_enable_search(int control_index, bool enabled)`
- `bool set_event_callback(int control_index, on_control_event_callback@ event_callback)`
- `bool set_keyboard_echo(int control_index, int keyboard_echo)`
- `bool set_keyboard_echo_update_callback(kb_echo_update_callback@callback)`
- `bool set_line(int control_index, int line, int col = 1, bool speak_result = false)`
- `bool set_link_url(int control_index, string new_url)`
- `bool set_list_multinavigation(int control_index, bool letters, bool numbers, bool nav_translate = true)`
- `bool set_list_position(int control_index, int position = -1, bool speak_new_item = false)`
- `bool set_list_properties(int control_index, bool multiselect=false, bool repeat_boundary_items=false)`
- `bool set_output_mode(int speech_output, bool progress_bars_beep = false)`
- `bool set_overwrite_mode(int control_index, bool overwrite)`
- `bool set_progress(int control_index, int value)`
- `bool set_read_only(int control_index, bool read_only)`
- `bool set_slider(int control_index, double value, double min = -1, double max = -1)`
- `bool set_slider_step_size(int control_index, double new_size)`
- `bool set_slider_text_value(int control_index, double value, const string& in text)`
- `bool set_speech_verbosity_options(int control_index, string highlight_selection, string highlight_unselection, string deletion, string percentage, int keyboard_echo)`
- `bool set_state(int control_index, bool enabled, bool visible)`
- `bool set_subform(int control_index, audio_form@ f)`
- `bool set_text(int control_index, string new_text)`
- `bool set_tts_object(tts_voice@ handle)`
- `const string& get_text_reference(int control_index)`
- `double get_slider(int control_index)`
- `double get_slider_maximum_value(int control_index)`
- `double get_slider_minimum_value(int control_index)`
- `double get_slider_step_size(int control_index)`
- `int create_button(string caption, bool primary = false, bool cancel = false, bool overwrite = true)`
- `int create_checkbox(string caption, bool initial_value = false, bool read_only = false)`
- `int create_input_box(string caption, string default_text = "", string password_mask = "", int maximum_length = 0, bool read_only = false, bool multiline = false, bool multiline_enter = true)`
- `int create_keyboard_area(string caption)`
- `int create_link(string caption, string url)`
- `int create_list(string caption, int maximum_items = 0, bool multiselect = false, bool repeat_boundary_items = false)`
- `int create_progress_bar(string caption, int speak_interval = 5, bool speak_global = true)`
- `int create_slider(string caption, double default_value = 50, double minimum_value = 0, double maximum_value = 100, string text = "", double step_size = 1)`
- `int create_status_bar(string caption, string text)`
- `int create_subform(string caption, audio_form@ f)`
- `int create_tab_panel(string caption, int maximum_items = 0, bool repeat_boundary_items = false)`
- `int get_cancel_button()`
- `int get_control_count()`
- `int get_control_type(int control_index)`
- `int get_current_focus()`
- `int get_default_button()`
- `int get_last_error()`
- `int get_line_column(int control_index)`
- `int get_line_number(int control_index)`
- `int get_list_count(int control_index)`
- `int get_list_index_by_id(int control_index, string id)`
- `int get_list_position(int control_index)`
- `int get_progress(int control_index)`
- `int get_text_cursor(int control_index)`
- `int monitor()`
- `int[]@ get_checked_list_items(int control_index)`
- `int[]@ get_list_selections(int control_index)`
- `private bool check_globals(bool required_setting)`
- `private bool focus(int tab_index, bool interrupt_previous_speech, bool silent = false)`
- `private int letter_to_key(string char)`
- `private int shortcut(string caption_text)`
- `private string shortcut_letter(string caption_text)`
- `private void check(int tab_index)`
- `private void check_speech_mode()`
- `private void set_cancel(int control, bool state, bool overwrite)`
- `private void set_primary(int control, bool state, bool overwrite)`
- `string get_caption(int control_index)`
- `string get_control_attributes(int control_index)`
- `string get_custom_type(int control_index)`
- `string get_link_url(int control_index)`
- `string get_list_item(int control_index, int list_index)`
- `string get_list_item_id(int control_index, int list_index)`
- `string get_password_mask(int control_index)`
- `string get_slider_text_value(int control_index, double value)`
- `string get_text(int control_index)`
- `void create_window()`
- `void create_window(string window_title, bool change_screen_title = true, bool say_dialog = true, bool silent = false)`
- `void reset(bool reset_to_default_keyboard_echo = true)`

#### Class `control`
- `audio_form@ subform = null`
- `bool active`
- `bool beeping_progress`
- `bool cancel`
- `bool checked`
- `bool enable_delete`
- `bool enable_go_to_index`
- `bool enable_search`
- `bool enabled`
- `bool focused`
- `bool list_is_tab_panel`
- `bool list_multiselect`
- `bool list_nav_translate`
- `bool list_repeat_boundary_items`
- `bool multiline`
- `bool multiline_enter`
- `bool multinav_letters`
- `bool multinav_numbers`
- `bool overwrite`
- `bool pressed`
- `bool primary`
- `bool read_only`
- `bool speak_global`
- `bool use_only_disallowed_chars`
- `bool visible`
- `dictionary slider_text_values`
- `double slider_maximum_value`
- `double slider_minimum_value`
- `double slider_step_size`
- `double slider_value`
- `int cursor`
- `int echo_flag`
- `int hotkey`
- `int list_index`
- `int list_length`
- `int list_position`
- `int max_items`
- `int max_length`
- `int progress`
- `int sel_end`
- `int sel_start`
- `int speak_interval`
- `int speech_output`
- `int type`
- `list_item[] list`
- `on_control_event_callback@ event_callback`
- `sound@ bar`
- `string caption`
- `string char_disallowed_description`
- `string custom_type`
- `string delete_disabled_message`
- `string delete_speech_text`
- `string highlight_selection_speech_text`
- `string highlight_unselection_speech_text`
- `string hotkey_letter`
- `string link_url`
- `string multinav_characters`
- `string password_mask`
- `string percentage_speech_text`
- `string text`
- `string[] disallowed_chars`
- `timer multinav_timer`
- `timer progress_time`
- `tts_voice@ ui_speech`
- `uint8 clipboard_flags`
- `bool add_silent(string content, int position)`
- `bool append_text(string content, int position)`
- `bool edit_silent(string content, int position, int edit_mode)`
- `bool is_disallowed_char(string char, bool search_all = true)`
- `bool replace_text(string content, int position)`
- `bool search(const string& in text, int dir = 1, bool silent = false)`
- `bool set_line(int line, int col = 1, bool silent = false)`
- `bool trim_to_length(string content, int position)`
- `control()`
- `int current_line_start_position(bool word = false)`
- `int get_line_column()`
- `int get_line_number()`
- `private void speak_selected(const string& in selection)`
- `string find_appropriate_character(string original_character)`
- `string input_box_speak(string character)`
- `string input_box_speak(string character, bool ignore_echo_flag)`
- `string read_line(int position)`
- `string read_word_from_position(int position)`
- `string slider_value_string()`
- `string type_to_name()`
- `void add(string character, bool silent = false)`
- `void add_new_line()`
- `void beep_progress()`
- `void check(audio_form@ f, int tab_index)`
- `void checkbox_toggle()`
- `void copy_highlighted()`
- `void cut_highlighted()`
- `void delete_highlighted()`
- `void delete_highlighted(int from_start)`
- `void delete_highlighted(int from_start, bool speak_deleted)`
- `void delete_word_left()`
- `void delete_word_right()`
- `void edit(string character)`
- `void field_end()`
- `void field_start()`
- `void focus(bool interrupt_previous_speech, bool separate_attributes, bool silent = false)`
- `void highlight_all()`
- `void highlight_by_position(int start, int end)`
- `void highlight_down()`
- `void highlight_left()`
- `void highlight_right()`
- `void highlight_to_field_end()`
- `void highlight_to_field_start()`
- `void highlight_to_line_end(bool continuation = false)`
- `void highlight_to_line_start(bool continuation = false)`
- `void highlight_to_word_end()`
- `void highlight_to_word_start()`
- `void highlight_up()`
- `void line_end()`
- `void line_start()`
- `void move_left()`
- `void move_right()`
- `void move_word_left(bool highlighting = false, bool speak_selection_status = true)`
- `void move_word_right(bool highlighting = false, bool speak_selection_status = true)`
- `void next_line()`
- `void paste_text()`
- `void previous_line()`
- `void speak_list_item(bool interrupt = true)`
- `void speak_progress()`
- `void speak_progress(bool interrupt)`

#### Class `go_to_index`
- `audio_form f`
- `audio_form@ parent`
- `int control_index`
- `int f_index, f_col, f_ok, f_cancel`
- `go_to_index(audio_form@ parent, int control_index)`
- `void monitor()`

#### Class `list_item`
- `bool checked`
- `string id`
- `string item`
- `list_item()`

#### Class `search_for`
- `audio_form f`
- `audio_form@ parent`
- `int control_index`
- `int f_text, f_next, f_prev, f_cancel`
- `search_for(audio_form@ parent, int control_index)`
- `void monitor()`

---
## Library: `ini.nvgt`
**Syntax to use:** `#include "ini.nvgt"`

### Global Functions
- `shared bool INI_IS_VALID_IDENT_CHAR(const string& in char)`
- `shared class ini`
- `shared class ini_section`
- `shared string INI_ESCAPE_STRING(const string&in value)`
- `shared string INI_UNESCAPE_STRING(const string&in value)`
- `shared string INI_VERIFY_IDENT(const string& in identifier)`
- `shared string[]@ get_lines(const string& in the_string)`

---
## Library: `input_forms.nvgt`
**Syntax to use:** `#include "input_forms.nvgt"`

### Global Functions
- `#include"form.nvgt" class input_field`

### Classes
#### Class `checkbox_field`
- `bool default_value = false`
- `bool require_check = true`
- `bool configure()`
- `bool is_ok()`
- `bool set_value(dictionary@d)`
- `checkbox_field(input_form@parent, string name, string label, bool default_value = false, bool required = false, bool require_check = true)`

#### Class `choice_input_field`
- `string[] choices`
- `)`
- `bool configure()`
- `bool is_ok()`
- `bool set_value(dictionary@d)`
- `choice_input_field(input_form@parent, string name, string label, bool required = false, string[] choices =`
- `void add_choice(string choice)`

#### Class `input_form`
- `audio_form@main_form`
- `bool is_dialog = true`
- `bool user_canceled = false`
- `input_field@[]fields`
- `int ok_btn = -1, cancel_btn = -1`
- `private bool active = false`
- `string char_disallowed_description = "you can't type this here"`
- `string description = ""`
- `string invalid_input_message = "invalid input"`
- `string ok_button_label = "&ok", cancel_button_label = "&cancel"`
- `string title`
- `bool add_checkbox_field(string name, string label, bool default_value = false, bool required = false, bool require_check = true)`
- `bool add_choice_field(string name, string label, string[] choices, bool required = false)`
- `bool add_number_field(string name, string label, int default_value = -1, bool required = false)`
- `bool add_text_field(string name, string label, string default_value = "", bool required = false, bool secure = false, string disallowed_chars = "")`
- `bool configure()`
- `bool fill_form(dictionary@d)`
- `bool setup()`
- `dictionary@ monitor()`
- `dictionary@ run()`
- `input_form(string title, audio_form@form = null)`

#### Class `number_text_field`
- `bool is_valid_text()`
- `bool set_value(dictionary@d)`
- `number_text_field(input_form@parent, string name, string label, int default_value = -1, bool required = false)`

#### Class `text_field`
- `bool multiline = false, readonly = false`
- `bool only_use_disallowed_chars = false`
- `bool secure = false`
- `int min_length = 0, max_length = 0`
- `string default_value`
- `string disallowed_chars = "", char_disallowed_description`
- `bool configure()`
- `bool is_ok()`
- `bool is_valid_text()`
- `bool set_disallowed_chars(string chars, bool only_use_disallowed_chars, string char_disallowed_description = "")`
- `bool set_value(dictionary@d)`
- `text_field(input_form@parent, string name, string label, string default_value = "", bool required = false)`

---
## Library: `instance.nvgt`
**Syntax to use:** `#include "instance.nvgt"`

### Classes
#### Class `instance`
- `private bool already_locked = false`
- `private named_mutex@ mtx`
- `private string mtx_name`
- `bool get_is_already_running() property`
- `instance(const string&in app_id = "")`
- `void wait_until_standalone()`
- `~instance()`

---
## Library: `int_to_byte.nvgt`
**Syntax to use:** `#include "int_to_byte.nvgt"`

### Global Functions
- `int byte_to_int(string the_bytes, uint8 endian = int_to_byte_little_endian)`
- `string int_to_byte(int the_int, uint8 endian = int_to_byte_little_endian, int compress = 4)`

---
## Library: `legacy_file_contents.nvgt`
**Syntax to use:** `#include "legacy_file_contents.nvgt"`

### Global Functions
- `bool put_file_contents(const string& in filename, const string& in content, bool a = false)`
- `string get_file_contents(const string& in filename)`

---
## Library: `legacy_sound_pool.nvgt`
**Syntax to use:** `#include "legacy_sound_pool.nvgt"`

### Classes
#### Class `sound_pool`
- `bool hrtf = true`
- `bool occlude = true`
- `bool y_is_elevation = sound_pool_default_y_elevation`
- `double last_listener_rotation`
- `float behind_pitch_decrease`
- `float pan_step`
- `float volume_step`
- `int clean_frequency`
- `int last_listener_x`
- `int last_listener_y`
- `int last_listener_z`
- `int max_distance`
- `mixer@ mixer = null`
- `pack@ pack_file = null`
- `sound_pool_item[] items`
- `uint highest_slot`
- `bool destroy_sound(int slot)`
- `bool destroy_sounds(string owner)`
- `bool pause_sound(int slot)`
- `bool resume_sound(int slot)`
- `bool set_sound_owner(int slot, string owner, int priority = 0)`
- `bool set_sound_rotation(int slot, double rotation, vector pivit)`
- `bool set_sounds_amp(string owner, int priority, float amp)`
- `bool set_sounds_rotation(string owner, double rotation, vector pivit)`
- `bool sound_is_active(int slot)`
- `bool sound_is_playing(int slot)`
- `bool sound_push_memory(int slot, string mem, bool stream_end = false, int pcm_rate = 0, int pcm_chans = 0)`
- `bool update_sound_1d(int slot, int x)`
- `bool update_sound_2d(int slot, int x, int y)`
- `bool update_sound_3d(int slot, int x, int y, int z)`
- `bool update_sound_3d(int slot, vector coordinate)`
- `bool update_sound_positioning_values(int slot, float pan_step = -1, float volume_step = -1, bool update_sound = true)`
- `bool update_sound_range_1d(int slot, int left_range, int right_range)`
- `bool update_sound_range_2d(int slot, int left_range, int right_range, int backward_range, int forward_range)`
- `bool update_sound_range_3d(int slot, int left_range, int right_range, int backward_range, int forward_range, int lower_range, int upper_range, bool update_sound = true)`
- `bool update_sound_start_values(int slot, float start_pan, float start_volume, float start_pitch)`
- `bool update_sounds_3d(string owner, int x, int y, int z, double rotation = -1)`
- `bool update_sounds_3d(string owner, vector coordinate, double rotation = -1)`
- `bool verify_slot(int slot)`
- `double sound_last_memory_push_time(int slot)`
- `int get_sound_by_owner(string owner, int priority = 0)`
- `int play_1d(string filename, float listener_x, float sound_x, bool looping, bool persistent = false)`
- `int play_1d(string filename, pack@ packfile, float listener_x, float sound_x, bool looping, bool persistent = false)`
- `int play_2d(string filename, float listener_x, float listener_y, float sound_x, float sound_y, bool looping, bool persistent = false)`
- `int play_2d(string filename, float listener_x, float listener_y, float sound_x, float sound_y, double rotation, bool looping, bool persistent = false)`
- `int play_2d(string filename, pack@ packfile, float listener_x, float listener_y, float sound_x, float sound_y, bool looping, bool persistent = false)`
- `int play_2d(string filename, pack@ packfile, float listener_x, float listener_y, float sound_x, float sound_y, double rotation, bool looping, bool persistent = false)`
- `int play_3d(string filename, float listener_x, float listener_y, float listener_z, float sound_x, float sound_y, float sound_z, double rotation, bool looping, bool persistent = false)`
- `int play_3d(string filename, pack@ packfile, float listener_x, float listener_y, float listener_z, float sound_x, float sound_y, float sound_z, double rotation, bool looping, bool persistent = false)`
- `int play_3d(string filename, pack@ packfile, vector listener, vector sound_coordinate, double rotation, bool looping, bool persistent = false)`
- `int play_3d(string filename, vector listener, vector sound_coordinate, double rotation, bool looping, bool persistent = false)`
- `int play_extended(int dimension, string filename, pack@ packfile, float listener_x, float listener_y, float listener_z, float sound_x, float sound_y, float sound_z, double rotation, int left_range, int right_range, int backward_range, int forward_range, int lower_range, int upper_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null, bool start_playing = true, double theta = 0)`
- `int play_extended_1d(string filename, float listener_x, float sound_x, int left_range, int right_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null)`
- `int play_extended_1d(string filename, pack@ packfile, float listener_x, float sound_x, int left_range, int right_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null)`
- `int play_extended_2d(string filename, float listener_x, float listener_y, float sound_x, float sound_y, double rotation, int left_range, int right_range, int backward_range, int forward_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null)`
- `int play_extended_2d(string filename, float listener_x, float listener_y, float sound_x, float sound_y, int left_range, int right_range, int backward_range, int forward_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null)`
- `int play_extended_2d(string filename, pack@ packfile, float listener_x, float listener_y, float sound_x, float sound_y, double rotation, int left_range, int right_range, int backward_range, int forward_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null)`
- `int play_extended_2d(string filename, pack@ packfile, float listener_x, float listener_y, float sound_x, float sound_y, int left_range, int right_range, int backward_range, int forward_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null)`
- `int play_extended_3d(string filename, float listener_x, float listener_y, float listener_z, float sound_x, float sound_y, float sound_z, double rotation, int left_range, int right_range, int backward_range, int forward_range, int lower_range, int upper_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null, bool start_playing = true, double theta = 0)`
- `int play_extended_3d(string filename, pack@ packfile, float listener_x, float listener_y, float listener_z, float sound_x, float sound_y, float sound_z, double rotation, int left_range, int right_range, int backward_range, int forward_range, int lower_range, int upper_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null, bool start_playing = true, double theta = 0)`
- `int play_stationary(string filename, bool looping, bool persistent = false)`
- `int play_stationary(string filename, pack@ packfile, bool looping, bool persistent = false)`
- `int play_stationary_extended(string filename, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null)`
- `int play_stationary_extended(string filename, pack@ packfile, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null)`
- `int reserve_slot()`
- `sound_pool(int default_item_size = 100)`
- `void clean_unused()`
- `void destroy_all()`
- `void find_highest_slot(uint limit)`
- `void pause_all()`
- `void resume_all()`
- `void update_listener_1d(float listener_x)`
- `void update_listener_2d(float listener_x, float listener_y, double rotation = 0.0)`
- `void update_listener_3d(float listener_x, float listener_y, float listener_z, double rotation = 0.0, bool refresh_y_is_elevation = true)`
- `void update_listener_3d(vector listener, double rotation = 0.0, bool refresh_y_is_elevation = true)`

#### Class `sound_pool_item`
- `bool is_3d`
- `bool looping`
- `bool occlude`
- `bool paused`
- `bool persistent`
- `bool stationary`
- `bool y_is_elevation`
- `double start_offset`
- `float behind_pitch_decrease`
- `float pan_step`
- `float start_pan`
- `float start_pitch`
- `float start_volume`
- `float theta`
- `float volume_step`
- `float x`
- `float y`
- `float z`
- `int backward_range`
- `int forward_range`
- `int left_range`
- `int lower_range`
- `int priority`
- `int right_range`
- `int upper_range`
- `pack@ packfile = null`
- `sound@ handle`
- `string extra_data`
- `string filename`
- `string owner`
- `timer last_memory_push`
- `vector pivit`
- `int get_total_distance(float listener_x, float listener_y, float listener_z)`
- `sound_pool_item()`
- `void reset()`
- `void update(float listener_x, float listener_y, float listener_z, double rotation, int max_distance)`
- `void update_listener_position(float listener_x, float listener_y, float listener_z, float rotation)`

---
## Library: `logger.nvgt`
**Syntax to use:** `#include "logger.nvgt"`

### Classes
#### Class `logger`
- `bool always_include_header`
- `bool date_all_entries`
- `bool overwrite_file`
- `string date_format`
- `string entry`
- `string footer_text`
- `string header_text`
- `bool write(string filename, bool reset_text)`
- `logger()`
- `string parse_time()`
- `void add_entry(string the_entry)`
- `void reset()`

---
## Library: `menu.nvgt`
**Syntax to use:** `#include "menu.nvgt"`

### Global Functions
- `#include "form.nvgt" class menu`
- `bool yes_no(const string&in prompt, menu@ m = null, string yes = "yes", string no = "no")`
- `void learn_game_sounds_menu(const name_value_collection&in sfx, const string&in audio_prefix = "", menu@ m = null, string go_back = "Go back")`

---
## Library: `music.nvgt`
**Syntax to use:** `#include "music.nvgt"`

### Global Functions
- `funcdef sound@ load_music_sound(sound@, string)`

### Classes
#### Class `music_manager`
- `bool stopping = false`
- `int64 next_play = 0`
- `load_music_sound@ load_callback = null`
- `mixer music_mixer`
- `music_track@ main_track = null`
- `music_track@ next_track = null`
- `bool get_playing() const property`
- `bool pause(int fade_ms = 0, bool blocking = false)`
- `bool play(string track, bool blocking = false)`
- `bool resume(int fade_ms = 0)`
- `float get_volume() const property`
- `sound@ load_sound(sound@ s, string filename)`
- `string get_playing_filename() const property`
- `string get_upcoming_filename() const property`
- `void loop(uint64 t = ticks())`
- `void set_load_callback(load_music_sound@ cb)`
- `void set_volume(float volume) property`
- `void stop(int fade_ms = 0, bool blocking = false)`

#### Class `music_track`
- `bool intro_repeating = false`
- `bool paused = false`
- `bool prerepeat = false`
- `bool stopping = false`
- `bool was_next_track_playing = false`
- `float start_position`
- `int intro_duration`
- `int predelay`
- `int repeat_fade_ms`
- `int repeat_point`
- `int start_fade_ms`
- `int switch_fade = 500`
- `int switch_predelay = 300`
- `int track_pitch = 100`
- `int track_volume`
- `music_manager@ parent = null`
- `sound@ next_track = null`
- `sound@ track = null`
- `string intro_filename`
- `string main_filename`
- `uint64 intro_end = 0`
- `uint64 last_played = 0`
- `uint64 start_playing = 0`
- `bool get_playing() property`
- `bool set_option(string varname, string value = "")`
- `int get_position() property`
- `music_track(string data, music_manager@ parent = null)`
- `sound@ load_sound(sound@ s, string filename)`
- `void loop(uint64 t)`
- `void pause(int fade_ms = 0)`
- `void play(int fade_ms = 0)`
- `void play_obj(sound@ handle, int fade_ms)`
- `void setup()`
- `void stop(int fade_ms = 0)`

---
## Library: `number_speaker.nvgt`
**Syntax to use:** `#include "number_speaker.nvgt"`

### Classes
#### Class `number_speaker`
- `#endif #if_not plugin_legacy_sound pack_file@ pack = null`
- `#endif bool include_and`
- `#if plugin_legacy_sound pack@ pack = null`
- `bool has_number`
- `sound internal_sound`
- `sound@ number_speech`
- `string append`
- `string prepend`
- `string[] word_list`
- `uint current_index`
- `bool set_sound_object(sound@ handle)`
- `int speak(double the_number)`
- `int speak_next()`
- `int speak_wait(double the_number)`
- `number_speaker()`
- `void stop()`

---
## Library: `nvgt_subsystems.nvgt`
**Syntax to use:** `#include "nvgt_subsystems.nvgt"`

### Global Functions
- `enum NVGT_SUBSYSTEM`

---
## Library: `rotation.nvgt`
**Syntax to use:** `#include "rotation.nvgt"`

### Global Functions
- `const string[] detailed_rotation_directions =`
- `const string[] rotation_directions =`
- `double getdir(double facing)`
- `double snapleft(double deg, int direction, double inc = 45)`
- `double snapright(double deg, int direction, double inc = 45)`
- `shared double calculate_clamped_x_y_angle(vector current, vector min, vector max, double deg, bool at_least_1_tile = true, bool floor_deg = true)`
- `shared double calculate_theta(double deg)`
- `shared double calculate_x_y_angle(double x1, double y1, double x2, double y2, double deg, bool at_least_1_tile = true, bool floor_deg = true)`
- `shared double degree_limit(double deg)`
- `shared double get_1d_distance(double x1, double x2)`
- `shared double get_2d_distance(double x1, double y1, double x2, double y2)`
- `shared double get_3d_distance(double x1, double y1, double z1, double x2, double y2, double z2)`
- `shared double get_3d_distance(vector c1, vector c2)`
- `shared double get_3d_distance_circle(double x1, double y1, double z1, double x2, double y2, double z2)`
- `shared double get_3d_distance_circle(vector c1, vector c2)`
- `shared double get_clamped_3d_distance(vector current, vector min, vector max)`
- `shared double turnleft(double deg, double inc)`
- `shared double turnright(double deg, double inc)`
- `shared string calculate_x_y_string(double deg)`
- `shared vector move(double x, double y, double deg, double dir = 0.0)`
- `shared vector move(double x, double y, double z, double deg, double dir)`
- `shared vector move(double x, double y, double z, double deg, double zdeg, double dir, double zdir)`
- `string calculate_x_y_string3d(double deg, double z1, double z2)`
- `string dir_to_string(int direction, bool more_detail = true)`

---
## Library: `settings.nvgt`
**Syntax to use:** `#include "settings.nvgt"`

### Global Functions
- `#include"ini.nvgt" class settings_helper`
- `bool ensure_data_path(const string&in filename, bool absolute = true)`
- `dictionary available_settings_formats =`
- `settings_helper@ ini_settings_factory(settings@ parent)`
- `settings_helper@ json_settings_factory(settings@ parent)`
- `settings_helper@ nvgt_settings_factory(settings@ parent)`
- `funcdef settings_helper@ settings_helper_factory(settings@ parent)`

### Classes
#### Class `ini_settings_helper`
- `ini@config`
- `bool clear()`
- `bool close(bool save = true)`
- `bool exists(const string&in key)`
- `bool is_active()`
- `bool open()`
- `bool read_bool(const string&in key)`
- `bool remove_value(const string&in key)`
- `bool write_bool(const string&in key, bool value)`
- `bool write_number(const string&in key, double number)`
- `bool write_string(const string&in key, const string&in value)`
- `ini_settings_helper(settings@parent)`
- `string get_file_extension()`
- `string raw_dump()`
- `string read_string(const string&in key)`
- `string[]@list_keys()`
- `var@get_value(string&in key)`

#### Class `json_settings_helper`
- `json_object@config`
- `bool clear()`
- `bool close(bool save = true)`
- `bool exists(const string&in key)`
- `bool is_active()`
- `bool open()`
- `bool read_bool(const string&in key)`
- `bool remove_value(const string&in key)`
- `bool write_bool(const string&in key, bool value)`
- `bool write_number(const string&in key, double number)`
- `bool write_string(const string&in key, const string&in value)`
- `json_settings_helper(settings@parent)`
- `string get_file_extension()`
- `string raw_dump()`
- `string read_string(const string&in key)`
- `string[]@list_keys()`
- `var@get_value(string&in key)`

#### Class `nvgt_settings_helper`
- `dictionary@config`
- `bool clear()`
- `bool close(bool save = true)`
- `bool exists(const string&in key)`
- `bool is_active()`
- `bool open()`
- `bool read_bool(const string&in key)`
- `bool remove_value(const string&in key)`
- `bool write_bool(const string&in key, bool value)`
- `bool write_number(const string&in key, double number)`
- `bool write_string(const string&in key, const string&in value)`
- `double read_number(const string&in key)`
- `nvgt_settings_helper(settings@parent)`
- `string get_file_extension()`
- `string raw_dump()`
- `string read_string(const string&in key)`
- `string[]@list_keys()`
- `var@get_value(string&in key)`

#### Class `settings`
- `bool instant_save = true`
- `bool local_path = false`
- `private string settings_filename`
- `settings_helper@data_helper`
- `string company_name, product`
- `string encryption_key`
- `bool clear(bool completely = true)`
- `bool close(bool save_data = true)`
- `bool dump()`
- `bool exists(const string&in key)`
- `bool get_active() const property`
- `bool has_other_products()`
- `bool read_bool(string&in key, bool default_value = false)`
- `bool remove_product()`
- `bool remove_value(const string&in value_name)`
- `bool set_encryption(const string&in key)`
- `bool setup(const string company, const string product, const bool local_path, const string format = "ini")`
- `bool write_bool(string&in key, bool value)`
- `bool write_number(const string&in key, double number)`
- `bool write_string(const string&in key, const string&in value)`
- `double read_number(const string&in key, double default_value = 0)`
- `settings()`
- `string get_filename() property`
- `string get_raw_dump()`
- `string read_string(const string&in key, const string&in default_value = "")`
- `string[]@keys()`
- `var@get_opIndex(string&in key) property`
- `void set_filename(string&in fname) property`
- `void set_opIndex(string key, var value) property`

---
## Library: `size.nvgt`
**Syntax to use:** `#include "size.nvgt"`

### Global Functions
- `const string[] SIZE_TO_STRING_UNITS =`
- `string size_to_string(uint64 size, uint8 round_place = 2)`

---
## Library: `sound_pool.nvgt`
**Syntax to use:** `#include "sound_pool.nvgt"`

### Classes
#### Class `sound_pool`
- `bool hrtf = true`
- `bool occlude = true`
- `bool y_is_elevation = sound_pool_default_y_elevation`
- `double last_listener_rotation`
- `float behind_pitch_decrease`
- `float pan_step`
- `float volume_step`
- `int clean_frequency`
- `int last_listener_x`
- `int last_listener_y`
- `int last_listener_z`
- `int max_distance`
- `mixer@ mixer = null`
- `pack_interface@ pack_file = null`
- `sound_pool_item[] items`
- `uint highest_slot`
- `bool destroy_sound(int slot)`
- `bool destroy_sounds(string owner)`
- `bool pause_sound(int slot)`
- `bool resume_sound(int slot)`
- `bool set_sound_owner(int slot, string owner, int priority = 0)`
- `bool set_sound_rotation(int slot, double rotation, vector pivit)`
- `bool set_sounds_amp(string owner, int priority, float amp)`
- `bool set_sounds_rotation(string owner, double rotation, vector pivit)`
- `bool sound_is_active(int slot)`
- `bool sound_is_playing(int slot)`
- `bool update_sound_1d(int slot, int x)`
- `bool update_sound_2d(int slot, int x, int y)`
- `bool update_sound_3d(int slot, int x, int y, int z)`
- `bool update_sound_3d(int slot, vector coordinate)`
- `bool update_sound_positioning_values(int slot, float pan_step = -1, float volume_step = -1, bool update_sound = true)`
- `bool update_sound_range_1d(int slot, int left_range, int right_range)`
- `bool update_sound_range_2d(int slot, int left_range, int right_range, int backward_range, int forward_range)`
- `bool update_sound_range_3d(int slot, int left_range, int right_range, int backward_range, int forward_range, int lower_range, int upper_range, bool update_sound = true)`
- `bool update_sound_start_values(int slot, float start_pan, float start_volume, float start_pitch)`
- `bool update_sounds_3d(string owner, int x, int y, int z, double rotation = -1)`
- `bool update_sounds_3d(string owner, vector coordinate, double rotation = -1)`
- `bool verify_slot(int slot)`
- `int get_sound_by_owner(string owner, int priority = 0)`
- `int play_1d(string filename, float listener_x, float sound_x, bool looping, bool persistent = false)`
- `int play_1d(string filename, pack_interface@ packfile, float listener_x, float sound_x, bool looping, bool persistent = false)`
- `int play_2d(string filename, float listener_x, float listener_y, float sound_x, float sound_y, bool looping, bool persistent = false)`
- `int play_2d(string filename, float listener_x, float listener_y, float sound_x, float sound_y, double rotation, bool looping, bool persistent = false)`
- `int play_2d(string filename, pack_interface@ packfile, float listener_x, float listener_y, float sound_x, float sound_y, bool looping, bool persistent = false)`
- `int play_2d(string filename, pack_interface@ packfile, float listener_x, float listener_y, float sound_x, float sound_y, double rotation, bool looping, bool persistent = false)`
- `int play_3d(string filename, float listener_x, float listener_y, float listener_z, float sound_x, float sound_y, float sound_z, double rotation, bool looping, bool persistent = false)`
- `int play_3d(string filename, pack_interface@ packfile, float listener_x, float listener_y, float listener_z, float sound_x, float sound_y, float sound_z, double rotation, bool looping, bool persistent = false)`
- `int play_3d(string filename, pack_interface@ packfile, vector listener, vector sound_coordinate, double rotation, bool looping, bool persistent = false)`
- `int play_3d(string filename, vector listener, vector sound_coordinate, double rotation, bool looping, bool persistent = false)`
- `int play_extended(int dimension, string filename, pack_interface@ packfile, float listener_x, float listener_y, float listener_z, float sound_x, float sound_y, float sound_z, double rotation, int left_range, int right_range, int backward_range, int forward_range, int lower_range, int upper_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null, bool start_playing = true, double theta = 0)`
- `int play_extended_1d(string filename, float listener_x, float sound_x, int left_range, int right_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null)`
- `int play_extended_1d(string filename, pack_interface@ packfile, float listener_x, float sound_x, int left_range, int right_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null)`
- `int play_extended_2d(string filename, float listener_x, float listener_y, float sound_x, float sound_y, double rotation, int left_range, int right_range, int backward_range, int forward_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null)`
- `int play_extended_2d(string filename, float listener_x, float listener_y, float sound_x, float sound_y, int left_range, int right_range, int backward_range, int forward_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null)`
- `int play_extended_2d(string filename, pack_interface@ packfile, float listener_x, float listener_y, float sound_x, float sound_y, double rotation, int left_range, int right_range, int backward_range, int forward_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null)`
- `int play_extended_2d(string filename, pack_interface@ packfile, float listener_x, float listener_y, float sound_x, float sound_y, int left_range, int right_range, int backward_range, int forward_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null)`
- `int play_extended_3d(string filename, float listener_x, float listener_y, float listener_z, float sound_x, float sound_y, float sound_z, double rotation, int left_range, int right_range, int backward_range, int forward_range, int lower_range, int upper_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null, bool start_playing = true, double theta = 0)`
- `int play_extended_3d(string filename, pack_interface@ packfile, float listener_x, float listener_y, float listener_z, float sound_x, float sound_y, float sound_z, double rotation, int left_range, int right_range, int backward_range, int forward_range, int lower_range, int upper_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null, bool start_playing = true, double theta = 0)`
- `int play_stationary(string filename, bool looping, bool persistent = false)`
- `int play_stationary(string filename, pack_interface@ packfile, bool looping, bool persistent = false)`
- `int play_stationary_extended(string filename, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null)`
- `int play_stationary_extended(string filename, pack_interface@ packfile, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null)`
- `int reserve_slot()`
- `sound_pool(int default_item_size = 100)`
- `void clean_unused()`
- `void destroy_all()`
- `void find_highest_slot(uint limit)`
- `void pause_all()`
- `void resume_all()`
- `void update_listener_1d(float listener_x)`
- `void update_listener_2d(float listener_x, float listener_y, double rotation = 0.0)`
- `void update_listener_3d(float listener_x, float listener_y, float listener_z, double rotation = 0.0, bool refresh_y_is_elevation = true)`
- `void update_listener_3d(vector listener, double rotation = 0.0, bool refresh_y_is_elevation = true)`

#### Class `sound_pool_item`
- `bool is_3d`
- `bool looping`
- `bool occlude`
- `bool paused`
- `bool persistent`
- `bool stationary`
- `bool y_is_elevation`
- `double start_offset`
- `float behind_pitch_decrease`
- `float pan_step`
- `float start_pan`
- `float start_pitch`
- `float start_volume`
- `float theta`
- `float volume_step`
- `float x`
- `float y`
- `float z`
- `int backward_range`
- `int forward_range`
- `int left_range`
- `int lower_range`
- `int priority`
- `int right_range`
- `int upper_range`
- `pack_interface@ packfile = null`
- `sound@ handle`
- `string extra_data`
- `string filename`
- `string owner`
- `timer last_memory_push`
- `vector pivit`
- `int get_total_distance(float listener_x, float listener_y, float listener_z)`
- `sound_pool_item()`
- `void reset()`
- `void update(float listener_x, float listener_y, float listener_z, double rotation, int max_distance)`
- `void update_listener_position(float listener_x, float listener_y, float listener_z, float rotation)`

---
## Library: `soundtrack.nvgt`
**Syntax to use:** `#include "soundtrack.nvgt"`

### Global Functions
- `#include "bgt_compat.nvgt" class soundtrack`

---
## Library: `speech.nvgt`
**Syntax to use:** `#include "speech.nvgt"`

### Global Functions
- `bool speak(string text, bool interrupt = tts_default_interrupt, text_processing_callback@ processing_callback = tts_default_text_processing_callback, bool braille = true)`
- `bool tts_load_config(string c, tts_voice@ v)`
- `string tts_dump_config(tts_voice@ v, bool save_screen_reader_setting = false)`
- `void raw_speak(string text, bool interrupt)`
- `void stop_speech()`
- `void tts_config(tts_voice@ v, bool main_config = false)`
- `funcdef string text_processing_callback(const string&in text)`

---
## Library: `sqlite3constants.nvgt`
**Syntax to use:** `#include "sqlite3constants.nvgt"`

---
## Library: `stat_set.nvgt`
**Syntax to use:** `#include "stat_set.nvgt"`

### Global Functions
- `enum stat_sort_mode`
- `string default_stat_callback_impl(stat@ stat)`
- `funcdef string stat_callback(stat@)`

### Classes
#### Class `stat`
- `dictionary user`
- `stat_callback@ callback`
- `string name`
- `string text`
- `uint64 sort_counter = _next_stat++`
- `var val`
- `double opAdd(double value)`
- `double opAddAssign(double value)`
- `double opAssign(double value)`
- `double opConv() const`
- `double opDiv(double value)`
- `double opDivAssign(double value)`
- `double opMod(int64 value)`
- `double opModAssign(int64 value)`
- `double opMul(double value)`
- `double opMulAssign(double value)`
- `double opSub(double value)`
- `double opSubAssign(double value)`
- `int opPostDec()`
- `int opPostInc()`
- `stat(const string&in name, var@ val, string text = "", stat_callback@ callback = default_stat_callback, dictionary@ user = null)`
- `string opImplConv()`
- `var@ opAddAssign(const string&in value)`
- `var@ opAssign(const string&in value)`

#### Class `stat_set`
- `dictionary stats`
- `) const`
- `, const string[]@ sort_behind =`
- `bool delete(const string&in name)`
- `bool deserialize(datastream@ ds)`
- `bool deserialize_linear(const string&in data)`
- `bool exists(const string&in stat_name) const`
- `int get_size() const property`
- `private bool string_is_number(const string&in str)`
- `stat@ add(const string&in name, var@ value, const string&in text = "", stat_callback@ callback = null, dictionary@ user = null)`
- `stat@ opIndex(const string&in stat_name) const`
- `stat@[] get_stats()`
- `stat_set()`
- `stat_set(const stat_set&in other)`
- `stat_set@ opAddAssign(const stat_set&in other)`
- `stat_set@ opAssign(const stat_set&in other)`
- `string serialize()`
- `string serialize_linear()`
- `string[]@ list(stat_sort_mode sort_mode = STAT_SORT_MODE_NONE, const string[]@ sort_in_front =`
- `string[]@ opImplConv() const`
- `void mod(const string&in name, double value)`
- `void mod(const string&in name, int64 value)`
- `void reset()`
- `void update(const string&in name, var@ value)`

---
## Library: `token_gen.nvgt`
**Syntax to use:** `#include "token_gen.nvgt"`

### Global Functions
- `enum token_gen_flag`
- `string generate_custom_token(int token_length, const string&in characters)`
- `string generate_custom_token(int token_length, string[]@ values)`
- `string generate_token(int token_length, int mode = TOKEN_CHARACTERS | TOKEN_NUMBERS)`

---
## Library: `touch.nvgt`
**Syntax to use:** `#include "touch.nvgt"`

### Global Functions
- `bool _touch_evt_cancel(uint64 device, const touch_finger&inout finger)`
- `bool _touch_evt_down(uint64 device, const touch_finger&inout finger)`
- `bool _touch_evt_move(uint64 device, const touch_finger&inout finger, float dx, float dy)`
- `bool _touch_evt_up(uint64 device, const touch_finger&inout finger)`
- `bool simulate_keys_down(int[] keys)`
- `bool simulate_keys_up(int[] keys)`
- `enum swipe_touch_directions`
- `int detect_swipe_direction(vector diff)`
- `string get_swipe_name(int dir)`
- `void _touch_manager_register(touch_gesture_manager@ mgr)`
- `void _touch_manager_unregister(touch_gesture_manager@ mgr)`
- `funcdef void tap_func(touch_screen_finger@finger, uint tap_count, uint finger_count)`

### Classes
#### Class `touch_gesture_manager`
- `dictionary finger_map`
- `float flick_velocity_threshold = 1.5f`
- `float hold_jitter_threshold = 0.05f`
- `float swipe_min_dist = 0.1f`
- `float swipe_segment_threshold = 0.1f`
- `private uint64 _last_input_time = 0`
- `touch_interface@[] interfaces`
- `uint current_finger_count = 0`
- `uint long_press_time = 600`
- `uint multi_tap_timeout = 600`
- `uint tap_max_delay = 250`
- `uint64 last_monitor_call_time = 0`
- `bool add_touch_interface(touch_interface@ i)`
- `bool get_available() const property`
- `bool get_was_last_instant_input() const property`
- `bool internal_on_cancel(const touch_finger&inout raw_finger)`
- `bool internal_on_down(const touch_finger&inout raw_finger)`
- `bool internal_on_move(const touch_finger&inout raw_finger, float dx, float dy)`
- `bool internal_on_up(const touch_finger&inout raw_finger)`
- `bool is_available()`
- `bool set_touch_interfaces(touch_interface@[] interfaces, bool append = false)`
- `int64 get_last_input_time() const property`
- `touch_gesture_manager()`
- `void clear_touch_interfaces()`
- `void dispatch_release(touch_screen_finger@ finger)`
- `void monitor()`
- `~touch_gesture_manager()`

#### Class `touch_interface`
- `bool allow_passthrough = false`
- `bool coordinated = false`
- `float minx, maxx, miny, maxy`
- `int current_fingers_in_bounds = 0`
- `int max_fingers_in_sequence = 0`
- `tap_func@ last_tap_func`
- `touch_gesture_manager@ parent`
- `touch_screen_finger@ last_tapped_finger`
- `uint current_tap_finger_count = 0`
- `uint tap_count = 0`
- `uint64 last_tap_time = 0`
- `vector last_tap_pos`
- `bool in_bounds(float x, float y)`
- `bool is_tap_chain_supported(uint s, uint f)`
- `touch_interface(touch_gesture_manager@ parent, float minx = TOUCH_UNCOORDINATED, float maxx = TOUCH_UNCOORDINATED, float miny = TOUCH_UNCOORDINATED, float maxy = TOUCH_UNCOORDINATED)`
- `void _exec_tap(touch_screen_finger@ finger, uint tap_count, uint finger_count)`
- `void _monitor()`
- `void _process_tap(touch_screen_finger@ finger)`
- `void _track_finger_down()`
- `void _track_finger_up()`
- `void force_release_all()`
- `void on_compound_swipe(touch_screen_finger@ f, int[] d)`
- `void on_double_tap(touch_screen_finger@ f, uint fc)`
- `void on_flick(touch_screen_finger@ f, int d, float v)`
- `void on_hold(touch_screen_finger@ f, uint fc)`
- `void on_long_press(touch_screen_finger@ f, uint fc)`
- `void on_released_finger(touch_screen_finger@ f)`
- `void on_single_tap(touch_screen_finger@ f, uint fc)`
- `void on_swipe(touch_screen_finger@ finger, int direction)`
- `void on_swipe_down(touch_screen_finger@ f)`
- `void on_swipe_down_left(touch_screen_finger@ f)`
- `void on_swipe_down_right(touch_screen_finger@ f)`
- `void on_swipe_left(touch_screen_finger@ f)`
- `void on_swipe_right(touch_screen_finger@ f)`
- `void on_swipe_up(touch_screen_finger@ f)`
- `void on_swipe_up_left(touch_screen_finger@ f)`
- `void on_swipe_up_right(touch_screen_finger@ f)`
- `void on_tap(touch_screen_finger@ finger, uint tap_count, uint finger_count)`
- `void on_tripple_tap(touch_screen_finger@ f, uint fc)`

#### Class `touch_keyboard_interface`
- `dictionary keymap`
- `int[] active_pressed_keys`
- `bool is_tap_chain_supported(uint start_check_from, uint finger_count)`
- `bool simulate_mapped_key(string keyname, int[] & out key_codes = void)`
- `bool trigger_mapped_key(string base_name, uint fingers, int[] & out result_codes = void)`
- `string get_tap_key_name(uint tap_count, uint finger_count)`
- `touch_keyboard_interface(touch_gesture_manager@ p, dictionary@ m, float minx = TOUCH_UNCOORDINATED, float maxx = TOUCH_UNCOORDINATED, float miny = TOUCH_UNCOORDINATED, float maxy = TOUCH_UNCOORDINATED)`
- `void force_release_all()`
- `void on_compound_swipe(touch_screen_finger@ finger, int[] directions)`
- `void on_flick(touch_screen_finger@ finger, int direction, float velocity)`
- `void on_long_press(touch_screen_finger@ finger, uint finger_count)`
- `void on_released_finger(touch_screen_finger@ finger)`
- `void on_swipe(touch_screen_finger@ finger, int direction)`
- `void on_tap(touch_screen_finger@ finger, uint tap_count, uint finger_count)`

#### Class `touch_screen_finger`
- `bool has_swiped = false`
- `bool is_long_press_triggered = false`
- `bool is_moving_too_much_for_hold = false`
- `int64 id`
- `int[] last_keys_pressed`
- `int[] swipe_sequence`
- `touch_finger internal_finger`
- `uint64 creation_time`
- `vector current_pos`
- `vector last_swipe_pos`
- `vector start_pos`
- `float get_pressure() property`
- `float get_x() property`
- `float get_y() property`
- `int64 get_active_time() const property`
- `touch_screen_finger(const touch_finger&in internal)`
- `void update_position(float nx, float ny, float pressure)`

---
## Library: `virtual_dialogs.nvgt`
**Syntax to use:** `#include "virtual_dialogs.nvgt"`

### Global Functions
- `#include "form.nvgt" class virtual_dialogs`
- `bool virtual_info_box(const string title, const string label, const string text)`
- `int virtual_alert(const string title, const string text, const bool can_cancel = false, const int flags = 0)`
- `int virtual_message_box(const string title, const string caption, string[]@ buttons, const int flags = 0)`
- `int virtual_question(const string title, const string text, const bool can_cancel = false, const int flags = 0)`
- `string virtual_input_box(const string title, const string text, const string default_text = "", const int flags = 0)`

