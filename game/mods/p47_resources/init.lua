-- Prospect 47 terrain, resource nodes, refined materials, and early station gear.

local function register_node(name, description, texture, groups, extra)
  local def = {
    description = description,
    tiles = {texture},
    groups = groups,
  }
  if extra then
    for key, value in pairs(extra) do def[key] = value end
  end
  minetest.register_node("p47_resources:" .. name, def)
end

-- Surface and structural terrain -------------------------------------------

register_node("regolith", "Carbonaceous Regolith", "p47_regolith.png", {
  cracky = 3, oddly_breakable_by_hand = 2, asteroid_surface = 1,
})

register_node("asteroid_rock", "Asteroid Rock", "p47_asteroid_rock.png", {
  cracky = 2, asteroid_rock = 1,
})

register_node("ridge_stone", "Survey Ridge Stone", "p47_asteroid_rock.png^[colorize:#5a4a3a:60", {
  cracky = 2, asteroid_rock = 1, survey_ridge = 1,
})

register_node("landing_plate", "Wayfarer Landing Plate", "p47_landing_plate.png", {
  cracky = 1, level = 1,
})

-- Ore nodes ----------------------------------------------------------------

register_node("iron_ore", "Iron-bearing Rock", "p47_iron_ore.png", {
  cracky = 2, ore = 1, iron = 1,
})

register_node("copper_ore", "Copper-bearing Rock", "p47_copper_ore.png", {
  cracky = 2, ore = 1, copper = 1,
})

register_node("silicon_ore", "Silicate Deposit", "p47_silicon_ore.png", {
  cracky = 2, ore = 1, silicon = 1,
})

register_node("titanium_ore", "Titanium-bearing Rock", "p47_titanium_ore.png", {
  cracky = 3, ore = 1, titanium = 1,
})

register_node("water_ice", "Subsurface Water Ice", "p47_water_ice.png", {
  cracky = 2, crumbly = 1, ore = 1, water_ice = 1,
}, {
  light_source = 3,
  use_texture_alpha = "opaque",
})

-- The buried anomaly. Faint violet glow, marked but not yet harvestable.
register_node("aetherium_signal", "Unknown Crystalline Signature", "p47_aetherium_signal.png", {
  cracky = 1, level = 2, anomaly = 1,
}, {
  light_source = 6,
})

-- Refined materials --------------------------------------------------------

local function register_chunk(name, description, image)
  minetest.register_craftitem("p47_resources:" .. name, {
    description = description,
    inventory_image = image,
  })
end

register_chunk("iron_chunk", "Iron Chunk", "p47_iron_chunk.png")
register_chunk("copper_chunk", "Copper Chunk", "p47_copper_chunk.png")
register_chunk("silicon_wafer", "Silicon Wafer", "p47_silicon_wafer.png")
register_chunk("titanium_ingot", "Titanium Ingot", "p47_titanium_ingot.png")
register_chunk("water_canister", "Water Canister", "p47_water_canister.png")

local hand_refine = {
  {"iron_ore", "iron_chunk"},
  {"copper_ore", "copper_chunk"},
  {"silicon_ore", "silicon_wafer"},
  {"titanium_ore", "titanium_ingot"},
  {"water_ice", "water_canister"},
}
for _, pair in ipairs(hand_refine) do
  minetest.register_craft({
    type = "shapeless",
    output = "p47_resources:" .. pair[2],
    recipe = {"p47_resources:" .. pair[1]},
  })
end

-- Early station gear -------------------------------------------------------

-- Storage crate: a working container the player can build to stash materials.
minetest.register_node("p47_resources:storage_crate", {
  description = "Storage Crate",
  tiles = {
    "p47_storage_crate_top.png", "p47_storage_crate_top.png",
    "p47_storage_crate.png",
  },
  groups = {cracky = 2, station = 1},
  on_construct = function(pos)
    local meta = minetest.get_meta(pos)
    meta:set_string("infotext", "Storage Crate")
    meta:get_inventory():set_size("main", 8 * 3)
  end,
  can_dig = function(pos)
    return minetest.get_meta(pos):get_inventory():is_empty("main")
  end,
  allow_metadata_inventory_move = function() return 99 end,
  allow_metadata_inventory_put = function() return 99 end,
  allow_metadata_inventory_take = function() return 99 end,
  on_rightclick = function(pos, _, clicker)
    local name = clicker:get_player_name()
    local location = "nodemeta:" .. pos.x .. "," .. pos.y .. "," .. pos.z
    minetest.show_formspec(name, "p47_resources:storage_crate",
      "size[8,7]" ..
      "list[" .. location .. ";main;0,0.3;8,3;]" ..
      "list[current_player;main;0,3.85;8,3;]" ..
      "listring[" .. location .. ";main]" ..
      "listring[current_player;main]")
  end,
})

-- Emergency beacon: original settlement light source and mission objective.
minetest.register_node("p47_resources:beacon", {
  description = "Communications Beacon",
  tiles = {"p47_beacon.png"},
  groups = {cracky = 2, station = 1, beacon = 1},
  light_source = 12,
  on_construct = function(pos)
    minetest.get_meta(pos):set_string("infotext", "Communications Beacon — active")
  end,
})

-- Crafting recipes for built gear ------------------------------------------

minetest.register_craft({
  output = "p47_resources:storage_crate",
  recipe = {
    {"p47_resources:iron_chunk", "p47_resources:iron_chunk", "p47_resources:iron_chunk"},
    {"p47_resources:iron_chunk", "", "p47_resources:iron_chunk"},
    {"p47_resources:iron_chunk", "p47_resources:iron_chunk", "p47_resources:iron_chunk"},
  },
})

-- Buildable in the landing zone: iron and copper only (no Phase 2 silicon).
minetest.register_craft({
  output = "p47_resources:beacon",
  recipe = {
    {"", "p47_resources:copper_chunk", ""},
    {"p47_resources:copper_chunk", "p47_resources:iron_chunk", "p47_resources:copper_chunk"},
    {"", "p47_resources:iron_chunk", ""},
  },
})
