local U = require("sf.util")
local B = require("sf.sub.cmd_builder")
local Term = {}
local H = {}
local t

-- this function is called in config.lua
-- it's meant to delay the raw term initialization so the term_cfg is ready after user's setup() call
---@param term_cfg table
function Term.setup(term_cfg)
  t = require("sf.sub.raw_term"):new(term_cfg)
end

function Term.toggle()
  t:toggle()
end

function Term.open()
  t:open()
end

function Term.save_and_push(extra_params)
  if U.is_empty_str(U.target_org) then
    return U.show_err("Target_org empty!")
  end

  vim.api.nvim_command("write!")

  local cmd_builder = B:new():cmd("project"):act("deploy start"):addParams("-d", "%:p")
  if extra_params then
    cmd_builder:addParamStr(extra_params)
  end
  local cmd = cmd_builder:build()
  t:run(cmd)
end

function Term.push_delta(extra_params)
  if U.is_empty_str(U.target_org) then
    return U.show_err("Target_org empty!")
  end

  local cmd_builder = B:new():cmd("project"):act("deploy start")
  if extra_params then
    cmd_builder:addParamStr(extra_params)
  end
  local cmd = cmd_builder:build()
  t:run(cmd)
end

function Term.retrieve(extra_params)
  if U.is_empty_str(U.target_org) then
    return U.show_err("Target_org empty!")
  end

  local filename = vim.fn.expandcmd("%:p")
  local cb = function()
    U.try_open_file(filename)
  end

  local cmd_builder = B:new():cmd("project"):act("retrieve start"):addParams("-d", filename)
  if extra_params then
    cmd_builder:addParamStr(extra_params)
  end
  local cmd = cmd_builder:build()
  t:run(cmd, cb)
end

function Term.retrieve_delta(extra_params)
  if U.is_empty_str(U.target_org) then
    return U.show_err("Target_org empty!")
  end

  local cmd_builder = B:new():cmd("project"):act("retrieve start")
  if extra_params then
    cmd_builder:addParamStr(extra_params)
  end
  local cmd = cmd_builder:build()
  t:run(cmd)
end

function Term.retrieve_package()
  if U.is_empty_str(U.target_org) then
    return U.show_err("Target_org empty!")
  end
  -- local cmd = vim.fn.expandcmd('sf project retrieve start -x "%:p" -o ') .. U.get()
  local cmd = B:new():cmd("project"):act("retrieve start"):addParams("-x", "%:p"):build()
  t:run(cmd)
end

function Term.run_anonymous()
  if U.is_empty_str(U.target_org) then
    return U.show_err("Target_org empty!")
  end
  -- local cmd = vim.fn.expandcmd('sf apex run -f "%:p" -o ') .. U.get()
  local cmd = B:new():cmd("apex"):act("run"):addParams("-f", "%:p"):build()
  t:run(cmd)
end

function Term.run_query()
  if U.is_empty_str(U.target_org) then
    return U.show_err("Target_org empty!")
  end
  -- local cmd = vim.fn.expandcmd('sf data query -w 5 -f "%:p" -o ') .. U.get()
  local cmd = B:new():cmd("data"):act("query"):addParams("-w", vim.g.sf.sf_wait_time):addParams("-f", "%:p"):build()
  t:run(cmd)
end

function Term.run_tooling_query()
  if U.is_empty_str(U.target_org) then
    return U.show_err("Target_org empty!")
  end
  -- local cmd = vim.fn.expandcmd('sf data query -t -w 5 -f "%:p" -o ') .. U.get()
  local cmd =
    B:new():cmd("data"):act("query"):addParams({ ["-w"] = vim.g.sf.sf_wait_time, ["-f"] = "%:p", ["-t"] = "" }):build()
  t:run(cmd)
end

function Term.run_highlighted_soql()
  if U.is_empty_str(U.target_org) then
    return U.show_err("Target_org empty!")
  end
  if vim.fn.mode() ~= "v" then
    vim.notify("Not in normal visual mode per character.", vim.log.levels.WARN)
    return
  end

  local selected_text = H.get_visual_selection()
  if not selected_text then
    vim.notify("Empty selection.", vim.log.levels.WARN)
  end

  -- local raw_cmd = string.format('sf data query -q "%s" -o %s', selected_text, U.get())
  local raw_cmd = B:new():cmd("data"):act("query"):addParamsNoExpand("-q", selected_text):build()
  t:run(raw_cmd)
end

function Term.cancel()
  t.is_running = false -- set the flag to stop the running task
  t:run("\3")
end

function Term.go_to_sf_root()
  local root = U.get_sf_root()
  t:run("cd " .. root)
end

function Term.run(cmd, cb)
  -- local cmd = vim.fn.expandcmd(c)
  t:run(cmd, cb)
end

function Term.get_config()
  return t:get_config()
end

-- helper;

H.get_visual_selection = function()
  -- Save the current register content and type
  local old_reg = vim.fn.getreg('"')
  local old_regtype = vim.fn.getregtype('"')

  -- Execute normal mode commands to yank the visual selection
  vim.cmd('noautocmd normal! "vy"')

  -- Get the content of the unnamed register (which now contains our selection)
  local selection = vim.fn.getreg("v")

  -- Restore the register to its previous state
  vim.fn.setreg('"', old_reg, old_regtype)

  -- Return the selected text
  return selection
end

return Term
