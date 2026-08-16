-- Compact Prospect 47 asteroid: layered geology, Survey Ridge, and the buried
-- Aetherium anomaly. Generated over singlenode so the world stays deterministic.

minetest.set_mapgen_setting("mg_name", "singlenode", true)
minetest.register_alias("mapgen_singlenode", "air")

local center = {x = 0, y = 0, z = 0}
local radius = {x = 34, y = 24, z = 34}

-- Survey Ridge protrudes to the north-east so it reads as a distinct landmark.
local ridge_center = {x = 17, y = 18, z = -15}
local ridge_radius = {x = 12, y = 15, z = 11}

-- The anomaly sits deep in the core, directly beneath the landing zone.
local anomaly_center = {x = 0, y = -17, z = 2}

local function ellipsoid_depth(x, y, z, c, r)
  local dx = (x - c.x) / r.x
  local dy = (y - c.y) / r.y
  local dz = (z - c.z) / r.z
  return 1 - (dx * dx + dy * dy + dz * dz)
end

-- Deterministic pseudo-random in [0, 1) for a node, seeded per feature.
local function node_roll(x, y, z, salt)
  local hash = minetest.hash_node_position({x = x, y = y, z = z})
  return (math.abs(hash * 2654435761 + salt) % 100000) / 100000
end

-- Pick terrain content by depth so mining rewards deliberate descent.
local function pick_ore(x, y, z, depth, ids, ridge)
  local roll = node_roll(x, y, z, 17)

  if ridge then
    -- The ridge is copper- and silicon-rich to justify the survey climb.
    if depth > 0.10 and roll < 0.09 then return ids.copper end
    if depth > 0.18 and roll < 0.16 then return ids.silicon end
    if depth > 0.30 and roll < 0.19 then return ids.iron end
    if depth < 0.06 then return ids.regolith end
    return ids.ridge
  end

  -- Water ice forms clustered pockets at mid depth.
  if depth > 0.22 and depth < 0.7 and node_roll(x, y, z, 91) < 0.05 then
    return ids.ice
  end
  if depth >= 0.08 and depth < 0.40 and roll < 0.05 then return ids.iron end
  if depth >= 0.12 and depth < 0.45 and roll >= 0.05 and roll < 0.085 then return ids.copper end
  if depth >= 0.28 and depth < 0.72 and roll >= 0.085 and roll < 0.125 then return ids.silicon end
  if depth >= 0.55 and roll >= 0.125 and roll < 0.165 then return ids.titanium end
  if depth < 0.055 then return ids.regolith end
  return ids.rock
end

minetest.register_on_generated(function(minp, maxp)
  local reach_x = math.max(radius.x, ridge_center.x + ridge_radius.x)
  local reach_z = math.max(radius.z, math.abs(ridge_center.z) + ridge_radius.z)
  if maxp.x < -reach_x or minp.x > reach_x or
      maxp.y < -radius.y or minp.y > math.max(radius.y, ridge_center.y + ridge_radius.y) or
      maxp.z < -reach_z or minp.z > reach_z then
    return
  end

  local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
  local area = VoxelArea:new({MinEdge = emin, MaxEdge = emax})
  local data = vm:get_data()

  local ids = {
    air = minetest.get_content_id("air"),
    regolith = minetest.get_content_id("p47_resources:regolith"),
    rock = minetest.get_content_id("p47_resources:asteroid_rock"),
    ridge = minetest.get_content_id("p47_resources:ridge_stone"),
    iron = minetest.get_content_id("p47_resources:iron_ore"),
    copper = minetest.get_content_id("p47_resources:copper_ore"),
    silicon = minetest.get_content_id("p47_resources:silicon_ore"),
    titanium = minetest.get_content_id("p47_resources:titanium_ore"),
    ice = minetest.get_content_id("p47_resources:water_ice"),
    anomaly = minetest.get_content_id("p47_resources:aetherium_signal"),
    plate = minetest.get_content_id("p47_resources:landing_plate"),
  }

  for z = minp.z, maxp.z do
    for y = minp.y, maxp.y do
      for x = minp.x, maxp.x do
        local index = area:index(x, y, z)
        local body_depth = ellipsoid_depth(x, y, z, center, radius)
        local ridge_depth = ellipsoid_depth(x, y, z, ridge_center, ridge_radius)

        if ridge_depth >= 0 and ridge_depth >= body_depth then
          data[index] = pick_ore(x, y, z, ridge_depth, ids, true)
        elseif body_depth >= 0 then
          data[index] = pick_ore(x, y, z, body_depth, ids, false)
        else
          data[index] = ids.air
        end

        -- Buried anomaly: a small cluster only, discovered via scanning.
        if math.abs(x - anomaly_center.x) <= 1 and
            math.abs(y - anomaly_center.y) <= 1 and
            math.abs(z - anomaly_center.z) <= 1 then
          data[index] = ids.anomaly
        end

        -- Wayfarer landing platform.
        if y == 24 and x >= -5 and x <= 5 and z >= 4 and z <= 12 then
          data[index] = ids.plate
        end
      end
    end
  end

  vm:set_data(data)
  vm:write_to_map()
end)

-- Shared world coordinates other mods reference for waypoints and dialogue.
p47 = rawget(_G, "p47") or {}
p47.landmarks = {
  landing = {x = 0, y = 25, z = 8},
  survey_ridge = {x = ridge_center.x, y = ridge_center.y + ridge_radius.y - 2, z = ridge_center.z},
  anomaly = anomaly_center,
}
