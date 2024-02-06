--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Packages = ReplicatedStorage:WaitForChild("Packages")

local Signal = require(Packages.Signal)

local Prototype = {}
Prototype.__index = Prototype

--[=[
	@within Draggable
	@prop _mouseOffset Vector2
	@private

	This property gets the offset of the mouse, and it's GuiObject; this is updated when [`Began`](#Dragging) is called.
]=]

--[=[
	@within Draggable
	@prop _guiObject GuiObject
	@private

	This is where the GuiObject is stored.
]=]

--[=[
	@within Draggable
	@prop _include {GuiObject}
	@private

	This is where the list of descendants is stored when [`Include`](#Include) or [`IncludeDescendants`](#IncludeDescendants) is called.
]=]

--[=[
	@within Draggable
	@prop Enabled boolean

	Determines whether the GuiObject is Draggable.
]=]

--[=[
	@within Draggable
	@prop Dragging Signal

	This property allows you to make a connection with the [`Connect`](https://rblxutils.github.io/FastSignal/api/ScriptSignal/#Connect) method.
	When the user is interacting with or dragging the Draggable GuiObject, this connection will be fired.

	See [FastSignal](https://rblxutils.github.io/FastSignal/api/ScriptSignal) for more information.

	```lua
	local draggableObject = Draggable.new(exampleFrame)

	draggableObject.Dragging:Connect(function(mousePosition: Vector2)
		print(`Dragging: {mousePosition}`)
	end)
	```
]=]

--[=[
	@within Draggable
	@prop Began Signal

	This property allows you to make a connection with the [`Connect`](https://rblxutils.github.io/FastSignal/api/ScriptSignal/#Connect) method.
	When the user clicks or touches the Draggable GuiObject, this connection will be fired.

	See [FastSignal](https://rblxutils.github.io/FastSignal/api/ScriptSignal) for more information.

	```lua
	local draggableObject = Draggable.new(exampleFrame)

	draggableObject.Began:Connect(function(mousePosition: Vector2)
		print(`Began: {mousePosition}`)
	end)
	```
]=]

--[=[
	@within Draggable
	@prop Ended Signal

	This property allows you to make a connection with the [`Connect`](https://rblxutils.github.io/FastSignal/api/ScriptSignal/#Connect) method.
	When the user stops interacting with or dragging the Draggable GuiObject, this connection will be fired.

	See [FastSignal](https://rblxutils.github.io/FastSignal/api/ScriptSignal) for more information.

	```lua
	local draggableObject = Draggable.new(exampleFrame)

	draggableObject.Ended:Connect(function(mousePosition: Vector2)
		print(`Ended: {mousePosition}`)
	end)
	```
]=]

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

--[=[
	This is automatically called when the user is interacting with or draggingthe Draggable GuiObject.

	@within Draggable
	@private
	@param mousePosition Vector2
	@method Dragging
]=]
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

--[=[
	This is automatically called when the user clicks or touches the Draggable GuiObject.

	@within Draggable
	@private
	@param mousePosition Vector2
	@method Began
]=]
function Prototype.Began(self: Class, mousePosition: Vector2)
	local guiObject = self._guiObject

	local offsetFromAnchorPoint = guiObject.AnchorPoint * guiObject.AbsoluteSize
	local rawOffset = guiObject.AbsolutePosition - mousePosition

	self._mouseOffset = rawOffset + offsetFromAnchorPoint

	self.Began:Fire(mousePosition)
end

--[=[
	This is automatically called when the user stops interacting with or dragging the Draggable GuiObject.

	@within Draggable
	@private
	@param mousePosition Vector2
	@method Ended
]=]
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
