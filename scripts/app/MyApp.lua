
require("config")
require("framework.init")
require("app.GameData")

local MyApp = class("MyApp", cc.mvc.AppBase)

function MyApp:ctor()
    MyApp.super.ctor(self)
end

function MyApp:run()
    CCFileUtils:sharedFileUtils():addSearchPath("res/")
    self:enterScene("MainScene")
end

function MyApp:enterMainScene()
	self:enterScene("MainScene",nil,"fade",0.6,display.COLOR_WHITE)
end
function MyApp:enterAboutScene()
	self:enterScene("AboutScene",nil,"fade",0.6,display.COLOR_WHITE)
end
function MyApp:enterSetScene()
	self:enterScene("SetScene",nil,"fade",0.6,display.COLOR_WHITE)
end
function MyApp:enterWaitScene()
	self:enterScene("WaitScene",nil,"fade",0,display.COLOR_WHITE)
end
function MyApp:enterGameScene()
	self:enterScene("GameScene",nil,"fade",0.6,display.COLOR_WHITE)
end
return MyApp
