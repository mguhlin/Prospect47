-- Data-driven campaign engine. Each mission is a table of objectives that read
-- from player metadata, so progress persists across browser reloads. Adding a
-- later area means appending one more entry to `missions`.

local function capped(meta, key, cap)
  return math.min(cap, meta:get_int(key))
end

local missions = {
  {
    code = "MISSION 01",
    title = "TOUCHDOWN",
    location = "Landing Zone",
    on_start = function(player)
      p47.notify(player, "SCOUT: Pathfinder link established. Let's secure the landing zone.")
    end,
    objectives = function(meta)
      return {
        {text = "Move away from Wayfarer", done = meta:get_int("p47_left_pad") == 1},
        {text = "Meet Scout", done = meta:get_int("p47_met_scout") == 1},
        {text = "Mine regolith " .. capped(meta, "p47_regolith", 3) .. "/3", done = meta:get_int("p47_regolith") >= 3},
        {text = "Mine iron " .. capped(meta, "p47_iron", 2) .. "/2", done = meta:get_int("p47_iron") >= 2},
        {text = "Craft and place a storage crate", done = meta:get_int("p47_crates") >= 1},
        {text = "Raise a communications beacon", done = meta:get_int("p47_beacons") >= 1},
      }
    end,
    on_complete = function(player)
      p47.notify(player, "MISSION CONTROL: Pathfinder, telemetry received. Prospect 47 is officially active. Begin settlement operations.")
      p47.notify(player, "REWARD: Portable Fabricator schematics unlocked.")
    end,
  },
  {
    code = "MISSION 02",
    title = "SURVEY RIDGE",
    location = "Survey Ridge",
    on_start = function(player)
      p47.notify(player, "SCOUT: Orbital scans flag a ridge to the north-east. Climb it and deploy survey gear.")
      if p47.landmarks then
        p47.set_waypoint(player, "objective", p47.landmarks.survey_ridge, "Survey Ridge", p47.colors.orange)
      end
    end,
    objectives = function(meta)
      return {
        {text = "Reach Survey Ridge", done = meta:get_int("p47_reached_ridge") == 1},
        {text = "Raise 3 survey markers " .. capped(meta, "p47_markers", 3) .. "/3", done = meta:get_int("p47_markers") >= 3},
        {text = "Scan the terrain", done = meta:get_int("p47_scanned") == 1},
        {text = "Map mineral deposits", done = meta:get_int("p47_mapped") == 1},
        {text = "Locate water ice", done = meta:get_int("p47_ice") >= 1},
        {text = "Mark the unknown signal", done = meta:get_int("p47_anomaly_seen") == 1},
        {text = "Build a communications relay", done = meta:get_int("p47_beacons") >= 2},
      }
    end,
    on_complete = function(player)
      p47.notify(player, "MISSION CONTROL: We see the anomaly. Do not prioritize it. Water and structural materials come first.")
      p47.notify(player, "SCOUT: I'll keep the violet marker on your map.")
      p47.notify(player, "REWARD: Advanced Geological Scanner recalibrated.")
      p47.clear_waypoint(player, "objective")
    end,
  },
}

local hud_ids = {}

local function active_index(meta)
  local idx = meta:get_int("p47_mission")
  if idx < 1 then idx = 1 end
  return idx
end

local function render(player, meta)
  local idx = active_index(meta)
  local mission = missions[idx]
  local lines
  if not mission then
    lines = "CAMPAIGN ONE\nSurvey complete — awaiting Iron Hollow"
  else
    local parts = {mission.code .. " · " .. mission.title}
    for _, obj in ipairs(mission.objectives(meta)) do
      table.insert(parts, (obj.done and "[x] " or "[ ] ") .. obj.text)
    end
    lines = table.concat(parts, "\n")
  end

  local name = player:get_player_name()
  local id = hud_ids[name]
  if id then
    player:hud_change(id, "text", lines)
  else
    hud_ids[name] = player:hud_add({
      type = "text",
      position = {x = 0.02, y = 0.12},
      alignment = {x = 1, y = 1},
      offset = {x = 0, y = 0},
      text = lines,
      number = p47.colors.cyan,
      scale = {x = 200, y = 200},
      style = 1,
    })
  end
end

-- Evaluate the active mission, advancing (and firing rewards) when it is done.
local function refresh(player)
  local meta = player:get_meta()
  if meta:get_int("p47_mission") < 1 then
    meta:set_int("p47_mission", 1)
    if missions[1].on_start then missions[1].on_start(player) end
  end

  local idx = active_index(meta)
  local mission = missions[idx]
  if mission then
    local complete = true
    for _, obj in ipairs(mission.objectives(meta)) do
      if not obj.done then complete = false break end
    end
    if complete then
      if mission.on_complete then mission.on_complete(player) end
      meta:set_int("p47_mission", idx + 1)
      local nxt = missions[idx + 1]
      if nxt and nxt.on_start then nxt.on_start(player) end
    end
  end

  render(player, meta)
end

-- Progress counters -------------------------------------------------------

local dig_counters = {
  ["p47_resources:regolith"] = {"p47_regolith", 3},
  ["p47_resources:iron_ore"] = {"p47_iron", 2},
  ["p47_resources:copper_ore"] = {"p47_copper", 99},
  ["p47_resources:silicon_ore"] = {"p47_silicon", 99},
  ["p47_resources:titanium_ore"] = {"p47_titanium", 99},
  ["p47_resources:water_ice"] = {"p47_ice", 99},
}

minetest.register_on_dignode(function(_, oldnode, digger)
  if not (digger and digger:is_player()) then return end
  local counter = dig_counters[oldnode.name]
  if not counter then return end
  local meta = digger:get_meta()
  meta:set_int(counter[1], math.min(counter[2], meta:get_int(counter[1]) + 1))
  refresh(digger)
end)

local place_counters = {
  ["p47_resources:storage_crate"] = {"p47_crates", 99},
  ["p47_resources:beacon"] = {"p47_beacons", 99},
  ["p47_scanner:survey_marker"] = {"p47_markers", 3},
}

minetest.register_on_placenode(function(_, newnode, placer)
  if not (placer and placer:is_player()) then return end
  local counter = place_counters[newnode.name]
  if not counter then return end
  local meta = placer:get_meta()
  meta:set_int(counter[1], math.min(counter[2], meta:get_int(counter[1]) + 1))
  refresh(placer)
end)

-- Location and proximity checks ------------------------------------------

local check_timer = 0
minetest.register_globalstep(function(delta)
  check_timer = check_timer + delta
  if check_timer < 0.5 then return end
  check_timer = 0

  for _, player in ipairs(minetest.get_connected_players()) do
    local meta = player:get_meta()
    local pos = player:get_pos()

    if meta:get_int("p47_left_pad") == 0 and
        vector.distance(pos, {x = 0, y = 24, z = 8}) > 10 then
      meta:set_int("p47_left_pad", 1)
    end

    if meta:get_int("p47_met_scout") == 0 then
      for _, object in ipairs(minetest.get_objects_inside_radius(pos, 3)) do
        local entity = object:get_luaentity()
        if entity and entity.name == "p47_scout:scout" then
          meta:set_int("p47_met_scout", 1)
          break
        end
      end
    end

    if meta:get_int("p47_reached_ridge") == 0 and p47.landmarks and
        vector.distance(pos, p47.landmarks.survey_ridge) < 8 then
      meta:set_int("p47_reached_ridge", 1)
      p47.notify(player, "SCOUT: Survey Ridge reached. Deploy the markers.")
    end

    refresh(player)
  end
end)

-- Photo mission: "First Footprints" — Wayfarer, a shelter, and the horizon.
if p47.register_photo_handler then
  p47.register_photo_handler(function(player, frame)
    local meta = player:get_meta()
    if meta:get_int("p47_photo_footprints") == 1 then return end
    if frame.on_landing and frame.station then
      meta:set_int("p47_photo_footprints", 1)
      p47.notify(player, "PHOTO MISSION COMPLETE — First Footprints archived.")
    end
  end)
end

minetest.register_on_joinplayer(function(player)
  minetest.after(1, refresh, player)
end)

minetest.register_on_leaveplayer(function(player)
  hud_ids[player:get_player_name()] = nil
end)
