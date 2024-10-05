local A = {}

local animals

function A.load()

    animals = {{id = 1, animalName = "Anglerfish", isPredator = 0, hintText = "They live in deep, deep water.", homeBiome = 2, specialRequirements = {"largeBiome", "sameBiomeAdjacentTwice"}},
    {id = 2, animalName = "Arctic Fox", isPredator = -1, hintText = "They're often found bounding through the snow (but like to avoid predators).", homeBiome = 6, specialRequirements = {"noNeighbors"}},
    {id = 3, animalName = "Beaver", isPredator = -1, hintText = "They're meadows-dwellers but also build homes on the water.", homeBiome = 1, specialRequirements = {"adjacentToWater"}},
    {id = 4, animalName = "Bison", isPredator = 0, hintText = "They need lots of space to roam the plains.", homeBiome = 10, specialRequirements = {"largeBiome"}},
    {id = 5, animalName = "Black Bear", isPredator = 1, hintText = "They need a large, isolated forest in which to forage.", homeBiome = 4, specialRequirements = {"largeBiome", "sameBiomeAdjacent"}},
    {id = 6, animalName = "Cat", isPredator = 0, hintText = "They're a finicky companion of humans.", homeBiome = 9, specialRequirements = {"adjacentToHumans", "sharesBiomeWithPrey"}},
    {id = 7, animalName = "Chupacabra", isPredator = 1, hintText = "Rarely seen, they hide in the depths of the jungle (but must have access to their main food source in the mountains).", homeBiome = 7, specialRequirements = {"notAdjacentToHumans"}},
    {id = 8, animalName = "Coyote", isPredator = 1, hintText = "They are experts at surviving in dry, arid climates.", homeBiome = 3, specialRequirements = {"adjacentToWater"}},
    {id = 9, animalName = "Crocodile", isPredator = 1, hintText = "They're fast on land in their jungle homes, but even faster in the water.", homeBiome = 7, specialRequirements = {"adjacentToWater"}},
    {id = 10, animalName = "Deer", isPredator = 0, hintText = "To thrive, they should stick to the forests away from people (but are frequently found near towns anyway).", homeBiome = 4, specialRequirements = {"noNeighbors", "sameBiomeAdjacent"}},
    {id = 11, animalName = "Dinosaur", isPredator = 1, hintText = "Long ago, they lumbered around the vast open meadows.", homeBiome = 1, specialRequirements = {"largeBiome"}},
    {id = 12, animalName = "Dog", isPredator = 0, hintText = "A loyal and loving best friend to humans (they must be nearby!).", homeBiome = 9, specialRequirements = {"adjacentToHumans"}},
    {id = 13, animalName = "Dolphin", isPredator = 0, hintText = "They need plenty of water in which to swim.", homeBiome = 2, specialRequirements = {"largeBiome"}},
    {id = 14, animalName = "Eagle", isPredator = 1, hintText = "REPLACE THIS HINT TEXT", homeBiome = 8, specialRequirements = {"largeBiome", "sharesBiomeWithPrey"}},
    {id = 15, animalName = "Elephant", isPredator = 0, hintText = "REPLACE THIS HINT TEXT", homeBiome = 10, specialRequirements = {"largeBiome", "notAdjacentToCold"}},
    {id = 16, animalName = "Extraterrestrial", isPredator = 1, hintText = "Vanishingly rare and out-of-this-world, most often 'spotted' in the deep desert.", homeBiome = 3, specialRequirements = {"noNeighbors", "sameBiomeAdjacentTwice"}},
    {id = 17, animalName = "Groundhog", isPredator = -1, hintText = "They're not picky, they just want some grass to frolic in.", homeBiome = 1, specialRequirements = {"none"}},
    {id = 18, animalName = "Hare", isPredator = -1, hintText = "REPLACE THIS HINT TEXT", homeBiome = 8, specialRequirements = {"noPredators"}},
    {id = 19, animalName = "Hawk", isPredator = 1, hintText = "REPLACE THIS HINT TEXT", homeBiome = 4, specialRequirements = {"adjacentToMountains", "sharesBiomeWithPrey"}},
    {id = 20, animalName = "Honeybee", isPredator = 0, hintText = "They love wide-open areas, but need access to trees!", homeBiome = 1, specialRequirements = {"largeBiome", "adjacentToForest"}},
    {id = 21, animalName = "Human", isPredator = 0, hintText = "REPLACE THIS HINT TEXT", homeBiome = 9, specialRequirements = {"none"}},
    {id = 22, animalName = "Jackalope", isPredator = 0, hintText = "REPLACE THIS HINT TEXT", homeBiome = 10, specialRequirements = {"noNeighbors"}},
    {id = 23, animalName = "Kangaroo", isPredator = 0, hintText = "REPLACE THIS HINT TEXT", homeBiome = 10, specialRequirements = {"none"}},
    {id = 24, animalName = "Kraken", isPredator = 1, hintText = "Reclusive and vast, their existence is the stuff of maritime legends.", homeBiome = 2, specialRequirements = {"noNeighbors", "largeBiome"}},
    {id = 25, animalName = "Lizard", isPredator = -1, hintText = "Find them basking in the desert sun.", homeBiome = 3, specialRequirements = {"none"}},
    {id = 26, animalName = "Mammoth", isPredator = 0, hintText = "REPLACE THIS HINT TEXT", homeBiome = 5, specialRequirements = {"noNeighbors", "largeBiome"}},
    {id = 27, animalName = "Moose", isPredator = 0, hintText = "REPLACE THIS HINT TEXT", homeBiome = 6, specialRequirements = {"largeBiome"}},
    {id = 28, animalName = "Mountain Goat", isPredator = 0, hintText = "REPLACE THIS HINT TEXT", homeBiome = 8, specialRequirements = {"none"}},
    {id = 29, animalName = "Mountain Lion", isPredator = 1, hintText = "REPLACE THIS HINT TEXT", homeBiome = 8, specialRequirements = {"sharesBiomeWithPrey"}},
    {id = 30, animalName = "Narwhal", isPredator = 1, hintText = "They're sea-dwelling, Arctic mammals who fear predators.", homeBiome = 2, specialRequirements = {"largeBiome", "noPredators"}},
    {id = 31, animalName = "Octopus", isPredator = 0, hintText = "Need lots of water in which to bloop around.", homeBiome = 2, specialRequirements = {"largeBiome", "sameBiomeAdjacentTwice"}},
    {id = 32, animalName = "Orca", isPredator = 1, hintText = "Humans have messed with them too much, they want to be out in the deep water.", homeBiome = 2, specialRequirements = {"largeBiome", "notAdjacentToHumans"}},
    {id = 33, animalName = "Parrot", isPredator = 0, hintText = "REPLACE THIS HINT TEXT", homeBiome = 7, specialRequirements = {"notAdjacentToHumans", "notAdjacentToCold"}},
    {id = 34, animalName = "Penguin", isPredator = -1, hintText = "REPLACE THIS HINT TEXT", homeBiome = 5, specialRequirements = {"none"}},
    {id = 35, animalName = "Pigeon", isPredator = -1, hintText = "REPLACE THIS HINT TEXT", homeBiome = 9, specialRequirements = {"noPredators"}},
    {id = 36, animalName = "Polar Bear", isPredator = 1, hintText = "REPLACE THIS HINT TEXT", homeBiome = 5, specialRequirements = {"sharesBiomeWithPrey"}},
    {id = 37, animalName = "Prairie Dog", isPredator = -1, hintText = "REPLACE THIS HINT TEXT", homeBiome = 10, specialRequirements = {"largeBiome"}},
    {id = 38, animalName = "Puffin", isPredator = -1, hintText = "REPLACE THIS HINT TEXT", homeBiome = 5, specialRequirements = {"noPredators"}},
    {id = 39, animalName = "Python", isPredator = 1, hintText = "REPLACE THIS HINT TEXT", homeBiome = 7, specialRequirements = {"sharesBiomeWithPrey"}},
    {id = 40, animalName = "Rabbit", isPredator = -1, hintText = "They just want to be safe in their flowery meadow.", homeBiome = 1, specialRequirements = {"noPredators"}},
    {id = 41, animalName = "Raccoon", isPredator = 0, hintText = "While they live in the grass, they like a bit of trash now and then.", homeBiome = 1, specialRequirements = {"adjacentToCity"}},
    {id = 42, animalName = "Rat", isPredator = -1, hintText = "REPLACE THIS HINT TEXT", homeBiome = 9, specialRequirements = {"adjacentToHumans"}},
    {id = 43, animalName = "Rattlesnake", isPredator = 0, hintText = "Need access to prey in their native desert.", homeBiome = 3, specialRequirements = {"sharesBiomeWithPrey", "notAdjacentToCold"}},
    {id = 44, animalName = "Salmon", isPredator = -1, hintText = "They swim up long rivers every year.", homeBiome = 2, specialRequirements = {"longBiome"}},
    {id = 45, animalName = "Scorpion", isPredator = -1, hintText = "They make a tasty snack for ambitious desert-dwelling creatures, so they'd like some safety.", homeBiome = 3, specialRequirements = {"noPredators"}},
    {id = 46, animalName = "Sloth", isPredator = 0, hintText = "REPLACE THIS HINT TEXT", homeBiome = 7, specialRequirements = {"none"}},
    {id = 47, animalName = "Snow Leopard", isPredator = 0, hintText = "REPLACE THIS HINT TEXT", homeBiome = 6, specialRequirements = {"sharesBiomeWithPrey"}},
    {id = 48, animalName = "Snowy Owl", isPredator = 1, hintText = "REPLACE THIS HINT TEXT", homeBiome = 6, specialRequirements = {"sharesBiomeWithPrey", "sameBiomeAdjacent"}},
    {id = 49, animalName = "Squirrel", isPredator = -1, hintText = "They thrive in forested parks near the city.", homeBiome = 4, specialRequirements = {"smallBiome", "adjacentToCity"}},
    {id = 50, animalName = "Sunfish", isPredator = -1, hintText = "They're just happy to be there, soaking up rays in their little ponds.", homeBiome = 2, specialRequirements = {"smallBiome"}},
    {id = 51, animalName = "Tiger", isPredator = 1, hintText = "REPLACE THIS HINT TEXT", homeBiome = 7, specialRequirements = {"sharesBiomeWithPrey"}},
    {id = 52, animalName = "Troll", isPredator = 1, hintText = "REPLACE THIS HINT TEXT", homeBiome = 6, specialRequirements = {"noNeighbors"}},
    {id = 53, animalName = "Unicorn", isPredator = 0, hintText = "REPLACE THIS HINT TEXT", homeBiome = 4, specialRequirements = {"noNeighbors"}},
    {id = 54, animalName = "Vampire", isPredator = 1, hintText = "REPLACE THIS HINT TEXT", homeBiome = 9, specialRequirements = {"adjacentToHumans"}},
    {id = 55, animalName = "Vulture", isPredator = 0, hintText = "They thrive off of the misfortune of other creatures who have wandered into the desert.", homeBiome = 3, specialRequirements = {"anyNeighbors"}},
    {id = 56, animalName = "Walrus", isPredator = 0, hintText = "REPLACE THIS HINT TEXT", homeBiome = 6, specialRequirements = {"none"}},
    {id = 57, animalName = "Wolf", isPredator = 1, hintText = "Can be heard and spotted howling at the moon from deep in the forest.", homeBiome = 4, specialRequirements = {"sharesBiomeWithPrey"}},
    {id = 58, animalName = "Yak", isPredator = 0, hintText = "REPLACE THIS HINT TEXT", homeBiome = 8, specialRequirements = {"notSmallBiome"}},
    {id = 59, animalName = "Yeti", isPredator = 1, hintText = "Their very existence is contentious, but the cold mountains may provide their hideaway.", homeBiome = 8, specialRequirements = {"largeBiome"}},
    {id = 60, animalName = "Zebra", isPredator = 0, hintText = "They thrive out on the plains (but must have access to a small watering hole!)", homeBiome = 10, specialRequirements = {"adjacentToWater", "noPredators"}}}

end

function A.getAnimal(id)
    return animals[id]
end

function A.addValidAnimalsToTileMap(tileCols)

    for col, c in ipairs(tileCols) do
        for row, t in ipairs(c) do
            t.validAnimals = {}
            if t.tileType ~= TILE_TYPE.BLANK then
                local biomeTiles = GetAllTilesInBiome(t)
                for _, a in ipairs(animals) do
                    local isValid = true
                    if t.tileType ~= a.homeBiome then
                        isValid = false
                    else
                        for _, s in ipairs(a.specialRequirements) do
                            isValid = CheckSpecialRequirement(s, biomeTiles, tileCols, t, row, col)
                            if not isValid then
                                break
                            end
                        end
                    end
                    if isValid then
                        table.insert(t.validAnimals, a)
                    end
                end
            end
        end
    end

    return tileCols

end

function CheckSpecialRequirement(s, biomeTiles, tileCols, tile, r, c)

    isValid = true

    if s == "largeBiome" then
        if #biomeTiles <= 10 then
            isValid = false
        end
    elseif s == "sharesBiomeWithPrey" then
    elseif s == "sameBiomeAdjacent" then
        if tileCols[c][r-1].tileType == tile.tileType and tileCols[c-1][r].tileType == tile.tileType and tileCols[c+1][r].tileType == tile.tileType and tileCols[c][r+1].tileType == tile.tileType then
            isValid = true
        else
            isValid = false
        end
    elseif s == "sameBiomeAdjacentTwice" then
    elseif s == "noNeighbors" then
    elseif s == "adjacentToWater" then
    elseif s == "adjacentToHumans" then 
    elseif s == "notAdjacentToCold" then
    elseif s == "noPredators" then
    elseif s == "adjacentToMountains" then
    elseif s == "adjacentToForest" then
    elseif s == "notAdjacentToHumans" then
    elseif s == "smallBiome" then
        if #biomeTiles > 3 then
            isValid = false
        end
    elseif s == "notSmallBiome" then
        if #biomeTiles <= 3 then
            isValid = false
        end
    elseif s == "longBiome" then
    elseif s == "adjacentToCity" then
    elseif s == "anyNeighbors" then
    end

    return isValid

end

function GetAllTilesInBiome(t)
    return t
end

return A