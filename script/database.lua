dofile "utilities.lua"

--pairs of maps
map_pairs = {
	{{"Route 9"},{"Route 10",0,0,25,11}}, --I know it is a duplicate. I want to give Route 10 priority before Cerulean about the pokecenter
	{{"Bike Road Stop"},{"Route 18"}},
	{{"Blackthorn City"},{"Dragons Den Entrance"}},
	{{"Blackthorn City"},{"Pokecenter Blackthorn"}},
	{{"Celadon City"},{"Pokecenter Celadon"}},
	{{"Celadon City"},{"Route 7"}},
	{{"Celadon City"},{"Route 16"}},
	{{"Cerulean City"},{"Pokecenter Cerulean"}},
	{{"Cerulean City"},{"Route 4"}},
	{{"Cerulean City"},{"Route 5"}},
	{{"Cerulean City"},{"Route 9"}},
	{{"Cinnabar Island"},{"Pokecenter Cinnabar"}},
	{{"Cinnabar Island"},{"Cinnabar mansion 1"}},
	{{"Cinnabar Island"},{"Route 20",0,36,1000,1000}}, --0,36 to island, 45,28 to route
	{{"Cinnabar Island"},{"Route 21"}},
	{{"Cinnabar mansion 1"},{"Cinnabar mansion 2"}},
	{{"Cinnabar mansion 2"},{"Cinnabar mansion 3"}},
	{{"Digletts Cave"},{"Digletts Cave Entrance 1"}},
	{{"Digletts Cave"},{"Digletts Cave Entrance 2"}},
	{{"Digletts Cave Entrance 1"},{"Route 2",0,0,45,90}},
	{{"Digletts Cave Entrance 2"},{"Route 11"}},
	{{"Dragons Den"},{"Dragons Den Entrance"}},
	{{"Fuchsia City"},{"Fuchsia City Stop House"}},
	{{"Fuchsia City"},{"Pokecenter Fuchsia"}},
	{{"Fuchsia City"},{"Route 18"}},
	{{"Fuchsia City Stop House"},{"Route 19"}},
	{{"Fuchsia City"},{"Route 15 Stop House"}},
	{{"Fuchsia City"},{"Safari Stop"}},
	{{"Fuchsia City Stop House"},{"Route 19"}},
	{{"Indigo Plateau"},{"Indigo Plateau Center"}},
	{{"Indigo Plateau"},{"Victory Road Kanto 3F"}},
	{{"Lavender Town"},{"Pokecenter Lavender"}},
	{{"Lavender Town"},{"Pokemon Tower 1F"}},
	{{"Pokemon Tower 1F"},{"Pokemon Tower 2F"}},
	{{"Pokemon Tower 2F"},{"Pokemon Tower 3F"}},
	{{"Pokemon Tower 3F"},{"Pokemon Tower 4F"}},
	{{"Pokemon Tower 4F"},{"Pokemon Tower 5F"}},
	{{"Pokemon Tower 5F"},{"Pokemon Tower 6F"}},
	{{"Pokemon Tower 6F"},{"Pokemon Tower 7F"}},
	{{"Lavender Town"},{"Route 8"}},
	{{"Lavender Town"},{"Route 10",0,43,100,100}},
	{{"Lavender Town"},{"Route 12"}}, --Only if passed snorlax
	{{"Mt. Moon B1F",53,15,100,35},{"Mt. Moon 1F"}}, --cell 21,20 to get to Mt. Moon B1F
	{{"Mt. Moon B1F",53,15,100,35},{"Mt. Moon B2F"}}, --56,34 for to b2f 38,40 fot to b1f
	{{"Mt. Moon B1F",31,18,43,21},{"Mt. Moon B2F"}}, --17,27 for to b1f and 32,21 for to b2f
	{{"Mt. Moon B1F",31,18,43,21},{"Mt. Moon Exit"}},
	{{"Mt. Moon 1F"},{"Route 3"}}, 
	{{"Mt. Moon Exit"},{"Route 4"}},
	{{"Mt. Silver Exterior"},{"Mt. Silver Pokecenter"}},
	{{"Pallet Town"},{"Route 1"}},
	{{"Pallet Town"},{"Route 21"}},
	{{"Pewter City"},{"Pokecenter Pewter"}},
	{{"Pewter City"},{"Route 2",0,0,45,90}},
	{{"Pewter City"},{"Route 3"}},
	{{"Pokecenter Route 3"},{"Route 3"}},
	{{"Pokecenter Route 10"},{"Route 10",0,0,25,11}},
	{{"Pokecenter Vermilion"},{"Vermilion City"}},
	{{"Pokecenter Saffron"},{"Saffron City"}},
	{{"Pokecenter Viridian"},{"Viridian City"}},
	{{"Rock Tunnel 1",33,0,100,18},{"Route 10",0,0,25,11}}, 
	{{"Rock Tunnel 1",33,0,100,18},{"Rock Tunnel 2",36,0,100,17}}, --2->1 : 36,16
	{{"Rock Tunnel 2",0,0,35,11},{"Rock Tunnel 2",36,0,100,17}}, --36,5 and 35,5
	{{"Rock Tunnel 2",0,0,35,11},{"Rock Tunnel 1",0,0,28,16}}, --2->1 7,5 1->2 7,7
	{{"Rock Tunnel 2",0,12,29,100},{"Rock Tunnel 1",0,0,28,16}}, --1->2 8,15 2->1 10,13
	{{"Rock Tunnel 2",0,12,29,100},{"Rock Tunnel 1",0,19,1000,1000}}, --1->2 7,30 2->1 10,13
	{{"Rock Tunnel 1",0,19,1000,1000},{"Route 10",0,43,100,100}},
	{{"Route 1"},{"Route 1 Stop House"}},
	{{"Route 1 Stop House"},{"Viridian City"}},
	{{"Route 2"},{"Route 2 Stop2"}},
	{{"Route 2",0,0,45,90},{"Route 2 Stop3"}},
	{{"Route 2",0,0,45,90},{"Route 2 Stop2"}},
	{{"Route 2",0,91,45,130},{"Route 2 Stop3"}},
	{{"Route 2",0,91,45,130},{"Route 2 Stop"}},
	{{"Route 2 Stop"},{"Viridian Forest"}},
	{{"Route 2 Stop2"},{"Viridian Forest"}},
	{{"Route 5"},{"Underground House 1"}},
	{{"Route 5"},{"Route 5 Stop House"}},
	--{{"Route 5 Stop House"},{"Saffron City"}}, --has to have discovered Saffron
	{{"Route 6"},{"Vermilion City"}},
	{{"Route 6"},{"Underground House 2"}},
	{{"Route 6"},{"Route 6 Stop House"}},
	--{{"Route 6 Stop House"},{"Saffron City"}},--has to have discovered Saffron
	{{"Route 7"},{"Underground House 3"}},
	{{"Route 7"},{"Route 7 Stop House"}},
	--{{"Route 7 Stop House"},{"Saffron City"}},--has to have discovered Saffron
	{{"Route 8"},{"Underground House 4"}},
	{{"Route 8"},{"Route 8 Stop House"}},
	--{{"Route 8 Stop House"},{"Saffron City"}},--has to have discovered Saffron
	{{"Route 9"},{"Route 10",0,0,25,11}}, --87,33
	{{"Route 9"},{"Route 10",26,0,100,42}}, --91,33
	{{"Route 10",0,12,25,42},{"Route 10",26,0,100,42}}, --25,24 et 26,24
	{{"Route 10",0,12,25,42},{"Power Plant"}}, --1,31,7,36
	{{"Route 11"},{"Vermilion City"}},
	{{"Route 11"},{"Route 11 Stop House"}},
	--{{"Route 11 Stop House"},{"Route 12"}}, --Only if passed snorlax
	{{"Route 12"},{"Route 13"}},
	{{"Route 13"},{"Route 14"}},
	{{"Route 14"},{"Route 15"}},
	{{"Route 15"},{"Route 15 Stop House"}},
	{{"Route 19"},{"Route 20",52,0,1000,35}},
	{{"Route 20",52,0,1000,35},{"Seafoam 1F",5,5,20,20}},
	{{"Route 20",0,36,1000,1000},{"Seafoam 1F",60,0,20,100,100}},
	{{"Seafoam 1F",5,5,20,20},{"Seafoam B1F"}}, --15,12 to 1F
	{{"Seafoam 1F",60,0,20,100,100},{"Seafoam B1F"}}, --85,22 to 1F
	{{"Route 22"},{"Viridian City"}},
	{{"Underground1"},{"Underground House 3"}},
	{{"Underground1"},{"Underground House 4"}},
	{{"Underground2"},{"Underground House 1"}},
	{{"Underground2"},{"Underground House 2"}}
}

move_to_cells = {
	{{"Mt. Moon 1F"},{"Mt. Moon B1F",53,15,100,35},21,20},
	{{"Mt. Moon B1F",53,15,100,35},{"Mt. Moon B2F"},56,34}, --56,34 for to b2f 38,40 fot to b1f
	{{"Mt. Moon B1F",31,18,43,21},{"Mt. Moon B2F"},32,21}, --17,27 for to b1f and 32,21 for to b2f
	{{"Mt. Moon B2F"},{"Mt. Moon B1F",53,15,100,35},38,40}, --56,34 for to b2f 38,40 fot to b1f
	{{"Mt. Moon B2F"},{"Mt. Moon B1F",31,18,43,21},17,27}, --17,27 for to b1f and 32,21 for to b2f
	{{"Seafoam B1F"},{"Seafoam 1F",5,5,20,20},15,12}, --15,12 to 1F
	{{"Seafoam B1F"},{"Seafoam 1F",60,0,20,100,100},85,22}, --85,22 to 1F
	{{"Cinnabar Island"},{"Route 20",0,36,1000,1000},45,28}, --0,36 to island, 45,28 to route
	{{"Cinnabar Island"},{"Route 20",0,36,1000,1000},0,36}, --0,36 to island, 45,28 to route
	{{"Route 9"},{"Route 10",0,0,25,11},87,33}, --87,33
	{{"Route 9"},{"Route 10",26,0,100,42},91,33}, --91,33
	{{"Route 10",0,12,25,42},{"Route 10",26,0,100,42},26,24}, --25,24 et 26,24
	{{"Route 10",26,0,100,42},{"Route 10",0,12,25,42},25,24},
	{{"Rock Tunnel 2",36,0,100,17},{"Rock Tunnel 1",33,0,100,18},36,16}, --2->1 : 36,16
	{{"Rock Tunnel 2",0,0,35,11},{"Rock Tunnel 2",36,0,100,17},36,5}, --36,5 and 35,5
	{{"Rock Tunnel 2",36,0,100,17},{"Rock Tunnel 2",0,0,35,11},35,5}, --36,5 and 35,5
	{{"Rock Tunnel 2",0,0,35,11},{"Rock Tunnel 1",0,0,28,16},7,5}, --2->1 7,5 1->2 7,7
	{{"Rock Tunnel 1",0,0,28,16},{"Rock Tunnel 2",0,0,35,11},7,7},
	{{"Rock Tunnel 2",0,12,29,100},{"Rock Tunnel 1",0,0,28,16},10,13}, --1->2 8,15 2->1 10,13
	{{"Rock Tunnel 1",0,0,28,16},{"Rock Tunnel 2",0,12,29,100},8,15}, --1->2 8,15 2->1 10,13
	{{"Rock Tunnel 2",0,12,29,100},{"Rock Tunnel 1",0,19,1000,1000},8,26} --1->2 7,30 2->1 10,13
}

--regular expressions where you can't use your bicycle
uncyclable_strings = {
	"Power Plant", "Seafoam", "Route 20", "Route 19", "Cave", "House", "Underground", "Pokecenter", "Dragons Den", "Cinnabar mansion", "Mt. Moon", "Victory Road", "Plateau Center", "Stop", "Silver 1F", "Silver 2F", "Silver 3F", "Silver 4F"
}	

fishing_rods = {
	"Super Rod",
	"Good Rod",
	"Old Rod"
}

possible_mounts = {
	"Bicycle"
}

swipe_moves = {
	"False Swipe",
	"Super Fang"
}

sleep_moves = {
	"Spore",
	"Yawn",
	"Sleep Powder",
	"Hypnosis",
	"Sing"
}
	
--regions where you want to surf
surf_regions = {"Vermilion City", "Route 19", "Dragons Den"}

--regions where you can't use surf of move to grass. you have to keep moving in a given rectangle.
rectangle_regions = {
	{"Victory Road Kanto 3F", 46, 14, 47, 22},
	{"Rock Tunnel 1", 39, 8, 45, 10},
	{"Mt. Moon 1F", 35, 43, 40, 62},
	{"Digletts Cave Entrance 2", 15, 19, 25, 27},
	{"Cinnabar mansion 1",0,0,12,41},
	{"Power Plant",1,31,7,36}
}

--regions where you want to fish. Specify the region name and the square on which you wish to fish
fish_regions = {{"Route 6", 23,43}}

--pokecenters that are not pokecenters
fake_pokecenters = {{"Indigo Plateau Center", 4, 22}}

blacklist = {
	"Ivysaur", "Venusaur", 
	"Charmeleon", "Charizard", 
	"Wartortle", "Blastoise", 
	"Metapod", "Butterfree", 
	"Kakuna", "Beedrill", 
	"Pidgeotto", "Pidgeot", 
	"Raticate", 
	"Fearow", 
	"Arbok", 
	"Raichu", 
	"Sandslash", 
	"Nidorina", "Nidoqueen", 
	"Nidorino", "Nidoking", 
	"Clefable", 
	"Ninetales", 
	"Wigglytuff", 
	"Golbat", "Crobat", 
	"Gloom", "Vileplume", 
	"Bellossom", 
	"Parasect", 
	"Venomoth", 
	"Dugtrio", 
	"Persian", 
	"Golduck", 
	"Primeape", 
	"Arcanine", 
	"Poliwhirl", "Poliwrath", 
	"Politoed", 
	"Kadabra", "Alakazam", 
	"Machoke", "Machamp", 
	"Weepinbell", "Victreebel", 
	"Tentacruel", 
	"Graveler", "Golem", 
	"Rapidash", 
	"Slowbro", 
	"Slowking", 
	"Magneton", "Magnezone", 
	"Dodrio", 
	"Dewgong", 
	"Muk", 
	"Cloyster", 
	"Haunter", "Gengar", 
	"Steelix", 
	"Hypno", 
	"Kingler", 
	"Electrode", 
	"Exeggutor", 
	"Marowak", 
	"Lickilicky", 
	"Weezing", 
	"Rhydon", "Rhyperior", 
	"Blissey", 
	"Tangrowth", 
	"Seadra", "Kingdra", 
	"Seaking", 
	"Starmie", 
	"Scizor", 
	"Electivire", 
	"Magmortar", 
	"Gyarados", 
	"Vaporeon", 
	"Jolteon", 
	"Flareon", 
	"Espeon", 
	"Umbreon", 
	"Leafeon", 
	"Glaceon", 
	"Sylveon", 
	"Porygon2", "Porygon-Z", 
	"Omastar", 
	"Kabutops", 
	"Dragonair", "Dragonite",
	"Noctowl",
	"Quagsire"

}


