--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Draggable = require(ReplicatedStorage:WaitForChild("Draggable"))

local ExampleFrame = script.Parent

local Parent1 = ExampleFrame.Parent
local Parent2 = Parent1.Parent
local screenGui = ExampleFrame:FindFirstAncestorOfClass("ScreenGui")

local button1 = screenGui:FindFirstChild("Button1")
local button2 = screenGui:FindFirstChild("Button2")
local button3 = screenGui:FindFirstChild("Button3")

local DraggableClass = Draggable.new(ExampleFrame)

DraggableClass.Began:Connect(function(mousePosition)
	print(`Began: {mousePosition}`)
end)

DraggableClass.Dragging:Connect(function(mousePosition)
	print(`Dragging: {mousePosition}`)
end)

DraggableClass.Ended:Connect(function(mousePosition)
	print(`Ended: {mousePosition}`)
end)

button1.MouseButton1Click:Connect(function()
	DraggableClass.Boundary = screenGui

	Parent1.BackgroundTransparency = 1
	Parent2.BackgroundTransparency = 1
end)

button2.MouseButton1Click:Connect(function()
	DraggableClass.Boundary = Parent2

	Parent2.BackgroundTransparency = 0
	Parent1.BackgroundTransparency = 1
end)

button3.MouseButton1Click:Connect(function()
	DraggableClass.Boundary = Parent1

	Parent1.BackgroundTransparency = 0
	Parent2.BackgroundTransparency = 1
end)
