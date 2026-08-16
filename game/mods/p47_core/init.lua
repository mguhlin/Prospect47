p47 = rawget(_G, "p47") or {}
p47.version = "0.2.0-dev"
p47.colors = {
  cyan = 0x32D8FF,
  orange = 0xFFAD20,
  violet = 0xA55BFF,
}

-- Player environment: an airless asteroid under a dense starfield.
minetest.register_on_joinplayer(function(player)
  player:set_sky({
    base_color = "#02050d",
    type = "plain",
    clouds = false,
  })
  player:set_sun({visible = false, sunrise_visible = false})
  player:set_moon({visible = false})
  player:set_stars({visible = true, count = 1800, star_color = "#d9f4ff"})
  player:set_properties({eye_height = 1.62})
end)

minetest.register_on_newplayer(function(player)
  player:set_pos({x = 0, y = 34, z = 8})
end)

-- Shared HUD helpers so every mod speaks with one voice ---------------------

-- Send a short, styled status line to a player's chat log.
function p47.notify(player, message)
  if not player then return end
  minetest.chat_send_player(player:get_player_name(), message)
end

-- Persistent named waypoints, keyed so a mod can move or clear its own marker
-- without disturbing another mod's markers.
local waypoints = {}

function p47.set_waypoint(player, key, pos, label, color)
  if not (player and pos) then return end
  local name = player:get_player_name()
  waypoints[name] = waypoints[name] or {}
  local existing = waypoints[name][key]
  if existing then
    player:hud_change(existing, "world_pos", pos)
    player:hud_change(existing, "name", label)
    return existing
  end
  local id = player:hud_add({
    type = "waypoint",
    name = label,
    text = "m",
    number = color or p47.colors.cyan,
    world_pos = pos,
  })
  waypoints[name][key] = id
  return id
end

function p47.clear_waypoint(player, key)
  local name = player:get_player_name()
  local set = waypoints[name]
  if set and set[key] then
    player:hud_remove(set[key])
    set[key] = nil
  end
end

minetest.register_on_leaveplayer(function(player)
  waypoints[player:get_player_name()] = nil
end)
