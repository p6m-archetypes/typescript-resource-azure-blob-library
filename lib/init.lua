-- typescript-resource-azure-blob-library main module.
-- Renders Azure Blob Storage client module.
--
-- The calling archetype is responsible for adding the corresponding
-- pnpm dependency to package.json:
--   @azure/storage-blob
--
-- API:
--   local azure = require("typescript-resource-azure-blob")
--   azure.render(context, { destination = context:get("project-name") })

local M = {}

function M.render(context, opts)
    opts = opts or {}
    local d = opts.destination
    if d and d ~= "" then
        directory.render("contents", context, { destination = d })
    else
        directory.render("contents", context)
    end
    return context
end

return M
