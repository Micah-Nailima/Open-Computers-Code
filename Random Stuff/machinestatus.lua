local gpu = component.gpu
local component = require("component")
local term = require("term")
local fs = require("filesystem")
local gpu = component.gpu
local wget = loadfile("/bin/wget.lua")
local superlib = require("superlib")
local autopid = require("autopidlib")

local function readStatus(proxy, ltype)
    running = 0
     
    if ltype == 1 then --For Mekanism
      running = proxy.canOperate()
    end
     
    if ltype == 2 then --For EnderIO
      running = proxy.getProgress()
      if running == -1 then
        running = false
      else
        running = true
      end
    end
  
    if ltype == 3 then --For newer mekanism blocks
        running = proxy.getMaxEnergy()
    end
  
    if ltype == 4 then --For Flux Networks
      running = proxy.getFluxInfo().maxStorage
    end
  
    return running
  end

  runningdata = {{"ID", "Level", "Type"}}
  for lid in pairs(powerdb) do
      table.insert(powerdata, {lid, percent_gen_db(powerdb, lid), powerdb[lid]["name"]})
      --middle = superlib.pad(" [".. powerdb[lid]["stored"] .. "/" .. powerdb[lid]["capacity"] .. "] ", 30)
      --if config.display_units == false then output = first_half .. second_half end --Possibly add this back later, I don't want to right now though, see middle above this comment
      --if config.display_units == true then output = first_half .. middle .. second_half end
  end

  supported_types = {
    {id="enderio_machine", type=2, name="Ender IO Machine"}, 
    {id="enrichment_chamber", type=1, name="Enrichment Chamber"}
    }

  print(running)