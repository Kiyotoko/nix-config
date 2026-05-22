hl.config{
  decoration = {
      rounding       = 5,

      -- Change transparency of focused and unfocused windows
      active_opacity   = 1.0,
      inactive_opacity = 1.0,

      shadow = {
        enabled      = false,
        range        = 4,
        render_power = 3,
        color        = 0xee1a1a1a,
      },

      blur = {
        enabled   = false,
        size      = 3,
        passes    = 1,
        vibrancy  = 0.1696,
      },
  },
}