function onCreatePost()
    addVCREffect('camGame')
    addVCREffect('camHud')
    addGlitchEffect('hud', 1,1)
end
function onUpdate(elapsed)
    songPos = getSongPosition()
    local currentBeat = (songPos/5000)*(curBpm/60)
    function opponentNoteHit(id, direction, noteType, isSustainNote)
    setProperty('health', getProperty('health') - 0.35 * ((getProperty('health')/22)))
    triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
    end
    setCharacterY('dad',getCharacterY('dad') + (math.sin(currentBeat) * 0.6))

    end