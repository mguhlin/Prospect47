-- Advanced Geological Scanner, survey markers, and the anomaly waypoint.
-- Scanning turns exploration into a deliberate geology loop (Phase 2).

local SCAN_RADIUS = 8

-- Ore group -> friendly label, in report order.
local ORE_GROUPS = {
  {group = "iron", label = "Iron"},
  {group = "copper", label = "Copper"},
  {group = "silicon", label = "Silicon"},
  {group = "titanium", label = "Titanium"},
  {group = "water_ice", label = "Water ice"},
}

local function count_group(positions, group)
  local total = 0
  for _, pos in ipairs(positions) do
    local node = minetest.get_node(pos)
    local def = minetest.registered_nodes[node.name]
    if def and def.groups and (def.groups[group] or 0) > 0 then
      total = total + 1
    end
  end
  return total
end

local function scan(player)
  local origin = vector.round(player:get_pos())
  local minp = vector.subtract(origin, SCAN_RADIUS)
  local maxp = vector.add(origin, SCAN_RADIUS)

  p47.notify(player, "SCANNER: Survey complete within " .. SCAN_RADIUS .. " m.")
  local meta = player:get_meta()
  meta:set_int("p47_scanned", 1)
  local kinds = 0
  for _, entry in ipairs(ORE_GROUPS) do
    local positions = minetest.find_nodes_in_area(minp, maxp, "group:" .. entry.group)
    if #positions > 0 then
      kinds = kinds + 1
      p47.notify(player, "  " .. entry.label .. ": " .. #positions .. " nodes")
    end
  end
  if kinds == 0 then
    p47.notify(player, "  No mapped deposits in range.")
  elseif kinds >= 2 then
    -- Two or more deposit types in one scan counts as a mapped survey grid.
    meta:set_int("p47_mapped", 1)
  end

  -- The deep signal only surfaces on the scanner once the Pathfinder has
  -- climbed Survey Ridge, matching the campaign's "second signal" beat. Its
  -- position is a known landmark, so no expensive area search is needed.
  local anomaly = p47.landmarks and p47.landmarks.anomaly
  if anomaly and meta:get_int("p47_reached_ridge") == 1 then
    local depth = math.floor(vector.distance(origin, anomaly))
    p47.notify(player, "SCANNER: Unknown crystalline signature detected ~" ..
      depth .. " m away. Signature: violet. Origin: below surface.")
    p47.set_waypoint(player, "anomaly", anomaly, "Unknown Signal", p47.colors.violet)
    meta:set_int("p47_anomaly_seen", 1)
  end

  return true
end

minetest.register_tool("p47_scanner:scanner", {
  description = "Advanced Geological Scanner",
  inventory_image = "p47_scanner.png",
  on_use = function(_, user)
    if user and user:is_player() then scan(user) end
    return nil
  end,
})

-- Survey markers: placeable posts the player raises to lock a survey grid.
minetest.register_node("p47_scanner:survey_marker", {
  description = "Survey Marker",
  drawtype = "plantlike",
  paramtype = "light",
  sunlight_propagates = true,
  walkable = false,
  tiles = {"p47_survey_marker.png"},
  inventory_image = "p47_survey_marker.png",
  wield_image = "p47_survey_marker.png",
  light_source = 5,
  selection_box = {type = "fixed", fixed = {-0.2, -0.5, -0.2, 0.2, 0.5, 0.2}},
  groups = {oddly_breakable_by_hand = 1, survey_marker = 1},
  on_construct = function(pos)
    minetest.get_meta(pos):set_string("infotext", "Survey Marker")
  end,
})

minetest.register_craft({
  output = "p47_scanner:survey_marker 3",
  recipe = {
    {"p47_resources:copper_chunk"},
    {"p47_resources:iron_chunk"},
    {"p47_resources:iron_chunk"},
  },
})

minetest.register_craft({
  output = "p47_scanner:scanner",
  recipe = {
    {"", "p47_resources:silicon_wafer", ""},
    {"p47_resources:silicon_wafer", "p47_resources:copper_chunk", "p47_resources:silicon_wafer"},
    {"", "p47_resources:iron_chunk", ""},
  },
})

minetest.register_on_newplayer(function(player)
  local inventory = player:get_inventory()
  inventory:add_item("main", "p47_scanner:scanner")
  inventory:add_item("main", "p47_scanner:survey_marker 6")
end)
