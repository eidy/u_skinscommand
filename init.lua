 
minetest.register_chatcommand("setskin", {
	params = "",
	privs = {startlocation=true},
	description = "Set your skin name.",
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		if not player then
			return false, "Player not found"
		end

		u_skins.u_skins[name] = param
	    u_skins.update_player_skin(player)
        if minetest.get_modpath("multiskin") ~= nil then
                local skin = multiskin:get_player_skin(name)
				if skin then
					multiskin:set_player_textures(player, {skin=skin})
				end
        end
		return true  
	end,
})

 