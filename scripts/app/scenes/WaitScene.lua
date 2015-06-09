
local WaitScene = class("WaitScene", function()
    return display.newScene("WaitScene")
end)


local s = CCDirector:sharedDirector():getWinSize()

------------------------------------
--  SpriteProgressToRadial
------------------------------------
local function SpriteProgressToRadial()
	local layer = CCLayer:create()
	--self:addChild(layer)


	local to1 = CCProgressTo:create(2, 100)
    local to2 = CCProgressTo:create(2, 100)


    local left = CCProgressTimer:create(CCSprite:create("res/jindu.png"))
    left:setType(kCCProgressTimerTypeBar)
    -- Setup for a bar starting from the left since the midpoint is 0 for the x
    left:setMidpoint(CCPointMake(0, 0))
    -- Setup for a horizontal bar since the bar change rate is 0 for y meaning no vertical change
    left:setBarChangeRate(CCPointMake(1, 0))
    left:setPosition(ccp(display.cx, display.cy-200))
    left:runAction(CCRepeatForever:create(to1))
	layer:addChild(left)

	--left:removeAction()

	return layer
end

function WaitScene:ctor()
    self._uiLayer = addCcsUi(self,"Ui_2/Ui_2.ExportJson")
    self:initUpdate()
   	self._time = 1
	-- self._mus1 = self:addButton("music_1")
	-- self._mus2 = self:addButton("music_2")
	-- self._about = self:addButton("about")
	-- self._return = self:addButton("return")
	-- self._btnExit = self:addButton("btn_exit")
	
	self._timer = SpriteProgressToRadial()
	-- self._labelName:setText(GlobalData.name)
	self:addChild(self._timer)
	
	
end


function WaitScene:initUpdate()
    self._scheduler = require("framework.scheduler")
    self._scheduler.scheduleGlobal(handler(self, self.update), 1/30)
end


function WaitScene:update()
	if self._time ~= nil and self._time < 30 then
		self._time = self._time + 1
	elseif self._time == 30 then
		app:enterGameScene()
		--self:removeChild(self._timer, cleanup)
		self._time = nil
	end
	-- map:setAnchorPoint(ccp(0,0))
	-- self:addChild(map)

 --    CCArmatureDataManager:sharedArmatureDataManager():addArmatureFileInfo("unit/unit1.png","unit/unit1.plist","unit/unit1.xml")

 --    self._armature = CCArmature:create("Skeletons")
 --    self._armature:getAnimation():setSpeedScale(0.7)
 --    self._armature:pos(400,200)
 --    self:addChild(self._armature)

end

return WaitScene
