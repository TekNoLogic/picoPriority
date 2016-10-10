
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
		local stat1 = priorities[1]
		local stat2 = priorities[2]
		if type(stat1) == "table" then
			stat1 = stat1[1]
			stat2 = stat1[2]
		end
		if stat2 then
			ns.dataobj.text = stat1.. ", ".. stat2
		else
			ns.dataobj.text = stat1
		end
	else
		ns.dataobj.text = "???"
	end
end
ns.RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
ns.OnLogin = ns.ACTIVE_TALENT_GROUP_CHANGED
