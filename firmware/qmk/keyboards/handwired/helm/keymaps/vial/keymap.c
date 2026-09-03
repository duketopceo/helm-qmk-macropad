#include QMK_KEYBOARD_H

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [0] = LAYOUT_helm(
        KC_MUTE, KC_VOLU, KC_VOLD,
        KC_MPLY, KC_MNXT, KC_MPRV, KC_ENT
    ),
    [1] = LAYOUT_helm(
        KC_1, KC_2, KC_3,
        KC_4, KC_5, KC_6, KC_0
    ),
    [2] = LAYOUT_helm(
        KC_F1, KC_F2, KC_F3,
        KC_F4, KC_F5, KC_F6, KC_F7
    ),
    [3] = LAYOUT_helm(
        KC_NO, KC_NO, KC_NO,
        KC_NO, KC_NO, KC_NO, KC_NO
    )
};

#if defined(ENCODER_MAP_ENABLE)
const uint16_t PROGMEM encoder_map[][NUM_ENCODERS][2] = {
    [0] = { ENCODER_CCW_CW(KC_VOLD, KC_VOLU) },
    [1] = { ENCODER_CCW_CW(KC_NO,   KC_NO)   },
    [2] = { ENCODER_CCW_CW(KC_NO,   KC_NO)   },
    [3] = { ENCODER_CCW_CW(KC_NO,   KC_NO)   }
};
#endif
