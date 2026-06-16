# NVGT Plugins API Reference

> **IMPORTANT NOTE:** These syntaxes belong to NVGT plugins written in C++. To use them, you MUST include the pragma directive at the top of your script. Example:
> `#pragma plugin("plugin_name")`

---
## Plugin: `legacy_sound`
**Syntax to use:** `#pragma plugin("legacy_sound")`

### Global Functions
- `array<string>@ get_sound_input_devices() property`
- `array<string>@ get_sound_output_devices() property`
- `bool get_SOUND_AVAILABLE() property`
- `bool get_sound_global_hrtf() property`
- `bool pack_set_global_identifier(const string&in)`
- `float get_sound_master_volume() property`
- `funcdef bool sound_seek_callback(uint, string)`
- `funcdef int sound_read_callback(string &out, uint, string)`
- `funcdef uint sound_length_callback(string)`
- `funcdef void sound_close_callback(string)`
- `uint get_sound_input_device() property`
- `uint get_sound_input_device_count() property`
- `uint get_sound_output_device() property`
- `uint get_sound_output_device_count() property`
- `void set_sound_global_hrtf(bool) property`
- `void set_sound_input_device(uint) property`
- `void set_sound_master_volume(float) property`
- `void set_sound_output_device(uint) property`

### Global Properties
- `const int PACK_OPEN_MODE_APPEND`
- `const int PACK_OPEN_MODE_CREATE`
- `const int PACK_OPEN_MODE_NONE`
- `const int PACK_OPEN_MODE_READ`
- `const string pack_global_identifier`
- `mixer@ sound_default_mixer`
- `pack@ sound_default_pack`

### Classes
#### Class `mixer`
##### Behaviours / Constructors
- `mixer @m()`
- `void f()`
##### Methods
- `bool get_pan_sliding() const property`
- `bool get_pitch_sliding() const property`
- `bool get_sliding() const property`
- `bool get_volume_sliding() const property`
- `bool set_fx(const string &in, int = -1)`
- `bool set_mixer(mixer@ = null)`
- `bool set_position(float, float, float, float, float, float, float, float, float)`
- `bool slide_pan(float, uint)`
- `bool slide_pitch(float, uint)`
- `bool slide_volume(float, uint)`
- `float get_pan() const property`
- `float get_pitch() const property`
- `float get_volume() const property`
- `void set_hrtf(bool = true)`
- `void set_pan(float) property`
- `void set_pitch(float) property`
- `void set_volume(float) property`

#### Class `pack`

#### Class `sound`
##### Behaviours / Constructors
- `sound @s()`
- `void f()`
##### Properties
- `const string loaded_filename`
##### Methods
- `bool close()`
- `bool get_active() const property`
- `bool get_pan_sliding() const property`
- `bool get_paused() const property`
- `bool get_pitch_sliding() const property`
- `bool get_playing() const property`
- `bool get_sliding() const property`
- `bool get_volume_sliding() const property`
- `bool load(const string &in filename, pack@ packfile = @sound_default_pack, bool allow_preloads = !system_is_mobile)`
- `bool load(sound_close_callback@, sound_length_callback@, sound_read_callback@, sound_seek_callback@, const string &in, const string&in = \`
- `bool load(string& data, uint size, const string&in preload_filename = \`
- `bool load_url(const string &in url)`
- `bool pause()`
- `bool play(bool reset_loop_state = true)`
- `bool play_looped()`
- `bool play_wait()`
- `bool push_memory(const string &in data, bool end_stream = false, int pcm_rate = 0, int pcm_channels = 0)`
- `bool seek(float position)`
- `bool set_fx(const string &in fx, int index = -1)`
- `bool set_mixer(mixer@ mixer = null)`
- `bool set_position(float listener_x, float listener_y, float listener_z, float sound_x, float sound_y, float sound_z, float rotation = 0.0, float pan_step = 1.0, float volume_step = 1.0)`
- `bool slide_pan(float, uint)`
- `bool slide_pitch(float, uint)`
- `bool slide_volume(float, uint)`
- `bool stop()`
- `bool stream(const string &in filename, pack@ containing_pack = sound_default_pack)`
- `double get_pitch_lower_limit() const property`
- `float get_length() const property`
- `float get_pan() const property`
- `float get_pitch() const property`
- `float get_position() const property`
- `float get_volume() const property`
- `void set_hrtf(bool enable = true)`
- `void set_length(float length = 0.0)`
- `void set_pan(float) property`
- `void set_pitch(float) property`
- `void set_volume(float) property`

#### Class `sound_environment`
##### Behaviours / Constructors
- `sound_environment @s()`
- `void f()`
##### Methods
- `bool add_box(const string&in, float, float, float, float, float, float)`
- `bool add_material(const string&in, float, float, float, float, float, float, float, bool = false)`
- `mixer@ new_mixer()`
- `sound@ new_sound()`
- `void set_listener(float, float, float, float)`
- `void update()`

---
## Plugin: `redis`
**Syntax to use:** `#pragma plugin("redis")`

### Classes
#### Class `blocking_redis_subscriber`
##### Behaviours / Constructors
- `blocking_redis_subscriber@ f()`
- `void f()`
##### Methods
- `array<string>@ get_messages(const string&in)`
- `bool get_is_running() const property`
- `bool has_messages(const string&in)`
- `bool subscribe(array<string>@)`
- `int get_port() const property`
- `string get_host() const property`
- `string get_last_error() const property`
- `string get_password() const property`
- `void set_host(const string&in) property`
- `void set_password(const string&in) property`
- `void set_port(int) property`
- `void stop()`

#### Class `redis_client`
##### Behaviours / Constructors
- `redis_client@ f()`
- `void f()`
##### Methods
- `array<array<double>@>@ geopos(const string&in, array<string>@)`
- `array<redis_value@>@ pipeline_execute()`
- `array<string>@ acl_getuser(const string&in)`
- `array<string>@ acl_list()`
- `array<string>@ client_list()`
- `array<string>@ georadius(const string&in, double, double, double, const string&in, bool = false, bool = false, bool = false, int64 = -1)`
- `array<string>@ georadiusbymember(const string&in, const string&in, double, const string&in, bool = false, bool = false, bool = false, int64 = -1)`
- `array<string>@ hkeys(const string&in)`
- `array<string>@ hvals(const string&in)`
- `array<string>@ keys(const string&in)`
- `array<string>@ lrange(const string&in, int64, int64)`
- `array<string>@ mget(array<string>@)`
- `array<string>@ scan(int64, const string&in = \`
- `array<string>@ sdiff(array<string>@)`
- `array<string>@ sinter(array<string>@)`
- `array<string>@ smembers(const string&in)`
- `array<string>@ srandmember_count(const string&in, int64)`
- `array<string>@ sunion(array<string>@)`
- `array<string>@ zrange(const string&in, int64, int64, bool = false)`
- `array<string>@ zrangebyscore(const string&in, double, double, bool = false, int64 = -1, int64 = -1)`
- `array<string>@ zrevrange(const string&in, int64, int64, bool = false)`
- `bool acl_deluser(const string&in)`
- `bool acl_setuser(const string&in, const string&in)`
- `bool bgrewriteaof()`
- `bool bgsave()`
- `bool client_pause(int64)`
- `bool client_setname(const string&in)`
- `bool config_resetstat()`
- `bool config_rewrite()`
- `bool config_set(const string&in, const string&in)`
- `bool connect()`
- `bool connect(const string&in, int, const string&in = \`
- `bool del(const string&in)`
- `bool discard()`
- `bool exists(const string&in)`
- `bool expire(const string&in, int64)`
- `bool flushall()`
- `bool flushdb()`
- `bool get_is_connected() const property`
- `bool getbit(const string&in, int64)`
- `bool hexists(const string&in, const string&in)`
- `bool hset(const string&in, const string&in, const string&in)`
- `bool hsetnx(const string&in, const string&in, const string&in)`
- `bool lset(const string&in, int64, const string&in)`
- `bool ltrim(const string&in, int64, int64)`
- `bool migrate(const string&in, int, const string&in, int, int, bool = false, bool = false)`
- `bool mset(array<string>@)`
- `bool mset(dictionary@)`
- `bool multi()`
- `bool pfadd(const string&in, array<string>@)`
- `bool pfadd(const string&in, const string&in)`
- `bool pfmerge(const string&in, array<string>@)`
- `bool pipeline_add(array<string>@)`
- `bool pipeline_begin()`
- `bool psetex(const string&in, int64, const string&in)`
- `bool restore(const string&in, int64, const string&in, bool = false)`
- `bool save()`
- `bool script_exists(const string&in)`
- `bool script_flush()`
- `bool select(int64)`
- `bool set(const string&in, const string&in, int64 = 0)`
- `bool setbit(const string&in, int64, bool)`
- `bool setex(const string&in, int64, const string&in)`
- `bool setnx(const string&in, const string&in)`
- `bool sismember(const string&in, const string&in)`
- `bool smove(const string&in, const string&in, const string&in)`
- `bool unwatch()`
- `bool watch(array<string>@)`
- `bool watch(const string&in)`
- `dictionary@ config_get(const string&in)`
- `dictionary@ hgetall(const string&in)`
- `dictionary@ memory_stats()`
- `dictionary@ object(const string&in, const string&in)`
- `double geodist(const string&in, const string&in, const string&in, const string&in = \`
- `double hincrbyfloat(const string&in, const string&in, double)`
- `double zincrby(const string&in, double, const string&in)`
- `double zscore(const string&in, const string&in)`
- `int get_database() const property`
- `int get_port() const property`
- `int get_timeout() const property`
- `int64 append(const string&in, const string&in)`
- `int64 bitcount(const string&in, int64 = -1, int64 = -1)`
- `int64 bitop(const string&in, const string&in, array<string>@)`
- `int64 bitpos(const string&in, bool, int64 = -1, int64 = -1)`
- `int64 client_id()`
- `int64 dbsize()`
- `int64 decr(const string&in)`
- `int64 decrby(const string&in, int64)`
- `int64 geoadd(const string&in, double, double, const string&in)`
- `int64 hdel(const string&in, const string&in)`
- `int64 hincrby(const string&in, const string&in, int64)`
- `int64 hlen(const string&in)`
- `int64 incr(const string&in)`
- `int64 incrby(const string&in, int64)`
- `int64 lastsave()`
- `int64 linsert(const string&in, const string&in, const string&in, const string&in)`
- `int64 llen(const string&in)`
- `int64 lpush(const string&in, const string&in)`
- `int64 lrem(const string&in, int64, const string&in)`
- `int64 memory_usage(const string&in, int = -1)`
- `int64 pfcount(array<string>@)`
- `int64 pfcount(const string&in)`
- `int64 publish(const string&in, const string&in)`
- `int64 rpush(const string&in, const string&in)`
- `int64 sadd(const string&in, array<string>@)`
- `int64 sadd(const string&in, const string&in)`
- `int64 scard(const string&in)`
- `int64 setrange(const string&in, int64, const string&in)`
- `int64 srem(const string&in, const string&in)`
- `int64 strlen(const string&in)`
- `int64 ttl(const string&in)`
- `int64 zadd(const string&in, double, const string&in)`
- `int64 zcard(const string&in)`
- `int64 zcount(const string&in, double, double)`
- `int64 zrank(const string&in, const string&in)`
- `int64 zrem(const string&in, const string&in)`
- `int64 zremrangebyrank(const string&in, int64, int64)`
- `int64 zremrangebyscore(const string&in, double, double)`
- `int64 zrevrank(const string&in, const string&in)`
- `redis_value@ eval(const string&in, array<string>@ = null, array<string>@ = null)`
- `redis_value@ evalsha(const string&in, array<string>@ = null, array<string>@ = null)`
- `redis_value@ exec()`
- `redis_value@ execute(array<string>@)`
- `string acl_whoami()`
- `string client_getname()`
- `string dump(const string&in)`
- `string geohash(const string&in, const string&in)`
- `string get(const string&in)`
- `string get_host() const property`
- `string get_last_error() const property`
- `string get_password() const property`
- `string getrange(const string&in, int64, int64)`
- `string hget(const string&in, const string&in)`
- `string info(const string&in = \`
- `string lindex(const string&in, int64)`
- `string lpop(const string&in)`
- `string memory_doctor()`
- `string ping(const string&in = \`
- `string rpop(const string&in)`
- `string script_load(const string&in)`
- `string spop(const string&in)`
- `string srandmember(const string&in)`
- `string type(const string&in)`
- `void disconnect()`
- `void set_database(int) property`
- `void set_host(const string&in) property`
- `void set_password(const string&in) property`
- `void set_port(int) property`
- `void set_timeout(int) property`

#### Class `redis_value`
##### Behaviours / Constructors
- `redis_value@ f()`
- `void f()`
##### Methods
- `array<redis_value@>@ get_array() const`
- `bool get_is_array() const property`
- `bool get_is_error() const property`
- `bool get_is_integer() const property`
- `bool get_is_nil() const property`
- `bool get_is_string() const property`
- `int64 get_integer() const`
- `string get_string() const`

### Enums
#### Enum `redis_type`
- `REDIS_TYPE_HASH`
- `REDIS_TYPE_LIST`
- `REDIS_TYPE_NONE`
- `REDIS_TYPE_SET`
- `REDIS_TYPE_STRING`
- `REDIS_TYPE_ZSET`

---
## Plugin: `systemd_notify`
**Syntax to use:** `#pragma plugin("systemd_notify")`

### Global Functions
- `int systemd_notify(const string&in state)`

---
## Plugin: `test_plugin`
**Syntax to use:** `#pragma plugin("test_plugin")`

### Global Functions
- `void do_exception()`
- `void do_test()`

