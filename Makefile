ARCHS = arm64
DEBUG = 0
FINALPACKAGE = 1
FOR_RELEASE = 1

# İşlemci çekirdeklerini otomatik algılayıp Theos'un paralel derlemesini zorlar
MAKEFLAGS += -j$(shell sysctl -n hw.ncpu)

include $(THEOS)/makefiles/common.mk
TWEAK_NAME = ESP

ESP_FRAMEWORKS = IOKit UIKit Foundation Security QuartzCore CoreGraphics CoreText AVFoundation Accelerate GLKit SystemConfiguration GameController

# Performans ve hız optimizasyon bayrakları (-O3 eklendi)
ESP_CCFLAGS = -w -std=gnu++14 -fno-rtti -fno-exceptions -DNDEBUG -Wno-module-import-in-extern-c -O3
ESP_CFLAGS = -w -fobjc-arc -Wno-deprecated-declarations -Wno-unused-variable -Wno-unused-value -O3

# SDK ve Tweak dosyaları
ESP_FILES = $(wildcard ESP/*.mm) $(wildcard ESP/*.cpp) $(wildcard SDK/*.cpp) $(wildcard ESP/imgui/*.mm) $(wildcard ESP/imgui/*.cpp)

include $(THEOS_MAKE_PATH)/tweak.mk
