function onCreate()
	-- background shit
	makeLuaSprite('sky', 'legendsunshine/sky', -3000, -1000)
	scaleObject('sky', 5, 5)
	setScrollFactor('sky', 0.3, 0.3)

	makeLuaSprite('grass', 'legendsunshine/grass', -600, 1000) --fortnite kids dont know what this is LOL
	scaleObject('grass', 2.5, 2.5)

	makeAnimatedLuaSprite('dafuckingsun', 'legendsunshine/sun', 1200, -200)
	addAnimationByPrefix('dafuckingsun', 'idle', 'sun', 24, true)
	setScrollFactor('dafuckingsun', 0.1, 0.1)

	makeAnimatedLuaSprite('whitestuff', 'legendsunshine/clouds', -500, 400)
	addAnimationByPrefix('whitestuff', 'idle', 'cloud', 24, true)
	setScrollFactor('whitestuff', 1, 1)
	scaleObject('whitestuff', 1.7, 1.7)

	makeAnimatedLuaSprite('helicopter', 'legendsunshine/helicopters', -500, 400)
	addAnimationByPrefix('helicopter', 'idle', 'helicopters', 24, true)
	setScrollFactor('helicopter', 0.7, 0.7)
	scaleObject('helicopter', 2, 2)

	addLuaSprite('sky', false)
	addLuaSprite('grass', false)
	addLuaSprite('dafuckingsun', false)
	addLuaSprite('whitestuff', false)
	addLuaSprite('helicopter', false)

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end