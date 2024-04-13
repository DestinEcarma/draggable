--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Draggable = require(ReplicatedStorage:WaitForChild("Draggable"))

local ExampleFrame = script.Parent

local Parent1 = ExampleFrame.Parent
local Parent2 = Parent1.Parent
local screenGui = ExampleFrame:FindFirstAncestorOfClass("ScreenGui")

local insideFrame = ExampleFrame:FindFirstChild("InsideFrame")
local insideFrameViewer = Parent1:FindFirstChild("InsideFrameViewer")

local button1 = screenGui:FindFirstChild("Button1")
local button2 = screenGui:FindFirstChild("Button2")
local button3 = screenGui:FindFirstChild("Button3")
local button4 = screenGui:FindFirstChild("Button4")

local DraggableClass = Draggable.new(ExampleFrame)

local function UpdateInsideFrameViewerPosition()
	local insideFramePosition = insideFrame.AbsolutePosition
	local parent1Position = Parent1.AbsolutePosition

	local difference = insideFramePosition - parent1Position

	local newPosition = insideFrameViewer.AbsoluteSize * insideFrameViewer.AnchorPoint + difference

	insideFrameViewer.Position = UDim2.fromOffset(newPosition.X, newPosition.Y)
end

DraggableClass.Began:Connect(function(mousePosition)
	print(`Began: {mousePosition}`)
end)

DraggableClass.Dragging:Connect(function(mousePosition)
	print(`Dragging: {mousePosition}`)
end)

DraggableClass.Ended:Connect(function(mousePosition)
	print(`Ended: {mousePosition}`)

	if DraggableClass.Boundary == insideFrame then
		UpdateInsideFrameViewerPosition()
	end
end)

button1.MouseButton1Click:Connect(function()
	DraggableClass.Boundary = screenGui

	Parent1.BackgroundTransparency = 1
	Parent2.BackgroundTransparency = 1
	insideFrameViewer.BackgroundTransparency = 1
end)

button2.MouseButton1Click:Connect(function()
	DraggableClass.Boundary = Parent2

	Parent2.BackgroundTransparency = 0
	Parent1.BackgroundTransparency = 1
	insideFrameViewer.BackgroundTransparency = 1
end)

button3.MouseButton1Click:Connect(function()
	DraggableClass.Boundary = Parent1

	Parent1.BackgroundTransparency = 0
	Parent2.BackgroundTransparency = 1
	insideFrameViewer.BackgroundTransparency = 1
end)

button4.MouseButton1Click:Connect(function()
	UpdateInsideFrameViewerPosition()

	DraggableClass.Boundary = insideFrame

	insideFrameViewer.BackgroundTransparency = 0
	Parent1.BackgroundTransparency = 1
	Parent2.BackgroundTransparency = 1
end) 