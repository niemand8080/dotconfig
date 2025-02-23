local util = require("b2.utils")

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>pv", function() vim.cmd.Ex() end)

vim.keymap.set("n", "<leader>r", function()
    local key = vim.fn.getcharstr()
    local filetype = vim.bo.filetype
    local in_tmux = string.gsub(vim.fn.system("echo $TERM_PROGRAM"), "%s+", "") == "tmux"

    -- If you add the "{input}" string any where in the command, it will prompt
    -- you to enter a command (with the default value you set the command to)
    -- It will also replce the "{input}" string...
    local config = {
        [{ "rust" }] = {
            r = "cargo run",         -- run command
            b = "cargo build",       -- build command
            t = "cargo test",        -- test command
            c = "cargo {input}",     -- default preset
            i = "cargo add {input}", -- install preset
        }
    }

    local commands = util.getByPartialKey(config, filetype)

    if not commands then
        print(string.format("No commands for file type %s found!", filetype))
        return
    end

    local command = commands[key]

    if not command then
        print(string.format('No action for key "%s" found!', key))
        return
    elseif string.find(command, "{input}") then
        command = vim.fn.input({ prompt = "Change Command Preset: ", default = string.gsub(command, "{input}", "") })
    end

    if in_tmux then
        local pane_id = vim.fn.system("tmux split-window -h -P -F '#{pane_id}'"):gsub("%s+", "")
        if pane_id and pane_id ~= "" then
            vim.fn.system(string.format('tmux resize-pane -Z'))
            vim.fn.system(string.format(
                'tmux send-keys -t %s "%s ; echo Press Enter to close...; read; tmux kill-pane" Enter',
                pane_id, command
            ))
        else
            print("Failed to create a pane...")
        end
    else
        vim.cmd(string.format("term bash -c '%s ; echo Press Enter to close...; read'", command))
    end
end)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- better indent
vim.keymap.set("v", "<", "<gv4h")
vim.keymap.set("v", ">", ">gv4l")

-- Scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- down
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- up
vim.keymap.set("n", "<C-ö>", "20zh")    -- left
vim.keymap.set("n", "<C-ü>", "20zl")    -- right

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+y$")
vim.keymap.set("v", "<leader>y", "\"+y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("n", "<leader>D", "\"+d$")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "<leader>c", "\"_c")
vim.keymap.set("n", "<leader>C", "\"+c$")
vim.keymap.set("v", "<leader>c", "\"_c")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
