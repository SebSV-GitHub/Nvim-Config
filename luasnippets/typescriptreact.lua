local function returnNodeFunction(args)
	return "\t\treturn <div>" .. args[1][1] .. "</div>"
end

local function exportNodeFunction(args)
	return "export default " .. args[1][1]
end

return {
	s("fnc", {
		t({ 'import React from "react"', "" }),
		t({ "", "function " }),
		i(1, "Component"),
		t({ "() {", "" }),
		i(0),
		f(returnNodeFunction, { 1 }),
		t({ "", "}", "", "" }),
		f(exportNodeFunction, { 1 }),
	}),
}
