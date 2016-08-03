
local myname, ns = ...


function ns.dataobj.OnTooltipShow(tip)
	tip:AddLine("picoPriorities")

	local num = GetNumSpecializations()
	if num then
		for i=1,num do
			local specID, spec = GetSpecializationInfo(i)
			tip:AddLine(" ")
			tip:AddLine(spec)
			for j,stat in pairs(ns.priorities[specID]) do
				tip:AddLine(stat, 1,1,1)
			end
		end
	else
		tip:AddLine(" ")
		tip:AddLine("Unable to determine talent spec")
	end
end
