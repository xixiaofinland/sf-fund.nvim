local U = require('sf.util')
local B = require('sf.sub.cmd_builder')

local H = {}
local Org = {}

function Org.fetch_org_list()
  H.fetch_org_list()
end

function Org.set_target_org()
  H.set_target_org()
end

function Org.set_global_target_org()
  H.set_global_target_org()
end

function Org.diff_in_target_org()
  H.diff_in_target_org()
end

function Org.diff_in_org()
  H.diff_in_org()
end

function Org.open()
  -- local cmd = 'sf org open -o ' .. U.get()
  local cmd = B:new():cmd('org'):act('open'):build()
  local err_msg = 'Command failed: ' .. cmd
  U.job_call(cmd, nil, err_msg)
end

function Org.open_current_file()
  -- local cmd = vim.fn.expandcmd('sf org open --source-file "%:p" -o ') .. U.get()
  local cmd = B:new():cmd('org'):act('open'):addParams('-f', '%:p'):build()
  local err_msg = 'Command failed: ' .. cmd
  U.job_call(cmd, nil, err_msg)
end

-- helpers;

H.orgs = {}

H.clean_org_cache = function()
  H.orgs = {}
end

H.set_target_org = function()
  U.is_table_empty(H.orgs)
  vim.ui.select(H.orgs, {
    prompt = 'Local target_org:'
  }, function(choice)
    if choice ~= nil then
      local org = string.gsub(choice, '%[S%] ', '')
      local cmd = 'sf config set target-org ' .. org
      local err_msg = org .. ' - set target_org failed! Not in a sfdx project folder?'
      local cb = function()
        U.target_org = org
      end

      U.silent_job_call(cmd, nil, err_msg, cb)
    end
  end)
end

H.set_global_target_org = function()
  if U.is_empty_str(H.orgs) then
    U.notify_then_error('Empty value')
  end

  vim.ui.select(H.orgs, {
    prompt = 'Global target_org:'
  }, function(choice)
    if choice ~= nil then
      local org = string.gsub(choice, '%[S%] ', '')
      local cmd = 'sf config set target-org --global ' .. org
      local msg = 'Global target_org set: ' .. org
      local err_msg = string.format('Global set target_org [%s] failed!', org)
      local cb = function()
        U.target_org = org
      end
      U.silent_job_call(cmd, msg, err_msg, cb)
    end
  end)
end

---@param data string
H.store_orgs = function(data)
  local s = ""
  for _, v in ipairs(data) do
    s = s .. v;
  end

  local org_data = vim.json.decode(s, {}).result.nonScratchOrgs
  local scratch_org_data = vim.json.decode(s, {}).result.scratchOrgs

  for i = 1, #scratch_org_data do
    org_data[#org_data + 1] = scratch_org_data[i]
  end

  for _, v in pairs(org_data) do
    local alias = v.alias or v.username
    if v.isDefaultUsername then
      U.target_org = alias
    end

    local org_entry = v.isScratch and '[S] ' .. alias or alias
    table.insert(H.orgs, org_entry)
  end

  U.is_table_empty(H.orgs)
end

H.fetch_and_store_orgs = function()
  vim.fn.jobstart('sf org list --json', {
    stdout_buffered = true,
    on_stdout =
        function(_, data)
          H.store_orgs(data)
        end
  })
end

H.fetch_org_list = function()
  U.is_sf_cmd_installed()

  H.clean_org_cache()
  H.fetch_and_store_orgs()
end

H.diff_in_target_org = function()
  if U.is_empty_str(U.target_org) then
    return U.show_err('Target_org empty!')
  end

  H.diff_in(U.target_org)
end

H.diff_in_org = function()
  U.is_table_empty(H.orgs)

  vim.ui.select(H.orgs, {
    prompt = 'Select org to diff in:'
  }, function(choice)
    if choice ~= nil then
      H.diff_in(choice)
    end
  end)
end

---@param org string
H.diff_in = function(org)
  local file_name = vim.fn.expand("%:t")
  local metadataType = H.get_metadata_type(vim.fn.expand("%:p"))
  local file_name_no_ext = H.get_file_name_without_extension(file_name)
  local temp_path = vim.fn.tempname()

  -- local cmd = string.format(
  --   "sf project retrieve start -m %s:%s -r %s -o %s --json",
  --   metadataType,
  --   file_name_no_ext,
  --   temp_path,
  --   org
  -- )
  local cmd = B:new():cmd('project'):act('retrieve start'):addParams({
    ['-m'] = metadataType .. ':' .. file_name_no_ext,
    ['-r'] = temp_path,
    ['--json'] = '',
  }):set_org(org):build()

  local msg = 'Retrive success: ' .. org
  local err_msg = 'Retrive failed: ' .. org
  local cb = function()
    local temp_file = H.find_file(temp_path, file_name)
    vim.cmd("vert diffsplit " .. temp_file)
    vim.bo[0].buflisted = false
  end

  U.silent_job_call(cmd, msg, err_msg, cb)
end

---@param fileName string
---@return any
H.get_file_name_without_extension = function(fileName)
  -- (.-) makes the match non-greedy
  -- see https://www.lua.org/manual/5.3/manual.html#6.4.1
  return fileName:match("(.-)%.%w+%-meta%.xml$") or fileName:match("(.-)%.[^%.]+$")
end

H.metadata_types = {
  ["lwc"] = "LightningComponentBundle",
  ["aura"] = "AuraDefinitionBundle",
  ["classes"] = "ApexClass",
  ["triggers"] = "ApexTrigger",
  ["pages"] = "ApexPage",
  ["components"] = "ApexComponent",
  ["flows"] = "Flow",
  ["objects"] = "CustomObject",
  ["layouts"] = "Layout",
  ["permissionsets"] = "PermissionSet",
  ["profiles"] = "Profile",
  ["labels"] = "CustomLabels",
  ["staticresources"] = "StaticResource",
  ["sites"] = "CustomSite",
  ["applications"] = "CustomApplication",
  ["roles"] = "UserRole",
  ["groups"] = "Group",
  ["queues"] = "Queue",
}

---@param filePath string
---@return string | nil
H.get_metadata_type = function(filePath)
  for key, metadataType in pairs(H.metadata_types) do
    if filePath:find(key) then
      return metadataType
    end
  end
  return nil
end

---@param path string
---@param target string
---@return string
H.find_file = function(path, target)
  local scanner = vim.loop.fs_scandir(path)
  -- if scanner is nil, then path is not a valid dir
  if scanner then
    local file, type = vim.loop.fs_scandir_next(scanner)
    if (path:sub(-1) ~= "/") then
      path = path .. "/"
    end
    while file do
      if type == "directory" then
        local found = H.find_file(path .. file, target)
        if found then
          return found
        end
      elseif file == target then
        return path .. file
      end
      -- get the next file and type
      file, type = vim.loop.fs_scandir_next(scanner)
    end
  end
end

return Org
