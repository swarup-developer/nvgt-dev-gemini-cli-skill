# King Audio Engine — Tam Kullanım Kılavuzu (Türkçe)

NVGT için **FMOD Core API** + **Steam Audio (Phonon)** HRTF + gömülü **Opus 1.3.1** codec üzerine kurulmuş ses motoru eklentisi. MiniAudio'nun yerini alır; daha kaliteli 3B konumlandırma, profesyonel DSP efektleri, mikrofon yakalama ve VoIP'e hazır sıkıştırma sunar.

---

## 1. Kurulum

1. `king_audio_engine.dll` dosyasını (ve yanında gelen FMOD/Phonon yardımcı DLL'lerini) NVGT'nin `lib/` klasörüne (veya NVGT'nin eklenti yüklediği bir klasöre) bırakın.
2. `king_audio_engine/includes/` içindeki `sound_pool.nvgt` ve `voice_chat.nvgt` yardımcı dosyalarını `#include` ile dahil edebileceğiniz bir yere koyun.
3. Eklentiyi kullanan her script'in en üstüne ekleyin:

```angelscript
#pragma namespace sound upcoming
#pragma plugin king_audio_engine
```

`upcoming` namespace, NVGT'ye yerleşik sound sınıfı yerine king_audio sound sınıfını kullanmasını söyler.

---

## 2. Koordinat Sistemi ve Rotasyon

| Eksen | NVGT (script) | FMOD (dahili) |
|-------|---------------|---------------|
| X     | sol/sağ       | sol/sağ       |
| Y     | derinlik/ileri | yukarı       |
| Z     | yukarı/yükseklik | derinlik/ileri |

Motor Y/Z'yi içeride takas eder — **her zaman NVGT koordinatlarını verin**, önceden çevirmeyin.

- Rotasyon **DERECE** cinsindendir, radyan değil. `calculate_theta()` ile **sarmalamayın**.
- 0° ileri (+Y), 90° sağ (+X), 180° arka, 270° sol.

---

## 3. Merhaba Dünya

```angelscript
#pragma namespace sound upcoming
#pragma plugin king_audio_engine

void main() {
    sound s;
    s.load("merhaba.ogg");
    s.play_wait();          // bitene kadar bekler
}
```

3B konumlandırılmış oynatma:

```angelscript
sound s;
s.load("kapi.ogg");
set_listener(player_x, player_y, player_z, player_rotation);
s.set_position(player_x, player_y, player_z, 10, 5, 0, player_rotation);
s.play();
king_system_update();      // her frame'de BİR KEZ, tüm güncellemelerden sonra
```

---

## 4. Global Fonksiyonlar ve Property'ler

| Sembol | Açıklama |
|--------|----------|
| `bool SOUND_AVAILABLE` | Motor başarıyla başlatıldı mı |
| `float sound_master_volume` | Master ses **0–100** lineer (0 sessiz, 100 normal) |
| `set_listener(float x, float y, float z, float rotation_deg)` | Global FMOD dinleyiciyi ayarlar (frame başına bir kez) |
| `king_system_update()` | FMOD durumunu işler — **her frame'de bir kez** en sonda çağırın |
| `float listener_x / listener_y / listener_z / listener_rotation` | Mevcut dinleyici konumunu okur |
| `bool king_global_hrtf` | Yeni oluşturulan her sesin HRTF'i. Varsayılan `false`. |
| `bool king_realistic_distance` | Gerçekçi mesafe azalması eğrisi |
| `void sound_master_eq(float low, float mid, float high)` | 3 bant master EQ (dB). Crossover sabit: 250 Hz / 4000 Hz |
| `float sound_master_eq_low / mid / high` | Tek tek bantları oku/yaz (dB) |
| `uint sound_output_device` | Aktif çıkış aygıtı indeksi (oku/yaz) |
| `string[]@ sound_output_devices` | Tüm çıkış aygıtlarının isimleri |
| `uint sound_input_device` | Aktif mikrofon indeksi |
| `string[]@ sound_input_devices` | Tüm mikrofonların isimleri |
| `set_default_pack(king_pack@)` / `set_default_pack(king_virtual_pack@)` | Göreceli isimle yapılan tüm yüklemeler önce buraya bakar |

---

## 5. `sound` Sınıfı

### 5.1 Yükleme

```angelscript
bool load(const string &in dosya, king_pack@ paket = null);
bool load(const string &in dosya, king_virtual_pack@ paket);
bool load_url(const string &in url);
bool stream(const string &in dosya, king_pack@ paket = null);
bool load_samples(array<int16>@ samples, int sample_rate = 44100, int channels = 1);
bool load_pcm(const string &in data, int sample_rate = 44100, int channels = 1);
bool push_memory(const string &in data, bool end_stream = false, int pcm_rate = 0, int pcm_channels = 0);
bool close();
```

Desteklenen formatlar: WAV, OGG, MP3, FLAC + kendiniz beslediğiniz ham PCM.

### 5.2 Oynatma

```angelscript
bool play(bool reset_loop_state = true);
bool play_wait();        // ses bitene kadar bekler
bool play_looped();
bool pause();
bool stop();
bool seek(float position_ms);
```

### 5.3 Durum (sadece okunur property'ler)

```angelscript
bool   active;            // ses yüklü ve hazır mı
bool   playing;
bool   paused;
bool   sliding, pan_sliding, pitch_sliding, volume_sliding;
float  length;            // milisaniye
float  position;          // milisaniye
const string loaded_filename;
double pitch_lower_limit;
```

### 5.4 Volume / Pitch / Pan

```angelscript
float pitch  = 100.0;     // 100 = orijinal hız, 50 = yarı, 200 = iki kat
float pan    = 0.0;       // -100 tam sol, 0 orta, 100 tam sağ
float volume = 0.0;       // -100 dB (sessiz) … 0 dB (tam). LEGACY dB ÖLÇEĞİ
```

> **Önemli.** `set_volume()` değeri doğrudan FMOD'a yazmaz. Motor `base_volume_db` ile mesafe azalmasını `set_position()` içinde birleştirir. Bu, kullanıcı sesi ile mesafe azalmasının çakışmasını önlemek için bilinçli bir tasarım. Dinleyici hareket etmeden ses değişimini duyurmak için, yeni volume atamasından sonra `set_position()`'ı tekrar çağırın.

Yumuşak geçişler:

```angelscript
bool slide_pitch(float hedef,    uint sure_ms);
bool slide_pan(float hedef,      uint sure_ms);
bool slide_volume(float hedef_db, uint sure_ms);
```

### 5.5 3B Konumlandırma

```angelscript
bool set_position(float lx, float ly, float lz,
                  float sx, float sy, float sz,
                  float rotation_deg = 0,
                  float pan_step     = 1,
                  float volume_step  = 1);

void set_hrtf(bool aktif = true);
```

`pan_step` ve `volume_step` BGT-tarzı adım davranışı için çarpandır (1.0 = orijinal hassasiyet).

### 5.6 Mixer Yönlendirme

```angelscript
bool set_mixer(mixer@ m = null);   // null = master'a geri dön
```

### 5.7 Ses Bazlı DSP

```angelscript
int set_fx(const string &in fx, int index = -1);
```

- `index = -1` → yeni efekt ekler.
- `index >= 0` → o slottaki efekti değiştirir.
- Boş string ile sil: `s.set_fx("", 0);`
- Efektlere **ID** ile de erişilebilir: `$id:` ile başlayın → ismiyle ekle/güncelle. `s.set_fx("$amp:fader:-6")` "amp" etiketli fader DSP'sini -6 dB ile ekler (varsa günceller). Sadece ID gönderilirse (`s.set_fx("$amp")`) silinir.

> **Kritik tuzak.** `set_fx()` mutlaka **`load()` SONRASI** ve **`play()` ÖNCESİ** çağrılmalı. `load()` kanalı yeniden kurar ve daha önce eklenen DSP'leri yok eder.

---

## 6. `mixer` Sınıfı

`mixer` bir FMOD ChannelGroup'tur. Sesleri ortak reverb, EQ, volume, pitch için bir araya getirin — veya grupları iç içe yerleştirin.

```angelscript
mixer dialog;
dialog.set_volume(-6);
dialog.set_reverb_preset("room");

sound npc;  npc.load("npc01.ogg");  npc.set_mixer(dialog);  npc.play();
```

### 6.1 Yönlendirme

```angelscript
bool set_mixer(mixer@ ust = null);     // BU mixer'ı başka mixer'a yönlendir
bool add_mixer(mixer@ alt);
bool remove_mixer(mixer@ alt);
bool add_sound(sound@);
bool remove_sound(sound@);
```

### 6.2 Reverb

#### Özel reverb

```angelscript
bool set_reverb(float decay_ms,
                float wet_db        = 0,
                float dry_db        = -80,
                float diffusion     = 80,
                float density       = 60,
                float early_delay   = 5,
                float late_delay    = 10,
                float hf_reference  = 5000,
                float hf_decay_ratio= 50,
                float low_shelf_freq= 250,
                float low_shelf_gain= 0,
                float high_cut      = 8000,
                float early_late_mix= 60);
```

#### Hazır ayarlar (`set_reverb_preset(isim, wet_db = 0, dry_db = -80)`)

| Preset       | Açıklama                  |
|--------------|---------------------------|
| `room`       | Küçük kuru oda            |
| `hall`       | Konser salonu             |
| `cave`       | Derin mağara              |
| `bathroom`   | Fayanslı banyo            |
| `arena`      | Spor arenası              |
| `hangar`     | Boş uçak hangarı          |
| `forest`     | Seyrek dış yansıma        |
| `tunnel`     | Uzun yeraltı tüneli       |
| `underwater` | Boğuk sualtı              |

```angelscript
mixer m;
m.set_reverb_preset("hangar", -3, -80);   // wet -3 dB, dry tam kapalı
```

`m.remove_reverb()` ile kaldırılır.

#### Konvolüsyon reverb (impulse response)

```angelscript
bool set_convolution(const string &in wav_dosya, float wet = 0, float dry = 0, bool linked = false);
bool set_convolution(const string &in wav_dosya, king_pack@ pack, float wet = 0, float dry = 0, bool linked = false);
```

WAV mutlaka PCM olmalı (16/24/32 bit). `linked = true` stereo kanallar arasında işlemi paylaşır (daha hafif, daha az stereo ayrım).

> Bilinen kısıt: bazı IR veri düzenlerinde crash olabilir; yayınlamadan önce test edin.

### 6.3 Mixer DSP / HRTF / Konum

```angelscript
int  set_fx(const string &in fx, int index = -1);
void set_hrtf(bool aktif = true);
bool set_position(float lx, float ly, float lz, float sx, float sy, float sz, float rotation_deg);
```

`sound` ile aynı volume/pitch/pan/slide API'si.

---

## 7. FX (DSP) Referansı

Format: `set_fx("isim:p1:p2:p3...")` — iki nokta ile ayrılır. İsteğe bağlı ID öneki: `$adim:isim:parametreler`.

### 7.1 Reverb ailesi

| Efekt      | Parametreler (sırayla) |
|------------|------------------------|
| `reverb`   | decay_ms, early_delay_ms, late_delay_ms, hf_ref_hz, hf_decay_ratio, diffusion, density, lowshelf_freq, lowshelf_gain_db, highcut_hz, early_late_mix, wet_db, dry_db |
| `freeverb` | dry_mix(0–1), wet_mix(0–1), roomsize(0–1), damp(0–1), width(0–1) — legacy BASS tarzı, dahili olarak SFX reverb'e eşlenir |

### 7.2 Echo / delay

| Efekt    | Parametreler                                                       |
|----------|--------------------------------------------------------------------|
| `echo`   | delay_ms, feedback(0–100), drylevel_db, wetlevel_db                |
| `echo4`  | dry_db, wet_db, feedback(0–100), delay_ms — BASS legacy            |
| `itecho` | wetdrymix(0–100), feedback(0–100), leftdelay_ms, rightdelay_ms, pandelay |
| `delay`  | ch0_ms, ch1_ms, max_delay_ms                                       |

### 7.3 Modülasyon

| Efekt        | Parametreler                                                |
|--------------|-------------------------------------------------------------|
| `chorus`     | mix(0–100), rate_hz(0–20), depth(0–100)                     |
| `flange`     | mix(0–100), depth(0–100), rate_hz(0–20)                     |
| `tremolo`    | freq_hz, depth(0–1), shape(0–1), skew(-1..1), duty(0–1), square(0–1), phase(0–1), spread(-180..180) |
| `oscillator` | tip(0–5: sine/square/sawup/sawdown/triangle/noise), rate_hz |

### 7.4 Filtreler

| Efekt             | Parametreler                          |
|-------------------|---------------------------------------|
| `lowpass`         | cutoff_hz(10–22000), resonance(1–10)  |
| `lowpass_simple`  | cutoff_hz                             |
| `itlowpass`       | cutoff_hz, resonance                  |
| `highpass`        | cutoff_hz(10–22000), resonance(1–10)  |
| `highpass_simple` | cutoff_hz                             |
| `bandpass`        | freq_hz, q(0.1–20), gain_db (legacy)  |

### 7.5 Equalizer'lar

| Efekt          | Parametreler |
|----------------|--------------|
| `parameq`      | center_hz, bandwidth(oktav), gain_db |
| `three_eq`     | low_db, mid_db, high_db, low_xover_hz(varsayılan 250), high_xover_hz(varsayılan 4000), slope(0=12dB/oct, 1=24, 2=48) |
| `multiband_eq` | filter_a, freq_a, q_a, gain_a, … B, C, D, E için tekrar (5 banta kadar). filter tipi: 0=disabled, 1=lowpass12, 2=lowpass24, 3=lowpass48, 4=highpass12, 5=highpass24, 6=highpass48, 7=lowshelf, 8=highshelf, 9=peaking, 10=bandpass, 11=notch, 12=allpass |

### 7.6 Dinamikler

| Efekt        | Parametreler |
|--------------|--------------|
| `compressor` | threshold_db, ratio, attack_ms, release_ms, makeup_db |
| `limiter`    | release_ms(1–1000), ceiling_db(-12..0), maximizer_gain_db(0..12) |
| `normalize`  | fadetime_ms, threshold(0–1), maxamp(1–20) |

### 7.7 Pitch / volume yardımcıları

| Efekt         | Parametreler |
|---------------|--------------|
| `pitchshift`  | pitch(0.5–2 = ±oktav), fft_size(256/512/1024/2048/4096), overlap(4–32) |
| `distortion`  | level(0–1) |
| `fader`       | gain_db |
| `volume`      | linear_volume(0–1) — legacy BGT eşlemesi → dahili dB |
| `lvolume`     | linear_amp(0–1) — `volume` ile aynı, isim uyumluluğu için |

### 7.8 Örnekler

```angelscript
sound s; s.load("tufek.ogg");
s.set_fx("$verb:reverb:1500:10:30:5000:50:80:80:200:0:8000:60:0:-12");  // hall benzeri
s.set_fx("$lp:lowpass:2000:1");                                          // duvar arkası boğuk
s.play();
// sonra…
s.set_fx("$lp");          // oyuncu duvardan çıkınca lowpass'i kaldır
```

---

## 8. Master EQ ve Master Volume

```angelscript
sound_master_volume = 80;             // 0..100 lineer

sound_master_eq(2, 0, -3);            // +2 dB bas, düz orta, -3 dB tiz
sound_master_eq_mid = 1.5;            // tek bandı değiştir
```

Master EQ tüm mixer'lardan sonra çalışır, ses kartından çıkmadan önceki son ton şekillendiricidir.

---

## 9. HRTF (Binaural 3B) — Steam Audio

İki şekilde aktifleştirilir:

```angelscript
king_global_hrtf = true;     // bundan sonra her YENİ ses HRTF ile başlar
sound s; s.load(...); s.set_hrtf(true);  // sese özel
```

- HRTF stereo çıkış aygıtı gerektirir.
- DSP oluşturulurken sessiz buffer ile "prime" edilir → ilk frame bozulması olmaz.
- Mesafe 0'da `volume_step = 0` durumunda Steam Audio bypass edilir, düz stereo passthrough yapılır (stereo kaynak stereo kalır).
- Stereo girdide 20° açıyla **iki** binaural efekt çalışır ve toplanır → tek noktasal kaynak yerine geniş stereo imaj oluşur.

İnce ayar (global):

| Property                   | Anlam |
|----------------------------|--------|
| `hrtf_near_field_radius`   | Bu yarıçap içinde near-field bas yükseltmesi devreye girer |
| `hrtf_dead_zone`           | Bu yarıçap içinde spatializer devre dışı kalır, stereo merkez kalır |

---

## 10. Sound Environment (Phonon Akustik)

Statik geometri tanımlayıp dinleyici ile kaynak arasında oklüzyon/boğukluk elde edin.

```angelscript
sound_environment_add_material("metal", 0.10, 0.05, 0.02, 0.5, 0.0, 0.0, 0.0);
//                              isim    abs_dus orta yuks  scatter trans_dus orta yuks
sound_environment_add_wall(0, 100, 0, 1, 0, 30, "metal", 1);     // kutu sınırları + materyal + id
sound_environment_add_platform(0, 100, 50, 51, 0, 30, "concrete", 2);
sound_environment_commit();          // Phonon'a yükle
```

Diğer yardımcılar:

```angelscript
sound_environment_remove_wall(int id);
sound_environment_reset();
int sound_environment_check_wall(float lx, float ly, float lz, float sx, float sy, float sz);
string sound_environment_debug();
bool SOUND_ENVIRONMENT_ACTIVE;       // property
```

> Bilinen sorun: dikey (Z) yükseklik algısı yatay kadar güçlü değil — revizyon gündemde.

---

## 11. Paket Dosyaları (`king_pack`, `king_virtual_pack`)

Diskten yüklenen (`king_pack`) veya tamamen RAM'de tutulan (`king_virtual_pack`) şifrelenmiş asset paketleri.

```angelscript
king_pack p;
p.add_file("muzik/tema.ogg", "src/tema.ogg");
p.add_from_memory("config.txt", "cevap=42");
p.open("oyun.dat", "gizli_anahtar");
set_default_pack(@p);                // göreceli yüklemeler buraya bakar
sound s; s.load("muzik/tema.ogg");   // p'den yüklenir
```

API (her iki sınıf için aynı):

```angelscript
bool   open(const string &in dosya, const string &in anahtar);
void   close();
bool   add_file(const string &in isim, const string &in kaynak_yol);
bool   add_from_memory(const string &in isim, const string &in veri);
uint64 get_file_count();
string get_file_name_at(uint64 i);
string get_file_content(const string &in isim);
bool   file_exists(const string &in isim);
uint64 get_file_size(const string &in isim);
bool   extract_file(const string &in isim, const string &in cikti_yol);
string[]@ get_file_list();
```

Bağımsız yardımcılar:

```angelscript
bool king_encrypt_file(const string &in src, const string &in dst, const string &in key);
bool king_decrypt_file(const string &in src, const string &in dst, const string &in key);
```

---

## 12. `king_microphone` — Kayıt, Canlı Dinleme, Ses Hatları

```angelscript
king_microphone mic;          // mevcut sound_input_device kullanılır
king_microphone mic2(2);      // belirli aygıt indeksi
```

### 12.1 `start()` ÖNCESİ ayarlanması gereken property'ler

| Property         | Varsayılan | Aralık / Notlar |
|------------------|-----------|-----------------|
| `sample_rate`    | 48000     | 8000 – 192000 Hz. Opus/VoIP için 48000'de tutun |
| `channels`       | 1         | 1 (mono) veya 2 (stereo). Ses sohbetinde her zaman 1. |
| `buffer_length`  | 2.0       | saniye, 0.5 – 300. Dahili ring buffer uzunluğu |
| `device`         | -1        | -1 = global `sound_input_device`, aksi halde belirli indeks |

İstendiğinde değiştirilebilen:

| Property | Varsayılan | Aralık / Notlar |
|----------|-----------|-----------------|
| `volume` | 1.0       | sadece monitor playback ses seviyesi (yakalanan veriyi etkilemez) |
| `gain`   | 100       | 0–200 yüzde (0 sessiz, 100 normal, 200 = 2× ön-amplifikasyon yakalanan veride) |

### 12.2 Metotlar

```angelscript
bool start();              // yakalamayı başlatır
bool stop();               // yakalama ve playback'i durdurur
bool play_back();          // canlı monitor (sesinizi hoparlörden duyma)
bool play_back(mixer@);    // canlı monitor mixer'a yönlendirilmiş
void stop_playback();
bool save(const string &in wav_dosya);
string get_data();         // ÖNCEKİ çağrıdan beri yakalanan YENİ PCM16 byte'ları
bool   is_recording();
bool   active;             // property — is_recording() ile aynı
```

`get_data()` streaming hattının kalbidir: her çağrıda son çağrıdan beri yakalanan ses döner; Opus'a beslemek bir döngü kadar basittir.

### 12.3 Hızlı tarifler

Dosyaya kayıt:

```angelscript
king_microphone mic;
mic.buffer_length = 30;             // 30 sn ring buffer
mic.start();
wait(5000);
mic.save("kayit.wav");
mic.stop();
```

Canlı "sesimi yansıt" monitör:

```angelscript
king_microphone mic;
mic.gain = 130;                      // hafif boost
mic.start();
mic.play_back();
```

Ham PCM'i streaming sese itme (codec yok):

```angelscript
king_microphone mic; mic.start();
sound s;
while (true) {
    string parca = mic.get_data();
    if (parca.length() > 0)
        s.push_memory(parca, false, mic.sample_rate, mic.channels);
    wait(5);
}
```

---

## 13. Opus Codec (Ses Sıkıştırma)

Gömülü Opus 1.3.1 — ayrı DLL yok. ID tabanlı, mutex korumalı, thread'ler arası güvenli.

### 13.1 Varsayılanlar (VoIP'e ayarlı)

| Ayar       | Varsayılan | Neden |
|------------|------------|--------|
| Bitrate    | 24 000 bps | Mükemmel ses kalitesi |
| Frame size | 20 ms      | Standart VoIP paket uzunluğu |
| Mode       | VBR        | Aynı ortalama bitrate'te daha yüksek kalite |
| FEC        | açık       | Forward error correction, kayıp paketleri kurtarır |
| DTX        | açık       | Sessizlikte göndermeyi durdurur (bandwidth tasarrufu) |
| Complexity | 6          | CPU/kalite dengesi |
| Packet loss| %5         | Encoder'a %5 ağ kaybı bekleneceğini söyler |

### 13.2 Encoder

```angelscript
int  opus_encoder_create(int sample_rate, int channels, int bitrate = 24000, int frame_ms = 20);
bool opus_encoder_destroy(int id);
string opus_encode(int id, const string &in pcm16_data);     // PCM16 girer, opus çıkar
string opus_encode_float(int id, float[]@ pcm);              // float [-1..1]
bool opus_encoder_set_bitrate(int id, int bps);              // 6 000 – 510 000
bool opus_encoder_set_complexity(int id, int c);             // 0 – 10
bool opus_encoder_set_fec(int id, bool aktif);
bool opus_encoder_set_dtx(int id, bool aktif);
bool opus_encoder_set_packet_loss(int id, int yuzde);        // 0 – 100
bool opus_encoder_set_signal(int id, int sinyal);            // 3000=auto, 3001=voice, 3002=music
bool opus_encoder_reset(int id);                             // dahili durumu temizle
```

Frame buffering: encoder örnekleri biriktirir ve sadece tam frame hazır olduğunda paket üretir. Yani `opus_encode()` yeterli ses gelene kadar boş string döndürebilir — bu normaldir.

### 13.3 Decoder

```angelscript
int  opus_decoder_create(int sample_rate, int channels, int frame_ms = 20);
bool opus_decoder_destroy(int id);
string opus_decode(int id, const string &in encoded_packet);
int  opus_decode_float(int id, const string &in encoded_packet, float[]@ pcm);
bool opus_decoder_reset(int id);
```

### 13.4 Önerilen bitrate / sample rate kombinasyonları

| Senaryo                   | Sample rate | Kanal | Bitrate     | Frame |
|---------------------------|-------------|-------|-------------|-------|
| Ses sohbet (düşük bant)   | 16 000 Hz   | 1     | 12 000 bps  | 40 ms |
| Ses sohbet (varsayılan)   | 48 000 Hz   | 1     | 24 000 bps  | 20 ms |
| Ses sohbet (HQ)           | 48 000 Hz   | 1     | 32 000 bps  | 20 ms |
| Stereo müzik              | 48 000 Hz   | 2     | 96 000 bps  | 20 ms |

### 13.5 Sıkıştır-aç demo

```angelscript
int enc = opus_encoder_create(48000, 1);
int dec = opus_decoder_create(48000, 1);

string pcm = mic.get_data();          // yakalanan PCM16
string pkt = opus_encode(enc, pcm);   // ağ-dostu küçük blob
// … pkt'yi ağ üzerinden gönder …
string out = opus_decode(dec, pkt);

opus_encoder_destroy(enc);
opus_decoder_destroy(dec);
```

---

## 14. `sound_pool.nvgt` — Yüksek Seviye 3B Ses Yöneticisi

`sound_pool` belirli sayıda `sound` nesnesi kiralar ve 1B/2B/3B sahnenin tüm bookkeeping'ini halleder. Legacy BGT/NVGT API yüzeyi, king_audio'ya uyarlanmış.

```angelscript
#include "sound_pool.nvgt"

sound_pool pool(150);          // 150 eş zamanlı slot
pool.pan_step = 1.0;
pool.volume_step = 1.0;
pool.behind_pitch_decrease = 0.25;   // arkadaki sesler hafif pitch düşer
pool.max_distance = 150;             // 150 birim ötedeki loop'lu sesler kapatılır
pool.hrtf = true;                    // BU pool'dan çalan her ses HRTF alır
```

### 14.1 Çalma metotları

| Metot                       | Amaç                                            |
|-----------------------------|------------------------------------------------|
| `play_stationary(...)`      | UI / spatial yok                               |
| `play_1d(...)`              | Sadece sol-sağ                                 |
| `play_2d(...)`              | XY düzlem (rotasyon opsiyonel)                 |
| `play_3d(...)`              | Tam 3B, opsiyonel streaming                    |
| `play_extended_*` varyantları | Aynı + range, offset, pan/vol/pitch, persistent, mixer, fx listesi açığa çıkar |

Her biri slot indeksi (>=0) veya hata kodu (-1/-2) döner.

```angelscript
int slot = pool.play_3d("kapi.ogg", px, py, pz, 10, 5, 0, rotation, false /*loop*/);
```

### 14.2 Dinleyici güncelleme (frame başına)

```angelscript
pool.update_listener_1d(player_x);
pool.update_listener_2d(player_x, player_y, rotation_deg);
pool.update_listener_3d(player_x, player_y, player_z, rotation_deg);
```

Bunlar global dinleyiciyi ayarlar VE sonunda `king_system_update()`'i çağırır. **Birden fazla pool** varsa, frame başına SADECE SON `update_listener_*` çağrılmalı — kendiniz `set_listener()` + `king_system_update()` çağırarak koordine edin.

### 14.3 Ses yaşam döngüsü

```angelscript
bool   pause_sound(int slot);
bool   resume_sound(int slot);
void   pause_all();
void   resume_all();
bool   destroy_sound(int slot);
bool   destroy_sounds(string owner);
void   destroy_all();
bool   sound_is_active(int slot);
bool   sound_is_playing(int slot);
```

### 14.4 Sahipler (sesleri grupla)

```angelscript
pool.set_sound_owner(slot, "dusman_42", oncelik);
int s = pool.get_sound_by_owner("dusman_42", oncelik);
pool.update_sounds_3d("dusman_42", x, y, z, rotation);     // sahibin tüm seslerini hareket ettir
pool.set_sounds_amp("dusman_42", oncelik, 0.5);            // eşleşen tüm seslere fader fx
pool.destroy_sounds("dusman_42");
```

### 14.5 Slot bazlı güncelleme

```angelscript
pool.update_sound_1d(slot, x);
pool.update_sound_2d(slot, x, y);
pool.update_sound_3d(slot, x, y, z);
pool.update_sound_position(slot, x, y, z);   // anında refresh yapmadan ayarla

pool.update_sound_range_1d(slot, sol, sag);
pool.update_sound_range_2d(slot, sol, sag, arka, on);
pool.update_sound_range_3d(slot, sol, sag, arka, on, alt, ust);

pool.update_sound_start_values(slot, start_pan, start_volume_db, start_pitch);
pool.update_sound_positioning_values(slot, pan_step, volume_step);

pool.set_sound_rotation(slot, theta_deg, vector(pivot));
pool.set_sounds_rotation("owner", theta_deg, vector(pivot));
```

### 14.6 PCM streaming

```angelscript
pool.sound_push_memory(slot, pcm_parca, end_stream, sample_rate, channels);
double t = pool.sound_last_memory_push_time(slot);   // son push'tan beri ms
```

### 14.7 Konfigürasyon

| Property                  | Ne yapar |
|---------------------------|----------|
| `bool y_is_elevation`     | Y'yi yükseklik olarak ele al (pool başına) |
| `bool sound_pool_default_y_elevation` | Her yeni pool için varsayılan |
| `int  max_distance`       | Loop'lu sesler bu mesafenin ötesinde kapanır. 0 = asla |
| `float pan_step`          | Yatay offset'ten türetilen stereo pan çarpanı |
| `float volume_step`       | Mesafe azalması çarpanı |
| `float behind_pitch_decrease` | Dinleyicinin arkasındaki seslere uygulanan pitch düşüşü |
| `bool hrtf`               | Bu pool'un sesleri için HRTF |
| `mixer@ mixer`            | Her yeni sese eklenen varsayılan mixer |
| `king_pack@ pack_file`    | Çağrı `null` geçtiğinde kullanılan varsayılan paket |

---

## 15. `voice_chat.nvgt` — Hazır 3B VoIP Yardımcısı

Oyuncu başına Opus decoder + spatialleştirilmiş streaming sound saran küçük bir sınıf. Her uzak oyuncunun harita üzerinde konumu olan multiplayer dünyalar için tasarlandı.

```angelscript
#include "voice_chat.nvgt"

// oyuncu katıldığında
spawn_voice_chat(px, py, pz, "kullanici_adi", "harita1");

// oyuncudan gelen her ağ paketi
int idx = get_voice_chat_index("kullanici_adi");
if (idx >= 0) voice_chats[idx].push_voice_data(packet_bytes);

// oyuncu hareket ettiğinde
update_voice_chat("kullanici_adi", yeni_x, yeni_y, yeni_z, "harita1");

// ana döngüde, frame başına
for (uint i = 0; i < voice_chats.length(); i++) {
    voice_chats[i].update_listener_position(me.x, me.y, me.z, facing);
}

// oyuncu ayrıldığında
remove_voice_chat("kullanici_adi");
```

Davranış notları:

- HRTF her `voice_chat` için zorunlu açık.
- 25 birim cull yarıçapı (kare mesafe > 2500): uzak oyuncuların paketleri hemen düşer.
- 300 ms aktivite zaman aşımı streaming sound'u otomatik kapatır (bağlantısı kopmuş oyuncu susar).
- Konuşmacı arkanızdaysa pitch `behind_pitch_decrease` (varsayılan 5) kadar düşer.
- Sınıf ayrıca `update_voice_chat`'tan `apply_effects(...)`'i çağırır ve harita sisteminizden `map_get_fx_list_from_location(...)` yardımcısı bekler. Yoksa `apply_effects`'i düzenleyin veya stub'layın.

---

## 16. Uçtan Uca Ses Sohbet Bağlantısı (Gönderici Taraf)

```angelscript
king_microphone mic;
mic.sample_rate = 48000;
mic.channels    = 1;
mic.start();

int enc = opus_encoder_create(48000, 1);              // 24 kbps varsayılan
opus_encoder_set_packet_loss(enc, 8);                 // bu ağda %8 kayıp bekle

while (oyun_calisiyor) {
    string pcm = mic.get_data();                      // son döngüden beri yeni ses
    if (pcm.length() > 0) {
        string pkt = opus_encode(enc, pcm);
        if (pkt.length() > 0) network_send(pkt);
    }
    wait(20);                                         // 20 ms frame ile eşleş
}
```

Alıcı taraf: yukarıdaki `voice_chat.nvgt` örneğine bakın.

---

## 17. Volume ve Mesafe Referansı

- **Sound volume:** -100 dB (sessiz) … 0 dB (tam). Legacy NVGT/BGT ile aynı ölçek.
- **Mixer volume:** -100 … 0 dB.
- **Master volume:** 0 (sessiz) … 100 (tam), lineer yüzde.
- **HRTF:** mesafe azalması Steam Audio içinde yapılır.
- **HRTF olmayan 3B yol:** sadece `set_position()` en az bir kez çağrıldığında etkinleşir. Düz FMOD rolloff kullanır → mesafe azalması tamamen manuel (`base_volume_db + dist_amp` `set_position` içinde birleşir).
- **2B / UI sesleri:** `set_position()` hiç çağrılmazsa mükemmel merkezde kalırlar.

---

## 18. Sık Yapılan Hatalar

1. **`set_fx`'i `play`'den sonra çağırmak** → efektler kaybolur. Daima `load → set_fx → play`.
2. **`king_system_update()`'i unutmak** → 3B güncellemeler donar veya gecikir.
3. **`set_listener`'ı her ses için ayrı çağırmak** → son çağrı kazanır; ana döngüden VEYA SON sound_pool güncellemesinden frame başına BİR KEZ çağırın.
4. **Rotasyonu `calculate_theta()` ile sarmak** → rotasyon zaten derece, çift dönüşüm yaparsınız.
5. **HRTF'siz stereo dosyaya 3B konumlandırma** → FMOD klasik 3B stereo'yu mono'ya çöker. Ya HRTF kullanın ya mono'yu kabul edin.
6. **Her pakette yeni Opus encoder oluşturmak** → pahalı. Bir kez oluştur, tekrar kullan.
7. **Kayıt sırasında `mic.sample_rate = X`** → görmezden gelinir. Durdur, değiştir, başlat.
8. **master_volume'u 100'ün üstüne çıkarmak** → 100'e clamp edilir. Yükseltmek için pozitif dB'li `fader` fx kullanın.

---

## 19. Dosya Düzeni (yayınlanan)

```
king_audio_engine.dll                       — eklenti
king_audio_engine/includes/sound_pool.nvgt  — yüksek seviye pool
king_audio_engine/includes/voice_chat.nvgt  — 3B VoIP yardımcısı
king_audio/king_audio_engine_TR.md          — bu doküman
king_audio/king_audio_engine_EN.md          — İngilizce versiyon
king_audio/test_*.nvgt                      — test/örnek script'ler
```

(plus eklentinin yanındaki FMOD / Phonon yardımcı DLL'leri)

---

## 20. Durum

| Özellik | Durum |
|---------|-------|
| WAV / OGG / MP3 / FLAC oynatma | ✅ |
| Streaming, push_memory PCM | ✅ |
| 3B konumlandırma (HRTF + non-HRTF) | ✅ |
| Mixer hiyerarşisi & yönlendirme | ✅ |
| Reverb (preset + özel) | ✅ |
| 27+ DSP efekti | ✅ |
| Master EQ + master volume | ✅ |
| Mikrofon yakalama + monitor | ✅ |
| Opus encode/decode (PCM16 + float) | ✅ |
| Sound environment duvar/materyal | ✅ |
| Paket dosyaları (şifrelenmiş) | ✅ |
| Convolution reverb | ⚠️ bazı IR'lerde crash olabilir |
| Phonon dikey (Z) akustik | ⚠️ yükseklik algısı revize ediliyor |
