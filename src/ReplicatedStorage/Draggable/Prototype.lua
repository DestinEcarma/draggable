--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Packages = ReplicatedStorage:WaitForChild("Packages")

local Signal = require(Packages.Signal)

local Prototype = {}
Prototype.__index = Prototype

export type Schema = {
	_mouseOffset: Vector2,
	_guiObject: GuiObject,
	_include: { GuiObject },

	Enabled: boolean,

	Dragging: Signal.Class,
	Began: Signal.Class,
	Ended: Signal.Class,
}

export type Class = typeof(setmetatable({} :: Schema, Prototype))

function Prototype.Dragging(self: Class, mousePosition: Vector2)
	local guiObject = self._guiObject

	local parent = guiObject:FindFirstAncestorWhichIsA("GuiBase2d")

	if not parent then
		return warn("GuiObject is not a descendant of GuiBase2d")
	end

	local newPosition = (mousePosition + self._mouseOffset) - parent.AbsolutePosition

	guiObject.Position = UDim2.fromOffset(newPosition.X, newPosition.Y)

	self.Dragging:Fire(mousePosition)
end

function Prototype.Began(self: Class, mousePosition: Vector2)
	local guiObject = self._guiObject

	local offsetFromAnchorPoint = guiObject.AnchorPoint * guiObject.AbsoluteSize
	local rawOffset = guiObject.AbsolutePosition - mousePosition

	self._mouseOffset = rawOffset + offsetFromAnchorPoint

	self.Began:Fire(mousePosition)
end

function Prototype.Ended(self: Class, mousePosition: Vector2)
	self.Ended:Fire(mousePosition)
end

--[[
	* These functions are initialized in the Draggable module.
	? For what purpose? It is to counter the Cyclic Module Dependecy.
]]

-- selene: allow(unused_variable)
function Prototype.Destroy(self: Class) end
-- selene: allow(unused_variable)
function Prototype.IncludeDescendants(self: Class) end
-- selene: allow(unused_variable)
function Prototype.Include(self: Class, guiObjects: { GuiObject }) end

return Prototype
