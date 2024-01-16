return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    config = function()
      local builtin = require('telescope.builtin')
      local telescope = require("telescope")
      local telescopeConfig = require("telescope.config")
      -- Clone the default Telescope configuration
      local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

      -- I want to search in hidden/dot files.
      table.insert(vimgrep_arguments, "--hidden")
      -- I don't want to search in the `.git` directory.
      table.insert(vimgrep_arguments, "--glob")
      table.insert(vimgrep_arguments, "!**/.git/*")

      telescope.setup({
        defaults = {
          -- `hidden = true` is not supported in text grep commands.
          vimgrep_arguments = vimgrep_arguments,
        },
        pickers = {
          find_files = {
            -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
          },
        },
      })

      vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
      vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
      vim.keymap.set('n', '<leader>ps', function()
        builtin.grep_string({ search = vim.fn.input("Grep >") })
      end)
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      local telescope = require('telescope')
      local themes = require('telescope.themes')

      telescope.setup({
        extensions = {
          ["ui-select"] = {
            themes.get_dropdown {}
          }
        }
      })
      telescope.load_extension("ui-select")
    end
  },
  {
    "ThePrimeagen/harpoon",
    config = function()
      local harpoon = require("harpoon")
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      harpoon.setup({
        -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
        save_on_toggle = true,

        -- saves the harpoon file upon every change. disabling is unrecommended.
        save_on_change = true,

        -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
        enter_on_sendcmd = false,

        -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
        tmux_autoclose_windows = false,

        -- filetypes that you want to prevent from adding to the harpoon list menu.
        excluded_filetypes = { "harpoon" },

        -- set marks specific to each git branch inside git repository
        mark_branch = true,

        -- enable tabline with harpoon marks
        tabline = false,
      })
      vim.keymap.set("n", "<Leader>hm", ui.toggle_quick_menu)
      vim.keymap.set("n", "<Leader>ha", mark.add_file)
      vim.keymap.set("n", "<Leader>hn", ui.nav_next)
      vim.keymap.set("n", "<Leader>hp", ui.nav_prev)
    end,
  }
}
