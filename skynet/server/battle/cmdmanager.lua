local NEXT_GAME_ID = 1
local NEXT_AI_ID = 10000

local CmdManager = class("CmdManager")

function CmdManager.create(model)
    return CmdManager.new(model)
end

function CmdManager:ctor(model)
	self.model = model
end

function CmdManager:apply(cmd)
	self.model:apply_command(cmd)
end

-- 玩家入场命令
function CmdManager:add_player()
	local now = self.model:timestamp() + 0.5
	local cmd = {
		name = "add",
		gameID = NEXT_GAME_ID,
		heroID = 100001,
		hp = 100,
		pos = {x = math.random(-30,30),y = math.random(-30,30)},
		dir = {x = 0, y = 0},
		face = {x = 0, y = 1},
		speed = {x = 5, y = 5},
		timestamp = now,
		lastupdate = now,
	}
	NEXT_GAME_ID = NEXT_GAME_ID + 1

	self:apply(cmd)
	return cmd
end

-- AI入场命令
function CmdManager:add_simulater()
	local now = self.model:timestamp() + 0.5
	local cmd = {
		name = "add",
		gameID = NEXT_AI_ID,
		heroID = 100001,
		hp = 100,
		pos = {x = math.random(-30,30),y = math.random(-30,30)},
		dir = {x = 0, y = 0},
		face = {x = 0, y = 1},
		speed = {x = 5, y = 5},
		timestamp = now,
		lastupdate = now,
	}
	NEXT_AI_ID = NEXT_AI_ID + 1

	self:apply(cmd)
	return cmd
end

-- 复活
function CmdManager:revive(gameID)
	local now = self.model:timestamp()
	local cmd = {
		name = "revive",
		gameID = gameID,
		timestamp = now,
	}

	self:apply(cmd)
	return cmd
end

-- 移动
function CmdManager:move(gameID,dir)
	local now = self.model:timestamp()
	local cmd = {
		name = "move",
		gameID = gameID,
		dir = dir,
		timestamp = now,
	}

	self:apply(cmd)
	return cmd
end

-- 攻击
function CmdManager:attack(gameID)
	local now = self.model:timestamp()
	local cmd = {
		name = "attack",
		gameID = gameID,
		timestamp = now,
	}

	self:apply(cmd)
	return cmd
end

return CmdManager