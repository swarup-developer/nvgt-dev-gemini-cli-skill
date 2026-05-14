# NVGT Standard Libraries & Plugins API Reference

> **IMPORTANT NOTE:** These syntaxes belong to standard libraries (includes) and plugins. To use them, you MUST include the corresponding file at the top of your script. Example:
> `#include "sound_pool.nvgt"`

---
## Library: `basic_character_controller.nvgt`
**Syntax to use:** `#include "basic_character_controller.nvgt"`

### Global Functions
- `shared string translate_yaw_to_direction(const float yaw)`
- `shared float snap_to_degree(const float deg, const float[] snaps)`
- `shared float nearest_compass_point(const float deg, const float step = 2.8125)`

---
## Library: `bgt_compat.nvgt`
**Syntax to use:** `#include "bgt_compat.nvgt"`

### Global Functions
- `uint string_len(const string& in str)`
- `string string_replace(const string& in str, const string& in search, const string& in replace, bool replace_all)`
- `string string_left(const string& in str, uint count)`
- `string string_right(const string& in str, uint count)`
- `string string_trim_left(const string& in str, uint count)`
- `string string_trim_right(const string& in str, uint count)`
- `string string_mid(const string& in str, uint start, int count)`
- `bool string_is_lower_case(const string& in str)`
- `bool string_is_upper_case(const string& in str)`
- `bool string_is_alphabetic(const string& in str)`
- `bool string_is_digits(const string& in str)`
- `bool string_is_alphanumeric(const string& in str)`
- `string string_reverse(const string& in str)`
- `string string_to_lower_case(const string& in str)`
- `shared string string_to_upper_case(const string& in str)`
- `shared string[]@ string_split(const string& in str, const string& in delim, bool full = true)`
- `shared int string_contains(const string& in str, const string& in search, int occurance = 1)`
- `string get_last_error_text()`
- `shared double string_to_number(const string& in num)`
- `bool show_game_window(const string& in title)`
- `bool hide_game_window()`
- `bool is_game_window_active()`
- `double cosine(double r)`
- `double sine(double r)`
- `double absolute(double x)`
- `double arc_cosine(double x)`
- `double arc_sine(double x)`
- `double arc_tangent(double x)`
- `double power(double x, double y)`
- `double square_root(double value)`
- `double ceiling(double x)`
- `double tangent(double x)`
- `const string get_DIRECTORY_MY_DOCUMENTS() property`
- `bool screen_reader_is_running(int reader)`
- `bool screen_reader_speak(int reader, const string& in text)`
- `bool screen_reader_speak_interrupt(int reader, const string& in text)`
- `bool screen_reader_stop_speech(int reader)`
- `string string_hash(const string& in data, int algorithm, bool binary)`
- `string file_hash(const string& in filename, int algorithm, bool binary)`
- `string string_encrypt(const string& in the_string, const string& in encryption_key)`
- `string string_decrypt(const string& in the_string, const string& in encryption_key)`
- `bool file_encrypt(const string&in input_file, const string&in output_file, string key)`
- `bool file_decrypt(const string&in input_file, const string&in output_file, string key)`
- `bool clipboard_copy_text(const string& in text)`
- `string clipboard_read_text()`
- `string serialize(dictionary@ the_data)`
- `string generate_computer_id(const string& in application_id, bool hardware_only)`
- `string get_sound_storage()`
- `bool set_sound_storage(const string&in filename, bool reset = false)`
- `bool set_sound_decryption_key(const string& in key, bool force_encryption)`
- `bool set_sound_storage(const string&in filename, const string&in key = "", bool force_encryption = false, bool reset = false)`
- `string get_sound_storage()`
- `bool set_sound_decryption_key(const string& in key, bool force_encryption)`
- `bool generate_profile(const string& in filename)`
- `string string_compress(string str)`
- `string string_decompress(string str)`

---
## Library: `bgt_dynamic_menu.nvgt`
**Syntax to use:** `#include "bgt_dynamic_menu.nvgt"`

### Global Functions
- `funcdef int menu_callback(dynamic_menu@, string)`

### Classes
#### Class `dynamic_menu_item`

#### Class `dynamic_menu`
- `int add_item(string filename, string name = "")`
- `int add_item_tts(string text, string name = "")`
- `int[] add_multiple_items(string[][] items)`
- `bool set_speech_mode(int speech_output)`
- `int get_item_count()`
- `int get_position()`
- `bool is_running()`
- `bool set_tts_object(tts_voice@ handle)`
- `bool set_sound_object(sound@ handle)`
- `bool set_callback(menu_callback@ callback, string user_data)`
- `string get_item_name(int menu_item)`
- `bool configure_joystick(joystick@ new_stick = null, int ok_button = -1, int cancel_button = -1)`
- `int run(string intro, bool is_intro_tts)`
- `int run_extended(string intro, bool is_intro_tts, int start_position, bool auto_speak_first)`
- `bool reset(bool completely)`
- `int add_item_extended(string filename, bool is_filename, string name = "")`

---
## Library: `db_props.nvgt`
**Syntax to use:** `#include "db_props.nvgt"`

### Classes
#### Class `database_object`
- `void postconstruct(sqlite3statement@ s = null)`
- `string get_row_filter() property`
- `string get_schema() property`
- `bool drop()`
- `bool commit()`
- `string dump(bool multiline_data = false)`

#### Class `database_property`
- `string get_type() property`
- `bool bind(sqlite3statement@ s, int idx)`
- `bool retrieve()`
- `bool retrieve(sqlite3statement@ s, int idx)`
- `bool retrieve(sqlite3statement@ s, int idx, database_object@ p)`
- `bool retrieve(sqlite3statement@ s, int idx, sqlite3@ db)`
- `void opAssign(database_property@ other)`
- `string text()`

#### Class `database_string`
- `string get_type() property`
- `bool bind(sqlite3statement@ s, int idx)`
- `bool retrieve(sqlite3statement@ s, int idx, sqlite3@ db)`
- `string text()`
- `string upper()`
- `string lower()`
- `string replace_range(uint start, int count, const string& in text)`
- `string replace(const string& in search, const string& in replace, bool replace_all = true)`
- `void replace_this(const string& in search, const string& in replace, bool replace_all = true)`
- `void insert(uint pos, const string& in other)`
- `void erase(uint pos, int count = -1)`
- `void resize(uint count)`
- `string reverse()`
- `bool is_upper()`
- `bool is_lower()`
- `bool is_alphabetic()`
- `bool is_digits()`
- `bool is_alphanumeric()`
- `bool is_punctuation()`
- `bool is_empty()`
- `uint length()`
- `int find(const string& in text, int start = 0)`
- `int find_first_of(const string& in text, int start = 0)`
- `int find_first_not_of(const string& in text, int start = 0)`
- `int rfind(const string& in text, int start = 0)`
- `int find_last_of(const string& in text, int start = 0)`
- `int find_last_not_of(const string& in text, int start = 0)`
- `string substr(uint start = 0, int count = -1)`
- `string get_opIndex(int idx) property`
- `void set_opIndex(int idx, const string& in char)`
- `string[]@ split(const string& in delim, bool full = true)`
- `string opImplConv()`
- `private void fetch()`
- `bool opEquals(const string& in val)`
- `int opCmp(const string& in val)`
- `string opAssign(const string& in val)`
- `string opAssign(database_string@ other)`
- `void opAssign(database_property@ other)`
- `string opAdd(const string& in val)`
- `string opAddAssign(const string& in val)`

#### Class `database_list`
- `string get_type() property`
- `bool bind(sqlite3statement@ s, int idx)`
- `bool retrieve(sqlite3statement@ s, int idx, sqlite3@ db)`
- `string text()`
- `void insert_at(uint pos, const string& in v)`
- `void insert_last(const string& in v)`
- `void remove_last()`
- `void remove_at(uint pos)`
- `void remove_range(uint start, uint count)`
- `void reserve(uint count)`
- `void resize(uint count)`
- `void reverse()`
- `bool is_empty()`
- `uint length()`
- `int find(const string& in v)`
- `int find(int start, const string& in v)`
- `string get_opIndex(int idx) property`
- `void set_opIndex(int idx, const string& in v) property`
- `string[]@ opImplCast()`
- `private string[]@ get_value() property`
- `bool opEquals(string[]@ val)`
- `string[]@ opAssign(string[]@ val)`
- `void opAssign(database_property@ other)`

#### Class `database_int`
- `string get_type() property`
- `bool bind(sqlite3statement@ s, int idx)`
- `bool retrieve(sqlite3statement@ s, int idx, sqlite3@ db)`
- `void set_autoincrement_value(int64 v)`
- `string text()`
- `int64 opImplConv()`
- `int64 get()`
- `private void fetch()`
- `int64 opAssign(int64 val)`
- `void opAssign(database_property@ other)`
- `bool opEquals(int64 val)`
- `int opCmp(int64 val)`
- `int64 opNeg()`
- `int64 opCom()`
- `int64 opPreInc()`
- `int64 opPostInc()`
- `int64 opPreDec()`
- `int64 opPostDec()`
- `int64 opAdd(int64 val)`
- `int64 opAddAssign(int64 val)`
- `int64 opSub(int64 val)`
- `int64 opSubAssign(int64 val)`
- `int64 opMul(int64 val)`
- `int64 opMulAssign(int64 val)`
- `int64 opDiv(int64 val)`
- `int64 opDivAssign(int64 val)`
- `int64 opMod(int64 val)`
- `int64 opModAssign(int64 val)`
- `int64 opPow(int64 val)`
- `int64 opPowAssign(int64 val)`
- `int64 opAnd(int64 val)`
- `int64 opAndAssign(int64 val)`
- `int64 opOr(int64 val)`
- `int64 opOrAssign(int64 val)`
- `int64 opXor(int64 val)`
- `int64 opXorAssign(int64 val)`
- `int64 opShl(int64 val)`
- `int64 opShlAssign(int64 val)`
- `int64 opShr(int64 val)`
- `int64 opShrAssign(int64 val)`
- `int64 opUShr(int64 val)`
- `int64 opUShrAssign(int64 val)`

#### Class `database_double`
- `string get_type() property`
- `bool bind(sqlite3statement@ s, int idx)`
- `bool retrieve(sqlite3statement@ s, int idx, sqlite3@ db)`
- `string text()`
- `string opImplConv()`
- `double opImplConv()`
- `double get()`
- `private void fetch()`
- `double opAssign(double val)`
- `void opAssign(database_property@ other)`
- `bool opEquals(double val)`
- `int opCmp(double val)`
- `double opNeg()`
- `double opPreInc()`
- `double opPostInc()`
- `double opPreDec()`
- `double opPostDec()`
- `double opAdd(double val)`
- `double opAddAssign(double val)`
- `double opSub(double val)`
- `double opSubAssign(double val)`
- `double opMul(double val)`
- `double opMulAssign(double val)`
- `double opDiv(double val)`
- `double opDivAssign(double val)`
- `double opMod(double val)`
- `double opModAssign(double val)`
- `double opPow(double val)`
- `double opPowAssign(double val)`

#### Class `database_bool`
- `string get_type() property`
- `bool bind(sqlite3statement@ s, int idx)`
- `bool retrieve(sqlite3statement@ s, int idx, sqlite3@ db)`
- `string text()`
- `bool opImplConv()`
- `bool get()`
- `bool opAssign(bool val)`
- `void opAssign(database_property@ other)`
- `bool opEquals(bool val)`
- `bool opEquals(database_bool@ val)`

---
## Library: `dget.nvgt`
**Syntax to use:** `#include "dget.nvgt"`

### Global Functions
- `double dgetn(dictionary@ d, const string& in key, double def = 0.0)`
- `string dgets(dictionary@ d, const string& in key, string def = "")`
- `string[] dgetsl_default(0)`
- `string[] dgetsl(dictionary@ d, const string& in key, string[] def = dgetsl_default)`
- `bool dgetb(dictionary@ d, const string& in key, bool def = false)`

---
## Library: `form.nvgt`
**Syntax to use:** `#include "form.nvgt"`

### Global Functions
- `list items can now have ID strings apart from the item names (add_list_item extra param, get_list_item_id, edit_list_item_id)`
- `delete_speech_text now empty by default and no space is added to text string if this is true (if you press backspace or delete you know your deleting)`
- `set_list_position now has speak_new_item argument (false by default)`
- `funcdef void prespeech_callback(audio_form@ f)`
- `funcdef bool form_background_callback(audio_form@ f)`
- `funcdef int on_control_event_callback(audio_form@ f, int c, control_event_type event, dictionary@ args)`
- `funcdef bool kb_echo_update_callback(audio_form@ f, int echo)`
- `bool key_repeating(int key, int repeat_delay, int prerepeat_delay)`
- `shared int bgt_string_contains(const string& in str, const string& in search, int occurance = 1)`
- `shared uint audioform_change_keyboard_echo(int keyboard_echo, int dir = 1)`
- `shared string audioform_keyboard_echo_string(int keyboard_echo)`

### Classes
#### Class `audio_form`
- `void create_window()`
- `void create_window(string window_title, bool change_screen_title = true, bool say_dialog = true, bool silent = false)`
- `bool set_checkbox_mark(int control_index, bool checked)`
- `bool set_custom_type(int control_index, string custom_type)`
- `string get_custom_type(int control_index)`
- `bool has_custom_type(int control_index)`
- `bool set_subform(int control_index, audio_form@ f)`
- `bool set_output_mode(int speech_output, bool progress_bars_beep = false)`
- `int create_input_box(string caption, string default_text = "", string password_mask = "", int maximum_length = 0, bool read_only = false, bool multiline = false, bool multiline_enter = true)`
- `int create_list(string caption, int maximum_items = 0, bool multiselect = false, bool repeat_boundary_items = false)`
- `int create_tab_panel(string caption, int maximum_items = 0, bool repeat_boundary_items = false)`
- `int create_button(string caption, bool primary = false, bool cancel = false, bool overwrite = true)`
- `int create_progress_bar(string caption, int speak_interval = 5, bool speak_global = true)`
- `int create_slider(string caption, double default_value = 50, double minimum_value = 0, double maximum_value = 100, string text = "", double step_size = 1)`
- `int create_status_bar(string caption, string text)`
- `int create_keyboard_area(string caption)`
- `int create_subform(string caption, audio_form@ f)`
- `int create_checkbox(string caption, bool initial_value = false, bool read_only = false)`
- `int create_link(string caption, string url)`
- `bool activate_progress_timer(int control_index)`
- `bool pause_progress_timer(int control_index)`
- `bool delete_control(int control_index)`
- `int monitor()`
- `bool focus(int control_id)`
- `bool focus_interrupt(int control_id)`
- `bool focus_silently(int control_id)`
- `bool is_disallowed_char(int control_index, string char, bool search_all = true)`
- `bool is_visible(int control_index)`
- `bool is_enabled(int control_index)`
- `bool is_read_only(int control_index)`
- `bool is_multiline(int control_index)`
- `bool is_pressed(int control_index)`
- `bool is_checked(int control_index)`
- `bool add_list_item(int control_index, const string& in option, int position = -1, bool selected = false, bool focus_if_first = true)`
- `bool add_list_item(int control_index, const string& in option, string id, int position = -1, bool selected = false, bool focus_if_first = true)`
- `bool edit_list_item(int control_index, string new_option, int position)`
- `bool edit_list_item_id(int control_index, string new_id, int position)`
- `bool set_default_controls(int primary, int cancel)`
- `bool set_button_attributes(int control_index, bool primary, bool cancel, bool overwrite = true)`
- `bool set_list_properties(int control_index, bool multiselect=false, bool repeat_boundary_items=false)`
- `bool delete_list_item(int control_index, int list_index, bool reset_cursor = true, bool speak_deletion_status = true)`
- `bool delete_list_selections(int control_index, bool reset_cursor = true, bool speak_deletion_status = true)`
- `bool clear_list(int control_index)`
- `bool set_state(int control_index, bool enabled, bool visible)`
- `bool set_enable_delete(int control_index, bool enabled)`
- `bool set_delete_disabled_message(int control_index, string message)`
- `bool set_enable_go_to_index(int control_index, bool enabled)`
- `bool set_enable_search(int control_index, bool enabled)`
- `bool set_disallowed_chars(int control_index, string chars, bool use_only_disallowed_chars = false, string char_disallowed_description = "")`
- `bool set_overwrite_mode(int control_index, bool overwrite)`
- `int get_list_position(int control_index)`
- `bool set_list_position(int control_index, int position = -1, bool speak_new_item = false)`
- `bool set_list_multinavigation(int control_index, bool letters, bool numbers, bool nav_translate = true)`
- `int[]@ get_list_selections(int control_index)`
- `bool is_list_item_checked(int control_index, int item_index)`
- `int[]@ get_checked_list_items(int control_index)`
- `int get_list_count(int control_index)`
- `int get_list_index_by_id(int control_index, string id)`
- `string get_list_item(int control_index, int list_index)`
- `string get_list_item_id(int control_index, int list_index)`
- `bool set_caption(int control_index, string caption)`
- `string get_caption(int control_index)`
- `bool set_event_callback(int control_index, on_control_event_callback@ event_callback)`
- `int get_default_button()`
- `int get_cancel_button()`
- `string get_password_mask(int control_index)`
- `string get_text(int control_index)`
- `const string& get_text_reference(int control_index)`
- `int get_text_cursor(int control_index)`
- `bool set_text(int control_index, string new_text)`
- `bool select_text(int control_index, int sel_start = -1, int sel_end = -1)`
- `bool add_text(int control_index, string new_text, int position = -1)`
- `bool edit_text(int control_index, string new_text, int position, int edit_mode = edit_mode_trim_to_length)`
- `int get_line_number(int control_index)`
- `int get_line_column(int control_index)`
- `bool set_line(int control_index, int line, int col = 1, bool speak_result = false)`
- `bool search(int control_index, const string& in text, int dir = 1, bool speak_result = false)`
- `int get_progress(int control_index)`
- `int get_control_type(int control_index)`
- `string get_control_attributes(int control_index)`
- `int get_control_count()`
- `int get_current_focus()`
- `int get_last_error()`
- `bool set_link_url(int control_index, string new_url)`
- `string get_link_url(int control_index)`
- `bool set_progress(int control_index, int value)`
- `bool set_read_only(int control_index, bool read_only)`
- `bool set_slider(int control_index, double value, double min = -1, double max = -1)`
- `double get_slider(int control_index)`
- `double get_slider_minimum_value(int control_index)`
- `double get_slider_maximum_value(int control_index)`
- `string get_slider_text_value(int control_index, double value)`
- `bool set_slider_step_size(int control_index, double new_size)`
- `double get_slider_step_size(int control_index)`
- `bool set_slider_text_value(int control_index, double value, const string& in text)`
- `bool clear_slider_text_values(int control_index)`
- `bool set_speech_verbosity_options(int control_index, string highlight_selection, string highlight_unselection, string deletion, string percentage, int keyboard_echo)`
- `bool set_clipboard_flags(int control_index, bool copy, bool cut, bool paste)`
- `bool set_keyboard_echo(int control_index, int keyboard_echo)`
- `bool set_keyboard_echo_update_callback(kb_echo_update_callback@callback)`
- `bool set_default_keyboard_echo(int keyboard_echo, bool update_controls = true)`
- `bool set_tts_object(tts_voice@ handle)`
- `void reset(bool reset_to_default_keyboard_echo = true)`
- `private void set_primary(int control, bool state, bool overwrite)`
- `private void set_cancel(int control, bool state, bool overwrite)`
- `private bool focus(int tab_index, bool interrupt_previous_speech, bool silent = false)`
- `private void check(int tab_index)`
- `private bool check_globals(bool required_setting)`
- `private void check_speech_mode()`
- `bool check_shortcuts(bool for_subform = false)`
- `private int shortcut(string caption_text)`
- `private string shortcut_letter(string caption_text)`
- `private int letter_to_key(string char)`
- `audio_form@ get_current_form() property`
- `private bool speak(string text, bool interrupt)`

#### Class `control`
- `void focus(bool interrupt_previous_speech, bool separate_attributes, bool silent = false)`
- `bool is_disallowed_char(string char, bool search_all = true)`
- `void check(audio_form@ f, int tab_index)`
- `string slider_value_string()`
- `int get_line_number()`
- `int get_line_column()`
- `bool set_line(int line, int col = 1, bool silent = false)`
- `bool search(const string& in text, int dir = 1, bool silent = false)`
- `void highlight_left()`
- `void highlight_right()`
- `void next_line()`
- `void previous_line()`
- `void highlight_all()`
- `private void speak_selected(const string& in selection)`
- `void add(string character, bool silent = false)`
- `void edit(string character)`
- `bool add_silent(string content, int position)`
- `bool edit_silent(string content, int position, int edit_mode)`
- `bool replace_text(string content, int position)`
- `bool trim_to_length(string content, int position)`
- `bool append_text(string content, int position)`
- `void copy_highlighted()`
- `void cut_highlighted()`
- `void paste_text()`
- `void delete_word_left()`
- `void delete_word_right()`
- `void delete_highlighted()`
- `void delete_highlighted(int from_start)`
- `void delete_highlighted(int from_start, bool speak_deleted)`
- `void move_left()`
- `void move_right()`
- `void add_new_line()`
- `int current_line_start_position(bool word = false)`
- `string type_to_name()`
- `string input_box_speak(string character)`
- `string input_box_speak(string character, bool ignore_echo_flag)`
- `void checkbox_toggle()`
- `string find_appropriate_character(string original_character)`
- `void speak_progress()`
- `void speak_progress(bool interrupt)`
- `void beep_progress()`
- `string read_line(int position)`
- `void line_start()`
- `void line_end()`
- `void move_word_left(bool highlighting = false, bool speak_selection_status = true)`
- `void move_word_right(bool highlighting = false, bool speak_selection_status = true)`
- `void field_start()`
- `void field_end()`
- `string read_word_from_position(int position)`
- `void highlight_to_field_start()`
- `void highlight_to_field_end()`
- `void highlight_to_word_start()`
- `void highlight_to_word_end()`
- `void highlight_to_line_start(bool continuation = false)`
- `void highlight_to_line_end(bool continuation = false)`
- `void highlight_up()`
- `void highlight_down()`
- `void highlight_by_position(int start, int end)`
- `void speak_list_item(bool interrupt = true)`
- `bool speak(string text, bool interrupt)`

#### Class `list_item`

#### Class `go_to_index`
- `void monitor()`

#### Class `search_for`
- `void monitor()`

---
## Library: `ini.nvgt`
**Syntax to use:** `#include "ini.nvgt"`

### Global Functions
- `shared bool INI_IS_VALID_IDENT_CHAR(const string& in char)`
- `shared string INI_ESCAPE_STRING(const string&in value)`
- `shared string INI_UNESCAPE_STRING(const string&in value)`
- `shared string INI_VERIFY_IDENT(const string& in identifier)`
- `shared string[]@ get_lines(const string& in the_string)`

---
## Library: `input_forms.nvgt`
**Syntax to use:** `#include "input_forms.nvgt"`

### Classes
#### Class `input_field`
- `bool fill(dictionary@d)`
- `bool set_value(dictionary@d)`
- `bool configure()`
- `bool get_valid_input() property`
- `bool is_ok()`

#### Class `checkbox_field`
- `bool is_ok()`
- `bool configure()`
- `bool set_value(dictionary@d)`

#### Class `choice_input_field`
- `void add_choice(string choice)`
- `bool configure()`
- `bool set_value(dictionary@d)`
- `bool is_ok()`

#### Class `text_field`
- `bool set_disallowed_chars(string chars, bool only_use_disallowed_chars, string char_disallowed_description = "")`
- `bool configure()`
- `bool is_ok()`
- `bool set_value(dictionary@d)`
- `bool is_valid_text()`

#### Class `number_text_field`
- `bool is_valid_text()`
- `bool set_value(dictionary@d)`

#### Class `input_form`
- `bool configure()`
- `bool setup()`
- `bool add_text_field(string name, string label, string default_value = "", bool required = false, bool secure = false, string disallowed_chars = "")`
- `bool add_number_field(string name, string label, int default_value = -1, bool required = false)`
- `bool add_checkbox_field(string name, string label, bool default_value = false, bool required = false, bool require_check = true)`
- `bool add_choice_field(string name, string label, string[] choices, bool required = false)`
- `dictionary@ monitor()`
- `dictionary@ run()`
- `bool fill_form(dictionary@d)`

---
## Library: `instance.nvgt`
**Syntax to use:** `#include "instance.nvgt"`

### Classes
#### Class `instance`
- `bool get_is_already_running() property`
- `void wait_until_standalone()`

---
## Library: `int_to_byte.nvgt`
**Syntax to use:** `#include "int_to_byte.nvgt"`

### Global Functions
- `string int_to_byte(int the_int, uint8 endian = int_to_byte_little_endian, int compress = 4)`
- `int byte_to_int(string the_bytes, uint8 endian = int_to_byte_little_endian)`

---
## Library: `legacy_file_contents.nvgt`
**Syntax to use:** `#include "legacy_file_contents.nvgt"`

### Global Functions
- `string get_file_contents(const string& in filename)`
- `bool put_file_contents(const string& in filename, const string& in content, bool a = false)`

---
## Library: `legacy_sound_pool.nvgt`
**Syntax to use:** `#include "legacy_sound_pool.nvgt"`

### Global Functions
- `Original copyright (C) 2010-2014 Blastbay Studios, zlib like license`

### Classes
#### Class `sound_pool_item`
- `void reset()`
- `void update(float listener_x, float listener_y, float listener_z, double rotation, int max_distance)`
- `void update_listener_position(float listener_x, float listener_y, float listener_z, float rotation)`
- `int get_total_distance(float listener_x, float listener_y, float listener_z)`

#### Class `sound_pool`
- `int play_extended(int dimension, string filename, pack@ packfile, float listener_x, float listener_y, float listener_z, float sound_x, float sound_y, float sound_z, double rotation, int left_range, int right_range, int backward_range, int forward_range, int lower_range, int upper_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null, bool start_playing = true, double theta = 0)`
- `int play_stationary(string filename, pack@ packfile, bool looping, bool persistent = false)`
- `int play_stationary(string filename, bool looping, bool persistent = false)`
- `int play_stationary_extended(string filename, pack@ packfile, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null)`
- `int play_stationary_extended(string filename, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null)`
- `int play_1d(string filename, pack@ packfile, float listener_x, float sound_x, bool looping, bool persistent = false)`
- `int play_1d(string filename, float listener_x, float sound_x, bool looping, bool persistent = false)`
- `int play_extended_1d(string filename, float listener_x, float sound_x, int left_range, int right_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null)`
- `int play_extended_1d(string filename, pack@ packfile, float listener_x, float sound_x, int left_range, int right_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null)`
- `int play_2d(string filename, pack@ packfile, float listener_x, float listener_y, float sound_x, float sound_y, bool looping, bool persistent = false)`
- `int play_2d(string filename, pack@ packfile, float listener_x, float listener_y, float sound_x, float sound_y, double rotation, bool looping, bool persistent = false)`
- `int play_2d(string filename, float listener_x, float listener_y, float sound_x, float sound_y, bool looping, bool persistent = false)`
- `int play_2d(string filename, float listener_x, float listener_y, float sound_x, float sound_y, double rotation, bool looping, bool persistent = false)`
- `int play_extended_2d(string filename, pack@ packfile, float listener_x, float listener_y, float sound_x, float sound_y, double rotation, int left_range, int right_range, int backward_range, int forward_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null)`
- `int play_extended_2d(string filename, float listener_x, float listener_y, float sound_x, float sound_y, double rotation, int left_range, int right_range, int backward_range, int forward_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null)`
- `int play_extended_2d(string filename, pack@ packfile, float listener_x, float listener_y, float sound_x, float sound_y, int left_range, int right_range, int backward_range, int forward_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null)`
- `int play_extended_2d(string filename, float listener_x, float listener_y, float sound_x, float sound_y, int left_range, int right_range, int backward_range, int forward_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null)`
- `int play_3d(string filename, pack@ packfile, float listener_x, float listener_y, float listener_z, float sound_x, float sound_y, float sound_z, double rotation, bool looping, bool persistent = false)`
- `int play_3d(string filename, pack@ packfile, vector listener, vector sound_coordinate, double rotation, bool looping, bool persistent = false)`
- `int play_3d(string filename, float listener_x, float listener_y, float listener_z, float sound_x, float sound_y, float sound_z, double rotation, bool looping, bool persistent = false)`
- `int play_3d(string filename, vector listener, vector sound_coordinate, double rotation, bool looping, bool persistent = false)`
- `int play_extended_3d(string filename, pack@ packfile, float listener_x, float listener_y, float listener_z, float sound_x, float sound_y, float sound_z, double rotation, int left_range, int right_range, int backward_range, int forward_range, int lower_range, int upper_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null, bool start_playing = true, double theta = 0)`
- `int play_extended_3d(string filename, float listener_x, float listener_y, float listener_z, float sound_x, float sound_y, float sound_z, double rotation, int left_range, int right_range, int backward_range, int forward_range, int lower_range, int upper_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null, bool start_playing = true, double theta = 0)`
- `bool sound_push_memory(int slot, string mem, bool stream_end = false, int pcm_rate = 0, int pcm_chans = 0)`
- `double sound_last_memory_push_time(int slot)`
- `bool sound_is_active(int slot)`
- `bool sound_is_playing(int slot)`
- `bool pause_sound(int slot)`
- `bool resume_sound(int slot)`
- `void pause_all()`
- `void resume_all()`
- `void destroy_all()`
- `void update_listener_1d(float listener_x)`
- `void update_listener_2d(float listener_x, float listener_y, double rotation = 0.0)`
- `void update_listener_3d(float listener_x, float listener_y, float listener_z, double rotation = 0.0, bool refresh_y_is_elevation = true)`
- `void update_listener_3d(vector listener, double rotation = 0.0, bool refresh_y_is_elevation = true)`
- `bool set_sound_owner(int slot, string owner, int priority = 0)`
- `int get_sound_by_owner(string owner, int priority = 0)`
- `bool update_sound_1d(int slot, int x)`
- `bool update_sound_2d(int slot, int x, int y)`
- `bool update_sound_3d(int slot, int x, int y, int z)`
- `bool update_sound_3d(int slot, vector coordinate)`
- `bool update_sounds_3d(string owner, int x, int y, int z, double rotation = -1)`
- `bool update_sounds_3d(string owner, vector coordinate, double rotation = -1)`
- `bool set_sound_rotation(int slot, double rotation, vector pivit)`
- `bool set_sounds_rotation(string owner, double rotation, vector pivit)`
- `bool set_sounds_amp(string owner, int priority, float amp)`
- `bool destroy_sounds(string owner)`
- `bool update_sound_start_values(int slot, float start_pan, float start_volume, float start_pitch)`
- `bool update_sound_range_1d(int slot, int left_range, int right_range)`
- `bool update_sound_range_2d(int slot, int left_range, int right_range, int backward_range, int forward_range)`
- `bool update_sound_range_3d(int slot, int left_range, int right_range, int backward_range, int forward_range, int lower_range, int upper_range, bool update_sound = true)`
- `bool update_sound_positioning_values(int slot, float pan_step = -1, float volume_step = -1, bool update_sound = true)`
- `bool destroy_sound(int slot)`
- `void find_highest_slot(uint limit)`
- `void clean_unused()`
- `bool verify_slot(int slot)`
- `int reserve_slot()`

---
## Library: `logger.nvgt`
**Syntax to use:** `#include "logger.nvgt"`

### Classes
#### Class `logger`
- `void add_entry(string the_entry)`
- `void reset()`
- `bool write(string filename, bool reset_text)`
- `string parse_time()`

---
## Library: `menu.nvgt`
**Syntax to use:** `#include "menu.nvgt"`

### Global Functions
- `void learn_game_sounds_menu(const name_value_collection&in sfx, const string&in audio_prefix = "", menu@ m = null, string go_back = "Go back")`
- `bool yes_no(const string&in prompt, menu@ m = null, string yes = "yes", string no = "no")`

### Classes
#### Class `menu`
- `funcdef void menu_callback(menu@, string)`
- `funcdef void menu_item_selected_callback(menu@, int)`
- `void reset(bool reset_settings = false)`
- `void set_first_letter_navigation(bool state) property`
- `bool get_first_letter_navigation() property`
- `int add_item(const string&in text, const string&in id = "", int position = -1)`
- `void add_items(const string[]@ item_list)`
- `bool delete_item(int index, bool reset_cursor = true)`
- `bool delete_all_items()`
- `void intro()`
- `bool monitor()`
- `int run()`
- `int get_focused_item() property`
- `void set_focused_item(int index) property`
- `bool set_focused_item(int index, bool speak_change)`
- `bool set_item_text(int index, const string&in new_text)`
- `string get_item_text(int index)`
- `bool set_item_id(int index, const string&in new_id)`
- `string get_item_id(int index)`
- `int get_item_index(const string&in id)`
- `int get_item_count() property`
- `int get_selected_item() const property`
- `string get_selected_item_id() const property`
- `bool get_allow_escape() const property`
- `void set_allow_escape(bool enabled) property`
- `bool get_allow_go_to_index() const property`
- `void set_allow_go_to_index(bool enabled) property`
- `bool get_allow_search() const property`
- `void set_allow_search(bool enabled) property`
- `bool play(const string&in soundpath)`
- `bool play(const string&in soundpath)`
- `private int on_form_list_event(audio_form@ f, int c, control_event_type event, dictionary@ args)`

---
## Library: `music.nvgt`
**Syntax to use:** `#include "music.nvgt"`

### Global Functions
- `funcdef sound@ load_music_sound(sound@, string)`

### Classes
#### Class `music_track`
- `bool set_option(string varname, string value = "")`
- `sound@ load_sound(sound@ s, string filename)`
- `void setup()`
- `bool get_playing() property`
- `int get_position() property`
- `void play_obj(sound@ handle, int fade_ms)`
- `void play(int fade_ms = 0)`
- `void pause(int fade_ms = 0)`
- `void stop(int fade_ms = 0)`
- `void loop(uint64 t)`

#### Class `music_manager`
- `void set_load_callback(load_music_sound@ cb)`
- `sound@ load_sound(sound@ s, string filename)`
- `float get_volume() const property`
- `void set_volume(float volume) property`
- `bool play(string track, bool blocking = false)`
- `void stop(int fade_ms = 0, bool blocking = false)`
- `bool pause(int fade_ms = 0, bool blocking = false)`
- `bool resume(int fade_ms = 0)`
- `bool get_playing() const property`
- `string get_playing_filename() const property`
- `string get_upcoming_filename() const property`
- `void loop(uint64 t = ticks())`

---
## Library: `number_speaker.nvgt`
**Syntax to use:** `#include "number_speaker.nvgt"`

### Classes
#### Class `number_speaker`
- `bool set_sound_object(sound@ handle)`
- `int speak(double the_number)`
- `int speak_next()`
- `void stop()`
- `int speak_wait(double the_number)`

---
## Library: `rotation.nvgt`
**Syntax to use:** `#include "rotation.nvgt"`

### Global Functions
- `shared vector move(double x, double y, double deg, double dir = 0.0)`
- `shared vector move(double x, double y, double z, double deg, double dir)`
- `shared vector move(double x, double y, double z, double deg, double zdeg, double dir, double zdir)`
- `shared double calculate_theta(double deg)`
- `double getdir(double facing)`
- `double snapleft(double deg, int direction, double inc = 45)`
- `double snapright(double deg, int direction, double inc = 45)`
- `shared double turnleft(double deg, double inc)`
- `shared double turnright(double deg, double inc)`
- `shared double degree_limit(double deg)`
- `string dir_to_string(int direction, bool more_detail = true)`
- `shared double get_1d_distance(double x1, double x2)`
- `shared double get_2d_distance(double x1, double y1, double x2, double y2)`
- `shared double get_3d_distance(double x1, double y1, double z1, double x2, double y2, double z2)`
- `shared double get_3d_distance(vector c1, vector c2)`
- `shared double get_clamped_3d_distance(vector current, vector min, vector max)`
- `shared double get_3d_distance_circle(double x1, double y1, double z1, double x2, double y2, double z2)`
- `shared double get_3d_distance_circle(vector c1, vector c2)`
- `shared double calculate_x_y_angle(double x1, double y1, double x2, double y2, double deg, bool at_least_1_tile = true, bool floor_deg = true)`
- `shared double calculate_clamped_x_y_angle(vector current, vector min, vector max, double deg, bool at_least_1_tile = true, bool floor_deg = true)`
- `shared string calculate_x_y_string(double deg)`
- `string calculate_x_y_string3d(double deg, double z1, double z2)`

---
## Library: `settings.nvgt`
**Syntax to use:** `#include "settings.nvgt"`

### Global Functions
- `funcdef settings_helper@ settings_helper_factory(settings@ parent)`
- `settings_helper@ ini_settings_factory(settings@ parent)`
- `settings_helper@ json_settings_factory(settings@ parent)`
- `settings_helper@ nvgt_settings_factory(settings@ parent)`
- `bool ensure_data_path(const string&in filename, bool absolute = true)`

### Classes
#### Class `settings_helper`
- `bool get_active() property`
- `bool is_active()`
- `bool get_encrypt_data() const property`
- `string get_encryption_key() const property`
- `bool get_instant_save() const property`
- `bool setup(string company, string product, bool local_path)`
- `string raw_dump()`
- `string get_data_path()`
- `string get_file_extension()`
- `bool clear()`
- `bool close(bool save = true)`
- `bool open()`
- `bool exists(const string&in key)`
- `bool remove_value(const string&in key)`
- `bool write_string(const string&in key, const string&in value)`
- `bool write_number(const string&in key, double number)`
- `bool write_bool(const string&in key, bool value)`
- `string read_string(const string&in key)`
- `double read_number(const string&in key)`
- `bool read_bool(const string&in key)`
- `bool dump()`

#### Class `ini_settings_helper`
- `bool is_active()`
- `bool open()`
- `bool clear()`
- `string raw_dump()`
- `string get_file_extension()`
- `bool write_string(const string&in key, const string&in value)`
- `bool write_bool(const string&in key, bool value)`
- `bool write_number(const string&in key, double number)`
- `string read_string(const string&in key)`
- `bool read_bool(const string&in key)`
- `bool exists(const string&in key)`
- `bool remove_value(const string&in key)`
- `bool close(bool save = true)`

#### Class `json_settings_helper`
- `bool is_active()`
- `bool open()`
- `bool clear()`
- `string get_file_extension()`
- `bool write_string(const string&in key, const string&in value)`
- `bool write_number(const string&in key, double number)`
- `bool write_bool(const string&in key, bool value)`
- `bool read_bool(const string&in key)`
- `string read_string(const string&in key)`
- `bool exists(const string&in key)`
- `bool remove_value(const string&in key)`
- `string raw_dump()`
- `bool close(bool save = true)`

#### Class `nvgt_settings_helper`
- `bool is_active()`
- `bool open()`
- `bool clear()`
- `string get_file_extension()`
- `bool write_string(const string&in key, const string&in value)`
- `bool write_number(const string&in key, double number)`
- `string read_string(const string&in key)`
- `double read_number(const string&in key)`
- `bool write_bool(const string&in key, bool value)`
- `bool read_bool(const string&in key)`
- `bool exists(const string&in key)`
- `bool remove_value(const string&in key)`
- `string raw_dump()`
- `bool close(bool save = true)`

#### Class `settings`
- `bool get_active() const property`
- `bool set_encryption(const string&in key)`
- `void set_opIndex(string key, var value) property`
- `bool close(bool save_data = true)`
- `bool exists(const string&in key)`
- `string read_string(const string&in key, const string&in default_value = "")`
- `double read_number(const string&in key, double default_value = 0)`
- `bool write_string(const string&in key, const string&in value)`
- `bool write_number(const string&in key, double number)`
- `bool write_bool(string&in key, bool value)`
- `bool read_bool(string&in key, bool default_value = false)`
- `bool has_other_products()`
- `bool remove_product()`
- `bool clear(bool completely = true)`
- `string get_raw_dump()`
- `void set_filename(string&in fname) property`
- `string get_filename() property`
- `bool remove_value(const string&in value_name)`
- `bool dump()`
- `bool setup(const string company, const string product, const bool local_path, const string format = "ini")`

---
## Library: `size.nvgt`
**Syntax to use:** `#include "size.nvgt"`

### Global Functions
- `string size_to_string(uint64 size, uint8 round_place = 2)`

---
## Library: `sound_pool.nvgt`
**Syntax to use:** `#include "sound_pool.nvgt"`

### Classes
#### Class `sound_pool_item`
- `void reset()`
- `void update(float listener_x, float listener_y, float listener_z, double rotation, int max_distance)`
- `void update_listener_position(float listener_x, float listener_y, float listener_z, float rotation)`
- `int get_total_distance(float listener_x, float listener_y, float listener_z)`

#### Class `sound_pool`
- `int play_extended(int dimension, string filename, pack_interface@ packfile, float listener_x, float listener_y, float listener_z, float sound_x, float sound_y, float sound_z, double rotation, int left_range, int right_range, int backward_range, int forward_range, int lower_range, int upper_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null, bool start_playing = true, double theta = 0)`
- `int play_stationary(string filename, pack_interface@ packfile, bool looping, bool persistent = false)`
- `int play_stationary(string filename, bool looping, bool persistent = false)`
- `int play_stationary_extended(string filename, pack_interface@ packfile, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null)`
- `int play_stationary_extended(string filename, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null)`
- `int play_1d(string filename, pack_interface@ packfile, float listener_x, float sound_x, bool looping, bool persistent = false)`
- `int play_1d(string filename, float listener_x, float sound_x, bool looping, bool persistent = false)`
- `int play_extended_1d(string filename, float listener_x, float sound_x, int left_range, int right_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null)`
- `int play_extended_1d(string filename, pack_interface@ packfile, float listener_x, float sound_x, int left_range, int right_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null)`
- `int play_2d(string filename, pack_interface@ packfile, float listener_x, float listener_y, float sound_x, float sound_y, bool looping, bool persistent = false)`
- `int play_2d(string filename, pack_interface@ packfile, float listener_x, float listener_y, float sound_x, float sound_y, double rotation, bool looping, bool persistent = false)`
- `int play_2d(string filename, float listener_x, float listener_y, float sound_x, float sound_y, bool looping, bool persistent = false)`
- `int play_2d(string filename, float listener_x, float listener_y, float sound_x, float sound_y, double rotation, bool looping, bool persistent = false)`
- `int play_extended_2d(string filename, pack_interface@ packfile, float listener_x, float listener_y, float sound_x, float sound_y, double rotation, int left_range, int right_range, int backward_range, int forward_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null)`
- `int play_extended_2d(string filename, float listener_x, float listener_y, float sound_x, float sound_y, double rotation, int left_range, int right_range, int backward_range, int forward_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null)`
- `int play_extended_2d(string filename, pack_interface@ packfile, float listener_x, float listener_y, float sound_x, float sound_y, int left_range, int right_range, int backward_range, int forward_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null)`
- `int play_extended_2d(string filename, float listener_x, float listener_y, float sound_x, float sound_y, int left_range, int right_range, int backward_range, int forward_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null)`
- `int play_3d(string filename, pack_interface@ packfile, float listener_x, float listener_y, float listener_z, float sound_x, float sound_y, float sound_z, double rotation, bool looping, bool persistent = false)`
- `int play_3d(string filename, pack_interface@ packfile, vector listener, vector sound_coordinate, double rotation, bool looping, bool persistent = false)`
- `int play_3d(string filename, float listener_x, float listener_y, float listener_z, float sound_x, float sound_y, float sound_z, double rotation, bool looping, bool persistent = false)`
- `int play_3d(string filename, vector listener, vector sound_coordinate, double rotation, bool looping, bool persistent = false)`
- `int play_extended_3d(string filename, pack_interface@ packfile, float listener_x, float listener_y, float listener_z, float sound_x, float sound_y, float sound_z, double rotation, int left_range, int right_range, int backward_range, int forward_range, int lower_range, int upper_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null, bool start_playing = true, double theta = 0)`
- `int play_extended_3d(string filename, float listener_x, float listener_y, float listener_z, float sound_x, float sound_y, float sound_z, double rotation, int left_range, int right_range, int backward_range, int forward_range, int lower_range, int upper_range, bool looping, double offset, float start_pan, float start_volume, float start_pitch, bool persistent = false, mixer@ mix = null, string[]@ fx = null, bool start_playing = true, double theta = 0)`
- `bool sound_push_memory(int slot, string mem, bool stream_end = false, int pcm_rate = 0, int pcm_chans = 0)`
- `double sound_last_memory_push_time(int slot)`
- `bool sound_is_active(int slot)`
- `bool sound_is_playing(int slot)`
- `bool pause_sound(int slot)`
- `bool resume_sound(int slot)`
- `void pause_all()`
- `void resume_all()`
- `void destroy_all()`
- `void update_listener_1d(float listener_x)`
- `void update_listener_2d(float listener_x, float listener_y, double rotation = 0.0)`
- `void update_listener_3d(float listener_x, float listener_y, float listener_z, double rotation = 0.0, bool refresh_y_is_elevation = true)`
- `void update_listener_3d(vector listener, double rotation = 0.0, bool refresh_y_is_elevation = true)`
- `bool set_sound_owner(int slot, string owner, int priority = 0)`
- `int get_sound_by_owner(string owner, int priority = 0)`
- `bool update_sound_1d(int slot, int x)`
- `bool update_sound_2d(int slot, int x, int y)`
- `bool update_sound_3d(int slot, int x, int y, int z)`
- `bool update_sound_3d(int slot, vector coordinate)`
- `bool update_sounds_3d(string owner, int x, int y, int z, double rotation = -1)`
- `bool update_sounds_3d(string owner, vector coordinate, double rotation = -1)`
- `bool set_sound_rotation(int slot, double rotation, vector pivit)`
- `bool set_sounds_rotation(string owner, double rotation, vector pivit)`
- `bool set_sounds_amp(string owner, int priority, float amp)`
- `bool destroy_sounds(string owner)`
- `bool update_sound_start_values(int slot, float start_pan, float start_volume, float start_pitch)`
- `bool update_sound_range_1d(int slot, int left_range, int right_range)`
- `bool update_sound_range_2d(int slot, int left_range, int right_range, int backward_range, int forward_range)`
- `bool update_sound_range_3d(int slot, int left_range, int right_range, int backward_range, int forward_range, int lower_range, int upper_range, bool update_sound = true)`
- `bool update_sound_positioning_values(int slot, float pan_step = -1, float volume_step = -1, bool update_sound = true)`
- `bool destroy_sound(int slot)`
- `void find_highest_slot(uint limit)`
- `void clean_unused()`
- `bool verify_slot(int slot)`
- `int reserve_slot()`

---
## Library: `soundtrack.nvgt`
**Syntax to use:** `#include "soundtrack.nvgt"`

### Classes
#### Class `soundtrack`
- `void add_channel(string commands)`
- `uint process_commands(string commands, uint cursor)`
- `uint cmd_o(string channel_input, uint cursor)`
- `uint cmd_lt(string channel_input, uint cursor)`
- `uint cmd_gt(string channel_input, uint cursor)`
- `uint cmd_l(string channel_input, uint cursor)`
- `uint cmd_p(string channel_input, uint cursor)`
- `uint cmd_note(string channel_input, uint cursor)`
- `void signal_error(string message, uint cursor)`
- `uint cmd_at(string channel_input, uint cursor)`
- `uint cmd_t(string channel_input, uint cursor)`
- `uint cmd_q(string channel_input, uint cursor)`
- `uint cmd_repeat(string channel_input, uint cursor)`
- `bool check_number(string channel_input, uint cursor)`
- `uint get_number(string channel_input, uint cursor, int &out number)`
- `uint cmd_v(string channel_input, uint cursor)`
- `uint cmd_a(string channel_input, uint cursor)`
- `uint cmd_r(string channel_input, uint cursor)`
- `uint cmd_n(string channel_input, uint cursor)`
- `uint cmd_u(string channel_input, uint cursor)`
- `uint cmd_d(string channel_input, uint cursor)`
- `bool write(string filename)`
- `sound@ write_sound()`

---
## Library: `speech.nvgt`
**Syntax to use:** `#include "speech.nvgt"`

### Global Functions
- `funcdef string text_processing_callback(const string&in text)`
- `bool speak(string text, bool interrupt = tts_default_interrupt, text_processing_callback@ processing_callback = tts_default_text_processing_callback, bool braille = true)`
- `void raw_speak(string text, bool interrupt)`
- `void stop_speech()`
- `string tts_dump_config(tts_voice@ v, bool save_screen_reader_setting = false)`
- `bool tts_load_config(string c, tts_voice@ v)`
- `void tts_config(tts_voice@ v, bool main_config = false)`

---
## Library: `stat_set.nvgt`
**Syntax to use:** `#include "stat_set.nvgt"`

### Global Functions
- `funcdef string stat_callback(stat@)`
- `string default_stat_callback_impl(stat@ stat)`

### Classes
#### Class `stat`
- `string opImplConv()`
- `double opConv() const`
- `var@ opAssign(const string&in value)`
- `var@ opAddAssign(const string&in value)`
- `double opAssign(double value)`
- `int opPostInc()`
- `int opPostDec()`
- `double opAdd(double value)`
- `double opAddAssign(double value)`
- `double opSub(double value)`
- `double opSubAssign(double value)`
- `double opMul(double value)`
- `double opMulAssign(double value)`
- `double opDiv(double value)`
- `double opDivAssign(double value)`
- `double opMod(int64 value)`
- `double opModAssign(int64 value)`

#### Class `stat_set`
- `stat_set@ opAssign(const stat_set&in other)`
- `stat@ add(const string&in name, var@ value, const string&in text = "", stat_callback@ callback = null, dictionary@ user = null)`
- `void update(const string&in name, var@ value)`
- `void mod(const string&in name, int64 value)`
- `void mod(const string&in name, double value)`
- `bool delete(const string&in name)`
- `void reset()`
- `stat@ opIndex(const string&in stat_name) const`
- `int get_size() const property`
- `string[]@ list(stat_sort_mode sort_mode = STAT_SORT_MODE_NONE, const string[]@ sort_in_front =`
- `stat@[] get_stats()`
- `bool exists(const string&in stat_name) const`
- `string[]@ opImplConv() const`
- `stat_set@ opAddAssign(const stat_set&in other)`
- `string serialize()`
- `bool deserialize(datastream@ ds)`
- `string serialize_linear()`
- `bool deserialize_linear(const string&in data)`
- `private bool string_is_number(const string&in str)`

---
## Library: `token_gen.nvgt`
**Syntax to use:** `#include "token_gen.nvgt"`

### Global Functions
- `string generate_token(int token_length, int mode = TOKEN_CHARACTERS | TOKEN_NUMBERS)`
- `string generate_custom_token(int token_length, string[]@ values)`
- `string generate_custom_token(int token_length, const string&in characters)`

---
## Library: `touch.nvgt`
**Syntax to use:** `#include "touch.nvgt"`

### Global Functions
- `void _touch_manager_register(touch_gesture_manager@ mgr)`
- `void _touch_manager_unregister(touch_gesture_manager@ mgr)`
- `bool _touch_evt_down(uint64 device, const touch_finger&inout finger)`
- `bool _touch_evt_up(uint64 device, const touch_finger&inout finger)`
- `bool _touch_evt_move(uint64 device, const touch_finger&inout finger, float dx, float dy)`
- `bool _touch_evt_cancel(uint64 device, const touch_finger&inout finger)`
- `funcdef void tap_func(touch_screen_finger@finger, uint tap_count, uint finger_count)`
- `int detect_swipe_direction(vector diff)`
- `string get_swipe_name(int dir)`
- `bool simulate_keys_down(int[] keys)`
- `bool simulate_keys_up(int[] keys)`

### Classes
#### Class `touch_interface`
- `void on_tap(touch_screen_finger@ finger, uint tap_count, uint finger_count)`
- `void on_single_tap(touch_screen_finger@ f, uint fc)`
- `void on_double_tap(touch_screen_finger@ f, uint fc)`
- `void on_tripple_tap(touch_screen_finger@ f, uint fc)`
- `void on_long_press(touch_screen_finger@ f, uint fc)`
- `void on_hold(touch_screen_finger@ f, uint fc)`
- `void on_swipe(touch_screen_finger@ finger, int direction)`
- `void on_flick(touch_screen_finger@ f, int d, float v)`
- `void on_compound_swipe(touch_screen_finger@ f, int[] d)`
- `void on_swipe_left(touch_screen_finger@ f)`
- `void on_swipe_right(touch_screen_finger@ f)`
- `void on_swipe_up(touch_screen_finger@ f)`
- `void on_swipe_down(touch_screen_finger@ f)`
- `void on_swipe_up_left(touch_screen_finger@ f)`
- `void on_swipe_up_right(touch_screen_finger@ f)`
- `void on_swipe_down_left(touch_screen_finger@ f)`
- `void on_swipe_down_right(touch_screen_finger@ f)`
- `void on_released_finger(touch_screen_finger@ f)`
- `void force_release_all()`
- `bool is_tap_chain_supported(uint s, uint f)`
- `bool in_bounds(float x, float y)`
- `void _process_tap(touch_screen_finger@ finger)`
- `void _exec_tap(touch_screen_finger@ finger, uint tap_count, uint finger_count)`
- `void _track_finger_down()`
- `void _track_finger_up()`
- `void _monitor()`

#### Class `touch_keyboard_interface`
- `string get_tap_key_name(uint tap_count, uint finger_count)`
- `bool is_tap_chain_supported(uint start_check_from, uint finger_count)`
- `bool simulate_mapped_key(string keyname, int[] & out key_codes = void)`
- `bool trigger_mapped_key(string base_name, uint fingers, int[] & out result_codes = void)`
- `void on_swipe(touch_screen_finger@ finger, int direction)`
- `void on_flick(touch_screen_finger@ finger, int direction, float velocity)`
- `void on_compound_swipe(touch_screen_finger@ finger, int[] directions)`
- `void on_long_press(touch_screen_finger@ finger, uint finger_count)`
- `void on_tap(touch_screen_finger@ finger, uint tap_count, uint finger_count)`
- `void on_released_finger(touch_screen_finger@ finger)`
- `void force_release_all()`

#### Class `touch_gesture_manager`
- `bool is_available()`
- `bool get_available() const property`
- `bool get_was_last_instant_input() const property`
- `int64 get_last_input_time() const property`
- `bool add_touch_interface(touch_interface@ i)`
- `bool set_touch_interfaces(touch_interface@[] interfaces, bool append = false)`
- `void clear_touch_interfaces()`
- `void dispatch_release(touch_screen_finger@ finger)`
- `bool internal_on_down(const touch_finger&inout raw_finger)`
- `bool internal_on_cancel(const touch_finger&inout raw_finger)`
- `bool internal_on_up(const touch_finger&inout raw_finger)`
- `bool internal_on_move(const touch_finger&inout raw_finger, float dx, float dy)`
- `void monitor()`

#### Class `touch_screen_finger`
- `void update_position(float nx, float ny, float pressure)`
- `float get_x() property`
- `float get_y() property`
- `float get_pressure() property`
- `int64 get_active_time() const property`

---
## Library: `virtual_dialogs.nvgt`
**Syntax to use:** `#include "virtual_dialogs.nvgt"`

### Global Functions
- `int virtual_alert(const string title, const string text, const bool can_cancel = false, const int flags = 0)`
- `bool virtual_info_box(const string title, const string label, const string text)`
- `string virtual_input_box(const string title, const string text, const string default_text = "", const int flags = 0)`
- `int virtual_message_box(const string title, const string caption, string[]@ buttons, const int flags = 0)`
- `int virtual_question(const string title, const string text, const bool can_cancel = false, const int flags = 0)`

### Classes
#### Class `virtual_dialogs`
- `private void create_dialog(const string title)`
- `private bool destroy_window()`
- `private bool create_window(const string title)`
- `private void handle_arrow_keys()`
- `private void monitor()`
- `bool info_box(const string title, const string label, const string text)`
- `string input_box(const string title, const string text, const string default_text = "", const int flags = 0)`
- `int message_box(const string title, const string caption, string[]@ buttons, int flags = 0)`
- `int question(const string title, const string text, const bool can_cancel = false, const int flags = 0)`
- `int alert(const string title, const string text, const bool can_cancel = false, const int flags = 0)`

