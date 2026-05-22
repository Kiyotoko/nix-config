hl.config({
  general = {
      gaps_in  = 6,
      gaps_out = 6,

      border_size = 3,

      col = {
        active_border = "rgba(ffffff00)",
        inactive_border = "rgba(ffffff00)",
      },

      -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
      resize_on_border = true,

      -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
      allow_tearing = false,

      layout = "dwindle",
  }
})
