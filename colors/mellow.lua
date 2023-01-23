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
end

local link = function(source, target)
  vim.api.nvim_set_hl(0, source, { link = target })
end

hi("Boolean", { fg = "yellow", bold = true })
hi("CmpItemAbbr", {})
hi("CmpItemAbbrDeprecated", { fg = "555", strikethrough = true })
hi("CmpItemAbrrMatch", { fg = "fff" })
hi("CmpItemKind", { fg = "maroon" })
hi("CmpItemMenu", { fg = "444" })
hi("ColorColumn", { bg = "111" })
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
link("DiffAdd", "diffAdded")
link("DiffDelete", "diffRemoved")
link("GitSignsAdd", "diffAdded")
link("GitSignsDelete", "diffRemoved")
link("fugitiveStagedHeading", "diffAdded")
link("fugitiveUnstagedHeading", "diffRemoved")
link("Character", "String")
link("CmpItemAbbrMatchFuzzy", "CmpItemAbrrMatch")
link("LineNrBelow", "LineNrAbove")
link("SpecialComment", "Comment")
link("fugitiveUntrackedHeading", "Macro")
link("vimGroup", "Normal")
link("vimHiGroup", "Normal")

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
