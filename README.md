# 🚁 Tek Eksenli İtki Vektör Kontrol (TVC) Sisteminin Modellenmesi ve PID ile Stabilizasyonu

**Proje:** Pervane Tahrikli Sarkaç (Aero-Pendulum)  
**Tarih:** Aralık 2025 - Ocak 2026  

Bu proje kapsamında, tek eksenli bir aero-sarkaç sisteminin mekanik tasarımı yapılmış, matematiksel modeli çıkarılmış ve MATLAB/Simulink ortamında tasarlanan PID kontrolcü ile gerçek zamanlı stabilizasyonu sağlanmıştır.

## 🛠️ Kullanılan Teknolojiler
* **Yazılım & Kontrol:** MATLAB / Simulink, Arduino (C++)
* **Mekanik Tasarım:** SolidWorks, 3D Yazıcı (FDM)
* **Donanım:** BLDC Motor, Pervane, Sensör Entegrasyonu

---

## 🚀 Proje Geliştirme Süreci

### 1. Sistem Modelleme ve Açık Çevrim Analizi
* Sarkacın fiziksel parametreleri (250 mm kol uzunluğu, 85 gr kütle vb.) kullanılarak sistemin Transfer Fonksiyonu elde edilmiştir.
* Kök-Yer (Root Locus) analizi ile sistemin kararlılık sınırları incelenmiş; basamak, rampa ve parabolik girişlere karşı açık çevrim yanıtları simüle edilmiştir.

### 2. PID Kontrolcü Tasarımı ve Optimizasyon
Sistemin kararlı hal hatasını gidermek ve dinamik referans takibini sağlamak için kapalı çevrim PID denetleyici tasarlanmıştır:
* **Kontrol Katsayıları:** Kp = 0.17689, Ki = 0.90333, Kd = 0.0086598
* **Ölü Bölge (Dead-zone) Telafisi:** Motor sürtünmeleri ve eylemsizliği aşmak için 1085 PWM başlangıç (bias) sinyali entegre edilmiştir.
* **Güvenlik (Saturation):** Donanım hasarını önlemek adına PWM sinyali 1000-1150 aralığında sınırlandırılmıştır.

### 3. Performans ve Sonuçlar
Tasarlanan kontrolcü ile sistemin tepki hızı ve stabilitesi maksimize edilmiştir:
* **Yükselme Süresi (Rise Time):** 0.12 saniye (Yüksek çeviklik)
* **Oturma Süresi (Settling Time):** 0.63 saniye 
* **Maksimum Aşım (Overshoot):** Sadece %1.91 (Güvenli sönümleme)

---

## 💻 Kaynak Kodlar ve Simülasyonlar

Sistemin matematiksel modellemesi, açık/kapalı çevrim analizleri ve PID optimizasyonu için geliştirilen MATLAB kodlarına aşağıdaki bağlantılardan ulaşabilirsiniz:

* 📄 **[yerkokegrisi.m](yerkokegrisi.m):** Sistemin transfer fonksiyonunun oluşturulması ve kararlılık (Root Locus) analizi.
* 📄 **[acikcevrimrampaparabolkodu.m](acikcevrimrampaparabolkodu.m):** Sistemin basamak (step), rampa ve parabolik girişlere verdiği açık çevrim yanıtlarının simülasyonu.
* 📄 **[Kapali_Cevrim_Kodu.m](Kapali_Cevrim_Kodu.m):** PID denetleyici (Kp, Ki, Kd) entegre edilmiş kapalı çevrim sistemin dinamik referans takibi ve performans analizi.

**Örnek Kod Kesiti (Transfer Fonksiyonu ve Kararlılık):**
```matlab
% Sarkaç Sistemi Transfer Fonksiyonu
num = 2.31;
den = [0.0025, 0.02, 0.205];
sys = tf(num, den);

% Yer-Kök Eğrisi (Root Locus) Analizi
figure;
rlocus(sys);
title('Sarkaç Sistemi Kararlılık Analizi');
