function onCreate()
	-- background shit
	makeLuaSprite('void', 'blackBG/blackBG', -3000, -1000)
	scaleObject('void', 5, 5)
	setScrollFactor('void', 0.3, 0.3)

	makeLuaSprite('floor', 'blackBG/floor', -600, 1100) --fortnite kids dont know what this is LOL
	scaleObject('floor', 2.5, 2.5)

    addLuaSprite('void', false)
	addLuaSprite('floor', false)

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end