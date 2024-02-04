--!strict

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui") :: PlayerGui

local Prototype = require(script.Parent.Prototype)

local EventHandler = {
	Dragging = nil :: Prototype.Class?,
	Draggables = {} :: { [GuiObject]: Prototype.Class },
}

local function InputConditionMet(input: InputObject, gameProccessedEvent: boolean, inputChanged: boolean): boolean
	if gameProccessedEvent then
		return false
	end

	if inputChanged and input.UserInputType ~= Enum.UserInputType.MouseMovement then
		return false
	elseif not inputChanged and input.UserInputType ~= Enum.UserInputType.MouseButton1 then
		return false
	end

	return true
end

UserInputService.InputChanged:Connect(function(input, gameProccessedEvent)
	if not InputConditionMet(input, gameProccessedEvent, true) then
		return
	end

	local draggable = EventHandler.Dragging

	if not draggable or (draggable and not draggable.Enabled) then
		return
	end

	local mousePosition = Vector2.new(input.Position.X, input.Position.Y)

	Prototype.Dragging(draggable :: Prototype.Class, mousePosition)
end)

UserInputService.InputBegan:Connect(function(input, gameProccessedEvent)
	if not InputConditionMet(input, gameProccessedEvent, false) then
		return
	end

	local mousePosition = Vector2.new(input.Position.X, input.Position.Y)
	local firstGuiObject = PlayerGui:GetGuiObjectsAtPosition(mousePosition.X, mousePosition.Y)[1]

	if not firstGuiObject then
		return
	end

	local draggable = EventHandler.Draggables[firstGuiObject :: GuiObject]

	if not draggable or (draggable and not draggable.Enabled) then
		return
	end

	Prototype.Began(draggable :: Prototype.Class, mousePosition)
	EventHandler.Dragging = draggable
end)

UserInputService.InputEnded:Connect(function(input, gameProccessedEvent)
	if not InputConditionMet(input, gameProccessedEvent, false) then
		return
	end

	local draggable = EventHandler.Dragging

	if not draggable or (draggable and not draggable.Enabled) then
		return
	end

	local mousePosition = Vector2.new(input.Position.X, input.Position.Y)

	EventHandler.Dragging = nil
	Prototype.Ended(draggable :: Prototype.Class, mousePosition)
end)

return EventHandler
