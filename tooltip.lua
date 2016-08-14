
local myname, ns = ...

local function addStatsToTooltip(tip, spec, stats)
	local title = stats.title
	if title then
		tip:AddLine(spec.." ("..title..")")
	else
		tip:AddLine(spec)
	end
	for _,stat in ipairs(stats) do
		tip:AddLine(stat, 1,1,1)
	end
end

function ns.dataobj.OnTooltipShow(tip)
	tip:AddLine("picoPriorities")

	local num = GetNumSpecializations()
	if num then
		for i=1,num do
			local specID, spec = GetSpecializationInfo(i)
			local priorities = ns.priorities[specID]
			if type(priorities[1]) ~= "table" then
				tip:AddLine(" ")
				addStatsToTooltip(tip, spec, priorities)
			else
				for _,stats in ipairs(priorities) do
					tip:AddLine(" ")
					addStatsToTooltip(tip, spec, stats)
				end
			end
		end
	else
		tip:AddLine(" ")
		tip:AddLine("Unable to determine talent spec")
	end
end
