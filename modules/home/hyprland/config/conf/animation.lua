for k, v in ipairs{ "windows", "layers", "zoomFactor" } do
  hl.animation{ leaf = v, enabled = false }
end

for k, v in ipairs{
  [10] = "border",
  [8] = "borderangle",
  [7] = "fade",
  [6] = "workspaces",
} do
  hl.animation{ leaf = v, enabled = true, speed = k, curve = "default" }
end
