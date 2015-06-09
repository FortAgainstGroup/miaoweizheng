local Fort = class("Fort", function()
    return display.newScene("Fort")
end)

function Fort:ctor()
	self._listAttackMe = {} 	----------攻击自己的单位列表
    self._goal = nil 			----------攻击的目标
    self._updateTime = GameData.fps ----------更新频率

	self:initControl()
	self:setState(State.alive)

end

function Fort:init( node )
	self._scale=node.scale
	self:setScale(self._scale)
	self._r=node.radius
	self:setAnchorPoint(ccp(0,0))

	self:setPosition(node.pos) 					
	self._pos = node.pos ----------位置
	self._defTime  = GameSkillDEF.time ----------塔防时间											
	self._life = node.life ----------生命
	self._price = node.price ------------价格
	self._gold = node.gold ----------金钱
	self._ATK = node.ATK  ----------攻击力
	self._DEF = node.DEF  ----------防御力
	self._SD = node.SD    ----------射程
	self._ASP = node.ASP    ----------攻速
	self._goldINC = node.goldINC ----------单位时间获得的金钱
    self._lifeLabel = cc.ui.UILabel.new({text = "", size = 50}) 		----------显示生命值
    				:align(display.CENTER, 0, -150)
    				:addTo(self)
    self._goldLabel = cc.ui.UILabel.new({text = "", size = 50}) 		----------显示金钱
    				:align(display.CENTER, 0, -250)
    				:addTo(self)
    self._defLabel = cc.ui.UILabel.new({text = "", size = 50}) 			----------显示防御
    				:align(display.CENTER, 0, -200)
    				:addTo(self)
end

function Fort:initControl()
    -- local layer = display.newLayer()
    -- layer:setTouchEnabled(true)
    -- layer:addNodeEventListener(cc.NODE_TOUCH_EVENT, 
    --     function(event)
    --         return self:onTouch(event.name, event.x, event.y, event.prevX, event.prevY)
    --     end
    --     )
    -- layer:setTouchSwallowEnabled(false)
    -- self:addChild(layer)
end

function Fort:setState( state )
	self._state = state
	if self._state == State.null then
		self:toDeath()
	elseif self._state == State.def then
    	self:toDef() 
	end
end

function Fort:update()
    if self._state == State.null then
    	return true
    elseif self._life <= 0 then
		self._life = 0
		self:setState(State.null)
    elseif self._state == State.def then
    	self:skillDEF() --塔防
    end

	self._updateTime = self._updateTime - 1 											----------更新金钱和生命
	if self._updateTime <= 0 then
		self._gold = self._gold + self._goldINC
		self._updateTime = GameData.fps
	end
    self._lifeLabel:setString("生命"..self._life)
    self._goldLabel:setString("金钱"..self._gold)
    self._defLabel:setString("防御"..self._DEF)

end

function Fort:toDeath(  )
end

function Fort:toDef(  )
	if self._gold >= GameSkillDEF.price then
		self._defTime = GameSkillDEF.time
		self._DEF  = GameSkillDEF.def
		self._gold = self._gold - GameSkillDEF.price
	end
end

function Fort:skillDEF()								-----------塔防
	self._defTime = self._defTime-1
    if self._defTime <= 0 then
 	  self._DEF = GameFort.DEF
 	  self._state= State.alive
    end
end

return Fort