return {
    'saghen/blink.cmp',
    version = '1.*',
    opts = {
        keymap = {
            preset = 'default',
        },
        appearance = {
            nerd_font_variant = 'mono'
        },
        completion = {
            documentation = { auto_show = true },
            accept = {
                auto_brackets = {
                    enabled = true,
                },
            },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
        signature = { enabled = true },
    },
}
