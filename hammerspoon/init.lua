hyper = {"ctrl", "alt", "cmd", "shift"}

function file_exists(name)
    local f=io.open(name,"r")
    if f~=nil then io.close(f) return true else return false end
end

function require_if_exists(file)
    if file_exists(file .. ".lua") then
        print(" ### Loading " .. file)
        require(file)
    end
end

require_if_exists("keyboard")
require_if_exists("yabai")
