
village_spawn = {}

-- the spawn building does not need any replacements
village_spawn.replacements_spawn = function( housetype, pr, replacements )
	-- change this if you want to change the main material of the spawn house
	table.insert( replacements, {'default:brick',         'default:brick' });
	table.insert( replacements, {'moreblocks:slab_brick', 'stairs:slab_brick' });
	-- change this if you want another roof
	table.insert( replacements, {'stairs:stair_stone',    'stairs:stair_stone'});
	table.insert( replacements, {'moreblocks:slab_stone', 'stairs:slab_stone' });
	table.insert( replacements, {'stairs:slab_stone',     'stairs:slab_stone' });
	-- the house was built with moreblocks beeing enabled
	table.insert( replacements, {'moreblocks:slab_wood',  'stairs:slab_wood' });
	table.insert( replacements, {'moreblocks:slab_sandstonebrick', 'stairs:slab_sandstonebrick' });
	return replacements;
end

-- add a new village type for all those buildings
mg_villages.add_village_type( 'spawn', { min = 25, max = 30,  space_between_buildings=1, mods={}, texture = 'wool_red.png',
		name_prefix = "Spawn house at ",
		replacement_function = village_spawn.replacements_spawn});

local path = minetest.get_modpath( 'village_spawn' )..'/schems/';

-- the spawn building itself
mg_villages.add_building( { scm="spawn_town_hall_2_0", mts_path=path, weight={spawn=3}, pervillage=1, typ='spawn', inh=0});

-- Important: at least one other type of building has to be there so that the mod can work (in this case: an empty plot)

-- empty plot (just so that there is one other building; can be bought by players if they want to)
mg_villages.add_building( { scm="empty_5x5", mts_path=path, weight={spawn=1/2}, typ='empty5x5', inh=0});
-- some trees now and then are nice to look at
mg_villages.add_building( { scm="empty_with_tree_1_0", mts_path=path, weight={spawn=1/8}, typ='empty5x5', inh=0});
-- empty plots which your players can buy
mg_villages.add_building( { scm="empty_6x12_1_0",      mts_path=path, weight={spawn=1/4}, typ='empty6x12',  inh=0});
mg_villages.add_building( { scm="empty_8x8_1_0",       mts_path=path, weight={spawn=1/4}, typ='empty8x8',   inh=0});
mg_villages.add_building( { scm="empty_16x16_1_0",     mts_path=path, weight={spawn=1/4}, typ='empty16x16', inh=0});
-- places where all players can build
mg_villages.add_building( { scm="public_farm_2_0",     mts_path=path, weight={spawn=2}, pervillage=1, typ='allmende', inh=0});
