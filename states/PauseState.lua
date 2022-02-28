PauseState = Class{__includes = BaseState}

function PauseState:enter(params)
    self.bird = params.bird
    self.pipePairs = params.pipePairs
    self.timer = params.timer
    self.score = params.score
    self.lastY = params.lastY
    self.nextGap = params.nextGap

    scrolling = false

    sounds['music']:pause()
end

function PauseState:exit()
    scrolling = true
    sounds['music']:play()
end

function PauseState:update(dt)
    if love.keyboard.wasPressed('p') then
        sounds['pause']:play()
        gStateMachine:change('play', {
            newGame = false,
            bird = self.bird,
            pipePairs = self.pipePairs,
            timer = self.timer,
            score = self.score,
            lastY = self.lastY,
            nextGap = self.nextGap
        })
    end
end

function PauseState:render()
    love.graphics.setFont(hugeFont)
    love.graphics.printf('||', 0, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, 'center')
end