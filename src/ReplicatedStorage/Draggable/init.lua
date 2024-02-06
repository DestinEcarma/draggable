--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Packages = ReplicatedStorage:WaitForChild("Packages")

local Signal = require(Packages.Signal)
local Prototype = require(script.Prototype)
local EventHanlder = require(script.EventHandler)

local Draggable = {}

type Schema = Prototype.Schema

export type Class = Prototype.Class

function Draggable.new(guiObject: GuiObject): Class
	if typeof(guiObject) ~= "Instance" then
		return error("Argument #1 must be a type of Instance", 2)
	end

	if not guiObject:IsA("GuiObject") then
		return error("Argument #1 must be a class under GuiObject", 2)
	end

	if not guiObject:FindFirstAncestorWhichIsA("ScreenGui") then
		return error("Argument #1 must be a descendant of ScreenGui", 2)
	end

	local schema: Schema = {
		_mouseOffset = Vector2.new(),
		_guiObject = guiObject,
		_include = {},

		Enabled = true,

		Dragging = Signal.new(),
		Began = Signal.new(),
		Ended = Signal.new(),
	}

	local self = setmetatable(schema, Prototype)
	EventHanlder.Draggables[guiObject] = self

	return self
end

--[[
	* Initialize functions that use the EventHandler module.
	? For what purpose? It is to counter the Cyclic Module Dependecy.
]]

function Prototype.Destroy(self: Class)
	EventHanlder.Draggables[self._guiObject] = nil

	for _, guiObject in ipairs(self._include) do
		EventHanlder.Draggables[guiObject] = nil
	end

	self.Dragging:Destroy()
	self.Began:Destroy()
	self.Ended:Destroy()

	table.clear(self._include)
end

function Prototype.IncludeDescendants(self: Class)
	for _, instance in ipairs(self._guiObject:GetDescendants()) do
		if not instance:IsA("GuiObject") then
			continue
		end

		table.insert(self._include, instance)
		EventHanlder.Draggables[instance] = self
	end
end

function Prototype.Include(self: Class, guiObjects: { GuiObject })
	for i, guiObject in ipairs(guiObjects) do
		if typeof(guiObject) ~= "Instance" then
			warn(`Index #{i} is not a type of Instance`)
			continue
		end

		if not guiObject:IsA("GuiObject") then
			warn(`Index #{i} is not a Class under GuiObject`)
			continue
		end

		if not guiObject:IsDescendantOf(self._guiObject) then
			warn(`Index #{i} is not a descendant of Draggable`)
			continue
		end

		table.insert(self._include, guiObject)
		EventHanlder.Draggables[guiObject] = self
	end
end

return Draggable
