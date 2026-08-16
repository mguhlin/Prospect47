-- SpaceCam: an in-world camera used for the campaign's photo missions.
-- The engine's own screenshot key saves the image; SpaceCam frames the shot
-- and lets missions react to what the Pathfinder chose to capture.

local photo_handlers = {}

-- Missions register here to be told when, and on what, a photo was taken.
function p47.register_photo_handler(handler)
  table.insert(photo_handlers, handler)
end

-- Describe roughly what fills the frame, so photo objectives can validate it.
local function frame_contents(player)
  local origin = vector.round(player:get_pos())
  local radius = 12
  local minp = vector.subtract(origin, radius)
  local maxp = vector.add(origin, radius)
  return {
    pos = origin,
    beacon = #minetest.find_nodes_in_area(minp, maxp, "group:beacon") > 0,
    station = #minetest.find_nodes_in_area(minp, maxp, "group:station") > 0,
    on_landing = minetest.find_node_near(origin, radius, "p47_resources:landing_plate") ~= nil,
  }
end

minetest.register_tool("p47_spacecam:spacecam", {
  description = "SpaceCam",
  inventory_image = "p47_spacecam.png",
  on_use = function(_, user)
    if not (user and user:is_player()) then return nil end
    local frame = frame_contents(user)
    p47.notify(user, "SPACECAM: Shot framed. Press the screenshot key to save the image.")
    for _, handler in ipairs(photo_handlers) do
      handler(user, frame)
    end
    return nil
  end,
})

minetest.register_craft({
  output = "p47_spacecam:spacecam",
  recipe = {
    {"p47_resources:titanium_ingot", "p47_resources:silicon_wafer", "p47_resources:titanium_ingot"},
    {"p47_resources:silicon_wafer", "p47_resources:copper_chunk", "p47_resources:silicon_wafer"},
  },
})

minetest.register_on_newplayer(function(player)
  player:get_inventory():add_item("main", "p47_spacecam:spacecam")
end)
