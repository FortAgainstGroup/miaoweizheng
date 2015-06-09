
local SetScene = class("SetScene", function()
    return display.newScene("SetScene")
end)

function SetScene:ctor()
    self._uiLayer = addCcsUi(self,"Ui_2/Ui_3.ExportJson")

	
	-- self._btnExit = self:addButton("btn_exit")
	Mus1 = self:addButton("music_1")
	Mus2 = self:addButton("music_2")
	Mus3 = self:addButton("music_3")
	Mus4 = self:addButton("music_4")
	self._about = self:addButton("about")
	self._return = self:addButton("return")
	if mus1==1 then
		Mus3:setVisible(false)
		Mus1:setVisible(true)
		Mus1:setZOrder(1)
		Mus3:setZOrder(0)
	end
	if mus2==1 then
	    Mus4:setVisible(false)
	    Mus2:setVisible(true)
	    Mus2:setZOrder(1)
		Mus4:setZOrder(0)
	end
	if mus3==1 then
	    Mus1:setVisible(false)
	    Mus3:setVisible(true)
	    Mus1:setZOrder(0)
		Mus3:setZOrder(1)
	end
	if mus4==1 then
	    Mus2:setVisible(false)
	    Mus4:setVisible(true)
	    Mus2:setZOrder(0)
		Mus4:setZOrder(1)
	end
	-- self._labelName = self._uiLayer:getWidgetByName("label_name")
	-- self._labelName:setText(GlobalData.name)
	self._uiItems = {}
	self:initGame()
end

function SetScene:addButton(name)
	local btn = self._uiLayer:getWidgetByName(name)
    local function callbackButton(sender, eventType)
		if eventType == TouchEventType.ended then
			self:clickButton(sender:getName())
		end
	end	
	btn:addTouchEventListener(callbackButton)
	return btn
end

function SetScene:setUiItemsCanTouch(isCanTouch) --------同时改变所有按钮是否可用的状态
  for i,uiItem in ipairs(self._uiItems) do
    -- uiItem:setCanTouch(isCanTouch)
    uiItem:setTouchEnabled(isCanTouch)
  end
end

function SetScene:clickButton(btnName)
	if btnName == "return" then
		app:enterMainScene()
	elseif btnName == "music_1" then
		Mus1:setZOrder(0)
		Mus3:setZOrder(1)
    	Mus1:setVisible(false)
    	Mus3:setVisible(true)
    	audio.pauseMusic()
    	mus1=0
    	mus3=1
	    -- self._armature:getAnimation():play("stand",-1,-1,1)
	elseif btnName == "music_2" then
	    Mus2:setZOrder(0)
		Mus4:setZOrder(1)
		Mus2:setVisible(false)
		Mus4:setVisible(true)
		mus2=0
		mus4=1
    elseif btnName == "music_3" then
	    Mus1:setZOrder(1)
		Mus3:setZOrder(0)	
		Mus3:setVisible(false)
		Mus1:setVisible(true)
		audio.resumeMusic()
		mus1=1
    	mus3=0
	elseif btnName == "music_4" then
	    Mus2:setZOrder(1)
		Mus4:setZOrder(0)
		Mus4:setVisible(false)
		Mus2:setVisible(true)
		mus2=1
    	mus4=0
	    -- self._armature:getAnimation():play("move",-1,-1,1)
	elseif btnName == "about" then
	    self:setUiItemsCanTouch(false)
    	local function callback()--------------------message box 的回调
     		self._msgBox:removeSelf()
     		self:setUiItemsCanTouch(true)
   		end
    	self._msgBox = addMessageBox1(self, callback)
	end
end

function SetScene:initGame()
	-- local map = display.newSprite("map.jpg")
	-- map:setAnchorPoint(ccp(0,0))
	-- self:addChild(map)

 --    CCArmatureDataManager:sharedArmatureDataManager():addArmatureFileInfo("unit/unit1.png","unit/unit1.plist","unit/unit1.xml")

 --    self._armature = CCArmature:create("Skeletons")
 --    self._armature:getAnimation():setSpeedScale(0.7)
 --    self._armature:pos(400,200)
 --    self:addChild(self._armature)

end

return SetScene