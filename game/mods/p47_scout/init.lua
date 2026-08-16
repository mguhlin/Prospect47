-- Scout: the Pathfinder Exploration Robot. A calm, dryly precise companion
-- whose remarks shift with campaign progress.

local lines_by_mission = {
  [1] = {
    "SCOUT: Surface stability within acceptable limits.",
    "SCOUT: Probability that anyone has stood here before: approximately zero.",
    "SCOUT: Mine what you can reach, then raise a beacon so Control can hear us.",
  },
  [2] = {
    "SCOUT: The ridge holds copper and silicon. Worth the climb.",
    "SCOUT: Deploy survey markers and let the scanner map the grid.",
    "SCOUT: The violet reading is still there. Deep. I am keeping it marked.",
  },
}

local function mission_index(clicker)
  local idx = clicker:get_meta():get_int("p47_mission")
  if idx < 1 then idx = 1 end
  return idx
end

local function speak(clicker)
  local set = lines_by_mission[mission_index(clicker)] or lines_by_mission[1]
  local meta = clicker:get_meta()
  local turn = meta:get_int("p47_scout_line") % #set
  meta:set_int("p47_scout_line", turn + 1)
  minetest.chat_send_player(clicker:get_player_name(), set[turn + 1])
end

minetest.register_entity("p47_scout:scout", {
  initial_properties = {
    visual = "cube",
    visual_size = {x = 0.65, y = 0.65},
    textures = {
      "p47_scout_side.png", "p47_scout_side.png", "p47_scout_top.png",
      "p47_scout_bottom.png", "p47_scout_face.png", "p47_scout_side.png",
    },
    physical = true,
    collide_with_objects = true,
    collisionbox = {-0.35, -0.35, -0.35, 0.35, 0.35, 0.35},
    glow = 5,
    nametag = "SCOUT",
    nametag_color = "#32d8ff",
    static_save = true,
  },
  on_rightclick = function(_, clicker)
    if clicker and clicker:is_player() then speak(clicker) end
  end,
})

local function ensure_scout()
  local position = {x = 5, y = 27, z = 8}
  local nearby = minetest.get_objects_inside_radius(position, 2)
  for _, object in ipairs(nearby) do
    local entity = object:get_luaentity()
    if entity and entity.name == "p47_scout:scout" then return end
  end
  minetest.add_entity(position, "p47_scout:scout")
end

minetest.register_on_joinplayer(function()
  minetest.after(2, ensure_scout)
end)
