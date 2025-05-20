-- Print a message to confirm the LaTeX configuration is loaded
print("LaTeX configuration loaded successfully")

-- Configure Neovim to use spaces instead of tabs for LaTeX files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "tex",
    callback = function()
        print("LaTeX FileType detected") -- Diagnostic message
        vim.bo.expandtab = true  -- Use spaces instead of tabs
        vim.bo.shiftwidth = 2    -- Number of spaces for each indentation level
        vim.bo.softtabstop = 2   -- Number of spaces per Tab key press
        print("Buffer options set: expandtab=" .. tostring(vim.bo.expandtab) ..
              ", shiftwidth=" .. vim.bo.shiftwidth ..
              ", softtabstop=" .. vim.bo.softtabstop) -- Confirm buffer options
    end,
})