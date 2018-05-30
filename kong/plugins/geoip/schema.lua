local iputils = require "resty.iputils"
local Errors = require "kong.dao.errors"

local function validate_ips(v, t, column)
  if v and type(v) == "table" then
    for _, ip in ipairs(v) do
      local _, err = iputils.parse_cidr(ip)
      if type(err) == "string" then -- It's an error only if the second variable is a string
        return false, "cannot parse '" .. ip .. "': " .. err
      end
    end
  end
  return true
end

return {
  fields = {
    whitelist_ips = {type = "array", func = validate_ips},
    blacklist_countries = {type = "array"}
  },
  self_check = function(schema, plugin_t, dao, is_update)
    local wl = type(plugin_t.whitelist_ips) == "table" and plugin_t.whitelist_ips or {}
    local bl = type(plugin_t.blacklist_countries) == "table" and plugin_t.blacklist_countries or {}

    if #wl == 0 and #bl == 0 then
      return false, Errors.schema "you must set at least a whitelist_ips or blacklist_countries"
    end

    return true
  end
}