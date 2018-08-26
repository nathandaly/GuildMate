local _G = _G 	--Rumors say that global _G is called by lookup in a super-global table. Have no idea whether it is true.
local _

GuildMate = LibStub("AceAddon-3.0"):NewAddon("GuildMate", "AceEvent-3.0", "AceConsole-3.0")

-- Called when the addon is loaded
function GuildMate:OnInitialize()
    self:RegisterEvent("PLAYER_ENTERING_WORLD")
    self:RegisterEvent("GUILD_ROSTER_UPDATE")
    local GM_UIParent = _G["UIParent"]

    GM_UIParent:SetScript('OnUpdate', function (self)
        local GM_CommunitiesFrame = _G["CommunitiesFrame"]
        if GM_CommunitiesFrame ~= nil then
            GM_CommunitiesFrame.GuildMemberDetailFrame:SetScript('OnShow' , function(self)
                    if self:IsVisible() and IsShiftKeyDown() then
                        GuildMate:GetPlayerInfo(self)
                        self:Hide()
                    end
                end
            )
        end
    end
    )
end

-- Called when the addon is enabled
function GuildMate:OnEnable()
end

-- Called when the addon is disabled
function GuildMate:OnDisable()
end

function GuildMate:PLAYER_ENTERING_WORLD()
    numGuildMembers, numOnline, numOnlineAndMobile = GetNumGuildMembers()
    self:Print("Members: |cffff8000" .. numGuildMembers .. "|r. Online: |cffff8000" .. numOnline .."|r")
end

function GuildMate:GUILD_ROSTER_UPDATE()

end

function GuildMate:GetPlayerInfo(player)
    print(GetPlayerInfoByGUID(player:GetMemberInfo().guid))
end

function RegisterKeyCombos()
    keys = {
        shift = IsShiftKeyDown(),
        control = IsControlKeyDown(),
        alt = IsAltKeyDown(),
    }
end