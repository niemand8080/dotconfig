# Karabiner

## Complex Modifications

Just some complex modifications for Karabiner I use, so I can copypasta them...

### Right cmd + left cmd

```json
{
    "description": "Right cmd + left cmd to focus Ghostty and hidding other apps",
    "manipulators": [
        {
            "from": {
                "key_code": "right_command",
                "modifiers": { "mandatory": ["left_command"] }
            },
            "to": [
                { "software_function": { "open_application": { "file_path": "/Applications/Ghostty.app" } } },
                {
                    "key_code": "h",
                    "modifiers": ["command", "option"]
                }
            ],
            "type": "basic"
        }
    ]
}
```

### Caps Lock

```json
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
```

### Swap <> and ^° keys

```json
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
```
