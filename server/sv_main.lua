RegisterNetEvent("ps-camera:cheatDetect", function()
    DropPlayer(source, "Cheater Detected")
end)

RegisterNetEvent("ps-camera:requestWebhook", function(Key)
    local source = source
    local event = ("ps-camera:grabbed%s"):format(Key)

    if SvConfig.webhook == '' then
        print("^1[Error] A webhook is missing in: SvConfig.webhook")
    else
        TriggerClientEvent(event, source, SvConfig.webhook)
    end
end)

RegisterNetEvent('ps-camera:requestFivemanageToken', function(Key)
    local source = source
    local event = ("ps-camera:grabbed%s"):format(Key)

    if Config.UseFivemanage == false then
        return print("^1[Error] Requesting Fivemanage token but Config.UseFivemanage set to false.")
    end

    if SvConfig.FivemanageApiToken == '' then
        return print("^1[Error] Your Fivemanage API Token is missing in: Config.FivemanageApiToken")
    end

    TriggerClientEvent(event, source, SvConfig.FivemanageApiToken)
end)

RegisterNetEvent("ps-camera:CreatePhoto", function(url)
    local source = source
    local player = exports.qbx_core:GetPlayer(source)
    if not player then return end

    local coords = GetEntityCoords(GetPlayerPed(source))

    TriggerClientEvent("ps-camera:getStreetName", source, url, coords)
end)

RegisterNetEvent("ps-camera:savePhoto", function(url, streetName)
    local source = source
    local player = exports.qbx_core:GetPlayer(source)
    if not player then return end

    local location = streetName

    local info = {
        ps_image = url,
        location = location
    }

    local ox_inventory = exports.ox_inventory

    if not ox_inventory:CanCarryItem(source, 'photo', 1) then
        return TriggerClientEvent('ox_lib:notify', source, { description = "Can not carry photo!", type = "error" })
    end

    ox_inventory:AddItem(source, "photo", 1, info)
end)


exports.qbx_core:CreateUseableItem("camera", function(source, item)
    local source = source

    if Config.UseFivemanage == false then
        if not SvConfig.webhook or SvConfig.webhook == nil or SvConfig.webhook == "" then
            print("^1[Error] A webhook is missing in: SvConfig.webhook")
            return;
        end
    else
        if not SvConfig.FivemanageApiToken or SvConfig.FivemanageApiToken == '' then
            return print("^1[Error] A webhook is missing in: SvConfig.FivemanageApiToken")
        end
    end

    local ox_inventory = exports.ox_inventory
    if ox_inventory:GetItem(source, item.name, nil, true) > 0 then
        TriggerClientEvent("ps-camera:useCamera", source)
    end
end)

exports.qbx_core:CreateUseableItem("photo", function(source, item)
    local source = source

    local ox_inventory = exports.ox_inventory
    if ox_inventory:GetItem(source, item.name, nil, true) > 0 then
        TriggerClientEvent("ps-camera:usePhoto", source, item.metadata.ps_image, item.metadata.location)
    end
end)

function UseCam(source)
    local source = source

    if not SvConfig.webhook or SvConfig.webhook == nil or SvConfig.webhook == "" then
        print("^1[Error] A webhook is missing in: SvConfig.webhook")
        return;
    end

    local ox_inventory = exports.ox_inventory
    if ox_inventory:GetItem(source, 'dslrcamera', nil, true) > 0 then
        TriggerClientEvent("ps-camera:useCamera", source)
    else
        TriggerClientEvent('ox_lib:notify', source, { description = "U don\'t have a camera", type = "error" })
    end
end

exports("UseCam", UseCam)
