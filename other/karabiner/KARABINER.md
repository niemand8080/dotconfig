# Karabiner

## Complex Modifications

Just some complex modifications for Karabiner I use, so I can copypasta them...

### For the leader-key app

I made this for the [leader-key](https://github.com/mikker/LeaderKey.app) app.

´´´json
{
    "description": "Right cmd + left cmd to fn + F12",
    "manipulators": [
        {
            "from": {
                "key_code": "right_command",
                "modifiers": { "mandatory": ["left_command"] }
            },
            "to": [
                {
                    "key_code": "f12",
                    "modifiers": ["fn"]
                }
            ],
            "type": "basic"
        }
    ]
},
´´´
### Caps Lock

Caps Lock is only useful for people who write lots of SQL qeuries.

´´´json
{
    "description": "Caps Lock to Escape (alone) / Control (held with other key)",
    "manipulators": [
        {
            "from": {
                "key_code": "caps_lock",
                "modifiers": { "optional": ["any"] }
            },
            "to": [{ "key_code": "left_control" }],
            "to_if_alone": [{ "key_code": "escape" }],
            "type": "basic"
        }
    ]
},
´´´

### Swap <> and ^° keys

I did this because they switched posiotion (I don't know why after adding the Caps Lock key bind.

´´´json
                    {
                        "description": "Swap <> and ^° keys",
                        "manipulators": [
                            {
                                "from": { "key_code": "grave_accent_and_tilde" },
                                "to": [{ "key_code": "non_us_backslash" }],
                                "type": "basic"
                            },
                            {
                                "from": { "key_code": "non_us_backslash" },
                                "to": [{ "key_code": "grave_accent_and_tilde" }],
                                "type": "basic"
                            },
                            {
                                "from": {
                                    "key_code": "grave_accent_and_tilde",
                                    "modifiers": { "mandatory": ["shift"] }
                                },
                                "to": [
                                    {
                                        "key_code": "non_us_backslash",
                                        "modifiers": ["shift"]
                                    }
                                ],
                                "type": "basic"
                            },
                            {
                                "from": {
                                    "key_code": "non_us_backslash",
                                    "modifiers": { "mandatory": ["shift"] }
                                },
                                "to": [
                                    {
                                        "key_code": "grave_accent_and_tilde",
                                        "modifiers": ["shift"]
                                    }
                                ],
                                "type": "basic"
                            }
                        ]
                    }
                ]
´´´
