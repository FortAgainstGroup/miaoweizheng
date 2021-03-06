


ClassMessageBox = require("app.scenes.MessageBox")
ClassMessageBox1 = require("app.scenes.MessageBox1")
ClassMessageBox2 = require("app.scenes.MessageBox2")

TouchEventString = TouchEventString or {} --------鼠标事件名称
TouchEventString.began = "began"
TouchEventString.moved = "moved"
TouchEventString.ended = "ended"
TouchEventString.canceled = "canceled"

TouchEventType = TouchEventType or {}
TouchEventType.began = 0
TouchEventType.moved = 1
TouchEventType.ended = 2
TouchEventType.canceled = 3

Mus1=Mus1 or {}
Mus2=Mus2 or {}
Mus3=Mus3 or {}
Mus4=Mus4 or {}
mus1=1
mus2=1
mus3=0
mus4=0
function addCcsUi(parent,path)
    local uiLayer = TouchGroup:create()
    parent:addChild(uiLayer)
    local widget = GUIReader:shareReader():widgetFromJsonFile(path)
    uiLayer:addWidget(widget)
    return uiLayer,widget
end

function addMessageBox(parent,callback)
	local msgBox = ClassMessageBox.new()
	msgBox:init(callback)
	parent:addChild(msgBox)
	return msgBox
end

function addMessageBox1(parent,callback)
	local msgBox = ClassMessageBox1.new()
	msgBox:init(callback)
	parent:addChild(msgBox)
	return msgBox
end
function addMessageBox2(parent,callback)
	local msgBox = ClassMessageBox2.new()
	msgBox:init(callback)
	parent:addChild(msgBox)
	return msgBox
end

State = State or {}	--------单位状态
State.null = 0
State.move = 1
State.def = 3
State.attack = 4
State.pause = 5
State.fight = 6
State.alive = 7

GameTouch = GameTouch or {} ----------鼠标当前点击控件名称
GameTouch.null = 0
GameTouch.fort1 = 1
GameTouch.fort2 = 2
GameTouch.addUnit = 3
GameTouch.scene = 5
GameTouch.def = 6
GameTouch.levelUp = 7

GameData = GameData or{} ----------游戏参数
GameData.fps = 50 ----------帧
GameData.rectScreen = {left = -50, right = CONFIG_SCREEN_WIDTH + 50, top = CONFIG_SCREEN_HEIGHT + 50, bottom = -50}

GameFort = GameFort or {} ----------城堡参数
GameFort.life = 5000 --生命
GameFort.price = 500 --价格
GameFort.gold = 500 --金钱
GameFort.ATK = 500  --攻击力
GameFort.DEF = 50  --防御力
GameFort.SD = 40    --射程
GameFort.ASP = 2   --攻速
GameFort.goldINC = 10 --单位时间获得的金钱


GameFort1 = GameFort1 or {}
GameFort1.camp = 1
GameFort1.name = "back1.jpg"
GameFort1.scale= 0.5
GameFort1.radius = 100*GameFort1.scale
GameFort1.pos = ccp(80, CONFIG_SCREEN_HEIGHT/2)
GameFort1.life = GameFort.life --生命
GameFort1.price = GameFort.price --价格
GameFort1.gold = GameFort.gold --金钱
GameFort1.ATK = GameFort.ATK  --攻击力
GameFort1.DEF = GameFort.DEF  --防御力
GameFort1.SD = GameFort.SD    --射程
GameFort1.ASP = GameFort.ASP   --攻速
GameFort1.goldINC = GameFort.goldINC --单位时间获得的金钱

GameFort2 = GameFort2 or {}
GameFort2.camp = 2
GameFort2.name = "back1.jpg"
GameFort2.scale= 0.5
GameFort2.radius = 100*GameFort2.scale
GameFort2.pos = ccp(CONFIG_SCREEN_WIDTH - 80, CONFIG_SCREEN_HEIGHT/2)
GameFort2.life = GameFort.life --生命
GameFort2.price = GameFort.price --价格
GameFort2.gold = GameFort.gold --金钱
GameFort2.ATK = GameFort.ATK  --攻击力
GameFort2.DEF = GameFort.DEF  --防御力
GameFort2.SD = GameFort.SD    --射程
GameFort2.ASP = GameFort.ASP   --攻速
GameFort2.goldINC = GameFort.goldINC --单位时间获得的金钱




GameUnit = GameUnit or {} ----------作战单位参数
GameUnit.maxNum = 5
GameUnit.speed = 3
GameUnit.alertTime = 20
GameUnit.addTime = 30

-- GameUnit2 = GameUnit2 or {} ----------作战单位参数
-- GameUnit2.scale = 0.1
-- GameUnit2.radius = 80*GameUnit2.scale
-- GameUnit2.alertTime = 20
-- GameUnit2.maxNum = 5
-- GameUnit2.speed = 2

GameBullet = GameBullet or{} ----------子弹
GameBullet.name = "bullet.png"
GameBullet.scale = 0.05
GameBullet.radius = 80*GameBullet.scale
GameBullet.speed = 3
GameBullet.bullet = 1 --普通弹
GameBullet.shot = 2 --散弹
GameBullet.track = 3 --追踪弹
GameBullet.GBU = 4   ----爆炸弹

GameTank1 = GameTank1 or {}
GameTank1.ico = "tank1.jpg" --图标
GameTank1.img1 = "tank1_1.png" --炮台
GameTank1.img2 = "tank1_2.png" --底盘
GameTank1.scale = 0.15
GameTank1.radius = 100*GameTank1.scale
GameTank1.speed = 2
GameTank1.price = 100 --价格
GameTank1.life = 500 --生命
GameTank1.ATK = 100  --攻击力
GameTank1.DEF = 10  --防御力
GameTank1.SD = 80    --射程
GameTank1.ASP = 2   --攻速
GameTank1.bullet = GameBullet.GBU --坦克发射子弹的类型

GameTank2 = GameTank2 or {}
GameTank2.ico = "tank2.jpg" --图标
GameTank2.img1 = "tank2_1.png" --炮台
GameTank2.img2 = "tank2_2.png" --底盘
GameTank2.scale = 0.15
GameTank2.radius = 100*GameTank2.scale
GameTank2.speed = 2
GameTank2.price = 60 --价格
GameTank2.life = 500 --生命
GameTank2.ATK = 60  --攻击力
GameTank2.DEF = 30  --防御力
GameTank2.SD = 80    --射程
GameTank2.ASP = 2   --攻速
GameTank2.bullet = GameBullet.track --坦克发射子弹的类型


GameTank3 = GameTank3 or {}
GameTank3.ico = "tank3.jpg" --图标
GameTank3.img1 = "tank3_1.png" --炮台
GameTank3.img2 = "tank3_2.png" --底盘
GameTank3.scale = 0.15
GameTank3.radius = 100*GameTank3.scale
GameTank3.speed = 2
GameTank3.price = 50 --价格
GameTank3.life = 500 --生命
GameTank3.ATK = 80  --攻击力
GameTank3.DEF = 20  --防御力
GameTank3.SD = 80    --射程
GameTank3.ASP = 2   --攻速
GameTank3.bullet = GameBullet.shot --坦克发射子弹的类型


GameButton = GameButton or {} ----------按钮
GameButton.scale = 0.2
GameButton.radius = 100*GameButton.scale

GameSkillDEF = GameSkillDEF or{} ----------塔防
GameSkillDEF.time = 2*GameData.fps --塔防时间
GameSkillDEF.price = 200 --塔防所需的价格
GameSkillDEF.def = 100 --塔防时刻的防御力

GameSkillLevelUp = GameSkillLevelUp or{} ----------武装升级
GameSkillLevelUp.price = 200 --升级所需的价格


GlobalData = {}
