--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Packages = ReplicatedStorage:WaitForChild("Packages")

local Signal = require(Packages.Signal)
local Prototype = require(script.Prototype)
local EventHanlder = require(script.EventHandler)

--[=[
	@client
	@class Draggable
]=]
local Draggable = {}

type Schema = Prototype.Schema

export type Class = Prototype.Class

--[=[
	This function creates a Draggable object, which turns the GuiObject into a Draggable GuiObject.

	@param guiObject GuiObject
	@return Draggable
]=]
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

	guiObject.Destroying:Connect(function()
		self:Destroy()
	end)

	return self
end

--[[
	* Initialize functions that use the EventHandler module.
	? For what purpose? It is to counter the Cyclic Module Dependecy.
]]

--[=[
	Removes the draggable capability from the associated GuiObject.

	@within Draggable
	@method Destroy
]=]
function Prototype.Destroy(self: Class)
	EventHanlder.Draggables[self._guiObject] = nil

	for _, guiObject in self._include do
		EventHanlder.Draggables[guiObject] = nil
	end

	self.Dragging:Destroy()
	self.Began:Destroy()
	self.Ended:Destroy()

	table.clear(self._include)
end

--[=[
	Allows the user to drag the Draggable GuiObject on its descendants.

	@within Draggable
	@method IncludeDescendants
]=]
function Prototype.IncludeDescendants(self: Class)
	for _, instance in self._guiObject:GetDescendants() do
		if not instance:IsA("GuiObject") then
			continue
		end

		table.insert(self._include, instance)
		EventHanlder.Draggables[instance] = self
	end
end

--[=[
	This function works similarly to [`IncludeDescendants`](#IncludeDescendants), but the developer can pass an array containing specific descendants of the GuiObject to be draggable.

	Example:
	```lua
	local draggableObject = Draggable.new(exampleFrame)

	local list = [] -- Do not include TextButtons

	for i, guiObject in exampleFrame:GetDescendants() do
		if guiObject:IsA("TextButton") then
			continue
		end

		table.insert(list, guiObject)
	end

	draggableObject:Include(list)
	```

	:::important
	Make sure that every element on the list is a GuiObject and that it is a descendant of the Draggable GuiObject.
	:::

	@within Draggable
	@param guiObjects {GuiObject}
	@method Include
]=]
function Prototype.Include(self: Class, guiObjects: { GuiObject })
	for i, guiObject in guiObjects do
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
