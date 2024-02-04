--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Draggable = require(ReplicatedStorage:WaitForChild("Draggable"))

local ExampleFrame = script.Parent.ExampleFrame

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
