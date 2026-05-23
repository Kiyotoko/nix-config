hl.config{
  xwayland = {
    force_zero_scaling = true
  }
}
hl.env("GTK_SCALE", 1)

require("conf/animation")
require("conf/autostart")
require("conf/decoration")
require("conf/keybinding")
require("conf/keyboard")
require("conf/monitor")
require("conf/window")
