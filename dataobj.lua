
local myname, ns = ...


local vals = {
	type = "data source",
	text = "???",
	icon = "Interface\\Icons\\Ability_iyyokuk_calculate",
}
ns.dataobj = LibStub("LibDataBroker-1.1"):NewDataObject("picoPriority", vals)


function ns.ACTIVE_TALENT_GROUP_CHANGED()
	local specIndex = GetSpecialization()
	if specIndex then
		local specID = GetSpecializationInfo(specIndex)
		local priorities = ns.priorities[specID]
		local stat = priorities[1]
		if type(stat) == "table" then
			stat = stat[1]
		end
		ns.dataobj.text = stat
	else
		ns.dataobj.text = "???"
	end
end
ns.RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
ns.OnLogin = ns.ACTIVE_TALENT_GROUP_CHANGED
