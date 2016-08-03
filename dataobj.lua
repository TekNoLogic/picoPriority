
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
		ns.dataobj.text = ns.priorities[specID][1]
	else
		ns.dataobj.text = "???"
	end
end
ns.RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
ns.OnLogin = ns.ACTIVE_TALENT_GROUP_CHANGED
