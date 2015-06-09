require("app.GameFunction")
require("app.GameData")
ClassGameDirectort = require("app.Game.GameDirector")


local GameScene = class("GameScene", function()
    return display.newScene("GameScene")
end)

function GameScene:ctor()
    self._uiLayer = addCcsUi(self,"Ui_2/Ui_6.ExportJson")

    self._uiItems = {}
    
    self._tank1 = self:addButton("tank1")
    self._tank2 = self:addButton("tank2")
    self._fort1 = self:addButton("fort1")
    self._fort2 = self:addButton("fort2")
    self._return = self:addButton("return")
    self._pause = self:addButton("pause")
    self._begin = self:addButton("begin")
    self._shengji = self:addButton("shengji")
    self._fangyu = self:addButton("fangyu")
  -- self._input = self:addUiItem("input", false)

  -- self._labelName = self._uiLayer:getWidgetByName("label_name")

  -- self:setUiItemsCanTouch(true)

-------------------
    self:initControl()
    -- self:initBack()
    g_director = ClassGameDirectort.new()
    g_director:init(self)
    self:initUpdate()

    self._onTouch = GameTouch.null  ----------点击的控件名称
    self._state = State.alive
---------------------
end
-----------------------------------------------------
function GameScene:initControl()
    local layer = display.newLayer() ----------鼠标点击控件
    layer:setTouchEnabled(true)
    layer:addNodeEventListener(cc.NODE_TOUCH_EVENT, 
        function(event)
            return self:onTouch(event.name, event.x, event.y, event.prevX, event.prevY)
        end
        )
    layer:setTouchSwallowEnabled(false)
    self:addChild(layer)
end

-- function GameScene:initBack()
--     local imgBack = display.newSprite("back1.jpg")
--     imgBack:setAnchorPoint(ccp(0,0))
--     self:addChild(imgBack) 
-- end

function GameScene:initUpdate()
    self._scheduler = require("framework.scheduler")
    self._scheduler.scheduleGlobal(handler(self, self.update), 1/GameData.fps)
end

function GameScene:update()
    if self._state ~= State.null and self._state ~= State.pause then
        if g_director:update() then
            self:gameOver() ----------游戏结束
        end
    end
end

function GameScene:onTouch(name,x,y,prevX,prevY)
    if self._state ~= State.null and self._state ~= State.pause then
      if name == TouchEventString.began then 
        if self._onTouch == GameTouch.addUnit then
          if effRange(ccp(x, y)) then
            if g_director._listFort[1]._gold >= self._addNode.price then
              g_director:addUnit(self._addNode,State.move,ccp(x, y))
              g_director._listFort[1]._gold = g_director._listFort[1]._gold - self._addNode.price
            end
          end
        end
      end
    end
    return true
end

function GameScene:gameOver(  )                                                     ----------游戏结束
    self._state = State.null
    self._label = cc.ui.UILabel.new({text = "游戏结束", size = 50})                     
                :align(display.CENTER, CONFIG_SCREEN_WIDTH/2, CONFIG_SCREEN_HEIGHT/2)
                :addTo(self)

end
--------------------------------------------------------------------------------------
function GameScene:addButton(name)
  local btn = self._uiLayer:getWidgetByName(name)
  local function callbackButton(sender, eventType)
    if eventType == TouchEventType.ended then
      self:clickButton(sender:getName())
    end
  end 
  btn:addTouchEventListener(callbackButton)
  return btn
end

function GameScene:setUiItemsCanTouch(isCanTouch) --------同时改变所有按钮是否可用的状态
  for i,uiItem in ipairs(self._uiItems) do
    -- uiItem:setCanTouch(isCanTouch)
    uiItem:setTouchEnabled(isCanTouch)
  end
end

function GameScene:clickButton(btnName)
  if btnName == "tank1" then
    -- app:enterWaitScene()
    self._onTouch = GameTouch.addUnit
    self._addNode = GameTank1 --添加单位的信息
  elseif btnName == "tank2" then
    -- app:enterSetScene()
    self._onTouch = GameTouch.addUnit
    self._addNode = GameTank2 --添加单位的信息
  elseif btnName == "return" then
    self:setUiItemsCanTouch(false)
    local function callback()--------------------message box 的回调
      self._msgBox:removeSelf()
      self:setUiItemsCanTouch(true)
    end
    self._msgBox = addMessageBox2(self, callback)
  elseif btnName == "fort1" then
  elseif btnName == "fort2" then
  elseif btnName == "pause" then
    if self._state == State.pause then
      self._state = State.alive
    elseif self._state == State.alive then
      self._state = State.pause
    end
  elseif btnName == "begin" then
  elseif btnName == "shengji" then
    self._onTouch = GameTouch.levelUp
    g_director:levelUp()
  elseif btnName == "fangyu" then
    self._onTouch = GameTouch.def
    g_director:fortDEF()
  end
end

return GameScene

