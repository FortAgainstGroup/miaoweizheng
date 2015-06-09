local MessageBox = class("MessageBox", function()
    return display.newNode()
end)

function MessageBox:ctor()
 	local uiLayer,widget = addCcsUi(self,"Ui_2/Ui_5.ExportJson")
 	local size = widget:getContentSize()
 	uiLayer:pos(-size.width/2,-size.height/2)

    local function callbackButton(sender, eventType)
		if eventType == TouchEventType.ended then
			self:clickButton(sender:getName())
		end
	end

	local btnYes = uiLayer:getWidgetByName("yes")
	btnYes:addTouchEventListener(callbackButton)

	local btnNo = uiLayer:getWidgetByName("no")
	btnNo:addTouchEventListener(callbackButton)
 end

function MessageBox:clickButton(btnName)
	if btnName == "yes" then
		app:exit()
	elseif btnName == "no" then
		self._callback()
	end
end

function MessageBox:init(callback,pos)
 	if not pos then
 		pos = ccp(CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2)
 	end
 	self:setPosition(pos)
 	self._callback = callback

 	self:scale(0)
 	self:runAction(CCEaseElasticOut:create(CCScaleTo:create(0.6,1)))
end


return MessageBox