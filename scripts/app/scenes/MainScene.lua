
local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
    self._uiLayer = addCcsUi(self,"Ui_2/Ui_1.ExportJson")

    self._uiItems = {}
    local MUSIC_FILE = GAME_SFX.background 
    if audio.isMusicPlaying()==false then
      audio.playMusic(MUSIC_FILE, true)
    end
    self._btn1 = self:addButton("btn_begin")
    self._btn2 = self:addButton("btn_cancel")
    self._btn3 = self:addButton("btn_set")
  -- self._input = self:addUiItem("input", false)

  -- self._labelName = self._uiLayer:getWidgetByName("label_name")

  -- self:setUiItemsCanTouch(true)
end

function MainScene:addButton(name)
  local btn = self._uiLayer:getWidgetByName(name)
  local function callbackButton(sender, eventType)
    if eventType == TouchEventType.ended then
      self:clickButton(sender:getName())
    end
  end 
  btn:addTouchEventListener(callbackButton)
  return btn
end

function MainScene:setUiItemsCanTouch(isCanTouch) --------同时改变所有按钮是否可用的状态
  for i,uiItem in ipairs(self._uiItems) do
    -- uiItem:setCanTouch(isCanTouch)
    uiItem:setTouchEnabled(isCanTouch)
  end
end

function MainScene:clickButton(btnName)
  if btnName == "btn_begin" then
    app:enterWaitScene()
  elseif btnName == "btn_set" then
    app:enterSetScene()
  elseif btnName == "btn_cancel" then
    self:setUiItemsCanTouch(false)
    local function callback()--------------------message box 的回调
      self._msgBox:removeSelf()
      self:setUiItemsCanTouch(true)
    end
    self._msgBox = addMessageBox(self, callback)
  end
end

return MainScene
