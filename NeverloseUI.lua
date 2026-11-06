local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer

local UI = {
	Flags = {},
	Configs = {},
	Settings = {
		Language = "English",
		MenuScale = "Auto",
		ESPScale = "100%",
		WindowsScale = "Auto",
		Units = "Auto",
		SafeMode = "Automatic",
		Sync = true,
	},
}

local T = {
	Window    = Color3.fromRGB(19, 20, 23),
	Panel     = Color3.fromRGB(23, 24, 27),
	Group     = Color3.fromRGB(28, 29, 33),
	Popup     = Color3.fromRGB(26, 27, 31),
	Field     = Color3.fromRGB(34, 35, 40),
	FieldHi   = Color3.fromRGB(41, 42, 48),
	Nav       = Color3.fromRGB(37, 38, 43),
	Stroke    = Color3.fromRGB(39, 40, 46),
	Divider   = Color3.fromRGB(36, 37, 42),
	Text      = Color3.fromRGB(232, 232, 236),
	SubText   = Color3.fromRGB(141, 143, 152),
	Caps      = Color3.fromRGB(100, 102, 110),
	Accent    = Color3.fromRGB(84, 112, 240),
	Danger    = Color3.fromRGB(240, 82, 82),
	Success   = Color3.fromRGB(72, 205, 120),
	Warning   = Color3.fromRGB(245, 180, 70),
	SwitchOff = Color3.fromRGB(45, 46, 52),
	KnobOff   = Color3.fromRGB(148, 149, 156),
	Pill      = Color3.fromRGB(22, 23, 26),
	PillLine  = Color3.fromRGB(46, 47, 53),
}
UI.Theme = T

local ACCENT_PRESETS = {
	{ "Blue", Color3.fromRGB(84, 112, 240) },
	{ "Purple", Color3.fromRGB(150, 95, 255) },
	{ "Pink", Color3.fromRGB(240, 90, 170) },
	{ "Red", Color3.fromRGB(240, 82, 82) },
	{ "Orange", Color3.fromRGB(245, 145, 60) },
	{ "Green", Color3.fromRGB(72, 205, 120) },
	{ "Cyan", Color3.fromRGB(50, 200, 230) },
	{ "White", Color3.fromRGB(230, 230, 235) },
}

local FONT = "rbxasset://fonts/families/BuilderSans.json"
local MONO = "rbxasset://fonts/families/RobotoMono.json"
local F = {
	Regular = Font.new(FONT, Enum.FontWeight.Regular),
	Medium  = Font.new(FONT, Enum.FontWeight.Medium),
	Bold    = Font.new(FONT, Enum.FontWeight.Bold),
	Heavy   = Font.new(FONT, Enum.FontWeight.ExtraBold),
	Mono    = Font.new(MONO, Enum.FontWeight.Regular),
	MonoB   = Font.new(MONO, Enum.FontWeight.Bold),
	Logo    = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Heavy),
}

local ICONS = {
	crosshair = { 16898613044, 453, 869 },
	mouse = { 16898613613, 563, 918 },
	image = { 16898613509, 306, 918 },
	layers = { 16898613509, 98, 967 },
	["layout-list"] = { 16898613509, 869, 453 },
	list = { 16898613509, 869, 808 },
	eye = { 16898613353, 771, 563 },
	["eye-off"] = { 16898613353, 820, 514 },
	clock = { 16898613044, 771, 661 },
	user = { 16898613869, 661, 869 },
	users = { 16898613869, 967, 98 },
	folder = { 16898613353, 404, 967 },
	["folder-open"] = { 16898613353, 820, 759 },
	save = { 16898613699, 918, 453 },
	search = { 16898613699, 918, 857 },
	ellipsis = { 16898613353, 771, 49 },
	["chevron-down"] = { 16898612819, 196, 918 },
	["chevron-right"] = { 16898612819, 869, 759 },
	["chevron-left"] = { 16898612819, 404, 967 },
	settings = { 16898613777, 771, 257 },
	["settings-2"] = { 16898613777, 0, 771 },
	keyboard = { 16898613509, 453, 820 },
	sliders = { 16898613777, 820, 355 },
	target = { 16898613869, 514, 771 },
	palette = { 16898613613, 453, 918 },
	sun = { 16898613777, 967, 453 },
	moon = { 16898613613, 306, 918 },
	globe = { 16898613509, 771, 563 },
	monitor = { 16898613613, 404, 820 },
	sparkles = { 16898613777, 918, 49 },
	star = { 16898613777, 967, 147 },
	plus = { 16898613699, 257, 918 },
	minus = { 16898613613, 771, 196 },
	trash = { 16898613869, 257, 918 },
	check = { 16898612819, 710, 869 },
	x = { 16898613869, 869, 906 },
	["rotate-ccw"] = { 16898613699, 967, 355 },
	["refresh-cw"] = { 16898613699, 404, 869 },
	link = { 16898613509, 918, 453 },
	["toggle-left"] = { 16898613869, 869, 49 },
	["toggle-right"] = { 16898613869, 820, 98 },
	info = { 16898613509, 612, 869 },
	bell = { 16898612819, 820, 257 },
	lock = { 16898613509, 918, 857 },
	copy = { 16898613044, 918, 612 },
	download = { 16898613044, 820, 906 },
	upload = { 16898613869, 612, 869 },
	shield = { 16898613777, 869, 0 },
	crown = { 16898613044, 404, 918 },
	hash = { 16898613509, 147, 771 },
	type = { 16898613869, 967, 257 },
	pipette = { 16898613699, 869, 49 },
	move = { 16898613613, 453, 820 },
	zap = { 16898613869, 918, 906 },
	gauge = { 16898613353, 771, 955 },
	ruler = { 16898613777, 869, 710 },
	terminal = { 16898613869, 820, 257 },
	skull = { 16898613777, 49, 869 },
	sword = { 16898613777, 710, 967 },
	focus = { 16898613353, 771, 759 },
	radar = { 16898613699, 820, 404 },
	message = { 16898613044, 355, 869 },
	languages = { 16898613509, 771, 563 },
	scale = { 16898613353, 771, 955 },
	ghost = { 16898613353, 869, 906 },
	flame = { 16898613353, 967, 306 },
}
UI.Icons = ICONS

local function Create(class, props, children)
	local inst = Instance.new(class)
	local parent
	for k, v in pairs(props or {}) do
		if k == "Parent" then
			parent = v
		else
			inst[k] = v
		end
	end
	for _, c in ipairs(children or {}) do
		c.Parent = inst
	end
	if parent then
		inst.Parent = parent
	end
	return inst
end

local function Tween(obj, props, t, style, dir)
	local tw = TweenService:Create(
		obj,
		TweenInfo.new(t or 0.2, style or Enum.EasingStyle.Quint, dir or Enum.EasingDirection.Out),
		props
	)
	tw:Play()
	return tw
end

local function Corner(r)
	return Create("UICorner", { CornerRadius = UDim.new(0, r or 8) })
end

local function Round()
	return Create("UICorner", { CornerRadius = UDim.new(1, 0) })
end

local function Stroke(color, thickness, transparency)
	return Create("UIStroke", {
		Color = color or T.Stroke,
		Thickness = thickness or 1,
		Transparency = transparency or 0,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	})
end

local function Pad(t, r, b, l)
	return Create("UIPadding", {
		PaddingTop = UDim.new(0, t or 0),
		PaddingRight = UDim.new(0, r or 0),
		PaddingBottom = UDim.new(0, b or 0),
		PaddingLeft = UDim.new(0, l or 0),
	})
end

local function List(padding, direction, hAlign, vAlign)
	return Create("UIListLayout", {
		Padding = UDim.new(0, padding or 0),
		SortOrder = Enum.SortOrder.LayoutOrder,
		FillDirection = direction or Enum.FillDirection.Vertical,
		HorizontalAlignment = hAlign or Enum.HorizontalAlignment.Left,
		VerticalAlignment = vAlign or Enum.VerticalAlignment.Top,
	})
end

local function Label(props)
	local base = {
		BackgroundTransparency = 1,
		FontFace = F.Medium,
		TextSize = 14,
		TextColor3 = T.Text,
		TextXAlignment = Enum.TextXAlignment.Left,
		Text = "",
	}
	for k, v in pairs(props) do
		base[k] = v
	end
	return Create("TextLabel", base)
end

local function Icon(name, parent, size, color, props)
	local img = Create("ImageLabel", {
		Size = UDim2.fromOffset(size or 16, size or 16),
		BackgroundTransparency = 1,
		ImageColor3 = color or T.SubText,
		ScaleType = Enum.ScaleType.Fit,
		Parent = parent,
	})
	local d = ICONS[name] or ICONS.star
	img.Image = "rbxassetid://" .. d[1]
	img.ImageRectOffset = Vector2.new(d[2], d[3])
	img.ImageRectSize = Vector2.new(48, 48)
	for k, v in pairs(props or {}) do
		img[k] = v
	end
	return img
end

local function SafeCall(fn, ...)
	if type(fn) ~= "function" then
		return
	end
	local ok, err = pcall(fn, ...)
	if not ok then
		warn("[Neverlose] " .. tostring(err))
	end
end

local orderCounter = 0
local function NextOrder()
	orderCounter += 1
	return orderCounter
end

local function KeyName(k)
	if not k then
		return "None"
	end
	local n = k.Name
	local map = {
		MouseButton1 = "M1", MouseButton2 = "M2", MouseButton3 = "M3",
		LeftShift = "LShift", RightShift = "RShift",
		LeftControl = "LCtrl", RightControl = "RCtrl",
		LeftAlt = "LAlt", RightAlt = "RAlt",
		Insert = "Ins", Delete = "Del", Backspace = "Back",
		CapsLock = "Caps", Return = "Enter", Space = "Space",
		Semicolon = ";", Quote = "'", Comma = ",", Period = ".", Slash = "/",
		BackSlash = "\\", LeftBracket = "[", RightBracket = "]", Minus = "-",
		Equals = "=", Backquote = "`", Tilde = "~", PageUp = "PgUp", PageDown = "PgDn",
		KeypadZero = "Num0", KeypadOne = "Num1", KeypadTwo = "Num2", KeypadThree = "Num3",
		KeypadFour = "Num4", KeypadFive = "Num5", KeypadSix = "Num6", KeypadSeven = "Num7",
		KeypadEight = "Num8", KeypadNine = "Num9",
		One = "1", Two = "2", Three = "3", Four = "4", Five = "5",
		Six = "6", Seven = "7", Eight = "8", Nine = "9", Zero = "0",
	}
	return map[n] or n
end

local function Mouse()
	return UserInputService:GetMouseLocation() - GuiService:GetGuiInset()
end

local function Inside(gui, m, pad)
	if not gui or not gui.Visible then
		return false
	end
	pad = pad or 0
	local p, s = gui.AbsolutePosition, gui.AbsoluteSize
	return m.X >= p.X - pad and m.X <= p.X + s.X + pad and m.Y >= p.Y - pad and m.Y <= p.Y + s.Y + pad
end

local function ValueEquals(a, b)
	if type(a) == "table" and type(b) == "table" then
		if #a ~= #b then
			return false
		end
		for i = 1, #a do
			if a[i] ~= b[i] then
				return false
			end
		end
		return true
	end
	return a == b
end

local function CopyValue(v)
	if type(v) == "table" then
		return table.clone(v)
	end
	return v
end

local function FollowShadow(target, root, radius, layers, strength, z, step)
	step = step or 3
	radius = radius or 12
	layers = layers or 6
	strength = strength or 0.12
	local margin = layers * 3 + 4
	local isGroup = target:IsA("CanvasGroup")
	local holder = Create("Frame", {
		Name = "Shadow",
		BackgroundTransparency = 1,
		Active = false,
		ZIndex = z or math.max(target.ZIndex - 1, 0),
		Parent = root,
	})
	local corners = {}
	local frames = {}
	for i = 1, layers do
		local grow = i * step
		local c = Create("UICorner", { CornerRadius = UDim.new(0, radius + grow) })
		table.insert(corners, { Corner = c, Grow = grow })
		local base = 1 - strength * (1 - (i - 1) / layers)
		local f = Create("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(1, grow * 2 - margin * 2, 1, grow * 2 - margin * 2),
			BackgroundColor3 = Color3.new(0, 0, 0),
			BackgroundTransparency = base,
			Active = false,
			ZIndex = holder.ZIndex,
			Parent = holder,
		}, { c })
		table.insert(frames, { Frame = f, Base = base })
	end
	local function Visible()
		local g = target
		while g and g:IsA("GuiObject") do
			if not g.Visible then
				return false
			end
			g = g.Parent
		end
		return target.Parent ~= nil
	end
	local function Sync()
		if not target.Parent then
			holder:Destroy()
			return
		end
		local p, s = target.AbsolutePosition, target.AbsoluteSize
		local rp = root.AbsolutePosition
		holder.Position = UDim2.fromOffset(p.X - rp.X - margin, p.Y - rp.Y - margin)
		holder.Size = UDim2.fromOffset(s.X + margin * 2, s.Y + margin * 2)
		holder.Visible = Visible()
	end
	target:GetPropertyChangedSignal("AbsolutePosition"):Connect(Sync)
	target:GetPropertyChangedSignal("AbsoluteSize"):Connect(Sync)
	target:GetPropertyChangedSignal("Visible"):Connect(Sync)
	target.AncestryChanged:Connect(Sync)
	if isGroup then
		local function Fade()
			local gt = target.GroupTransparency
			for _, l in ipairs(frames) do
				l.Frame.BackgroundTransparency = l.Base + (1 - l.Base) * gt
			end
		end
		target:GetPropertyChangedSignal("GroupTransparency"):Connect(Fade)
		Fade()
	end
	task.defer(Sync)
	return holder, Sync, corners
end

local AccentHooks = {}
local function OnAccent(fn)
	table.insert(AccentHooks, fn)
	fn(T.Accent)
end

function UI:SetAccent(color)
	T.Accent = color
	for _, fn in ipairs(AccentHooks) do
		SafeCall(fn, color)
	end
end

local MAX_LEVEL = 5

local FadeTokens = setmetatable({}, { __mode = "k" })

local function HideFrame(frame)
	local tok = (FadeTokens[frame] or 0) + 1
	FadeTokens[frame] = tok
	if frame:IsA("CanvasGroup") then
		Tween(frame, { GroupTransparency = 1 }, 0.2, Enum.EasingStyle.Quint).Completed:Connect(function()
			if FadeTokens[frame] == tok then
				frame.Visible = false
			end
		end)
	else
		frame.Visible = false
	end
end

local function CloseFrom(win, level, keep)
	for l = MAX_LEVEL, level, -1 do
		local e = win._layers[l]
		if e then
			win._layers[l] = nil
			win._closedAt[e.Frame] = os.clock()
			if e.Frame ~= keep then
				HideFrame(e.Frame)
			end
			SafeCall(e.OnClose)
		end
	end
end

local function OpenLayer(win, level, frame, onClose)
	CloseFrom(win, level, frame)
	win._layers[level] = { Frame = frame, OnClose = onClose }
	FadeTokens[frame] = (FadeTokens[frame] or 0) + 1
	frame.Visible = true
end

local function IsOpen(win, frame)
	if not frame then
		return false
	end
	for l = 1, MAX_LEVEL do
		local e = win._layers[l]
		if e and e.Frame == frame then
			return true
		end
	end
	return false
end

local function JustClosed(win, frame)
	return os.clock() - (win._closedAt[frame] or 0) < 0.3
end

local function InsideLayers(win, m)
	for l = 1, MAX_LEVEL do
		local e = win._layers[l]
		if e and Inside(e.Frame, m, 2) then
			return true
		end
	end
	return false
end

local function AnimateIn(frame, x, y)
	frame.Position = UDim2.fromOffset(x, y - 8)
	Tween(frame, { Position = UDim2.fromOffset(x, y) }, 0.38, Enum.EasingStyle.Quint)
	if frame:IsA("CanvasGroup") then
		Tween(frame, { GroupTransparency = 0 }, 0.3, Enum.EasingStyle.Quint)
	end
end

local function PlaceNear(win, frame, anchor, width, mode)
	local p, s = anchor.AbsolutePosition, anchor.AbsoluteSize
	local scr = win.Gui.AbsoluteSize
	local x, y
	if mode == "right" then
		x, y = p.X + s.X + 8, p.Y - 6
	elseif mode == "below-left" then
		x, y = p.X, p.Y + s.Y + 6
	else
		x, y = p.X + s.X - width, p.Y + s.Y + 6
	end
	x = math.clamp(x, 6, math.max(scr.X - width - 6, 6))
	frame.Position = UDim2.fromOffset(x, y)
	task.defer(function()
		local h = frame.AbsoluteSize.Y
		if y + h > scr.Y - 8 then
			y = math.max(scr.Y - h - 8, 6)
		end
		AnimateIn(frame, x, y)
	end)
end

local function PopupFrame(win, width, title, zbase)
	zbase = zbase or 100
	local frame = Create("CanvasGroup", {
		Size = UDim2.fromOffset(width, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		GroupTransparency = 1,
		Visible = false,
		ZIndex = zbase,
		Parent = win.Overlay,
	}, { Pad(1, 1, 1, 1) })
	local card = Create("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = T.Popup,
		ZIndex = zbase,
		Parent = frame,
	}, { Corner(12), Stroke(T.Stroke) })
	FollowShadow(frame, win.Overlay, 12, 6, 0.16, zbase - 1)
	local items = Create("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		ZIndex = zbase + 1,
		Parent = card,
	}, { List(0, nil, Enum.HorizontalAlignment.Center), Pad(6, 0, 6, 0) })
	if title then
		local cap = Label({
			Text = title:upper(),
			FontFace = F.Medium,
			TextSize = 11,
			TextColor3 = T.Caps,
			Size = UDim2.new(1, 0, 0, 26),
			LayoutOrder = -100,
			ZIndex = zbase + 2,
			Parent = items,
		})
		Create("UIPadding", { PaddingLeft = UDim.new(0, 16), Parent = cap })
	end
	return frame, items
end

local function MenuRow(parent, o)
	local z = o.Z or 102
	local row = Create("TextButton", {
		Size = UDim2.new(1, -12, 0, o.Height or 34),
		BackgroundColor3 = T.Nav,
		BackgroundTransparency = o.Selected and 0 or 1,
		AutoButtonColor = false,
		Text = "",
		LayoutOrder = o.Order or NextOrder(),
		ZIndex = z,
		Parent = parent,
	}, { Corner(8) })
	local color = o.Color or T.Text
	local x = 12
	local ic
	if o.Icon then
		ic = Icon(o.Icon, row, 16, o.IconColor or (o.Color or T.SubText), {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 12, 0.5, 0),
			ZIndex = z + 1,
		})
		x = 38
	end
	local lbl = Label({
		Text = o.Text or "",
		TextSize = 13,
		TextColor3 = color,
		Position = UDim2.fromOffset(x, 0),
		Size = UDim2.new(1, -x - 90, 1, 0),
		TextTruncate = Enum.TextTruncate.AtEnd,
		ZIndex = z + 1,
		Parent = row,
	})
	local rightLbl
	if o.Right then
		rightLbl = Label({
			Text = o.Right,
			TextSize = 13,
			TextColor3 = T.SubText,
			TextXAlignment = Enum.TextXAlignment.Right,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, o.Chevron and -30 or -12, 0.5, 0),
			Size = UDim2.fromOffset(100, 20),
			TextTruncate = Enum.TextTruncate.AtEnd,
			ZIndex = z + 1,
			Parent = row,
		})
	end
	local chev
	if o.Chevron then
		chev = Icon("chevron-right", row, 14, T.SubText, {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -10, 0.5, 0),
			ZIndex = z + 1,
		})
	end
	row.MouseEnter:Connect(function()
		if not o.Selected then
			Tween(row, { BackgroundTransparency = 0.4 }, 0.22)
		end
	end)
	row.MouseLeave:Connect(function()
		if not o.Selected then
			Tween(row, { BackgroundTransparency = 1 }, 0.22)
		end
	end)
	if o.Callback then
		row.Activated:Connect(function()
			o.Callback(row)
		end)
	end
	return row, lbl, rightLbl, ic, chev
end

local function MenuDivider(parent, z)
	local d = Create("Frame", {
		Size = UDim2.new(1, 0, 0, 9),
		BackgroundTransparency = 1,
		LayoutOrder = NextOrder(),
		ZIndex = z or 102,
		Parent = parent,
	})
	Create("Frame", {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 12, 0.5, 0),
		Size = UDim2.new(1, -24, 0, 1),
		BackgroundColor3 = T.Divider,
		BorderSizePixel = 0,
		ZIndex = (z or 102) + 1,
		Parent = d,
	})
	return d
end

local function Switch(parent, z, small)
	local w, h, k = small and 34 or 42, small and 20 or 24, small and 14 or 18
	local sw = Create("Frame", {
		Size = UDim2.fromOffset(w, h),
		BackgroundColor3 = T.SwitchOff,
		ZIndex = z,
		Parent = parent,
	}, { Round() })
	local knob = Create("Frame", {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 3, 0.5, 0),
		Size = UDim2.fromOffset(k, k),
		BackgroundColor3 = T.KnobOff,
		ZIndex = z + 1,
		Parent = sw,
	}, { Round() })
	local state = false
	local function Paint(on, animate)
		state = on
		local t = animate and 0.34 or 0
		Tween(sw, { BackgroundColor3 = on and T.Accent or T.SwitchOff }, t)
		Tween(knob, {
			Position = on and UDim2.new(1, -(k + 3), 0.5, 0) or UDim2.new(0, 3, 0.5, 0),
			BackgroundColor3 = on and Color3.new(1, 1, 1) or T.KnobOff,
		}, t)
	end
	OnAccent(function()
		if state then
			sw.BackgroundColor3 = T.Accent
		end
	end)
	return sw, Paint
end

local Hotkey = {}
Hotkey.__index = Hotkey

function Hotkey.new(win, elem)
	local hk = setmetatable({
		Window = win,
		Elem = elem,
		Key = nil,
		Mode = "Toggle",
		Value = elem:_DefaultHotkeyValue(),
		Visible = true,
		Active = false,
		ActivatedAt = 0,
	}, Hotkey)
	table.insert(elem.Hotkeys, hk)
	table.insert(win._hotkeys, hk)
	win:_RefreshHotkeys()
	return hk
end

function Hotkey:SetActive(active)
	active = active and true or false
	if active == self.Active then
		return
	end
	self.Active = active
	if active then
		self.ActivatedAt = os.clock()
	end
	self.Elem:_Recompute()
	self.Window:_RefreshHotkeys()
end

function Hotkey:SetMode(mode)
	self.Mode = mode
	if mode == "Always" then
		self:SetActive(true)
	else
		self:SetActive(false)
	end
	self.Window:_RefreshHotkeys()
end

function Hotkey:SetKey(key)
	self.Key = key
	self.Window:_RefreshHotkeys()
end

function Hotkey:SetValue(v)
	self.Value = CopyValue(v)
	if self.Active then
		self.Elem:_Recompute()
	end
end

function Hotkey:Destroy()
	self:SetActive(false)
	local list = self.Elem.Hotkeys
	local i = table.find(list, self)
	if i then
		table.remove(list, i)
	end
	local all = self.Window._hotkeys
	local j = table.find(all, self)
	if j then
		table.remove(all, j)
	end
	self.Window:_RefreshHotkeys()
end

function Hotkey:Describe()
	local v = self.Value
	if type(v) == "boolean" then
		return v and "On" or "Off"
	elseif type(v) == "table" then
		return #v == 0 and "None" or table.concat(v, ", ")
	elseif type(v) == "number" and self.Elem._Fmt then
		return self.Elem._Fmt(v)
	end
	return tostring(v)
end

local function MakeBindable(elem)
	elem.Hotkeys = {}
	elem.Base = CopyValue(elem.Value)

	function elem:_Recompute(silent)
		local v, best = self.Base, -math.huge
		for _, hk in ipairs(self.Hotkeys) do
			if hk.Active and hk.ActivatedAt > best then
				best = hk.ActivatedAt
				v = hk.Value
			end
		end
		self:_Apply(CopyValue(v), silent)
	end

	function elem:Set(v, silent)
		self.Base = CopyValue(v)
		local changedHotkeys = false
		for _, hk in ipairs(self.Hotkeys) do
			if hk.Mode == "Toggle" and hk.Active then
				hk.Active = false
				changedHotkeys = true
			end
		end
		self:_Recompute(silent)
		if changedHotkeys and self.Window then
			self.Window:_RefreshHotkeys()
		end
	end

	function elem:Get()
		return self.Value
	end

	function elem:Reset()
		self:Set(CopyValue(self.Default))
	end

	function elem:_PaintHint() end

	return elem
end

local function PrevValue(o)
	local f = o.Flag and UI.Flags[o.Flag]
	if f and f.Base ~= nil then
		return CopyValue(f.Base)
	end
	return nil
end

local Container = {}
Container.__index = Container

local function NewContainer(win, items, z, opts)
	opts = opts or {}
	return setmetatable({
		Window = win,
		Items = items,
		_count = 0,
		_z = z or 1,
		_noRegister = opts.NoRegister,
		_noMenu = opts.NoMenu,
		_level = opts.Level or 1,
		Tab = opts.Tab,
		Frame = opts.Frame,
	}, Container)
end

local function NewRow(self, height)
	local row = Create("Frame", {
		Size = UDim2.new(1, 0, 0, height or 40),
		BackgroundTransparency = 1,
		LayoutOrder = NextOrder(),
		ZIndex = self._z,
		Parent = self.Items,
	})
	if self._count > 0 then
		Create("Frame", {
			Position = UDim2.fromOffset(14, 0),
			Size = UDim2.new(1, -28, 0, 1),
			BackgroundColor3 = T.Divider,
			BorderSizePixel = 0,
			ZIndex = self._z,
			Parent = row,
		})
	end
	self._count += 1
	return row
end

local function RowLabel(self, row, text, rightSpace)
	return Label({
		Text = text,
		Position = UDim2.fromOffset(16, 0),
		Size = UDim2.new(1, -(rightSpace or 120), 1, 0),
		TextTruncate = Enum.TextTruncate.AtEnd,
		ZIndex = self._z,
		Parent = row,
	})
end

local function RightHolder(self, row)
	return Create("Frame", {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -14, 0.5, 0),
		Size = UDim2.fromOffset(0, 24),
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundTransparency = 1,
		ZIndex = self._z,
		Parent = row,
	}, { List(10, Enum.FillDirection.Horizontal, Enum.HorizontalAlignment.Right, Enum.VerticalAlignment.Center) })
end

local function Register(self, o, elem, row)
	elem.Name = o.Name
	elem.Window = self.Window
	elem._row = row
	if not self._noRegister then
		if o.Flag then
			UI.Flags[o.Flag] = elem
		end
		if self.Tab then
			table.insert(self.Window._elements, {
				Name = (o.Name or ""):lower(),
				Row = row,
				Container = self,
				Elem = elem,
			})
		end
	end
	return elem
end

local function AddDots(self, holder, elem, o, order)
	local dots = Create("ImageButton", {
		Size = UDim2.fromOffset(20, 20),
		BackgroundTransparency = 1,
		Image = "",
		LayoutOrder = order or 6,
		ZIndex = self._z + 2,
		Parent = holder,
	})
	local icon = Icon("ellipsis", dots, 18, T.SubText, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		ZIndex = self._z + 3,
	})
	dots.MouseEnter:Connect(function()
		Tween(icon, { ImageColor3 = T.Text }, 0.22)
	end)
	dots.MouseLeave:Connect(function()
		if not elem._menuOpen then
			Tween(icon, { ImageColor3 = T.SubText }, 0.22)
		end
	end)
	dots.Activated:Connect(function()
		self.Window:_OpenElementMenu(elem, dots, o, icon)
	end)
	elem._dots = dots
	elem._dotsIcon = icon
	return dots
end

function Container:AddToggle(o)
	o = o or {}
	local win, z = self.Window, self._z
	local start = PrevValue(o)
	if start == nil then
		start = o.Default and true or false
	end
	local elem = {
		Type = "Toggle",
		Value = start,
		Default = o.Default and true or false,
		Settings = o.Settings,
		Window = win,
	}
	MakeBindable(elem)

	local row = NewRow(self, 40)
	RowLabel(self, row, o.Name or "Toggle", 160)
	local holder = RightHolder(self, row)

	local sw, Paint = Switch(holder, z)
	sw.LayoutOrder = 10


	if o.Color then
		elem.ColorPicker = self:_Swatch(holder, o.Color, o.ColorFlag, o.ColorCallback, 4, o.Name)
	end

	if not self._noMenu and o.Bindable ~= false then
		AddDots(self, holder, elem, o, 6)
	end

	function elem:_Apply(v, silent)
		local changed = v ~= self.Value
		self.Value = v
		Paint(v, true)
		if changed and not silent then
			SafeCall(o.Callback, v)
		end
	end

	function elem:_DefaultHotkeyValue()
		return true
	end

	local hit = Create("TextButton", {
		Size = UDim2.new(1, -150, 1, 0),
		BackgroundTransparency = 1,
		Text = "",
		ZIndex = z,
		Parent = row,
	})
	local swHit = Create("TextButton", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		Text = "",
		ZIndex = z + 2,
		Parent = sw,
	})
	hit.Activated:Connect(function()
		elem:Set(not elem.Value)
	end)
	swHit.Activated:Connect(function()
		elem:Set(not elem.Value)
	end)
	if elem._dots then
		hit.MouseButton2Click:Connect(function()
			win:_OpenElementMenu(elem, elem._dots, o, elem._dotsIcon)
		end)
	end

	Paint(elem.Value, false)
	return Register(self, o, elem, row)
end

function Container:AddSlider(o)
	o = o or {}
	local win, z = self.Window, self._z
	local min, max = o.Min or 0, o.Max or 100
	local inc = o.Increment or 1
	local start = PrevValue(o)
	if start == nil then
		start = o.Default or min
	end
	local elem = {
		Type = "Slider",
		Value = start,
		Default = o.Default or min,
		Settings = o.Settings,
		Min = min,
		Max = max,
		Increment = inc,
		Suffix = o.Suffix,
		Window = win,
	}
	MakeBindable(elem)

	local row = NewRow(self, 40)
	RowLabel(self, row, o.Name or "Slider", self._noMenu and 190 or 230)

	local rightOffset = 14
	if not self._noMenu and o.Bindable ~= false then
		local h = RightHolder(self, row)
		AddDots(self, h, elem, o, 1)
		rightOffset = 44
	end

	local box = Create("TextBox", {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -rightOffset, 0.5, 0),
		Size = UDim2.fromOffset(48, 26),
		BackgroundColor3 = T.Field,
		Text = "",
		FontFace = F.Medium,
		TextSize = 12,
		TextColor3 = T.SubText,
		ClearTextOnFocus = false,
		ZIndex = z,
		Parent = row,
	}, { Corner(7), Stroke(T.Stroke) })

	local trackW = o.TrackWidth or (self._noMenu and 96 or 120)
	local track = Create("Frame", {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -rightOffset - 60, 0.5, 0),
		Size = UDim2.fromOffset(trackW, 4),
		BackgroundColor3 = T.SwitchOff,
		ZIndex = z,
		Parent = row,
	}, { Round() })
	local fill = Create("Frame", {
		Size = UDim2.fromScale(0, 1),
		BackgroundColor3 = T.Accent,
		ZIndex = z + 1,
		Parent = track,
	}, { Round() })
	OnAccent(function(c)
		fill.BackgroundColor3 = c
	end)
	local knob = Create("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0, 0.5),
		Size = UDim2.fromOffset(16, 16),
		BackgroundColor3 = Color3.new(1, 1, 1),
		ZIndex = z + 2,
		Parent = track,
	}, { Round() })

	local decimals = 0
	do
		local s = tostring(inc)
		local dot = s:find("%.")
		if dot then
			decimals = #s - dot
		end
	end
	local function Fmt(v)
		return string.format("%." .. decimals .. "f", v) .. (o.Suffix or "")
	end
	local function Snap(v)
		return math.clamp(math.floor((v - min) / inc + 0.5) * inc + min, min, max)
	end
	elem._Fmt = Fmt

	function elem:_Apply(v, silent)
		v = Snap(v)
		local changed = v ~= self.Value
		self.Value = v
		local pct = (v - min) / math.max(max - min, 1e-9)
		Tween(fill, { Size = UDim2.fromScale(pct, 1) }, 0.14)
		Tween(knob, { Position = UDim2.fromScale(pct, 0.5) }, 0.14)
		box.Text = Fmt(v)
		if changed and not silent then
			SafeCall(o.Callback, v)
		end
	end

	function elem:_DefaultHotkeyValue()
		return self.Base
	end

	box.FocusLost:Connect(function()
		local n = tonumber((box.Text:gsub("[^%d%.%-]", "")))
		if n then
			elem:Set(n)
		else
			box.Text = Fmt(elem.Value)
		end
	end)

	local dragging = false
	local hit = Create("TextButton", {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -rightOffset - 54, 0.5, 0),
		Size = UDim2.fromOffset(trackW + 12, 26),
		BackgroundTransparency = 1,
		Text = "",
		ZIndex = z + 3,
		Parent = row,
	})
	local function FromMouse()
		local m = Mouse()
		local pct = math.clamp((m.X - track.AbsolutePosition.X) / math.max(track.AbsoluteSize.X, 1), 0, 1)
		elem:Set(min + (max - min) * pct)
	end
	hit.InputBegan:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			Tween(knob, { Size = UDim2.fromOffset(18, 18) }, 0.1)
			FromMouse()
		end
	end)
	table.insert(win._conns, UserInputService.InputChanged:Connect(function(i)
		if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
			if not row.Parent then
				dragging = false
				return
			end
			FromMouse()
		end
	end))
	table.insert(win._conns, UserInputService.InputEnded:Connect(function(i)
		if dragging and (i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch) then
			dragging = false
			Tween(knob, { Size = UDim2.fromOffset(16, 16) }, 0.1)
		end
	end))

	elem.Value = nil
	elem:_Apply(elem.Base, true)
	return Register(self, o, elem, row)
end

local function DropBox(z, parent, width, rightOffset)
	local box = Create("TextButton", {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -(rightOffset or 14), 0.5, 0),
		Size = width or UDim2.new(0.5, -4, 0, 30),
		BackgroundColor3 = T.Field,
		AutoButtonColor = false,
		Text = "",
		ZIndex = z,
		Parent = parent,
	}, { Corner(8), Stroke(T.Stroke) })
	local txt = Label({
		Text = "",
		TextSize = 13,
		Position = UDim2.fromOffset(12, 0),
		Size = UDim2.new(1, -40, 1, 0),
		TextTruncate = Enum.TextTruncate.AtEnd,
		ZIndex = z,
		Parent = box,
	})
	local chev = Icon("chevron-down", box, 14, T.SubText, {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -10, 0.5, 0),
		ZIndex = z,
	})
	box.MouseEnter:Connect(function()
		Tween(box, { BackgroundColor3 = T.FieldHi }, 0.22)
	end)
	box.MouseLeave:Connect(function()
		Tween(box, { BackgroundColor3 = T.Field }, 0.22)
	end)
	return box, txt, chev
end

function Container:AddDropdown(o)
	o = o or {}
	local win, z = self.Window, self._z
	local multi = o.Multi
	local options = o.Options or {}
	local default = multi and table.clone(o.Default or {}) or (o.Default or options[1])
	local start = PrevValue(o)
	if start == nil then
		start = CopyValue(default)
	end
	local elem = {
		Type = "Dropdown",
		Options = options,
		Multi = multi,
		Value = start,
		Default = CopyValue(default),
		Settings = o.Settings,
		Window = win,
	}
	MakeBindable(elem)

	local row = NewRow(self, 40)
	RowLabel(self, row, o.Name or "Dropdown", 230)

	local rightOffset = 14
	if not self._noMenu and o.Bindable ~= false then
		local h = RightHolder(self, row)
		AddDots(self, h, elem, o, 1)
		rightOffset = 44
	end
	local box, txt, chev = DropBox(z, row, UDim2.new(0.5, -(rightOffset - 10), 0, 30), rightOffset)

	local level = self._level + (self._noMenu and 1 or 0)
	local pop = Create("ScrollingFrame", {
		Size = UDim2.fromOffset(200, 0),
		BackgroundColor3 = T.Popup,
		ScrollBarThickness = 2,
		ScrollBarImageColor3 = T.Caps,
		CanvasSize = UDim2.new(),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		BorderSizePixel = 0,
		Visible = false,
		ZIndex = 140 + level * 10,
		Parent = win.Overlay,
	}, { Corner(10), Stroke(T.Stroke), List(2), Pad(5, 5, 5, 5) })
	FollowShadow(pop, win.Overlay, 10, 5, 0.16, pop.ZIndex - 1)

	local function IsOn(opt)
		if multi then
			return table.find(elem.Value, opt) ~= nil
		end
		return elem.Value == opt
	end

	local function Display()
		if multi then
			txt.Text = #elem.Value == 0 and "None" or table.concat(elem.Value, ", ")
		else
			txt.Text = tostring(elem.Value or "None")
		end
	end

	local Build
	function Build()
		for _, c in ipairs(pop:GetChildren()) do
			if c:IsA("TextButton") then
				c:Destroy()
			end
		end
		local zz = pop.ZIndex + 1
		for i, opt in ipairs(elem.Options) do
			local on = IsOn(opt)
			local b = Create("TextButton", {
				Size = UDim2.new(1, 0, 0, 30),
				BackgroundColor3 = T.Nav,
				BackgroundTransparency = on and 0 or 1,
				AutoButtonColor = false,
				Text = "",
				LayoutOrder = i,
				ZIndex = zz,
				Parent = pop,
			}, { Corner(7) })
			local t = Label({
				Text = tostring(opt),
				TextSize = 13,
				TextColor3 = on and T.Text or T.SubText,
				Position = UDim2.fromOffset(10, 0),
				Size = UDim2.new(1, -36, 1, 0),
				ZIndex = zz + 1,
				Parent = b,
			})
			if on then
				Icon("check", b, 14, T.Accent, {
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.new(1, -8, 0.5, 0),
					ZIndex = zz + 1,
				})
			end
			b.MouseEnter:Connect(function()
				if not IsOn(opt) then
					Tween(b, { BackgroundTransparency = 0.5 }, 0.1)
					Tween(t, { TextColor3 = T.Text }, 0.1)
				end
			end)
			b.MouseLeave:Connect(function()
				if not IsOn(opt) then
					Tween(b, { BackgroundTransparency = 1 }, 0.1)
					Tween(t, { TextColor3 = T.SubText }, 0.1)
				end
			end)
			b.Activated:Connect(function()
				if multi then
					local v = table.clone(elem.Value)
					local idx = table.find(v, opt)
					if idx then
						table.remove(v, idx)
					else
						table.insert(v, opt)
					end
					elem:Set(v)
				else
					elem:Set(opt)
					CloseFrom(win, level)
				end
			end)
		end
		pop.Size = UDim2.fromOffset(box.AbsoluteSize.X, math.min(#elem.Options * 32 + 10, 260))
	end

	function elem:_Apply(v, silent)
		local changed = not ValueEquals(v, self.Value)
		self.Value = v
		Display()
		if pop.Visible then
			Build()
		end
		if changed and not silent then
			SafeCall(o.Callback, CopyValue(v))
		end
	end

	function elem:_DefaultHotkeyValue()
		return CopyValue(self.Base)
	end

	function elem:Refresh(newOptions, keep)
		self.Options = newOptions or {}
		if not keep then
			self:Set(multi and {} or self.Options[1])
		else
			Display()
		end
		if pop.Visible then
			Build()
		end
	end

	box.Activated:Connect(function()
		if IsOpen(win, pop) then
			CloseFrom(win, level)
		elseif not JustClosed(win, pop) then
			Build()
			PlaceNear(win, pop, box, box.AbsoluteSize.X, "below-right")
			Tween(chev, { Rotation = 180 }, 0.15)
			OpenLayer(win, level, pop, function()
				Tween(chev, { Rotation = 0 }, 0.15)
			end)
		end
	end)

	Display()
	return Register(self, o, elem, row)
end

function Container:_Swatch(parent, default, flag, callback, layoutOrder, name)
	local win = self.Window
	local level = self._level + (self._noMenu and 1 or 0)
	local cp = { Type = "ColorPicker", Value = default or Color3.new(1, 1, 1), Name = name }
	local h, s, v = cp.Value:ToHSV()

	local sw = Create("TextButton", {
		Size = UDim2.fromOffset(22, 14),
		BackgroundColor3 = cp.Value,
		AutoButtonColor = false,
		Text = "",
		LayoutOrder = layoutOrder or 1,
		ZIndex = self._z,
		Parent = parent,
	}, { Corner(4), Stroke(Color3.new(0, 0, 0), 1, 0.4) })

	local zb = 160 + level * 10
	local pop = Create("Frame", {
		Size = UDim2.fromOffset(222, 248),
		BackgroundColor3 = T.Popup,
		Visible = false,
		ZIndex = zb,
		Parent = win.Overlay,
	}, { Corner(12), Stroke(T.Stroke) })
	FollowShadow(pop, win.Overlay, 12, 6, 0.16, zb - 1)

	local svBox = Create("ImageButton", {
		Position = UDim2.fromOffset(12, 12),
		Size = UDim2.fromOffset(164, 164),
		BackgroundColor3 = Color3.fromHSV(h, 1, 1),
		AutoButtonColor = false,
		Image = "",
		ZIndex = zb + 1,
		Parent = pop,
	}, { Corner(8) })
	Create("Frame", {
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = Color3.new(1, 1, 1),
		Active = false,
		ZIndex = zb + 2,
		Parent = svBox,
	}, { Corner(8), Create("UIGradient", { Transparency = NumberSequence.new(0, 1) }) })
	Create("Frame", {
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = Color3.new(0, 0, 0),
		Active = false,
		ZIndex = zb + 3,
		Parent = svBox,
	}, { Corner(8), Create("UIGradient", { Rotation = 90, Transparency = NumberSequence.new(1, 0) }) })
	local svKnob = Create("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.fromOffset(12, 12),
		BackgroundTransparency = 1,
		ZIndex = zb + 4,
		Parent = svBox,
	}, { Round(), Stroke(Color3.new(1, 1, 1), 2) })

	local hue = Create("ImageButton", {
		Position = UDim2.fromOffset(186, 12),
		Size = UDim2.fromOffset(24, 164),
		BackgroundColor3 = Color3.new(1, 1, 1),
		AutoButtonColor = false,
		Image = "",
		ZIndex = zb + 1,
		Parent = pop,
	}, {
		Corner(8),
		Create("UIGradient", {
			Rotation = 90,
			Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.fromHSV(0, 1, 1)),
				ColorSequenceKeypoint.new(1 / 6, Color3.fromHSV(1 / 6, 1, 1)),
				ColorSequenceKeypoint.new(2 / 6, Color3.fromHSV(2 / 6, 1, 1)),
				ColorSequenceKeypoint.new(3 / 6, Color3.fromHSV(3 / 6, 1, 1)),
				ColorSequenceKeypoint.new(4 / 6, Color3.fromHSV(4 / 6, 1, 1)),
				ColorSequenceKeypoint.new(5 / 6, Color3.fromHSV(5 / 6, 1, 1)),
				ColorSequenceKeypoint.new(1, Color3.fromHSV(1, 1, 1)),
			}),
		}),
	})
	local hueKnob = Create("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0),
		Size = UDim2.new(1, 4, 0, 4),
		BackgroundColor3 = Color3.new(1, 1, 1),
		ZIndex = zb + 2,
		Parent = hue,
	}, { Corner(2) })

	local presets = Create("Frame", {
		Position = UDim2.fromOffset(12, 184),
		Size = UDim2.new(1, -24, 0, 18),
		BackgroundTransparency = 1,
		ZIndex = zb + 1,
		Parent = pop,
	}, { List(6, Enum.FillDirection.Horizontal) })

	local hex = Create("TextBox", {
		Position = UDim2.fromOffset(12, 212),
		Size = UDim2.new(1, -24, 0, 26),
		BackgroundColor3 = T.Field,
		Text = "",
		FontFace = F.Medium,
		TextSize = 12,
		TextColor3 = T.Text,
		ClearTextOnFocus = false,
		ZIndex = zb + 1,
		Parent = pop,
	}, { Corner(7), Stroke(T.Stroke) })

	local function Apply(silent)
		cp.Value = Color3.fromHSV(h, s, v)
		sw.BackgroundColor3 = cp.Value
		svBox.BackgroundColor3 = Color3.fromHSV(h, 1, 1)
		svKnob.Position = UDim2.fromScale(s, 1 - v)
		hueKnob.Position = UDim2.fromScale(0.5, h)
		hex.Text = "#" .. cp.Value:ToHex():upper()
		if not silent then
			SafeCall(callback, cp.Value)
		end
	end

	function cp:Set(c, silent)
		h, s, v = c:ToHSV()
		Apply(silent)
	end

	for _, pr in ipairs(ACCENT_PRESETS) do
		local b = Create("TextButton", {
			Size = UDim2.fromOffset(18, 18),
			BackgroundColor3 = pr[2],
			AutoButtonColor = false,
			Text = "",
			ZIndex = zb + 2,
			Parent = presets,
		}, { Round() })
		b.Activated:Connect(function()
			cp:Set(pr[2])
		end)
	end

	local mode
	local function Update()
		local m = Mouse()
		if mode == "sv" then
			s = math.clamp((m.X - svBox.AbsolutePosition.X) / svBox.AbsoluteSize.X, 0, 1)
			v = 1 - math.clamp((m.Y - svBox.AbsolutePosition.Y) / svBox.AbsoluteSize.Y, 0, 1)
		elseif mode == "hue" then
			h = math.clamp((m.Y - hue.AbsolutePosition.Y) / hue.AbsoluteSize.Y, 0, 0.999)
		end
		Apply()
	end
	svBox.MouseButton1Down:Connect(function()
		mode = "sv"
		Update()
	end)
	hue.MouseButton1Down:Connect(function()
		mode = "hue"
		Update()
	end)
	table.insert(win._conns, UserInputService.InputChanged:Connect(function(i)
		if mode and i.UserInputType == Enum.UserInputType.MouseMovement then
			Update()
		end
	end))
	table.insert(win._conns, UserInputService.InputEnded:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 then
			mode = nil
		end
	end))
	hex.FocusLost:Connect(function()
		local str = (hex.Text:gsub("#", ""))
		local ok, c = pcall(Color3.fromHex, str)
		if ok and c then
			cp:Set(c)
		else
			Apply(true)
		end
	end)

	sw.Activated:Connect(function()
		if IsOpen(win, pop) then
			CloseFrom(win, level)
		elseif not JustClosed(win, pop) then
			PlaceNear(win, pop, sw, 222, "below-right")
			OpenLayer(win, level, pop)
		end
	end)

	Apply(true)
	if flag and not self._noRegister then
		UI.Flags[flag] = cp
	end
	return cp
end

function Container:AddColorPicker(o)
	o = o or {}
	local row = NewRow(self, 40)
	RowLabel(self, row, o.Name or "Color", 80)
	local holder = Create("Frame", {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -14, 0.5, 0),
		Size = UDim2.fromOffset(22, 14),
		BackgroundTransparency = 1,
		ZIndex = self._z,
		Parent = row,
	})
	local cp = self:_Swatch(holder, o.Default, nil, o.Callback, 1, o.Name)
	return Register(self, o, cp, row)
end

function Container:AddButton(o)
	o = o or {}
	local z = self._z
	local row = NewRow(self, 48)
	local b = Create("TextButton", {
		Position = UDim2.fromOffset(14, 8),
		Size = UDim2.new(1, -28, 1, -15),
		BackgroundColor3 = o.Danger and Color3.fromRGB(52, 30, 32) or T.Field,
		AutoButtonColor = false,
		Text = o.Name or "Button",
		FontFace = F.Medium,
		TextSize = 13,
		TextColor3 = o.Danger and T.Danger or T.Text,
		ZIndex = z,
		Parent = row,
	}, { Corner(8), Stroke(T.Stroke) })
	local base = b.BackgroundColor3
	b.MouseEnter:Connect(function()
		Tween(b, { BackgroundColor3 = o.Danger and Color3.fromRGB(64, 34, 36) or T.FieldHi }, 0.22)
	end)
	b.MouseLeave:Connect(function()
		Tween(b, { BackgroundColor3 = base }, 0.22)
	end)
	b.Activated:Connect(function()
		b.BackgroundColor3 = o.Danger and T.Danger or T.Accent
		Tween(b, { BackgroundColor3 = base }, 0.35)
		SafeCall(o.Callback)
	end)
	return Register(self, o, { Type = "Button" }, row)
end

function Container:AddKeybind(o)
	o = o or {}
	local win, z = self.Window, self._z
	local kb = { Type = "Keybind", Value = o.Default, Listening = false }
	local row = NewRow(self, 40)
	RowLabel(self, row, o.Name or "Keybind", 120)
	local chip = Create("TextButton", {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -14, 0.5, 0),
		Size = UDim2.fromOffset(0, 28),
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundColor3 = T.Field,
		AutoButtonColor = false,
		Text = "",
		FontFace = F.Medium,
		TextSize = 12,
		TextColor3 = T.SubText,
		ZIndex = z,
		Parent = row,
	}, { Corner(7), Stroke(T.Stroke), Pad(0, 12, 0, 12) })
	local function Paint()
		chip.Text = kb.Listening and "Press a key..." or KeyName(kb.Value)
		chip.TextColor3 = kb.Listening and T.Accent or T.SubText
	end
	function kb:Set(k)
		self.Value = k
		Paint()
		SafeCall(o.Changed, k)
	end
	chip.Activated:Connect(function()
		kb.Listening = true
		win._listeningKeybind = kb
		Paint()
	end)
	table.insert(win._conns, UserInputService.InputBegan:Connect(function(i, gp)
		if kb.Listening then
			if i.UserInputType == Enum.UserInputType.Keyboard then
				kb.Listening = false
				task.defer(function()
					win._listeningKeybind = nil
				end)
				if i.KeyCode == Enum.KeyCode.Escape or i.KeyCode == Enum.KeyCode.Backspace then
					kb:Set(nil)
				else
					kb:Set(i.KeyCode)
				end
			end
			return
		end
		if not gp and kb.Value and i.KeyCode == kb.Value then
			SafeCall(o.Callback)
		end
	end))
	Paint()
	return Register(self, o, kb, row)
end

function Container:AddTextbox(o)
	o = o or {}
	local z = self._z
	local tb = { Type = "Textbox", Value = o.Default or "" }
	local row = NewRow(self, 40)
	RowLabel(self, row, o.Name or "Text", 230)
	local box = Create("TextBox", {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -14, 0.5, 0),
		Size = UDim2.new(0.5, -4, 0, 30),
		BackgroundColor3 = T.Field,
		Text = tb.Value,
		PlaceholderText = o.Placeholder or "",
		PlaceholderColor3 = T.Caps,
		FontFace = F.Medium,
		TextSize = 13,
		TextColor3 = T.Text,
		TextXAlignment = Enum.TextXAlignment.Left,
		ClearTextOnFocus = false,
		ZIndex = z,
		Parent = row,
	}, { Corner(8), Stroke(T.Stroke), Pad(0, 12, 0, 12) })
	function tb:Set(t)
		self.Value = t
		box.Text = t
	end
	box.FocusLost:Connect(function(enter)
		tb.Value = box.Text
		SafeCall(o.Callback, box.Text, enter)
	end)
	return Register(self, o, tb, row)
end

function Container:AddLabel(text)
	local row = NewRow(self, 36)
	local l = Label({
		Text = text or "",
		TextSize = 12,
		TextColor3 = T.SubText,
		Position = UDim2.fromOffset(16, 0),
		Size = UDim2.new(1, -32, 1, 0),
		TextWrapped = true,
		ZIndex = self._z,
		Parent = row,
	})
	return {
		Type = "Label",
		Set = function(_, t)
			l.Text = t
		end,
	}
end

function Container:AddParagraph(o)
	o = o or {}
	local row = NewRow(self, 0)
	row.AutomaticSize = Enum.AutomaticSize.Y
	local inner = Create("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		ZIndex = self._z,
		Parent = row,
	}, { List(4), Pad(10, 16, 10, 16) })
	Label({
		Text = o.Title or "",
		FontFace = F.Bold,
		TextSize = 13,
		Size = UDim2.new(1, 0, 0, 16),
		ZIndex = self._z,
		Parent = inner,
	})
	Label({
		Text = o.Text or "",
		TextSize = 12,
		TextColor3 = T.SubText,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		TextWrapped = true,
		ZIndex = self._z,
		Parent = inner,
	})
	return { Type = "Paragraph" }
end

local Window = {}
Window.__index = Window

local SIDEBAR = 186
local BASE_W, BASE_H = 840, 600

function UI:CreateWindow(opts)
	opts = opts or {}
	if opts.Accent then
		T.Accent = opts.Accent
	end

	local win = setmetatable({
		_conns = {},
		_elements = {},
		_hotkeys = {},
		_tabs = {},
		_layers = {},
		_closedAt = {},
		_hudScales = {},
		Brand = opts.Brand or "Neverlose",
		Logo = opts.Logo or "CH",
		Game = opts.Game or "",
		SubText = opts.SubText or "Lifetime",
		Config = "default",
		Visible = true,
		ToggleKey = opts.ToggleKey or Enum.KeyCode.Insert,
	}, Window)

	local old = LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("NeverloseMenu")
	if old then
		old:Destroy()
	end
	local gui = Create("ScreenGui", {
		Name = "NeverloseMenu",
		ResetOnSpawn = false,
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		DisplayOrder = 1000,
		AutoLocalize = false,
		Parent = LocalPlayer:WaitForChild("PlayerGui"),
	})
	win.Gui = gui

	local main = Create("CanvasGroup", {
		Name = "Main",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 30),
		Size = UDim2.fromOffset(BASE_W, BASE_H),
		BackgroundColor3 = T.Window,
		GroupTransparency = 0,
		ZIndex = 2,
		Parent = gui,
	}, { Corner(16) })
	Create("Frame", {
		Position = UDim2.fromOffset(1, 1),
		Size = UDim2.new(1, -2, 1, -2),
		BackgroundTransparency = 1,
		ZIndex = 50,
		Parent = main,
	}, { Corner(15), Stroke(Color3.fromRGB(36, 37, 42)) })
	win.Main = main
	win.Scale = Create("UIScale", { Parent = main })
	FollowShadow(main, gui, 16, 3, 0.5, 1, 2)
	win.Overlay = Create("Frame", {
		Name = "Overlay",
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		ZIndex = 90,
		Parent = gui,
	})
	win._modal = Create("TextButton", {
		Size = UDim2.fromOffset(0, 0),
		BackgroundTransparency = 1,
		Text = "",
		Modal = true,
		Parent = main,
	})

	local side = Create("Frame", {
		Size = UDim2.new(0, SIDEBAR, 1, 0),
		BackgroundTransparency = 1,
		ZIndex = 2,
		Parent = main,
	})
	win._side = side

	local head = Create("Frame", {
		Size = UDim2.new(1, 0, 0, 78),
		BackgroundTransparency = 1,
		ZIndex = 2,
		Parent = side,
	})
	win._head = head
	local logo = Create("Frame", {
		Position = UDim2.fromOffset(16, 18),
		Size = UDim2.fromOffset(42, 42),
		BackgroundColor3 = Color3.fromRGB(12, 13, 15),
		ZIndex = 3,
		Parent = head,
	}, { Corner(10), Stroke(Color3.fromRGB(36, 37, 42)) })
	win._logoLbl = Label({
		Text = win.Logo,
		FontFace = F.Logo,
		TextSize = 20,
		TextXAlignment = Enum.TextXAlignment.Center,
		Size = UDim2.fromScale(1, 1),
		ZIndex = 4,
		Parent = logo,
	})
	Create("UIStroke", { Color = Color3.new(0, 0, 0), Thickness = 1.2, Transparency = 0.35, Parent = win._logoLbl })
	win._brandLbl = Label({
		Text = win.Brand,
		FontFace = F.Bold,
		TextSize = 15,
		Position = UDim2.fromOffset(68, 20),
		Size = UDim2.new(1, -76, 0, 18),
		TextTruncate = Enum.TextTruncate.AtEnd,
		ZIndex = 3,
		Parent = head,
	})
	win._gameLbl = Label({
		Text = win.Game,
		TextSize = 12,
		TextColor3 = T.Caps,
		Position = UDim2.fromOffset(68, 40),
		Size = UDim2.new(1, -76, 0, 16),
		TextTruncate = Enum.TextTruncate.AtEnd,
		ZIndex = 3,
		Parent = head,
	})
	if win.Game == "" then
		win._gameLbl.Visible = false
		win._brandLbl.Position = UDim2.fromOffset(68, 30)
	end

	win._nav = Create("ScrollingFrame", {
		Position = UDim2.fromOffset(0, 78),
		Size = UDim2.new(1, 0, 1, -78 - 76),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ScrollBarThickness = 0,
		CanvasSize = UDim2.new(),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ZIndex = 2,
		Parent = side,
	})
	win._navContent = Create("Frame", {
		Position = UDim2.fromOffset(12, 0),
		Size = UDim2.new(1, -24, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		ZIndex = 3,
		Parent = win._nav,
	}, { List(4) })
	win._navHighlight = Create("Frame", {
		Size = UDim2.new(1, -24, 0, 40),
		BackgroundColor3 = T.Nav,
		Visible = false,
		ZIndex = 2,
		Parent = win._nav,
	}, { Corner(10) })

	local foot = Create("Frame", {
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.new(0, 0, 1, 0),
		Size = UDim2.new(1, 0, 0, 76),
		BackgroundTransparency = 1,
		ZIndex = 2,
		Parent = side,
	})
	Create("Frame", {
		Position = UDim2.fromOffset(14, 0),
		Size = UDim2.new(1, -28, 0, 1),
		BackgroundColor3 = T.Divider,
		BorderSizePixel = 0,
		ZIndex = 2,
		Parent = foot,
	})
	local card = Create("TextButton", {
		Position = UDim2.fromOffset(8, 10),
		Size = UDim2.new(1, -16, 0, 56),
		BackgroundColor3 = T.Nav,
		BackgroundTransparency = 1,
		AutoButtonColor = false,
		Text = "",
		ZIndex = 3,
		Parent = foot,
	}, { Corner(10) })
	win._profileCard = card
	local av = Create("ImageLabel", {
		Position = UDim2.fromOffset(8, 9),
		Size = UDim2.fromOffset(38, 38),
		BackgroundColor3 = T.Field,
		ZIndex = 4,
		Parent = card,
	}, { Round() })
	win._avatar = av
	task.spawn(function()
		local ok, img = pcall(function()
			return Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
		end)
		if ok then
			av.Image = img
			win._avatarImage = img
			if win._profileAvatar then
				win._profileAvatar.Image = img
			end
		end
	end)
	Label({
		Text = LocalPlayer.Name,
		FontFace = F.Medium,
		TextSize = 13,
		Position = UDim2.fromOffset(54, 11),
		Size = UDim2.new(1, -86, 0, 16),
		TextTruncate = Enum.TextTruncate.AtEnd,
		ZIndex = 4,
		Parent = card,
	})
	win._subLbl = Label({
		Text = win.SubText,
		TextSize = 12,
		TextColor3 = T.Caps,
		Position = UDim2.fromOffset(54, 29),
		Size = UDim2.new(1, -86, 0, 15),
		ZIndex = 4,
		Parent = card,
	})
	local cardChev = Icon("chevron-right", card, 14, T.Caps, {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -10, 0.5, 0),
		ZIndex = 4,
	})
	card.MouseEnter:Connect(function()
		Tween(card, { BackgroundTransparency = 0.4 }, 0.22)
		Tween(cardChev, { ImageColor3 = T.Text }, 0.22)
	end)
	card.MouseLeave:Connect(function()
		Tween(card, { BackgroundTransparency = 1 }, 0.22)
		Tween(cardChev, { ImageColor3 = T.Caps }, 0.22)
	end)
	card.Activated:Connect(function()
		win:_ToggleProfileMenu()
	end)

	local panel = Create("Frame", {
		Position = UDim2.fromOffset(SIDEBAR, 8),
		Size = UDim2.new(1, -SIDEBAR - 8, 1, -16),
		BackgroundColor3 = T.Panel,
		ZIndex = 2,
		Parent = main,
	}, { Corner(12), Stroke(Color3.fromRGB(33, 34, 39)) })
	win._panel = panel

	local top = Create("Frame", {
		Size = UDim2.new(1, 0, 0, 62),
		BackgroundTransparency = 1,
		ZIndex = 2,
		Parent = panel,
	})
	win._top = top
	Create("Frame", {
		Position = UDim2.new(0, 14, 1, -1),
		Size = UDim2.new(1, -28, 0, 1),
		BackgroundColor3 = T.Divider,
		BorderSizePixel = 0,
		ZIndex = 2,
		Parent = top,
	})

	local cfgBox = Create("Frame", {
		Position = UDim2.fromOffset(14, 14),
		Size = UDim2.fromOffset(200, 34),
		BackgroundColor3 = T.Group,
		ZIndex = 3,
		Parent = top,
	}, { Corner(9), Stroke(T.Stroke) })
	win._cfgBox = cfgBox
	local saveBtn = Create("ImageButton", {
		Size = UDim2.fromOffset(38, 34),
		BackgroundTransparency = 1,
		Image = "",
		ZIndex = 4,
		Parent = cfgBox,
	})
	local saveIcon = Icon("save", saveBtn, 15, T.SubText, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		ZIndex = 5,
	})
	Create("Frame", {
		Position = UDim2.fromOffset(38, 8),
		Size = UDim2.fromOffset(1, 18),
		BackgroundColor3 = T.Stroke,
		BorderSizePixel = 0,
		ZIndex = 4,
		Parent = cfgBox,
	})
	local cfgBtn = Create("TextButton", {
		Position = UDim2.fromOffset(39, 0),
		Size = UDim2.new(1, -39, 1, 0),
		BackgroundTransparency = 1,
		Text = "",
		ZIndex = 4,
		Parent = cfgBox,
	})
	win._cfgLbl = Label({
		Text = win.Config,
		TextSize = 13,
		Position = UDim2.fromOffset(12, 0),
		Size = UDim2.new(1, -40, 1, 0),
		TextTruncate = Enum.TextTruncate.AtEnd,
		ZIndex = 5,
		Parent = cfgBtn,
	})
	local cfgChev = Icon("chevron-down", cfgBtn, 14, T.SubText, {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -12, 0.5, 0),
		ZIndex = 5,
	})
	saveBtn.MouseEnter:Connect(function()
		Tween(saveIcon, { ImageColor3 = T.Text }, 0.22)
	end)
	saveBtn.MouseLeave:Connect(function()
		Tween(saveIcon, { ImageColor3 = T.SubText }, 0.22)
	end)
	saveBtn.Activated:Connect(function()
		win:SaveConfig(win.Config)
		win:Notify({ Title = "Config", Text = "Saved \"" .. win.Config .. "\"", Icon = "save" })
	end)

	local cfgPop, cfgItems = PopupFrame(win, 220, "Configs")
	local function FillConfigs()
		for _, c in ipairs(cfgItems:GetChildren()) do
			if c:IsA("TextButton") or c:IsA("Frame") then
				c:Destroy()
			end
		end
		local names = win:ConfigNames()
		if not table.find(names, win.Config) then
			table.insert(names, 1, win.Config)
		end
		for _, n in ipairs(names) do
			local on = n == win.Config
			MenuRow(cfgItems, {
				Text = n,
				Icon = on and "folder-open" or "folder",
				IconColor = on and T.Accent or T.SubText,
				Color = on and T.Text or T.SubText,
				Selected = on,
				Callback = function()
					win:_SetConfig(n)
					win:LoadConfig(n)
					CloseFrom(win, 1)
					win:Notify({ Title = "Config", Text = "Loaded \"" .. n .. "\"", Icon = "folder-open" })
				end,
			})
		end
		MenuDivider(cfgItems)
		MenuRow(cfgItems, {
			Text = "New config",
			Icon = "plus",
			IconColor = T.Accent,
			Callback = function()
				local n = "config " .. (#win:ConfigNames() + 1)
				win:_SetConfig(n)
				win:SaveConfig(n)
				CloseFrom(win, 1)
				win:Notify({ Title = "Config", Text = "Created \"" .. n .. "\"", Icon = "plus" })
			end,
		})
		MenuRow(cfgItems, {
			Text = "Export / Import",
			Icon = "upload",
			Callback = function()
				CloseFrom(win, 1)
				win:_ShowExport(win:SaveConfig(win.Config))
			end,
		})
		MenuRow(cfgItems, {
			Text = "Delete",
			Icon = "trash",
			IconColor = T.Danger,
			Color = T.Danger,
			Callback = function()
				UI.Configs[win.Config] = nil
				CloseFrom(win, 1)
				win:Notify({ Title = "Config", Text = "Deleted \"" .. win.Config .. "\"", Icon = "trash" })
			end,
		})
	end
	cfgBtn.Activated:Connect(function()
		if IsOpen(win, cfgPop) then
			CloseFrom(win, 1)
		elseif not JustClosed(win, cfgPop) then
			FillConfigs()
			PlaceNear(win, cfgPop, cfgBox, 220, "below-left")
			Tween(cfgChev, { Rotation = 180 }, 0.15)
			OpenLayer(win, 1, cfgPop, function()
				Tween(cfgChev, { Rotation = 0 }, 0.15)
			end)
		end
	end)

	local contexts = opts.Contexts or { "Local" }
	win.Context = contexts[1]
	local ctxBox = Create("TextButton", {
		Position = UDim2.fromOffset(226, 14),
		Size = UDim2.fromOffset(124, 34),
		BackgroundColor3 = T.Group,
		AutoButtonColor = false,
		Text = "",
		ZIndex = 3,
		Parent = top,
	}, { Corner(9), Stroke(T.Stroke) })
	win._ctxBox = ctxBox
	local ctxLbl = Label({
		Text = win.Context,
		TextSize = 13,
		Position = UDim2.fromOffset(14, 0),
		Size = UDim2.new(1, -40, 1, 0),
		ZIndex = 4,
		Parent = ctxBox,
	})
	local ctxChev = Icon("chevron-down", ctxBox, 14, T.SubText, {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -12, 0.5, 0),
		ZIndex = 4,
	})
	local ctxPop, ctxItems = PopupFrame(win, 170)
	for _, c in ipairs(contexts) do
		MenuRow(ctxItems, {
			Text = c,
			Callback = function()
				win.Context = c
				ctxLbl.Text = c
				CloseFrom(win, 1)
				SafeCall(opts.ContextChanged, c)
			end,
		})
	end
	ctxBox.Activated:Connect(function()
		if IsOpen(win, ctxPop) then
			CloseFrom(win, 1)
		elseif not JustClosed(win, ctxPop) then
			PlaceNear(win, ctxPop, ctxBox, 170, "below-left")
			Tween(ctxChev, { Rotation = 180 }, 0.15)
			OpenLayer(win, 1, ctxPop, function()
				Tween(ctxChev, { Rotation = 0 }, 0.15)
			end)
		end
	end)

	local searchWrap = Create("Frame", {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -14, 0.5, 0),
		Size = UDim2.fromOffset(34, 34),
		BackgroundColor3 = T.Group,
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		ZIndex = 3,
		Parent = top,
	}, { Corner(9) })
	win._searchWrap = searchWrap
	local searchStroke = Stroke(T.Stroke, 1, 1)
	searchStroke.Parent = searchWrap
	local searchBox = Create("TextBox", {
		Position = UDim2.fromOffset(12, 0),
		Size = UDim2.new(1, -46, 1, 0),
		BackgroundTransparency = 1,
		Text = "",
		PlaceholderText = "Search",
		PlaceholderColor3 = T.Caps,
		FontFace = F.Medium,
		TextSize = 13,
		TextColor3 = T.Text,
		TextXAlignment = Enum.TextXAlignment.Left,
		ClearTextOnFocus = false,
		Visible = false,
		ZIndex = 4,
		Parent = searchWrap,
	})
	local searchBtn = Create("ImageButton", {
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.fromScale(1, 0),
		Size = UDim2.fromOffset(34, 34),
		BackgroundTransparency = 1,
		Image = "",
		ZIndex = 4,
		Parent = searchWrap,
	})
	local searchIcon = Icon("search", searchBtn, 17, T.SubText, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		ZIndex = 5,
	})
	local searchOpen = false
	searchBtn.Activated:Connect(function()
		searchOpen = not searchOpen
		Tween(searchWrap, {
			Size = UDim2.fromOffset(searchOpen and 220 or 34, 34),
			BackgroundTransparency = searchOpen and 0 or 1,
		}, 0.25)
		Tween(searchStroke, { Transparency = searchOpen and 0 or 1 }, 0.25)
		Tween(searchIcon, { ImageColor3 = searchOpen and T.Text or T.SubText }, 0.2)
		searchBox.Visible = searchOpen
		if searchOpen then
			searchBox:CaptureFocus()
		else
			searchBox.Text = ""
		end
	end)
	searchBox:GetPropertyChangedSignal("Text"):Connect(function()
		win:_Filter(searchBox.Text)
	end)

	win._pages = Create("Frame", {
		Position = UDim2.fromOffset(0, 62),
		Size = UDim2.new(1, 0, 1, -62),
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		ZIndex = 2,
		Parent = panel,
	})

	win:_SetupDrag()

	table.insert(win._conns, UserInputService.InputBegan:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.MouseButton2 then
			local m = Mouse()
			task.defer(function()
				local anyOpen = false
				for l = 1, MAX_LEVEL do
					if win._layers[l] then
						anyOpen = true
						break
					end
				end
				if anyOpen and not InsideLayers(win, m) then
					CloseFrom(win, 1)
				end
			end)
		end
	end))

	table.insert(win._conns, UserInputService.InputBegan:Connect(function(i)
		if win._listeningMenuKey then
			if i.UserInputType == Enum.UserInputType.Keyboard then
				local done = win._listeningMenuKey
				if i.KeyCode ~= Enum.KeyCode.Escape and i.KeyCode ~= Enum.KeyCode.Unknown then
					win.ToggleKey = i.KeyCode
				end
				task.defer(function()
					win._listeningMenuKey = nil
				end)
				SafeCall(done)
			end
			return
		end
		if i.KeyCode == win.ToggleKey and not UserInputService:GetFocusedTextBox() and not win._listeningKeybind and not win._listeningHotkey then
			win:SetVisible(not win.Visible)
		end
	end))

	win:_SetupHotkeyInput()

	local hudOk, hudErr = pcall(win._BuildHud, win)
	if not hudOk then
		warn("[Neverlose] " .. tostring(hudErr))
	end

	local cam = workspace.CurrentCamera
	if cam then
		table.insert(win._conns, cam:GetPropertyChangedSignal("ViewportSize"):Connect(function()
			win:_ApplyScale()
		end))
	end
	win:_ApplyScale()
	return win
end

function Window:_SetupDrag()
	local main = self.Main
	local dragging, startMouse, startPos = false, nil, nil

	local function OverControl(m)
		local blockers = { self._cfgBox, self._ctxBox, self._searchWrap, self._profileCard }
		for _, b in ipairs(blockers) do
			if b and Inside(b, m) then
				return true
			end
		end
		for _, t in ipairs(self._tabs) do
			if Inside(t._btn, m) then
				return true
			end
		end
		local tab = self.ActiveTab
		if tab then
			for _, g in ipairs(tab._groups) do
				if g.Frame.Visible and Inside(g.Box, m) then
					return true
				end
			end
		end
		return false
	end

	table.insert(self._conns, UserInputService.InputBegan:Connect(function(i)
		if i.UserInputType ~= Enum.UserInputType.MouseButton1 and i.UserInputType ~= Enum.UserInputType.Touch then
			return
		end
		if not self.Visible or not main.Visible then
			return
		end
		local m = Mouse()
		if not Inside(main, m) or InsideLayers(self, m) then
			return
		end
		if OverControl(m) then
			return
		end
		dragging = true
		startMouse = m
		startPos = main.Position
	end))
	table.insert(self._conns, UserInputService.InputChanged:Connect(function(i)
		if not dragging then
			return
		end
		if i.UserInputType ~= Enum.UserInputType.MouseMovement and i.UserInputType ~= Enum.UserInputType.Touch then
			return
		end
		local d = Mouse() - startMouse
		main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
	end))
	table.insert(self._conns, UserInputService.InputEnded:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
			dragging = false
		end
	end))
end

local function ParseScale(s)
	if s == "Auto" or not s then
		return nil
	end
	local n = tonumber((tostring(s):gsub("%%", "")))
	return n and n / 100 or nil
end

function Window:_ApplyScale()
	local cam = workspace.CurrentCamera
	local vs = (cam and cam.ViewportSize) or Vector2.new(1280, 720)
	local auto = math.min(1, (vs.Y - 140) / BASE_H, (vs.X - 40) / BASE_W)
	self._fit = ParseScale(UI.Settings.MenuScale) or auto
	if self.Visible then
		self.Scale.Scale = self._fit
	end
	local hudScale = ParseScale(UI.Settings.WindowsScale) or math.min(1, vs.Y / 720)
	for _, s in ipairs(self._hudScales) do
		s.Scale = hudScale
	end
end

function Window:SetVisible(v)
	self.Visible = v
	CloseFrom(self, 1)
	self._modal.Modal = v
	local ease = Enum.EasingStyle.Quint
	if v then
		if not self.Main.Visible then
			self.Scale.Scale = self._fit * 0.95
			self.Main.GroupTransparency = 1
		end
		self.Main.Visible = true
		Tween(self.Scale, { Scale = self._fit }, 0.45, ease)
		Tween(self.Main, { GroupTransparency = 0 }, 0.35, ease)
	else
		Tween(self.Main, { GroupTransparency = 1 }, 0.28, ease)
		Tween(self.Scale, { Scale = self._fit * 0.95 }, 0.32, ease).Completed:Connect(function()
			if not self.Visible then
				self.Main.Visible = false
			end
		end)
	end
	self:_RefreshHotkeys()
	self:_RefreshSpectators()
	self:_RefreshWidgets()
end

function Window:_MoveNavHighlight(btn)
	task.defer(function()
		local hl, content = self._navHighlight, self._navContent
		local scale = self.Main.AbsoluteSize.X / BASE_W
		if scale <= 0 then
			return
		end
		local y = (btn.AbsolutePosition.Y - content.AbsolutePosition.Y) / scale
		local target = UDim2.fromOffset(12, y)
		if not hl.Visible then
			hl.Position = target
			hl.Visible = true
		else
			Tween(hl, { Position = target }, 0.32)
		end
	end)
end

function Window:SetBrand(name, logo, gameName)
	if name then
		self.Brand = name
		self._brandLbl.Text = name
	end
	if logo then
		self.Logo = logo
		self._logoLbl.Text = logo
		self._wmLogo.Text = logo
	end
	if gameName then
		self.Game = gameName
		self._gameLbl.Text = gameName
	end
end

local Section = {}
Section.__index = Section

function Window:AddCategory(name)
	local cap = Label({
		Text = name:upper(),
		FontFace = F.Medium,
		TextSize = 11,
		TextColor3 = T.Caps,
		Size = UDim2.new(1, 0, 0, #self._tabs == 0 and 24 or 38),
		TextYAlignment = Enum.TextYAlignment.Bottom,
		LayoutOrder = NextOrder(),
		ZIndex = 3,
		Parent = self._navContent,
	})
	Create("UIPadding", { PaddingLeft = UDim.new(0, 4), PaddingBottom = UDim.new(0, 6), Parent = cap })
	return setmetatable({ Window = self, Name = name }, Section)
end

local Tab = {}
Tab.__index = Tab

function Section:AddTab(name, icon)
	local win = self.Window
	local tab = setmetatable({ Window = win, Name = name, Section = self.Name, _groups = {} }, Tab)

	local btn = Create("TextButton", {
		Size = UDim2.new(1, 0, 0, 40),
		BackgroundColor3 = T.Nav,
		BackgroundTransparency = 1,
		AutoButtonColor = false,
		Text = "",
		LayoutOrder = NextOrder(),
		ZIndex = 3,
		Parent = win._navContent,
	}, { Corner(10) })
	local ic = Icon(icon or "star", btn, 18, T.SubText, {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 12, 0.5, 0),
		ZIndex = 4,
	})
	local lbl = Label({
		Text = name,
		TextSize = 14,
		TextColor3 = T.SubText,
		Position = UDim2.fromOffset(42, 0),
		Size = UDim2.new(1, -48, 1, 0),
		ZIndex = 4,
		Parent = btn,
	})
	tab._btn, tab._icon, tab._lbl = btn, ic, lbl

	local page = Create("ScrollingFrame", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ScrollBarThickness = 3,
		ScrollBarImageColor3 = T.Caps,
		CanvasSize = UDim2.new(),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		Visible = false,
		ZIndex = 2,
		Parent = win._pages,
	}, { Pad(6, 14, 16, 14) })
	local left = Create("Frame", {
		Size = UDim2.new(0.5, -7, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		ZIndex = 2,
		Parent = page,
	}, { List(0) })
	local right = Create("Frame", {
		Position = UDim2.new(0.5, 7, 0, 0),
		Size = UDim2.new(0.5, -7, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		ZIndex = 2,
		Parent = page,
	}, { List(0) })
	tab._page, tab._left, tab._right = page, left, right

	local empty = Create("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.4),
		Size = UDim2.fromOffset(260, 90),
		BackgroundTransparency = 1,
		Visible = false,
		ZIndex = 2,
		Parent = win._pages,
	})
	tab._empty = empty

	local function PaintNav(t, on)
		Tween(t._lbl, { TextColor3 = on and T.Text or T.SubText }, 0.18)
		Tween(t._icon, { ImageColor3 = on and T.Accent or T.SubText }, 0.18)
	end
	OnAccent(function()
		if win.ActiveTab == tab then
			tab._icon.ImageColor3 = T.Accent
		end
	end)

	function tab:Select()
		for _, t in ipairs(win._tabs) do
			local on = t == tab
			t._page.Visible = on
			t._empty.Visible = on and #t._groups == 0
			PaintNav(t, on)
		end
		win.ActiveTab = tab
		win:_MoveNavHighlight(btn)
		page.Position = UDim2.fromOffset(0, 14)
		Tween(page, { Position = UDim2.new() }, 0.38)
		CloseFrom(win, 1)
	end

	btn.MouseEnter:Connect(function()
		if win.ActiveTab ~= tab then
			Tween(lbl, { TextColor3 = T.Text }, 0.22)
		end
	end)
	btn.MouseLeave:Connect(function()
		if win.ActiveTab ~= tab then
			Tween(lbl, { TextColor3 = T.SubText }, 0.22)
		end
	end)
	btn.Activated:Connect(function()
		tab:Select()
	end)

	table.insert(win._tabs, tab)
	if #win._tabs == 1 then
		tab:Select()
	end
	return tab
end

function Tab:AddGroup(name, side)
	local col = (side == "Right" or side == 2) and self._right or self._left
	local wrap = Create("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = NextOrder(),
		ZIndex = 2,
		Parent = col,
	})
	Label({
		Text = (name or ""):upper(),
		TextSize = 11,
		TextColor3 = T.Caps,
		Position = UDim2.fromOffset(8, 0),
		Size = UDim2.new(1, -8, 0, 34),
		ZIndex = 2,
		Parent = wrap,
	})
	local box = Create("Frame", {
		Position = UDim2.fromOffset(0, 34),
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = T.Group,
		ZIndex = 2,
		Parent = wrap,
	}, { Corner(12), Stroke(T.Stroke) })
	local items = Create("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		ZIndex = 2,
		Parent = box,
	}, { List(0), Pad(2, 0, 2, 0) })
	Create("UIPadding", { PaddingBottom = UDim.new(0, 8), Parent = wrap })

	local c = NewContainer(self.Window, items, 3, { Tab = self, Frame = wrap })
	c.Box = box
	table.insert(self._groups, c)
	if self.Window.ActiveTab == self then
		self._empty.Visible = false
	end
	return c
end

function Window:_Filter(q)
	q = (q or ""):lower()
	local tab = self.ActiveTab
	if not tab then
		return
	end
	local any = {}
	for _, e in ipairs(self._elements) do
		if e.Container.Tab == tab and e.Row then
			local show = q == "" or e.Name:find(q, 1, true) ~= nil
			e.Row.Visible = show
			if show then
				any[e.Container] = true
			end
		end
	end
	for _, g in ipairs(tab._groups) do
		g.Frame.Visible = q == "" or any[g] == true
	end
end

local function ClearChildren(holder)
	for _, c in ipairs(holder:GetChildren()) do
		if c:IsA("GuiObject") then
			c:Destroy()
		end
	end
end

local function EditorRow(items, order, icon, text, z)
	local row = Create("Frame", {
		Size = UDim2.new(1, 0, 0, 38),
		BackgroundTransparency = 1,
		LayoutOrder = order,
		ZIndex = z,
		Parent = items,
	})
	Icon(icon, row, 16, T.SubText, {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 16, 0.5, 0),
		ZIndex = z + 1,
	})
	Label({
		Text = text,
		TextSize = 13,
		Position = UDim2.fromOffset(42, 0),
		Size = UDim2.new(0, 100, 1, 0),
		ZIndex = z + 1,
		Parent = row,
	})
	return row
end

local function DecorateSubRow(elemRow, icon, z)
	local lbl = elemRow:FindFirstChildWhichIsA("TextLabel")
	if lbl then
		lbl.Position = UDim2.fromOffset(42, 0)
		lbl.TextSize = 13
	end
	Icon(icon, elemRow, 16, T.SubText, {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 16, 0.5, 0),
		ZIndex = z + 1,
	})
end

function Window:_OpenElementMenu(elem, anchor, o, dotsIcon)
	local win = self
	local M = win._elemMenu
	if M and M.Elem == elem then
		if IsOpen(win, M.Frame) then
			CloseFrom(win, 1)
			return
		end
		if JustClosed(win, M.Frame) then
			return
		end
	end

	if not M then
		local left, leftItems = PopupFrame(win, 210, nil, 100)
		local right, rightItems = PopupFrame(win, 280, nil, 120)
		M = { Frame = left, Items = leftItems, Right = right, RightItems = rightItems }
		win._elemMenu = M
	end
	M.Elem = elem
	M.Options = o

	local OpenEditor, OpenAll, OpenSettings, BuildLeft

	function OpenEditor(hk, rowAnchor)
		ClearChildren(M.RightItems)
		local items = M.RightItems
		local z = 122

		local cap = Label({
			Text = ((elem.Name or "Hotkey") .. " · HOTKEY"):upper(),
			TextSize = 11,
			TextColor3 = T.Caps,
			Size = UDim2.new(1, 0, 0, 26),
			LayoutOrder = 0,
			ZIndex = z,
			Parent = items,
		})
		Create("UIPadding", { PaddingLeft = UDim.new(0, 16), Parent = cap })

		do
			local row = EditorRow(items, 1, "keyboard", "Key", z)
			local chip = Create("TextButton", {
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, -14, 0.5, 0),
				Size = UDim2.fromOffset(0, 26),
				AutomaticSize = Enum.AutomaticSize.X,
				BackgroundColor3 = T.Field,
				AutoButtonColor = false,
				Text = hk.Key and KeyName(hk.Key) or "-",
				FontFace = F.Medium,
				TextSize = 12,
				TextColor3 = T.SubText,
				ZIndex = z + 1,
				Parent = row,
			}, { Corner(7), Stroke(T.Stroke), Pad(0, 12, 0, 12) })
			chip.Activated:Connect(function()
				chip.Text = "Press a key..."
				chip.TextColor3 = T.Accent
				win._listeningHotkey = {
					Hotkey = hk,
					Done = function()
						if chip.Parent then
							chip.Text = hk.Key and KeyName(hk.Key) or "-"
							chip.TextColor3 = T.SubText
						end
						BuildLeft()
						elem:_PaintHint()
					end,
				}
			end)
		end

		do
			local row = EditorRow(items, 2, "toggle-left", "Mode", z)
			local seg = Create("Frame", {
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, -14, 0.5, 0),
				Size = UDim2.fromOffset(168, 26),
				BackgroundColor3 = T.Field,
				ZIndex = z + 1,
				Parent = row,
			}, { Corner(8), Stroke(T.Stroke) })
			local pill = Create("Frame", {
				Size = UDim2.new(1 / 3, -4, 1, -4),
				Position = UDim2.fromOffset(2, 2),
				BackgroundColor3 = T.Accent,
				ZIndex = z + 2,
				Parent = seg,
			}, { Corner(6) })
			local modes = { "Toggle", "Hold", "Always" }
			local btns = {}
			local function PaintSeg(animate)
				local i = table.find(modes, hk.Mode) or 1
				local target = UDim2.new((i - 1) / 3, 2, 0, 2)
				if animate then
					Tween(pill, { Position = target }, 0.22)
				else
					pill.Position = target
				end
				for j, b in ipairs(btns) do
					b.TextColor3 = j == i and Color3.new(1, 1, 1) or T.SubText
				end
			end
			for i, m in ipairs(modes) do
				local b = Create("TextButton", {
					Position = UDim2.fromScale((i - 1) / 3, 0),
					Size = UDim2.fromScale(1 / 3, 1),
					BackgroundTransparency = 1,
					Text = m,
					FontFace = F.Medium,
					TextSize = 12,
					TextColor3 = T.SubText,
					ZIndex = z + 3,
					Parent = seg,
				})
				b.Activated:Connect(function()
					hk:SetMode(m)
					PaintSeg(true)
					BuildLeft()
				end)
				btns[i] = b
			end
			PaintSeg(false)
		end

		do
			local valueHolder = Create("Frame", {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				ZIndex = z,
				Parent = items,
			}, { List(0) })
			local sub = NewContainer(win, valueHolder, z, { NoRegister = true, NoMenu = true, Level = 2 })
			local made
			if elem.Type == "Toggle" then
				made = sub:AddToggle({
					Name = "Value",
					Default = hk.Value,
					Bindable = false,
					Callback = function(v)
						hk:SetValue(v)
						BuildLeft()
					end,
				})
			elseif elem.Type == "Slider" then
				made = sub:AddSlider({
					Name = "Value",
					Min = elem.Min,
					Max = elem.Max,
					Increment = elem.Increment,
					Suffix = elem.Suffix,
					Default = hk.Value,
					TrackWidth = 80,
					Bindable = false,
					Callback = function(v)
						hk:SetValue(v)
						BuildLeft()
					end,
				})
			elseif elem.Type == "Dropdown" then
				made = sub:AddDropdown({
					Name = "Value",
					Options = elem.Options,
					Multi = elem.Multi,
					Default = CopyValue(hk.Value),
					Bindable = false,
					Callback = function(v)
						hk:SetValue(v)
						BuildLeft()
					end,
				})
			end
			if made and made._row then
				DecorateSubRow(made._row, "link", z)
			end
		end

		do
			local row = EditorRow(items, 4, "eye", "Visible", z)
			local holder = Create("Frame", {
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, -14, 0.5, 0),
				Size = UDim2.fromOffset(34, 20),
				BackgroundTransparency = 1,
				ZIndex = z + 1,
				Parent = row,
			})
			local sw, Paint = Switch(holder, z + 1, true)
			Paint(hk.Visible, false)
			local b = Create("TextButton", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				Text = "",
				ZIndex = z + 4,
				Parent = sw,
			})
			b.Activated:Connect(function()
				hk.Visible = not hk.Visible
				Paint(hk.Visible, true)
				win:_RefreshHotkeys()
			end)
		end

		MenuDivider(items, z).LayoutOrder = 5

		MenuRow(items, {
			Text = "Delete",
			Icon = "trash",
			IconColor = T.Danger,
			Color = T.Danger,
			Z = z,
			Order = 6,
			Callback = function()
				hk:Destroy()
				elem:_PaintHint()
				CloseFrom(win, 2)
				BuildLeft()
			end,
		})

		PlaceNear(win, M.Right, rowAnchor, 280, "right")
		OpenLayer(win, 2, M.Right)
	end

	function OpenAll(rowAnchor)
		ClearChildren(M.RightItems)
		local items = M.RightItems
		local cap = Label({
			Text = "ALL HOTKEYS",
			TextSize = 11,
			TextColor3 = T.Caps,
			Size = UDim2.new(1, 0, 0, 26),
			LayoutOrder = 0,
			ZIndex = 122,
			Parent = items,
		})
		Create("UIPadding", { PaddingLeft = UDim.new(0, 16), Parent = cap })
		if #win._hotkeys == 0 then
			local l = Label({
				Text = "No hotkeys yet",
				TextSize = 13,
				TextColor3 = T.SubText,
				Size = UDim2.new(1, 0, 0, 32),
				LayoutOrder = 1,
				ZIndex = 122,
				Parent = items,
			})
			Create("UIPadding", { PaddingLeft = UDim.new(0, 16), Parent = l })
		end
		for i, hk in ipairs(win._hotkeys) do
			MenuRow(items, {
				Text = (hk.Elem.Name or "?"),
				Right = (hk.Key and KeyName(hk.Key) or "-") .. " · " .. hk.Mode:lower(),
				Icon = hk.Active and "toggle-right" or "toggle-left",
				IconColor = hk.Active and T.Accent or T.SubText,
				Z = 122,
				Order = i,
			})
		end
		PlaceNear(win, M.Right, rowAnchor, 280, "right")
		OpenLayer(win, 2, M.Right)
	end

	function OpenSettings(rowAnchor)
		ClearChildren(M.RightItems)
		local items = M.RightItems
		local cap = Label({
			Text = ((o.Name or "") .. " · SETTINGS"):upper(),
			TextSize = 11,
			TextColor3 = T.Caps,
			Size = UDim2.new(1, 0, 0, 26),
			LayoutOrder = -1,
			ZIndex = 122,
			Parent = items,
		})
		Create("UIPadding", { PaddingLeft = UDim.new(0, 16), Parent = cap })
		local holder = Create("Frame", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			ZIndex = 122,
			Parent = items,
		}, { List(0) })
		local sub = NewContainer(win, holder, 122, { NoMenu = true, Level = 2 })
		SafeCall(elem.Settings, sub)
		PlaceNear(win, M.Right, rowAnchor, 280, "right")
		OpenLayer(win, 2, M.Right)
	end

	function BuildLeft()
		ClearChildren(M.Items)
		local items = M.Items
		local n = 0
		local function Next()
			n += 1
			return n
		end
		if type(elem.Settings) == "function" then
			MenuRow(items, {
				Text = "Settings",
				Icon = "sliders",
				Chevron = true,
				Order = Next(),
				Callback = function(row)
					OpenSettings(row)
				end,
			})
			MenuDivider(items).LayoutOrder = Next()
		end
		if #elem.Hotkeys == 0 then
			MenuRow(items, {
				Text = "Unbound",
				Icon = "keyboard",
				Chevron = true,
				Order = Next(),
				Callback = function(row)
					local hk = Hotkey.new(win, elem)
					BuildLeft()
					OpenEditor(hk, row)
				end,
			})
		end
		for _, hk in ipairs(elem.Hotkeys) do
			MenuRow(items, {
				Text = hk.Key and KeyName(hk.Key) or "Unbound",
				Right = hk:Describe(),
				Icon = "keyboard",
				IconColor = hk.Active and T.Accent or T.SubText,
				Chevron = true,
				Order = Next(),
				Callback = function(row)
					OpenEditor(hk, row)
				end,
			})
		end
		MenuRow(items, {
			Text = "All Hotkeys",
			Icon = "list",
			Chevron = true,
			Order = Next(),
			Callback = function(row)
				OpenAll(row)
			end,
		})
		MenuRow(items, {
			Text = "New Hotkey",
			Icon = "plus",
			Color = T.SubText,
			Order = Next(),
			Callback = function(row)
				local hk = Hotkey.new(win, elem)
				BuildLeft()
				OpenEditor(hk, row)
			end,
		})
		MenuDivider(items).LayoutOrder = Next()
		MenuRow(items, {
			Text = "Reset",
			Icon = "rotate-ccw",
			IconColor = T.Danger,
			Color = T.Danger,
			Order = Next(),
			Callback = function()
				for i = #elem.Hotkeys, 1, -1 do
					elem.Hotkeys[i]:Destroy()
				end
				elem:Reset()
				elem:_PaintHint()
				CloseFrom(win, 1)
				win:Notify({ Title = elem.Name or "Reset", Text = "Value and hotkeys reset", Icon = "rotate-ccw" })
			end,
		})
	end

	BuildLeft()
	PlaceNear(win, M.Frame, anchor, 210, "below-right")
	elem._menuOpen = true
	if dotsIcon then
		dotsIcon.ImageColor3 = T.Text
	end
	OpenLayer(win, 1, M.Frame, function()
		elem._menuOpen = false
		if dotsIcon then
			Tween(dotsIcon, { ImageColor3 = T.SubText }, 0.22)
		end
	end)
end

function Window:_SetupHotkeyInput()
	table.insert(self._conns, UserInputService.InputBegan:Connect(function(i)
		local listen = self._listeningHotkey
		if listen then
			local key
			if i.UserInputType == Enum.UserInputType.Keyboard then
				if i.KeyCode == Enum.KeyCode.Escape or i.KeyCode == Enum.KeyCode.Backspace then
					key = false
				else
					key = i.KeyCode
				end
			elseif i.UserInputType == Enum.UserInputType.MouseButton2 or i.UserInputType == Enum.UserInputType.MouseButton3 then
				key = i.UserInputType
			end
			if key ~= nil then
				listen.Hotkey:SetKey(key or nil)
				task.defer(function()
					self._listeningHotkey = nil
				end)
				SafeCall(listen.Done)
			end
			return
		end
		if UserInputService:GetFocusedTextBox() then
			return
		end
		for _, hk in ipairs(self._hotkeys) do
			if hk.Key and (i.KeyCode == hk.Key or i.UserInputType == hk.Key) then
				if hk.Mode == "Toggle" then
					hk:SetActive(not hk.Active)
				elseif hk.Mode == "Hold" then
					hk:SetActive(true)
				end
			end
		end
	end))
	table.insert(self._conns, UserInputService.InputEnded:Connect(function(i)
		for _, hk in ipairs(self._hotkeys) do
			if hk.Key and hk.Mode == "Hold" and (i.KeyCode == hk.Key or i.UserInputType == hk.Key) then
				hk:SetActive(false)
			end
		end
	end))
end

local SCALE_OPTIONS = { "Auto", "75%", "100%", "125%", "150%", "175%", "200%" }

function Window:_ToggleProfileMenu()
	local win = self
	if win._profile and IsOpen(win, win._profile.Frame) then
		CloseFrom(win, 1)
		return
	end
	if win._profile and JustClosed(win, win._profile.Frame) then
		return
	end

	if not win._profile then
		local frame = Create("CanvasGroup", {
			Size = UDim2.fromOffset(270, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			GroupTransparency = 1,
			Visible = false,
			ZIndex = 100,
			Parent = win.Overlay,
		}, { Pad(1, 1, 1, 1) })
		local card = Create("Frame", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = T.Popup,
			ZIndex = 100,
			Parent = frame,
		}, { Corner(14), Stroke(T.Stroke) })
		FollowShadow(frame, win.Overlay, 14, 7, 0.16, 99)
		local items = Create("Frame", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			ZIndex = 101,
			Parent = card,
		}, { List(0, nil, Enum.HorizontalAlignment.Center), Pad(8, 0, 8, 0) })
		local sub, subItems = PopupFrame(win, 170, nil, 120)
		win._profile = { Frame = frame, Items = items, Sub = sub, SubItems = subItems }
	end
	local P = win._profile

	local Build

	local function OpenChoices(row, options, current, onPick, swatches)
		ClearChildren(P.SubItems)
		for i, opt in ipairs(options) do
			local name = swatches and opt[1] or opt
			local on = name == current
			local r = MenuRow(P.SubItems, {
				Text = name,
				Color = on and T.Text or T.SubText,
				Selected = on,
				Z = 122,
				Order = i,
				Callback = function()
					onPick(opt)
					CloseFrom(win, 2)
					Build()
				end,
			})
			if swatches then
				Create("Frame", {
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.new(1, -12, 0.5, 0),
					Size = UDim2.fromOffset(14, 14),
					BackgroundColor3 = opt[2],
					ZIndex = 124,
					Parent = r,
				}, { Corner(4) })
			elseif on then
				Icon("check", r, 14, T.Accent, {
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.new(1, -12, 0.5, 0),
					ZIndex = 124,
				})
			end
		end
		PlaceNear(win, P.Sub, row, 170, "right")
		OpenLayer(win, 2, P.Sub)
	end

	function Build()
		ClearChildren(P.Items)
		local items = P.Items

		local head = Create("Frame", {
			Size = UDim2.new(1, 0, 0, 62),
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			ZIndex = 102,
			Parent = items,
		})
		local av = Create("ImageLabel", {
			Position = UDim2.fromOffset(14, 8),
			Size = UDim2.fromOffset(44, 44),
			BackgroundColor3 = T.Field,
			Image = win._avatarImage or "",
			ZIndex = 103,
			Parent = head,
		}, { Round() })
		win._profileAvatar = av
		Label({
			Text = LocalPlayer.Name,
			FontFace = F.Bold,
			TextSize = 14,
			Position = UDim2.fromOffset(68, 8),
			Size = UDim2.new(1, -80, 0, 16),
			TextTruncate = Enum.TextTruncate.AtEnd,
			ZIndex = 103,
			Parent = head,
		})
		Label({
			Text = "Till: " .. win.SubText,
			TextSize = 12,
			TextColor3 = T.SubText,
			Position = UDim2.fromOffset(68, 26),
			Size = UDim2.new(1, -80, 0, 14),
			ZIndex = 103,
			Parent = head,
		})
		local renew = Create("TextButton", {
			Position = UDim2.fromOffset(68, 42),
			Size = UDim2.fromOffset(0, 14),
			AutomaticSize = Enum.AutomaticSize.X,
			BackgroundTransparency = 1,
			Text = "Renew",
			FontFace = F.Medium,
			TextSize = 12,
			TextColor3 = T.Accent,
			ZIndex = 103,
			Parent = head,
		})
		renew.Activated:Connect(function()
			win:Notify({ Title = "Subscription", Text = "Your license: " .. win.SubText, Icon = "crown" })
		end)

		MenuDivider(items).LayoutOrder = 2

		local s = UI.Settings
		local order = 2
		local function Choice(icon, text, value, options, onPick)
			order += 1
			MenuRow(items, {
				Text = text,
				Right = value,
				Icon = icon,
				Chevron = true,
				Order = order,
				Callback = function(row)
					OpenChoices(row, options, value, onPick)
				end,
			})
		end

		Choice("languages", "Language", s.Language, { "English" }, function(v)
			s.Language = v
		end)
		Choice("scale", "Menu Scale", s.MenuScale, SCALE_OPTIONS, function(v)
			s.MenuScale = v
			win:_ApplyScale()
		end)
		Choice("focus", "ESP Scale", s.ESPScale, { "75%", "100%", "125%", "150%", "175%", "200%" }, function(v)
			s.ESPScale = v
			SafeCall(win.OnSetting, "ESPScale", v)
		end)
		Choice("monitor", "Windows Scale", s.WindowsScale, SCALE_OPTIONS, function(v)
			s.WindowsScale = v
			win:_ApplyScale()
		end)
		Choice("ruler", "Units", s.Units, { "Auto", "Studs", "Meters", "Feet" }, function(v)
			s.Units = v
			SafeCall(win.OnSetting, "Units", v)
		end)

		order += 1
		local keyRow, _, keyLbl = MenuRow(items, {
			Text = "Menu Key",
			Right = KeyName(win.ToggleKey),
			Icon = "keyboard",
			Order = order,
		})
		keyRow.Activated:Connect(function()
			keyLbl.Text = "Press a key..."
			Tween(keyLbl, { TextColor3 = T.Accent }, 0.2)
			win._listeningMenuKey = function()
				if keyLbl.Parent then
					keyLbl.Text = KeyName(win.ToggleKey)
					Tween(keyLbl, { TextColor3 = T.SubText }, 0.2)
				end
			end
		end)


		order += 1
		MenuDivider(items).LayoutOrder = order

		Choice("shield", "Safe Mode", s.SafeMode, { "Automatic", "Enabled", "Disabled" }, function(v)
			s.SafeMode = v
		end)

		order += 1
		local syncRow = MenuRow(items, {
			Text = "Synchronization",
			Icon = "refresh-cw",
			Order = order,
		})
		local holder = Create("Frame", {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -12, 0.5, 0),
			Size = UDim2.fromOffset(34, 20),
			BackgroundTransparency = 1,
			ZIndex = 104,
			Parent = syncRow,
		})
		local _, PaintSync = Switch(holder, 104, true)
		PaintSync(s.Sync, false)
		syncRow.Activated:Connect(function()
			s.Sync = not s.Sync
			PaintSync(s.Sync, true)
		end)

		order += 1
		MenuDivider(items).LayoutOrder = order

		order += 1
		MenuRow(items, {
			Text = "About",
			Icon = "info",
			Order = order,
			Callback = function()
				win:Notify({ Title = win.Brand, Icon = "info" })
			end,
		})
		order += 1
		MenuRow(items, {
			Text = "Chat",
			Icon = "message",
			Order = order,
			Callback = function()
				win:Notify({ Title = "Chat", Text = "Coming soon", Icon = "message" })
			end,
		})
	end

	Build()
	local cardPos = win._profileCard.AbsolutePosition
	P.Frame.Position = UDim2.fromOffset(cardPos.X, cardPos.Y)
	OpenLayer(win, 1, P.Frame)
	task.defer(function()
		local h = P.Frame.AbsoluteSize.Y
		AnimateIn(P.Frame, cardPos.X, math.max(cardPos.Y - h - 8, 6))
	end)
end

function Window:SaveConfig(name)
	local data = { Flags = {}, Hotkeys = {} }
	for flag, obj in pairs(UI.Flags) do
		local v = obj.Base
		if v == nil then
			v = obj.Value
		end
		if typeof(v) == "Color3" then
			data.Flags[flag] = { C = v:ToHex() }
		elseif typeof(v) == "EnumItem" then
			data.Flags[flag] = { K = v.Name }
		elseif type(v) == "table" then
			data.Flags[flag] = { L = v }
		elseif v ~= nil then
			data.Flags[flag] = v
		end
	end
	for flag, obj in pairs(UI.Flags) do
		if obj.Hotkeys then
			for _, hk in ipairs(obj.Hotkeys) do
				table.insert(data.Hotkeys, {
					Flag = flag,
					Key = hk.Key and hk.Key.Name or nil,
					KeyType = hk.Key and tostring(hk.Key.EnumType) or nil,
					Mode = hk.Mode,
					Value = hk.Value,
					Visible = hk.Visible,
				})
			end
		end
	end
	local raw = HttpService:JSONEncode(data)
	if name then
		UI.Configs[name] = raw
	end
	return raw
end

function Window:LoadConfig(name, raw)
	raw = raw or UI.Configs[name]
	if not raw then
		return false
	end
	local ok, data = pcall(HttpService.JSONDecode, HttpService, raw)
	if not ok or type(data) ~= "table" then
		return false
	end
	for i = #self._hotkeys, 1, -1 do
		self._hotkeys[i]:Destroy()
	end
	for flag, v in pairs(data.Flags or {}) do
		local obj = UI.Flags[flag]
		if obj and obj.Set then
			if type(v) == "table" and v.C then
				pcall(function()
					obj:Set(Color3.fromHex(v.C))
				end)
			elseif type(v) == "table" and v.K then
				pcall(function()
					obj:Set(Enum.KeyCode[v.K])
				end)
			elseif type(v) == "table" and v.L then
				obj:Set(v.L)
			else
				obj:Set(v)
			end
		end
	end
	for _, h in ipairs(data.Hotkeys or {}) do
		local obj = UI.Flags[h.Flag]
		if obj and obj.Hotkeys then
			local hk = Hotkey.new(self, obj)
			if h.Key then
				pcall(function()
					if h.KeyType == "UserInputType" then
						hk.Key = Enum.UserInputType[h.Key]
					else
						hk.Key = Enum.KeyCode[h.Key]
					end
				end)
			end
			hk.Value = h.Value
			hk.Visible = h.Visible ~= false
			hk:SetMode(h.Mode or "Toggle")
			obj:_PaintHint()
		end
	end
	self:_RefreshHotkeys()
	return true
end

function Window:ConfigNames()
	local t = {}
	for n in pairs(UI.Configs) do
		table.insert(t, n)
	end
	table.sort(t)
	return t
end

function Window:_ShowExport(raw)
	if not self._export then
		local f = Create("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(420, 260),
			BackgroundColor3 = T.Popup,
			Visible = false,
			ZIndex = 200,
			Parent = self.Overlay,
		}, { Corner(14), Stroke(T.Stroke) })
		FollowShadow(f, self.Overlay, 14, 7, 0.2, 199)
		Label({
			Text = "EXPORT / IMPORT CONFIG",
			TextSize = 11,
			TextColor3 = T.Caps,
			Position = UDim2.fromOffset(16, 10),
			Size = UDim2.new(1, -60, 0, 20),
			ZIndex = 201,
			Parent = f,
		})
		local close = Create("ImageButton", {
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, -10, 0, 8),
			Size = UDim2.fromOffset(24, 24),
			BackgroundTransparency = 1,
			Image = "",
			ZIndex = 201,
			Parent = f,
		})
		Icon("x", close, 16, T.SubText, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			ZIndex = 202,
		})
		local box = Create("TextBox", {
			Position = UDim2.fromOffset(14, 38),
			Size = UDim2.new(1, -28, 1, -96),
			BackgroundColor3 = T.Field,
			Text = "",
			FontFace = F.Mono,
			TextSize = 11,
			TextColor3 = T.Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			TextWrapped = true,
			ClearTextOnFocus = false,
			MultiLine = true,
			ZIndex = 201,
			Parent = f,
		}, { Corner(8), Stroke(T.Stroke), Pad(8, 8, 8, 8) })
		local import = Create("TextButton", {
			AnchorPoint = Vector2.new(1, 1),
			Position = UDim2.new(1, -14, 1, -14),
			Size = UDim2.fromOffset(110, 32),
			BackgroundColor3 = T.Accent,
			AutoButtonColor = false,
			Text = "Import",
			FontFace = F.Bold,
			TextSize = 13,
			TextColor3 = Color3.new(1, 1, 1),
			ZIndex = 201,
			Parent = f,
		}, { Corner(8) })
		OnAccent(function(c)
			import.BackgroundColor3 = c
		end)
		close.Activated:Connect(function()
			f.Visible = false
		end)
		import.Activated:Connect(function()
			if self:LoadConfig(nil, box.Text) then
				self:Notify({ Title = "Config", Text = "Imported", Icon = "download" })
				f.Visible = false
			else
				self:Notify({ Title = "Config", Text = "Invalid config text", Icon = "x" })
			end
		end)
		self._export = { Frame = f, Box = box }
	end
	self._export.Box.Text = raw or ""
	self._export.Frame.Visible = true
end

local EASE = Enum.EasingStyle.Quint
local ROW_W = 236
local LOG_W = 360

local function EscText(v)
	local r = tostring(v):gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;")
	return r
end

function Window:_HudDrag(handle, target, onClick, onDragged)
	local pressing, moved, startMouse, startPos = false, false, nil, nil
	handle.InputBegan:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
			pressing = true
			moved = false
			startMouse = Mouse()
			startPos = target.AbsolutePosition
		end
	end)
	table.insert(self._conns, UserInputService.InputChanged:Connect(function(i)
		if not pressing then
			return
		end
		if i.UserInputType ~= Enum.UserInputType.MouseMovement and i.UserInputType ~= Enum.UserInputType.Touch then
			return
		end
		local d = Mouse() - startMouse
		if not moved and d.Magnitude < 4 then
			return
		end
		if not moved then
			moved = true
			SafeCall(onDragged)
		end
		local scr, s = self.Gui.AbsoluteSize, target.AbsoluteSize
		local x = math.clamp(startPos.X + d.X, 0, math.max(scr.X - s.X, 0))
		local y = math.clamp(startPos.Y + d.Y, 0, math.max(scr.Y - s.Y, 0))
		target.Position = UDim2.fromOffset(x, y)
	end))
	table.insert(self._conns, UserInputService.InputEnded:Connect(function(i)
		if pressing and (i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch) then
			pressing = false
			if not moved then
				SafeCall(onClick)
			end
		end
	end))
end

function Window:_Pill(withBody)
	local wrap = Create("CanvasGroup", {
		Size = UDim2.fromOffset(0, 0),
		BackgroundTransparency = 1,
		GroupTransparency = 0,
		ZIndex = 3,
		Parent = self.Gui,
	}, { Pad(1, 1, 1, 1) })
	table.insert(self._hudScales, Create("UIScale", { Parent = wrap }))
	local _, _, shadowCorners = FollowShadow(wrap, self.Gui, 23, 3, 0.5, 1, 2)

	local pill = Create("Frame", {
		Size = UDim2.fromOffset(0, 0),
		AutomaticSize = withBody and Enum.AutomaticSize.Y or Enum.AutomaticSize.XY,
		BackgroundColor3 = T.Pill,
		ClipsDescendants = withBody and true or false,
		ZIndex = 3,
		Parent = wrap,
	}, { Stroke(T.PillLine), List(0) })
	local corner = Create("UICorner", { CornerRadius = UDim.new(0, 22), Parent = pill })
	local wrapScale = wrap:FindFirstChildOfClass("UIScale")
	local function FitWrap()
		local sc = math.max(wrapScale and wrapScale.Scale or 1, 0.01)
		local a = pill.AbsoluteSize
		wrap.Size = UDim2.fromOffset(math.ceil(a.X / sc) + 2, math.ceil(a.Y / sc) + 2)
	end
	pill:GetPropertyChangedSignal("AbsoluteSize"):Connect(FitWrap)
	if wrapScale then
		wrapScale:GetPropertyChangedSignal("Scale"):Connect(FitWrap)
	end
	task.defer(FitWrap)

	local head = Create("TextButton", {
		Size = UDim2.fromOffset(0, 44),
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundTransparency = 1,
		AutoButtonColor = false,
		Text = "",
		LayoutOrder = 1,
		ZIndex = 4,
		Parent = pill,
	}, { Pad(0, 18, 0, 18) })
	local inner = Create("Frame", {
		Size = UDim2.fromOffset(0, 44),
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundTransparency = 1,
		ZIndex = 4,
		Parent = head,
	}, { List(10, Enum.FillDirection.Horizontal, Enum.HorizontalAlignment.Left, Enum.VerticalAlignment.Center) })

	local body, bodyPad
	if withBody then
		bodyPad = Pad(0, 14, 0, 14)
		body = Create("Frame", {
			Size = UDim2.fromOffset(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			ZIndex = 4,
			Parent = pill,
		}, { List(0), bodyPad })
	end

	head.MouseEnter:Connect(function()
		Tween(pill, { BackgroundColor3 = Color3.fromRGB(27, 28, 32) }, 0.25, EASE)
	end)
	head.MouseLeave:Connect(function()
		Tween(pill, { BackgroundColor3 = T.Pill }, 0.25, EASE)
	end)
	return {
		Wrap = wrap,
		Pill = pill,
		Inner = inner,
		Head = head,
		Body = body,
		Corner = corner,
		BodyPad = bodyPad,
		ShadowCorners = shadowCorners,
	}
end

local function PillSep(parent, order)
	return Create("Frame", {
		Size = UDim2.fromOffset(1, 18),
		BackgroundColor3 = Color3.fromRGB(54, 55, 62),
		BorderSizePixel = 0,
		LayoutOrder = order,
		ZIndex = 5,
		Parent = parent,
	})
end

local function PillSepNotify(parent, order)
	return Create("Frame", {
		Size = UDim2.fromOffset(1, 16),
		BackgroundColor3 = Color3.fromRGB(54, 55, 62),
		BorderSizePixel = 0,
		LayoutOrder = order,
		ZIndex = 9,
		Parent = parent,
	})
end

local function PillText(parent, text, order, bold)
	return Label({
		Text = text,
		FontFace = bold and F.Bold or F.Medium,
		TextSize = 14,
		Size = UDim2.fromOffset(0, 44),
		AutomaticSize = Enum.AutomaticSize.X,
		LayoutOrder = order,
		ZIndex = 5,
		Parent = parent,
	})
end

local function NewHudRow(body, item, order, rowW)
	local row = Create("CanvasGroup", {
		Size = UDim2.fromOffset(rowW, 0),
		BackgroundTransparency = 1,
		GroupTransparency = 1,
		LayoutOrder = order,
		ZIndex = 6,
		Parent = body,
	})
	local hasRight = item.Right ~= nil
	local left = Label({
		Text = item.Left,
		RichText = true,
		TextSize = 13,
		Position = UDim2.fromOffset(-10, 0),
		Size = UDim2.fromOffset(hasRight and rowW - 110 or rowW, 28),
		TextTruncate = Enum.TextTruncate.AtEnd,
		ZIndex = 7,
		Parent = row,
	})
	local right = Label({
		Text = item.Right or "",
		TextSize = 12,
		TextColor3 = item.RightColor or T.Accent,
		TextXAlignment = Enum.TextXAlignment.Right,
		Position = UDim2.fromOffset(rowW - 100, 0),
		Size = UDim2.fromOffset(110, 28),
		TextTruncate = Enum.TextTruncate.AtEnd,
		Visible = hasRight,
		ZIndex = 7,
		Parent = row,
	})
	Tween(row, { Size = UDim2.fromOffset(rowW, 28), GroupTransparency = 0 }, 0.45, EASE)
	Tween(left, { Position = UDim2.fromOffset(0, 0) }, 0.55, EASE)
	Tween(right, { Position = UDim2.fromOffset(rowW - 110, 0) }, 0.55, EASE)
	return { Frame = row, Left = left, Right = right }
end

function Window:_PillList(w, rowW)
	local win = self
	rowW = rowW or ROW_W
	local pill, body, corner, bodyPad, head, wrap = w.Pill, w.Body, w.Corner, w.BodyPad, w.Head, w.Wrap
	local P = { Rows = {}, Items = {}, Enabled = true, Expanded = false, Shown = true, _token = 0, Wrap = wrap }
	local uiScale = wrap:FindFirstChildOfClass("UIScale")

	local function TargetWidth()
		local sc = uiScale and uiScale.Scale or 1
		local headW = head.AbsoluteSize.X / math.max(sc, 0.01)
		if P.Expanded then
			return math.max(headW, rowW + 28)
		end
		return headW
	end
	local function FitWidth(animate)
		local wd = TargetWidth()
		if animate then
			Tween(pill, { Size = UDim2.fromOffset(wd, 0) }, 0.45, EASE)
		else
			pill.Size = UDim2.fromOffset(wd, 0)
		end
	end
	head:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		FitWidth(false)
	end)
	task.defer(FitWidth, false)

	local divider = Create("Frame", {
		Size = UDim2.fromOffset(rowW, 0),
		BackgroundTransparency = 1,
		LayoutOrder = 0,
		ZIndex = 5,
		Parent = body,
	})
	local line = Create("Frame", {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.fromScale(0, 0.5),
		Size = UDim2.new(1, 0, 0, 1),
		BackgroundColor3 = T.PillLine,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 5,
		Parent = divider,
	})

	local function SetExpanded(on)
		if on == P.Expanded then
			return
		end
		P.Expanded = on
		Tween(corner, { CornerRadius = UDim.new(0, on and 16 or 22) }, 0.4, EASE)
		for _, sc in ipairs(w.ShadowCorners or {}) do
			Tween(sc.Corner, { CornerRadius = UDim.new(0, (on and 17 or 23) + sc.Grow) }, 0.4, EASE)
		end
		Tween(divider, { Size = UDim2.fromOffset(rowW, on and 8 or 0) }, 0.4, EASE)
		Tween(line, { BackgroundTransparency = on and 0 or 1 }, 0.4, EASE)
		Tween(bodyPad, { PaddingBottom = UDim.new(0, on and 10 or 0) }, 0.4, EASE)
		FitWidth(true)
	end

	function P:SetShown(on)
		if on == self.Shown then
			return
		end
		self.Shown = on
		self._token += 1
		local token = self._token
		if on then
			wrap.Visible = true
			Tween(wrap, { GroupTransparency = 0 }, 0.35, EASE)
		else
			Tween(wrap, { GroupTransparency = 1 }, 0.3, EASE).Completed:Connect(function()
				if self._token == token then
					wrap.Visible = false
				end
			end)
		end
	end

	function P:UpdateShown()
		self:SetShown(self.Visible ~= false and (win.Visible or #self.Items > 0))
	end

	local function Render()
		local show = P.Enabled and P.Items or {}
		local seen = {}
		for i, it in ipairs(show) do
			seen[it.Id] = true
			local r = P.Rows[it.Id]
			if not r then
				r = NewHudRow(body, it, i, rowW)
				P.Rows[it.Id] = r
			else
				r.Frame.LayoutOrder = i
				r.Left.Text = it.Left
				r.Right.Text = it.Right or ""
			end
			r.Right.TextColor3 = it.RightColor or T.Accent
		end
		for id, r in pairs(P.Rows) do
			if not seen[id] then
				P.Rows[id] = nil
				Tween(r.Frame, { Size = UDim2.fromOffset(rowW, 0), GroupTransparency = 1 }, 0.35, EASE).Completed:Connect(function()
					r.Frame:Destroy()
				end)
			end
		end
		SetExpanded(#show > 0)
		P:UpdateShown()
	end

	function P:Sync(items)
		self.Items = items
		Render()
	end

	function P:Toggle()
		self.Enabled = not self.Enabled
		Render()
	end

	return P
end

function Window:_BuildHud()
	local gui = self.Gui

	local hkW = self:_Pill(true)
	Icon("list", hkW.Inner, 16, T.SubText, { LayoutOrder = 1, ZIndex = 5 })
	PillSep(hkW.Inner, 2)
	PillText(hkW.Inner, "Hotkeys", 3, true)

	local wmW = self:_Pill(false)
	self._wmLogo = PillText(wmW.Inner, self.Logo, 1, true)
	self._wmLogo.FontFace = F.Logo
	self._wmLogo.TextSize = 18
	Create("UIStroke", { Color = Color3.new(0, 0, 0), Thickness = 1, Transparency = 0.4, Parent = self._wmLogo })
	local clockI = Icon("clock", wmW.Inner, 16, T.Accent, { LayoutOrder = 2, ZIndex = 5 })
	local timeL = PillText(wmW.Inner, os.date("%H:%M"), 3)
	local userI = Icon("user", wmW.Inner, 16, T.Accent, { LayoutOrder = 4, ZIndex = 5 })
	PillText(wmW.Inner, LocalPlayer.Name, 5)
	local folderI = Icon("folder", wmW.Inner, 16, T.Accent, { LayoutOrder = 6, ZIndex = 5 })
	self._wmCfg = PillText(wmW.Inner, self.Config, 7)

	local spW = self:_Pill(true)
	local eyeI = Icon("eye", spW.Inner, 16, T.Accent, { LayoutOrder = 1, ZIndex = 5 })
	PillText(spW.Inner, "Spectators", 2, true)

	local kW = self:_Pill(false)
	local skullI = Icon("skull", kW.Inner, 16, T.Accent, { LayoutOrder = 1, ZIndex = 5 })
	PillSep(kW.Inner, 2)
	PillText(kW.Inner, "Kill List", 3, true)

	local mW = self:_Pill(false)
	Icon("x", mW.Inner, 16, T.Warning, { LayoutOrder = 1, ZIndex = 5 })
	PillSep(mW.Inner, 2)
	PillText(mW.Inner, "Miss List", 3, true)

	OnAccent(function(c)
		clockI.ImageColor3 = c
		userI.ImageColor3 = c
		folderI.ImageColor3 = c
		eyeI.ImageColor3 = c
		skullI.ImageColor3 = c
	end)

	task.spawn(function()
		while gui.Parent do
			timeL.Text = os.date("%H:%M")
			task.wait(1)
		end
	end)

	self._hkList = self:_PillList(hkW, ROW_W)
	self._spList = self:_PillList(spW, ROW_W)
	self._killList = self:_LogAnchor(kW)
	self._missList = self:_LogAnchor(mW)
	self._wmWidget = wmW
	self._widgets = {
		Hotkeys = { W = hkW, List = self._hkList },
		Watermark = { W = wmW },
		Spectators = { W = spW, List = self._spList },
		Kills = { W = kW, List = self._killList },
		Misses = { W = mW, List = self._missList },
	}

	local dragged = {}
	local function Layout()
		local x = 24
		for _, w in ipairs({ hkW, wmW, spW }) do
			if not dragged[w] then
				w.Wrap.Position = UDim2.fromOffset(x, 20)
			end
			x += math.max(w.Head.AbsoluteSize.X, 1) + 14
		end
		local y = math.floor(gui.AbsoluteSize.Y * 0.3)
		if not dragged[kW] then
			kW.Wrap.Position = UDim2.fromOffset(24, y)
		end
		if not dragged[mW] then
			local sc = kW.Wrap:FindFirstChildOfClass("UIScale")
			local s = sc and sc.Scale or 1
			mW.Wrap.Position = UDim2.fromOffset(24 + (LOG_W + 160) * s, y)
		end
	end
	for _, w in ipairs({ hkW, wmW, spW, kW, mW }) do
		w.Head:GetPropertyChangedSignal("AbsoluteSize"):Connect(Layout)
	end
	task.defer(Layout)

	local function Bind(w, list)
		self:_HudDrag(w.Head, w.Wrap, list and function()
			list:Toggle()
		end or nil, function()
			dragged[w] = true
		end)
	end
	Bind(hkW, self._hkList)
	Bind(wmW, nil)
	Bind(spW, self._spList)
	Bind(kW, self._killList)
	Bind(mW, self._missList)

	self._notes = Create("Frame", {
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.new(1, -18, 1, -18),
		Size = UDim2.fromOffset(600, 400),
		BackgroundTransparency = 1,
		ZIndex = 5,
		Parent = gui,
	}, {
		Create("UIListLayout", {
			Padding = UDim.new(0, 4),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Bottom,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
		}),
	})
	table.insert(self._hudScales, Create("UIScale", { Parent = self._notes }))

	self._specItems = {}
	self.LogsEnabled = true
	self.LogDuration = 6
	self.LogMax = 6
	self:_RefreshHotkeys()
	self:_RefreshSpectators()
	self._killList:UpdateShown()
	self._missList:UpdateShown()
end

function Window:_LogAnchor(w)
	local win = self
	local A = { Shown = true, _token = 0 }
	local logs = Create("Frame", {
		Size = UDim2.fromOffset(LOG_W + 120, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		ZIndex = 4,
		Parent = self.Gui,
	}, { List(5) })
	table.insert(self._hudScales, Create("UIScale", { Parent = logs }))
	local function Follow()
		local p, sz = w.Wrap.AbsolutePosition, w.Wrap.AbsoluteSize
		logs.Position = UDim2.fromOffset(p.X, p.Y + sz.Y + 6)
	end
	w.Wrap:GetPropertyChangedSignal("AbsolutePosition"):Connect(Follow)
	w.Wrap:GetPropertyChangedSignal("AbsoluteSize"):Connect(Follow)
	task.defer(Follow)
	A.Logs = logs

	function A:SetShown(on)
		if on == self.Shown then
			return
		end
		self.Shown = on
		self._token += 1
		local token = self._token
		if on then
			w.Wrap.Visible = true
			Tween(w.Wrap, { GroupTransparency = 0 }, 0.35, EASE)
		else
			Tween(w.Wrap, { GroupTransparency = 1 }, 0.3, EASE).Completed:Connect(function()
				if self._token == token then
					w.Wrap.Visible = false
				end
			end)
		end
	end
	function A:UpdateShown()
		self:SetShown(self.Visible ~= false and win.Visible)
	end
	function A:Toggle() end
	return A
end

function Window:_RefreshWidgets()
	for _, d in pairs(self._widgets or {}) do
		if d.List then
			d.List:UpdateShown()
		end
	end
end

function Window:SetHud(name, visible)
	local d = self._widgets and self._widgets[name]
	if not d then
		return
	end
	if d.List then
		d.List.Visible = visible
		d.List:UpdateShown()
	else
		d.W.Wrap.Visible = visible
	end
end

function Window:_SetConfig(name)
	self.Config = name
	self._cfgLbl.Text = name
	if self._wmCfg then
		self._wmCfg.Text = name
	end
end

local MODE_TEXT = { Toggle = "toggled", Hold = "holding", Always = "always" }

function Window:_RefreshHotkeys()
	if not self._hkList then
		return
	end
	local items = {}
	for _, hk in ipairs(self._hotkeys) do
		if hk.Visible and hk.Active then
			table.insert(items, {
				Id = hk,
				Left = EscText(hk.Elem.Name or "?"),
				Right = (hk.Key and ("[" .. KeyName(hk.Key) .. "] ") or "") .. MODE_TEXT[hk.Mode],
			})
		end
	end
	self._hkList:Sync(items)
end

function Window:SetSpectators(items)
	self._specItems = items or {}
	self:_RefreshSpectators()
end

function Window:_RefreshSpectators()
	if self._spList then
		self._spList:Sync(self._specItems)
	end
end

function Window:HitLog(richText, kind)
	if not self.LogsEnabled or not self._killList then
		return
	end
	local holder = (kind == "miss" and self._missList or self._killList).Logs
	local colors = { hit = T.Accent, kill = T.Danger, miss = T.Warning }
	local icons = { hit = "crosshair", kill = "skull", miss = "x" }
	local c = colors[kind] or T.SubText
	local row = Create("CanvasGroup", {
		Size = UDim2.fromOffset(0, 0),
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundColor3 = Color3.fromRGB(14, 15, 17),
		BackgroundTransparency = 0.15,
		GroupTransparency = 1,
		LayoutOrder = NextOrder(),
		ZIndex = 5,
		Parent = holder,
	}, { Corner(6), Pad(0, 12, 0, 8) })
	local inner = Create("Frame", {
		Size = UDim2.fromOffset(0, 26),
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundTransparency = 1,
		ZIndex = 6,
		Parent = row,
	}, { List(8, Enum.FillDirection.Horizontal, Enum.HorizontalAlignment.Left, Enum.VerticalAlignment.Center) })
	Create("Frame", {
		Size = UDim2.fromOffset(3, 14),
		BackgroundColor3 = c,
		BorderSizePixel = 0,
		LayoutOrder = 0,
		ZIndex = 7,
		Parent = inner,
	}, { Round() })
	Icon(icons[kind] or "info", inner, 13, c, { LayoutOrder = 1, ZIndex = 7 })
	Create("TextLabel", {
		Size = UDim2.fromOffset(0, 26),
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundTransparency = 1,
		RichText = true,
		Text = richText,
		FontFace = F.Mono,
		TextSize = 12,
		TextColor3 = Color3.fromRGB(225, 226, 230),
		LayoutOrder = 2,
		ZIndex = 7,
		Parent = inner,
	})
	local rows = {}
	for _, ch in ipairs(holder:GetChildren()) do
		if ch:IsA("CanvasGroup") then
			table.insert(rows, ch)
		end
	end
	table.sort(rows, function(x, y)
		return x.LayoutOrder < y.LayoutOrder
	end)
	while #rows > self.LogMax do
		table.remove(rows, 1):Destroy()
	end
	Tween(row, { GroupTransparency = 0, Size = UDim2.fromOffset(0, 26) }, 0.4, EASE)
	task.delay(self.LogDuration, function()
		if row.Parent then
			Tween(row, { GroupTransparency = 1, Size = UDim2.fromOffset(0, 0) }, 0.45, EASE).Completed:Connect(function()
				row:Destroy()
			end)
		end
	end)
end

function Window:Notify(o)
	o = o or {}
	local dur = o.Duration or 3

	local holder = Create("Frame", {
		Size = UDim2.fromOffset(0, 0),
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundTransparency = 1,
		ClipsDescendants = false,
		LayoutOrder = NextOrder(),
		ZIndex = 6,
		Parent = self._notes,
	})
	local group = Create("CanvasGroup", {
		Position = UDim2.fromOffset(60, 0),
		Size = UDim2.fromOffset(0, 46),
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundTransparency = 1,
		GroupTransparency = 1,
		ZIndex = 6,
		Parent = holder,
	}, { Pad(2, 2, 4, 2) })
	local card = Create("Frame", {
		Size = UDim2.fromOffset(0, 40),
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundColor3 = T.Pill,
		ZIndex = 7,
		Parent = group,
	}, { Round(), Stroke(T.PillLine), Pad(0, 18, 0, 6) })
	local row = Create("Frame", {
		Size = UDim2.fromOffset(0, 40),
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundTransparency = 1,
		ZIndex = 8,
		Parent = card,
	}, { List(10, Enum.FillDirection.Horizontal, Enum.HorizontalAlignment.Left, Enum.VerticalAlignment.Center) })

	local badge = Create("Frame", {
		Size = UDim2.fromOffset(28, 28),
		BackgroundColor3 = Color3.fromRGB(12, 13, 15),
		LayoutOrder = 1,
		ZIndex = 9,
		Parent = row,
	}, { Round(), Stroke(T.PillLine) })
	Label({
		Text = self.Logo,
		FontFace = F.Logo,
		TextSize = 12,
		TextXAlignment = Enum.TextXAlignment.Center,
		Size = UDim2.fromScale(1, 1),
		ZIndex = 10,
		Parent = badge,
	})
	PillSepNotify(row, 2)
	if o.Icon then
		Icon(o.Icon, row, 15, T.Accent, { LayoutOrder = 3, ZIndex = 9 })
	end
	Label({
		Text = o.Title or self.Brand,
		FontFace = F.Bold,
		TextSize = 13,
		Size = UDim2.fromOffset(0, 40),
		AutomaticSize = Enum.AutomaticSize.X,
		LayoutOrder = 4,
		ZIndex = 9,
		Parent = row,
	})
	if o.Text and o.Text ~= "" then
		Label({
			Text = o.Text,
			TextSize = 13,
			TextColor3 = T.SubText,
			Size = UDim2.fromOffset(0, 40),
			AutomaticSize = Enum.AutomaticSize.X,
			LayoutOrder = 5,
			ZIndex = 9,
			Parent = row,
		})
	end

	local bar = Create("Frame", {
		AnchorPoint = Vector2.new(0.5, 1),
		Position = UDim2.new(0.5, 0, 1, -1),
		Size = UDim2.new(1, -48, 0, 2),
		BackgroundColor3 = T.Accent,
		BackgroundTransparency = 0.2,
		BorderSizePixel = 0,
		ZIndex = 11,
		Parent = group,
	}, { Round() })

	local ease = Enum.EasingStyle.Quint
	Tween(holder, { Size = UDim2.fromOffset(0, 46) }, 0.35, ease)
	Tween(group, { Position = UDim2.fromOffset(0, 0), GroupTransparency = 0 }, 0.5, ease)
	Tween(bar, { Size = UDim2.new(0, 0, 0, 2) }, dur, Enum.EasingStyle.Linear)
	task.delay(dur, function()
		Tween(group, { Position = UDim2.fromOffset(60, 0), GroupTransparency = 1 }, 0.4, ease)
		Tween(holder, { Size = UDim2.fromOffset(0, 0) }, 0.45, ease).Completed:Connect(function()
			holder:Destroy()
		end)
	end)
end

function Window:Destroy()
	for _, c in ipairs(self._conns) do
		c:Disconnect()
	end
	self.Gui:Destroy()
end

local HitLogger = {}

local GUN_NAMES = { "gun", "revolver", "pistol", "sheriff" }
local KNIFE_NAMES = { "knife", "blade", "murder" }

local function ToolKind(tool)
	local n = tool.Name:lower()
	for _, g in ipairs(GUN_NAMES) do
		if n:find(g, 1, true) then
			return "Gun"
		end
	end
	for _, k in ipairs(KNIFE_NAMES) do
		if n:find(k, 1, true) then
			return "Knife"
		end
	end
	return nil
end

local function BodyRegion(part)
	if not part then
		return nil
	end
	local n = part.Name:lower()
	if n:find("head") then
		return "head"
	elseif n:find("torso") or n:find("chest") or n == "humanoidrootpart" then
		return "body"
	elseif n:find("arm") or n:find("hand") then
		return "arm"
	elseif n:find("leg") or n:find("foot") then
		return "leg"
	end
	return nil
end

local function Esc(s)
	local r = tostring(s):gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;")
	return r
end

local GRAY = "8d8f98"

function HitLogger.Start(win)
	local lastAction = nil
	local conns = {}

	local function WindowFor(kind)
		return kind == "Knife" and 2.5 or 1.2
	end

	local function Recent()
		local a = lastAction
		if a and os.clock() - a.Time <= WindowFor(a.Kind) then
			return a
		end
		return nil
	end

	local function OnAction(tool)
		local kind = ToolKind(tool)
		if not kind then
			return
		end
		local mouse = LocalPlayer:GetMouse()
		local target = mouse and mouse.Target
		local action = {
			Time = os.clock(),
			Kind = kind,
			Tool = tool.Name,
			TargetPart = target,
			Aimed = nil,
			Hit = false,
		}
		lastAction = action
		return action
	end

	local function WatchMiss(action)
		if action.Aimed then
			task.delay(WindowFor(action.Kind), function()
				if not action.Hit and action.Aimed.Parent then
					win:HitLog(string.format(
						'Missed shot at <font color="#%s"><b>%s</b></font> <font color="#%s">(%s)</font>',
						T.Accent:ToHex(),
						Esc(action.Aimed.DisplayName),
						GRAY,
						Esc(action.Tool)
					), "miss")
				end
			end)
		end
	end

	function HitLogger.AimbotShot(plr, toolName)
		local action = {
			Time = os.clock(),
			Kind = "Gun",
			Tool = toolName or "Gun",
			TargetPart = plr and plr.Character and plr.Character:FindFirstChild("Head"),
			Aimed = plr,
			Hit = false,
		}
		lastAction = action
		WatchMiss(action)
	end

	local function HookTool(tool)
		if tool:IsA("Tool") then
			table.insert(conns, tool.Activated:Connect(function()
				OnAction(tool)
			end))
		end
	end

	local function HookCharacter(char)
		for _, t in ipairs(char:GetChildren()) do
			HookTool(t)
		end
		table.insert(conns, char.ChildAdded:Connect(HookTool))
	end

	local function LogKill(plr, a, region, dmg)
		local hex = T.Accent:ToHex()
		win:HitLog(string.format(
			'Killed <font color="#%s"><b>%s</b></font>%s with %s <font color="#%s">(%d damage)</font>',
			hex,
			Esc(plr.DisplayName),
			region and (" in the " .. region) or "",
			Esc(a.Tool),
			GRAY,
			math.floor(dmg + 0.5)
		), "kill")
	end

	local function LogHit(plr, region, dmg, left)
		local hex = T.Accent:ToHex()
		win:HitLog(string.format(
			'Hit <font color="#%s"><b>%s</b></font>%s for <font color="#%s">%d</font> damage <font color="#%s">(%d health left)</font>',
			hex,
			Esc(plr.DisplayName),
			region and (" in the " .. region) or "",
			hex,
			math.floor(dmg + 0.5),
			GRAY,
			math.floor(left + 0.5)
		), "hit")
	end

	local function WatchPlayer(plr)
		if plr == LocalPlayer then
			return
		end
		local function OnChar(char)
			local hum = char:WaitForChild("Humanoid", 10)
			if not hum then
				return
			end
			local health = hum.Health
			local logged = false

			local function RegionFor(a)
				if a.TargetPart and a.TargetPart:IsDescendantOf(char) then
					return BodyRegion(a.TargetPart)
				end
				return nil
			end

			table.insert(conns, hum.HealthChanged:Connect(function(newHealth)
				local old = health
				health = newHealth
				local dmg = old - newHealth
				if dmg <= 0 or logged then
					return
				end
				local a = Recent()
				if not a then
					return
				end
				a.Hit = true
				if newHealth <= 0 then
					logged = true
					LogKill(plr, a, RegionFor(a), dmg)
				else
					LogHit(plr, RegionFor(a), dmg, newHealth)
				end
			end))

			table.insert(conns, hum.Died:Connect(function()
				if logged then
					return
				end
				local a = Recent()
				if a then
					a.Hit = true
					logged = true
					LogKill(plr, a, RegionFor(a), math.max(health, 0) > 0 and health or hum.MaxHealth)
				end
			end))

			table.insert(conns, char.AncestryChanged:Connect(function(_, parent)
				if parent or logged then
					return
				end
				local a = Recent()
				if a and health > 0 then
					a.Hit = true
					logged = true
					LogKill(plr, a, RegionFor(a), health)
				end
			end))
		end
		if plr.Character then
			task.spawn(OnChar, plr.Character)
		end
		table.insert(conns, plr.CharacterAdded:Connect(OnChar))
	end

	if LocalPlayer.Character then
		HookCharacter(LocalPlayer.Character)
	end
	table.insert(conns, LocalPlayer.CharacterAdded:Connect(HookCharacter))
	for _, p in ipairs(Players:GetPlayers()) do
		WatchPlayer(p)
	end
	table.insert(conns, Players.PlayerAdded:Connect(WatchPlayer))

	return function()
		for _, c in ipairs(conns) do
			c:Disconnect()
		end
	end
end

local SpectatorTracker = {}

function SpectatorTracker.Start(win)
	local dead = {}
	local counter = 0
	local conns = {}
	local running = true

	local function Push()
		local items = {}
		for plr, order in pairs(dead) do
			if plr.Parent then
				table.insert(items, {
					Id = plr,
					Left = plr.DisplayName,
					Right = "@" .. plr.Name,
					RightColor = T.SubText,
					Order = order,
				})
			end
		end
		table.sort(items, function(a, b)
			return a.Order < b.Order
		end)
		win:SetSpectators(items)
	end

	local function Clear()
		if next(dead) then
			table.clear(dead)
			Push()
		end
	end

	local function LocalAlive()
		local c = LocalPlayer.Character
		local h = c and c:FindFirstChildOfClass("Humanoid")
		return h ~= nil and h.Health > 0
	end

	local function Watch(plr)
		if plr == LocalPlayer then
			return
		end
		local function OnChar(char)
			local hum = char:WaitForChild("Humanoid", 10)
			if not hum then
				return
			end
			table.insert(conns, hum.Died:Connect(function()
				if LocalAlive() and not dead[plr] then
					counter += 1
					dead[plr] = counter
					Push()
				end
			end))
		end
		if plr.Character then
			task.spawn(OnChar, plr.Character)
		end
		table.insert(conns, plr.CharacterAdded:Connect(OnChar))
	end

	local function OnLocalChar(char)
		Clear()
		local hum = char:WaitForChild("Humanoid", 10)
		if hum then
			table.insert(conns, hum.Died:Connect(Clear))
		end
	end

	for _, p in ipairs(Players:GetPlayers()) do
		Watch(p)
	end
	table.insert(conns, Players.PlayerAdded:Connect(Watch))
	table.insert(conns, Players.PlayerRemoving:Connect(function(p)
		if dead[p] then
			dead[p] = nil
			Push()
		end
	end))
	if LocalPlayer.Character then
		task.spawn(OnLocalChar, LocalPlayer.Character)
	end
	table.insert(conns, LocalPlayer.CharacterAdded:Connect(OnLocalChar))

	task.spawn(function()
		local last
		while running do
			local c = LocalPlayer.Character
			local root = c and c:FindFirstChild("HumanoidRootPart")
			if root then
				local pos = root.Position
				if last and (pos - last).Magnitude > 250 then
					Clear()
				end
				last = pos
			else
				last = nil
			end
			task.wait(0.25)
		end
	end)

	return function()
		running = false
		for _, c in ipairs(conns) do
			c:Disconnect()
		end
	end
end

UI.HitLogger = HitLogger
UI.SpectatorTracker = SpectatorTracker

return UI
