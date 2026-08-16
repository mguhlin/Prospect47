minetest.register_tool("p47_tools:field_pick", {
  description = "Pathfinder Field Pick",
  inventory_image = "p47_field_pick.png",
  tool_capabilities = {
    full_punch_interval = 1.0,
    max_drop_level = 1,
    groupcaps = {
      cracky = {times = {[1] = 2.8, [2] = 1.4, [3] = 0.7}, uses = 80, maxlevel = 1},
    },
    damage_groups = {fleshy = 2},
  },
})

minetest.register_on_newplayer(function(player)
  local inventory = player:get_inventory()
  inventory:add_item("main", "p47_tools:field_pick")
  inventory:add_item("main", "p47_resources:landing_plate 12")
end)

