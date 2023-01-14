local colors = {
  ["NONE"] = "NONE",
  ["darkgray"] = "#161821",
  ["darkergray"] = "#191919",
  ["yellow"] = "#ffd600",
  ["orange"] = "#ff8700",
  ["maroon"] = "#be5f5f",
  ["green"] = "#649e3f",
  ["red"] = "#bb0000",
  ["darkred"] = "#660000",
  ["reddish"] = "#e41b63",
  ["greenish"] = "#35ca93",
}

local hi = function(group, highlights)
  local bg = highlights["bg"] or "NONE"
  local fg = highlights["fg"] or "NONE"
  local bold = highlights["bold"]
  local strikethrough = highlights["strikethrough"]

  if #bg == 3 and string.match(bg, "^[0-9a-fA-F]") then
    bg = "#" .. bg .. bg
  elseif string.match(bg, "^#") == nil then
    bg = colors[bg]
  end

  if #fg == 3 and string.match(fg, "^[0-9a-fA-F]") then
    fg = "#" .. fg .. fg
    -- elseif string.match(fg, "^#") == nil then
    -- fixing this makes everything not work. oof
  elseif string.match(bg, "^#") == nil then
    fg = colors[fg]
  end

  vim.api.nvim_set_hl(0, group, { fg = fg, bg = bg, bold = bold, strikethrough = strikethrough })

  -- vim.highlight.create(group, { guibg = bg, guifg = fg, gui = gui })
  -- vim.cmd(string.format("highlight! %s guibg=%s guifg=%s gui=%s", group, bg, fg, gui))
end

local link = function(source, target)
  -- vim.highlight.link(source, target, true)
  vim.api.nvim_set_hl(0, source, { link = target })
end

-- Regular highlight groups
hi("Boolean", { fg = "yellow", bold = true })
hi("CmpItemAbbr", {})
hi("CmpItemAbbrDeprecated", { fg = "555", strikethrough = true })
hi("CmpItemAbrrMatch", { fg = "fff" })
hi("CmpItemKind", { fg = "maroon" })
hi("CmpItemMenu", { fg = "444" })
hi("ColorColumn", { bg = "555" })
hi("Comment", { fg = "777" })
hi("Conditional", { fg = "yellow", bold = true })
hi("Constant", { fg = "777" })
hi("CursorLineNr", { fg = "yellow" })
hi("Delimiter", { fg = "bbb" })
hi("Directory", { fg = "yellow" })
hi("EndOfBuffer", { fg = "maroon" })
hi("Float", { fg = "aaa" })
hi("FloatBorder", { fg = "maroon", bold = true })
hi("Folded", { bg = "111", fg = "yellow", bold = true })
hi("Function", { fg = "aaa" })
hi("GitSignsChange", { fg = "orange" })
hi("GitSignsChangeDelete", { fg = "darkred" })
hi("Identifier", { fg = "bbb" })
hi("IncSearch", { bg = "333", fg = "yellow" })
hi("Include", { fg = "aaa" })
hi("Keyword", { fg = "yellow", bold = true })
hi("LineNr", { fg = "yellow" })
hi("LineNrAbove", { fg = "aaa" })
hi("Macro", { fg = "888" })
hi("MatchParen", { bg = "555" })
hi("MiniCursorword", { bg = "222" })
hi("MiniStatuslineDevinfo", { bg = "111" })
hi("MiniStatuslineFileinfo", { bg = "111" })
hi("MiniStatuslineFilename", { bg = "222" })
hi("MiniStatuslineModeCommand", { bg = "greenish", fg = "111" })
hi("MiniStatuslineModeInsert", { bg = "yellow", fg = "111" })
hi("MiniStatuslineModeNormal", { bg = "111", fg = "yellow" })
hi("MiniStatuslineModeOther", {})
hi("MiniStatuslineModeReplace", { bg = "reddish", fg = "111" })
hi("MiniStatuslineModeVisual", { bg = "orange", fg = "111" })
hi("Normal", { fg = "#000000", bold = true })
hi("Number", { fg = "aaa" })
hi("Operator", { fg = "ddd" })
hi("Pmenu", { bg = "darkgray", fg = "aaa" })
hi("PmenuSbar", { bg = "darkgray" })
hi("PmenuSel", { bg = "darkgray", fg = "yellow" })
hi("PmenuThumb", { bg = "darkgray" })
hi("PreProc", { fg = "maroon" })
hi("Search", { bg = "maroon", fg = "333" })
hi("SignColumn", {})
hi("Special", { fg = "maroon" })
hi("Statement", { fg = "yellow" })
hi("StatusLine", { fg = "ddd", bg = "111" })
hi("StorageClass", { fg = "yellow", bold = true })
hi("String", { fg = "green" })
hi("Title", { fg = "yellow" })
hi("Todo", { bg = "maroon", fg = "eee" })
hi("Type", { fg = "yellow" })
hi("Visual", { bg = "444" })
hi("WinSeparator", { bg = "NONE", fg = "555" })
hi("diffAdded", { fg = "green" })
hi("diffRemoved", { fg = "red" })
link("Character", "String")
link("CmpItemAbbrMatchFuzzy", "CmpItemAbrrMatch")
link("GitSignsAdd", "diffAdded")
link("GitSignsDelete", "diffRemoved")
link("LineNrBelow", "LineNrAbove")
link("SpecialComment", "Comment")
link("fugitiveStagedHeading", "diffAdded")
link("fugitiveUnstagedHeading", "diffRemoved")
link("fugitiveUntrackedHeading", "Macro")
link("vimGroup", "Normal")
link("vimHiGroup", "Normal")

-- Treesitter highlight groups
hi("TSAnnotation", { fg = "yellow" })
hi("TSAttribute", { fg = "yellow" })
hi("TSCharacter", { fg = "yellow" })
hi("TSComment", { fg = "777" })
hi("TSConstBuiltin", { fg = "yellow", bold = true })
hi("TSConstMacro", { fg = "yellow" })
hi("TSConstant", { fg = "888" })
hi("TSConstructor", { fg = "yellow" })
hi("TSError", { fg = "yellow" })
hi("TSException", { fg = "yellow" })
hi("TSFloat", { fg = "yellow" })
hi("TSFuncBuiltin", { fg = "yellow", bold = true })
hi("TSFuncMacro", { fg = "yellow" })
hi("TSFunction", { fg = "maroon" })
hi("TSKeyword", { fg = "yellow", bold = true })
hi("TSOperator", { fg = "yellow" })
hi("TSString", { fg = "green" })
hi("TSType", { fg = "maroon" })
hi("TSVariable", { fg = "aaa" })
hi("TSVariableBuiltin", { fg = "yellow", bold = true })
link("TSBoolean", "TSKeyword")
link("TSConditional", "TSKeyword")
link("TSField", "TSVariable")
link("TSInclude", "TSKeyword")
link("TSKeywordOperator", "TSKeyword")
link("TSKeywordReturn", "TSKeyword")
link("TSMethod", "TSFunction")

-- " 	hi.TSAnnotation = { guifg = M.colors.base0F, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSAttribute = { guifg = M.colors.base0A, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSBoolean = { guifg = M.colors.base09, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSCharacter = { guifg = M.colors.base08, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSComment = { guifg = M.colors.base03, guibg = nil, gui = "bold", guisp = nil }
-- " 	hi.TSConstructor = { guifg = M.colors.base0D, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSConditional = { guifg = M.colors.base0E, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSConstant = { guifg = M.colors.base09, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSConstBuiltin = { guifg = M.colors.base09, guibg = nil, gui = "bold", guisp = nil }
-- " 	hi.TSConstMacro = { guifg = M.colors.base08, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSError = { guifg = M.colors.base08, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSException = { guifg = M.colors.base08, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSField = { guifg = M.colors.base05, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSFloat = { guifg = M.colors.base09, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSFunction = { guifg = M.colors.base0D, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSFuncBuiltin = { guifg = M.colors.base0D, guibg = nil, gui = "bold", guisp = nil }
-- " 	hi.TSFuncMacro = { guifg = M.colors.base08, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSInclude = { guifg = M.colors.base0D, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSKeyword = { guifg = M.colors.base0E, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSKeywordFunction = { guifg = M.colors.base0E, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSKeywordOperator = { guifg = M.colors.base0E, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSLabel = { guifg = M.colors.base0A, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSMethod = { guifg = M.colors.base0D, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSNamespace = { guifg = M.colors.base08, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSNone = { guifg = M.colors.base05, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSNumber = { guifg = M.colors.base09, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSOperator = { guifg = M.colors.base05, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSParameter = { guifg = M.colors.base05, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSParameterReference = { guifg = M.colors.base05, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSProperty = { guifg = M.colors.base05, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSPunctDelimiter = { guifg = M.colors.base0F, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSPunctBracket = { guifg = M.colors.base05, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSPunctSpecial = { guifg = M.colors.base05, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSRepeat = { guifg = M.colors.base0A, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSString = { guifg = M.colors.base0B, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSStringRegex = { guifg = M.colors.base0C, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSStringEscape = { guifg = M.colors.base0C, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSSymbol = { guifg = M.colors.base0B, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSTag = { guifg = M.colors.base0A, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSTagDelimiter = { guifg = M.colors.base0F, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSText = { guifg = M.colors.base05, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSStrong = { guifg = nil, guibg = nil, gui = "bold", guisp = nil }
-- " 	hi.TSEmphasis = { guifg = M.colors.base09, guibg = nil, gui = "bold", guisp = nil }
-- " 	hi.TSUnderline = { guifg = M.colors.base00, guibg = nil, gui = "underline", guisp = nil }
-- " 	hi.TSStrike = { guifg = M.colors.base00, guibg = nil, gui = "strikethrough", guisp = nil }
-- " 	hi.TSTitle = { guifg = M.colors.base0D, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSLiteral = { guifg = M.colors.base09, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSURI = { guifg = M.colors.base09, guibg = nil, gui = "underline", guisp = nil }
-- " 	hi.TSType = { guifg = M.colors.base0A, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSTypeBuiltin = { guifg = M.colors.base0A, guibg = nil, gui = "bold", guisp = nil }
-- " 	hi.TSVariable = { guifg = M.colors.base08, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.TSVariableBuiltin = { guifg = M.colors.base08, guibg = nil, gui = "bold", guisp = nil }

-- " 	hi.TSDefinition = { guifg = nil, guibg = nil, gui = "underline", guisp = M.colors.base04 }
-- " 	hi.TSDefinitionUsage = { guifg = nil, guibg = nil, gui = "underline", guisp = M.colors.base04 }
-- " 	hi.TSCurrentScope = { guifg = nil, guibg = nil, gui = "bold", guisp = nil }

-- " 	-- Vim editor colors
-- " 	hi.Normal = { guifg = M.colors.base05, guibg = M.colors.base00, gui = nil, guisp = nil }
-- " 	hi.Bold = { guifg = nil, guibg = nil, gui = "bold", guisp = nil }
-- " 	hi.Debug = { guifg = M.colors.base08, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.Directory = { guifg = M.colors.base0D, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.Error = { guifg = M.colors.base00, guibg = M.colors.base08, gui = nil, guisp = nil }
-- " 	hi.ErrorMsg = { guifg = M.colors.base08, guibg = M.colors.base00, gui = nil, guisp = nil }
-- " 	hi.Exception = { guifg = M.colors.base08, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.FoldColumn = { guifg = M.colors.base0C, guibg = M.colors.base00, gui = nil, guisp = nil }
-- " 	hi.Folded = { guifg = M.colors.base03, guibg = M.colors.base01, gui = nil, guisp = nil }
-- " 	hi.IncSearch = { guifg = M.colors.base01, guibg = M.colors.base09, gui = "none", guisp = nil }
-- " 	hi.Italic = { guifg = nil, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.Macro = { guifg = M.colors.base08, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.MatchParen = { guifg = nil, guibg = M.colors.base03, gui = nil, guisp = nil }
-- " 	hi.ModeMsg = { guifg = M.colors.base0B, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.MoreMsg = { guifg = M.colors.base0B, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.Question = { guifg = M.colors.base0D, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.Search = { guifg = M.colors.base01, guibg = M.colors.base0A, gui = nil, guisp = nil }
-- " 	hi.Substitute = { guifg = M.colors.base01, guibg = M.colors.base0A, gui = "none", guisp = nil }
-- " 	hi.SpecialKey = { guifg = M.colors.base03, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.TooLong = { guifg = M.colors.base08, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.Underlined = { guifg = M.colors.base08, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.Visual = { guifg = nil, guibg = M.colors.base02, gui = nil, guisp = nil }
-- " 	hi.VisualNOS = { guifg = M.colors.base08, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.WarningMsg = { guifg = M.colors.base08, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.WildMenu = { guifg = M.colors.base08, guibg = M.colors.base0A, gui = nil, guisp = nil }
-- " 	hi.Title = { guifg = M.colors.base0D, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.Conceal = { guifg = M.colors.base0D, guibg = M.colors.base00, gui = nil, guisp = nil }
-- " 	hi.Cursor = { guifg = M.colors.base00, guibg = M.colors.base05, gui = nil, guisp = nil }
-- " 	hi.NonText = { guifg = M.colors.base03, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.LineNr = { guifg = M.colors.base04, guibg = M.colors.base00, gui = nil, guisp = nil }
-- " 	hi.SignColumn = { guifg = M.colors.base04, guibg = M.colors.base00, gui = nil, guisp = nil }
-- " 	hi.StatusLine = { guifg = M.colors.base05, guibg = M.colors.base02, gui = "none", guisp = nil }
-- " 	hi.StatusLineNC = { guifg = M.colors.base04, guibg = M.colors.base01, gui = "none", guisp = nil }
-- " 	hi.VertSplit = { guifg = M.colors.base05, guibg = M.colors.base00, gui = "none", guisp = nil }
-- " 	hi.ColorColumn = { guifg = nil, guibg = M.colors.base01, gui = "none", guisp = nil }
-- " 	hi.CursorColumn = { guifg = nil, guibg = M.colors.base01, gui = "none", guisp = nil }
-- " 	hi.CursorLine = { guifg = nil, guibg = M.colors.base01, gui = "none", guisp = nil }
-- " 	hi.CursorLineNr = { guifg = M.colors.base04, guibg = M.colors.base01, gui = nil, guisp = nil }
-- " 	hi.QuickFixLine = { guifg = nil, guibg = M.colors.base01, gui = "none", guisp = nil }
-- " 	hi.PMenu = { guifg = M.colors.base05, guibg = M.colors.base01, gui = "none", guisp = nil }
-- " 	hi.PMenuSel = { guifg = M.colors.base01, guibg = M.colors.base05, gui = nil, guisp = nil }
-- " 	hi.TabLine = { guifg = M.colors.base03, guibg = M.colors.base01, gui = "none", guisp = nil }
-- " 	hi.TabLineFill = { guifg = M.colors.base03, guibg = M.colors.base01, gui = "none", guisp = nil }
-- " 	hi.TabLineSel = { guifg = M.colors.base0B, guibg = M.colors.base01, gui = "none", guisp = nil }

-- " 	-- Standard syntax highlighting
-- " 	hi.Boolean = { guifg = M.colors.base09, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.Character = { guifg = M.colors.base08, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.Comment = { guifg = M.colors.base03, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.Conditional = { guifg = M.colors.base0E, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.Constant = { guifg = M.colors.base09, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.Define = { guifg = M.colors.base0E, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.Delimiter = { guifg = M.colors.base0F, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.Float = { guifg = M.colors.base09, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.Function = { guifg = M.colors.base0D, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.Identifier = { guifg = M.colors.base08, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.Include = { guifg = M.colors.base0D, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.Keyword = { guifg = M.colors.base0E, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.Label = { guifg = M.colors.base0A, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.Number = { guifg = M.colors.base09, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.Operator = { guifg = M.colors.base05, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.PreProc = { guifg = M.colors.base0A, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.Repeat = { guifg = M.colors.base0A, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.Special = { guifg = M.colors.base0C, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.SpecialChar = { guifg = M.colors.base0F, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.Statement = { guifg = M.colors.base08, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.StorageClass = { guifg = M.colors.base0A, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.String = { guifg = M.colors.base0B, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.Structure = { guifg = M.colors.base0E, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.Tag = { guifg = M.colors.base0A, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.Todo = { guifg = M.colors.base0A, guibg = M.colors.base01, gui = nil, guisp = nil }
-- " 	hi.Type = { guifg = M.colors.base0A, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.Typedef = { guifg = M.colors.base0A, guibg = nil, gui = nil, guisp = nil }

-- " 	-- Diff highlighting
-- " 	hi.DiffAdd = { guifg = M.colors.base0B, guibg = M.colors.base00, gui = nil, guisp = nil }
-- " 	hi.DiffChange = { guifg = M.colors.base03, guibg = M.colors.base00, gui = nil, guisp = nil }
-- " 	hi.DiffDelete = { guifg = M.colors.base08, guibg = M.colors.base00, gui = nil, guisp = nil }
-- " 	hi.DiffText = { guifg = M.colors.base0D, guibg = M.colors.base00, gui = nil, guisp = nil }
-- " 	hi.DiffAdded = { guifg = M.colors.base0B, guibg = M.colors.base00, gui = nil, guisp = nil }
-- " 	hi.DiffFile = { guifg = M.colors.base08, guibg = M.colors.base00, gui = nil, guisp = nil }
-- " 	hi.DiffNewFile = { guifg = M.colors.base0B, guibg = M.colors.base00, gui = nil, guisp = nil }
-- " 	hi.DiffLine = { guifg = M.colors.base0D, guibg = M.colors.base00, gui = nil, guisp = nil }
-- " 	hi.DiffRemoved = { guifg = M.colors.base08, guibg = M.colors.base00, gui = nil, guisp = nil }

-- " 	-- Git highlighting
-- " 	hi.gitcommitOverflow = { guifg = M.colors.base08, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.gitcommitSummary = { guifg = M.colors.base0B, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.gitcommitComment = { guifg = M.colors.base03, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.gitcommitUntracked = { guifg = M.colors.base03, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.gitcommitDiscarded = { guifg = M.colors.base03, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.gitcommitSelected = { guifg = M.colors.base03, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.gitcommitHeader = { guifg = M.colors.base0E, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.gitcommitSelectedType = { guifg = M.colors.base0D, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.gitcommitUnmergedType = { guifg = M.colors.base0D, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.gitcommitDiscardedType = { guifg = M.colors.base0D, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.gitcommitBranch = { guifg = M.colors.base09, guibg = nil, gui = "bold", guisp = nil }
-- " 	hi.gitcommitUntrackedFile = { guifg = M.colors.base0A, guibg = nil, gui = nil, guisp = nil }
-- " 	hi.gitcommitUnmergedFile = { guifg = M.colors.base08, guibg = nil, gui = "bold", guisp = nil }
-- " 	hi.gitcommitDiscardedFile = { guifg = M.colors.base08, guibg = nil, gui = "bold", guisp = nil }
-- " 	hi.gitcommitSelectedFile = { guifg = M.colors.base0B, guibg = nil, gui = "bold", guisp = nil }

-- " 	-- GitGutter highlighting
-- " 	hi.GitGutterAdd = { guifg = M.colors.base0B, guibg = M.colors.base00, gui = nil, guisp = nil }
-- " 	hi.GitGutterChange = { guifg = M.colors.base0D, guibg = M.colors.base00, gui = nil, guisp = nil }
-- " 	hi.GitGutterDelete = { guifg = M.colors.base08, guibg = M.colors.base00, gui = nil, guisp = nil }
-- " 	hi.GitGutterChangeDelete = { guifg = M.colors.base0E, guibg = M.colors.base00, gui = nil, guisp = nil }

-- " 	-- Spelling highlighting
-- " 	hi.SpellBad = { guifg = nil, guibg = nil, gui = "undercurl", guisp = M.colors.base08 }
-- " 	hi.SpellLocal = { guifg = nil, guibg = nil, gui = "undercurl", guisp = M.colors.base0C }
-- " 	hi.SpellCap = { guifg = nil, guibg = nil, gui = "undercurl", guisp = M.colors.base0D }
-- " 	hi.SpellRare = { guifg = nil, guibg = nil, gui = "undercurl", guisp = M.colors.base0E }

-- " 	hi.DiagnosticError = { guifg = M.colors.base08, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.DiagnosticWarn = { guifg = M.colors.base0E, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.DiagnosticInfo = { guifg = M.colors.base05, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.DiagnosticHint = { guifg = M.colors.base0C, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.DiagnosticUnderlineError = { guifg = nil, guibg = nil, gui = "undercurl", guisp = M.colors.base08 }
-- " 	hi.DiagnosticUnderlineWarning = { guifg = nil, guibg = nil, gui = "undercurl", guisp = M.colors.base0E }
-- " 	hi.DiagnosticUnderlineWarn = { guifg = nil, guibg = nil, gui = "undercurl", guisp = M.colors.base0E }
-- " 	hi.DiagnosticUnderlineInformation = { guifg = nil, guibg = nil, gui = "undercurl", guisp = M.colors.base0F }
-- " 	hi.DiagnosticUnderlineHint = { guifg = nil, guibg = nil, gui = "undercurl", guisp = M.colors.base0C }

-- " 	hi.LspReferenceText = { guifg = nil, guibg = nil, gui = "underline", guisp = M.colors.base04 }
-- " 	hi.LspReferenceRead = { guifg = nil, guibg = nil, gui = "underline", guisp = M.colors.base04 }
-- " 	hi.LspReferenceWrite = { guifg = nil, guibg = nil, gui = "underline", guisp = M.colors.base04 }
-- " 	hi.LspDiagnosticsDefaultError = "DiagnosticError"
-- " 	hi.LspDiagnosticsDefaultWarning = "DiagnosticWarn"
-- " 	hi.LspDiagnosticsDefaultInformation = "DiagnosticInfo"
-- " 	hi.LspDiagnosticsDefaultHint = "DiagnosticHint"
-- " 	hi.LspDiagnosticsUnderlineError = "DiagnosticUnderlineError"
-- " 	hi.LspDiagnosticsUnderlineWarning = "DiagnosticUnderlineWarning"
-- " 	hi.LspDiagnosticsUnderlineInformation = "DiagnosticUnderlineInformation"
-- " 	hi.LspDiagnosticsUnderlineHint = "DiagnosticUnderlineHint"

-- " 	hi.NvimInternalError = { guifg = M.colors.base00, guibg = M.colors.base08, gui = "none", guisp = nil }

-- " 	hi.NormalFloat = { guifg = M.colors.base05, guibg = M.colors.base00, gui = nil, guisp = nil }
-- " 	hi.FloatBorder = { guifg = M.colors.base05, guibg = M.colors.base00, gui = nil, guisp = nil }
-- " 	hi.NormalNC = { guifg = M.colors.base05, guibg = M.colors.base00, gui = nil, guisp = nil }
-- " 	hi.TermCursor = { guifg = M.colors.base00, guibg = M.colors.base05, gui = "none", guisp = nil }
-- " 	hi.TermCursorNC = { guifg = M.colors.base00, guibg = M.colors.base05, gui = nil, guisp = nil }

-- " 	hi.User1 = { guifg = M.colors.base08, guibg = M.colors.base02, gui = "none", guisp = nil }
-- " 	hi.User2 = { guifg = M.colors.base0E, guibg = M.colors.base02, gui = "none", guisp = nil }
-- " 	hi.User3 = { guifg = M.colors.base05, guibg = M.colors.base02, gui = "none", guisp = nil }
-- " 	hi.User4 = { guifg = M.colors.base0C, guibg = M.colors.base02, gui = "none", guisp = nil }
-- " 	hi.User5 = { guifg = M.colors.base01, guibg = M.colors.base02, gui = "none", guisp = nil }
-- " 	hi.User6 = { guifg = M.colors.base05, guibg = M.colors.base02, gui = "none", guisp = nil }
-- " 	hi.User7 = { guifg = M.colors.base05, guibg = M.colors.base02, gui = "none", guisp = nil }
-- " 	hi.User8 = { guifg = M.colors.base00, guibg = M.colors.base02, gui = "none", guisp = nil }
-- " 	hi.User9 = { guifg = M.colors.base00, guibg = M.colors.base02, gui = "none", guisp = nil }

-- " 	hi.TreesitterContext = { guifg = nil, guibg = M.colors.base01, gui = "bold", guisp = nil }

-- " 	hi.TelescopeBorder = { guifg = darkerbg, guibg = darkerbg, gui = nil, guisp = nil }
-- " 	hi.TelescopePromptBorder = { guifg = darkerstatusline, guibg = darkerstatusline, gui = nil, guisp = nil }
-- " 	hi.TelescopePromptNormal = { guifg = M.colors.base05, guibg = darkerstatusline, gui = nil, guisp = nil }
-- " 	hi.TelescopePromptPrefix = { guifg = M.colors.base08, guibg = darkerstatusline, gui = nil, guisp = nil }
-- " 	hi.TelescopeNormal = { guifg = nil, guibg = darkerbg, gui = nil, guisp = nil }
-- " 	hi.TelescopePreviewTitle = { guifg = darkercursorline, guibg = M.colors.base0B, gui = nil, guisp = nil }
-- " 	hi.TelescopePromptTitle = { guifg = darkercursorline, guibg = M.colors.base08, gui = nil, guisp = nil }
-- " 	hi.TelescopeResultsTitle = { guifg = darkerbg, guibg = darkerbg, gui = nil, guisp = nil }
-- " 	hi.TelescopeSelection = { guifg = nil, guibg = darkerstatusline, gui = nil, guisp = nil }

-- " 	hi.NotifyERRORBorder = { guifg = M.colors.base08, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.NotifyWARNBorder = { guifg = M.colors.base0E, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.NotifyINFOBorder = { guifg = M.colors.base05, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.NotifyDEBUGBorder = { guifg = M.colors.base0C, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.NotifyTRACEBorder = { guifg = M.colors.base0C, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.NotifyERRORIcon = { guifg = M.colors.base08, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.NotifyWARNIcon = { guifg = M.colors.base0E, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.NotifyINFOIcon = { guifg = M.colors.base05, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.NotifyDEBUGIcon = { guifg = M.colors.base0C, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.NotifyTRACEIcon = { guifg = M.colors.base0C, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.NotifyERRORTitle = { guifg = M.colors.base08, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.NotifyWARNTitle = { guifg = M.colors.base0E, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.NotifyINFOTitle = { guifg = M.colors.base05, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.NotifyDEBUGTitle = { guifg = M.colors.base0C, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.NotifyTRACETitle = { guifg = M.colors.base0C, guibg = nil, gui = "none", guisp = nil }
-- " 	hi.NotifyERRORBody = "Normal"
-- " 	hi.NotifyWARNBody = "Normal"
-- " 	hi.NotifyINFOBody = "Normal"
-- " 	hi.NotifyDEBUGBody = "Normal"
-- " 	hi.NotifyTRACEBody = "Normal"

