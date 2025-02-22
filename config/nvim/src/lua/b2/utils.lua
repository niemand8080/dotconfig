local M = {}

M.getByPartialKey = function(t, key)
    for k, v in pairs(t) do
        if type(k) == "table" then
            for _, v2 in ipairs(k) do
                if v2 == key then
                    return v
                end
            end
        end
    end
    return nil
end

return M
