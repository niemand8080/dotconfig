vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>pv", function()
    if vim.g.loaded_netrw == 1 then
        require('nvim-tree.api').tree.open()
    else
        vim.cmd.Ex()
    end
end)

vim.keymap.set("n", "<leader>r", function()
    local key = vim.fn.getcharstr()
    local filetype = vim.bo.filetype
    local in_tmux = string.gsub(vim.fn.system("echo $TERM_PROGRAM"), "%s+", "") == "tmux"

    local run_command
    local test_command
    local build_command
    local custom_command_preset = ""

    if filetype == "rust" then
        run_command = "cargo run"
        test_command = "cargo test"
        build_command = "cargo build"
        custom_command_preset = "cargo "
    -- elseif util.contains({ "javascript", "typescript" }, filetype) then
    --     run_command = "pnpm run dev"
    --     test_command = "pnpm run test"
    --     build_command = "pnpm run build"
    end

    local command -- The command that will be executed

    if key == "r" then
        if run_command then
            command = run_command
        else
            print(string.format("No run command found for file of tipe %s!", filetype))
        end
    elseif key == "t" then
        if test_command then
            command = test_command
        else
            print(string.format("No test command found for file type %s!", filetype))
        end
    elseif key == "b" then
        if build_command then
            command = build_command
        else
            print(string.format("No build command found for file type %s!", filetype))
        end
    elseif key == "c" then
        local custom_command = vim.fn.input("Custom command: ", custom_command_preset)
        if custom_command then
            command = custom_command
        else
            return
        end
    else
        print(string.format("No action for key (%s) found!", key))
        return
    end

    if not command then
        return
    end

    if in_tmux then
        local pane_id = vim.fn.system("tmux split-window -h -P -F '#{pane_id}'"):gsub("%s+", "")
        if pane_id and pane_id ~= "" then
            vim.fn.system(string.format('tmux resize-pane -Z'))
            vim.fn.system(string.format(
                'tmux send-keys -t %s "%s; echo Press Enter to close...; read; tmux kill-pane" Enter',
                pane_id, command
            ))
        else
            print("Failed to create a pane...")
        end
    else
        vim.cmd(string.format("term bash -c '%s; echo Press Enter to close...; read'", command))
    end
end)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")     -- down
vim.keymap.set("n", "<C-u>", "<C-u>zz")     -- up
vim.keymap.set("n", "<C-ö>", "20zh")        -- left
vim.keymap.set("n", "<C-ü>", "20zl")        -- right

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+y$")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
