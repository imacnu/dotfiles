#pragma once

/* Select hand configuration */
#define MASTER_LEFT
#define TAPPING_TERM 200
//#define MASTER_RIGHT
//#define EE_HANDS

#ifdef RGBLIGHT_ENABLE
#    define RGBLIGHT_ANIMATIONS
#    define RGBLIGHT_HUE_STEP 8 // number of steps to cycle through the hue by
#    define RGBLIGHT_SAT_STEP 20 // number of steps to increment the saturation by
#    define RGBLIGHT_VAL_STEP 20 // number of steps to increment the brightness by
#    define RGBLIGHT_SLEEP //  the RGB lighting will be switched off when the host goes to sleep
#endif
