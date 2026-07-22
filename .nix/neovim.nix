{
  lib,
  pkgs,
  ...
}: {
  config.vim = {
    viAlias = false;
    vimAlias = false;
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    # Core Utilities
    statusline.lualine.enable = true;
    filetree.neo-tree = {
      enable = true;
      setupOpts.filesystem.filtered_items.visible = true;
    };

    telescope = {
      enable = true;
    };

    terminal.toggleterm = {
      enable = true;
    };

    binds.whichKey.enable = true;

    git.enable = true;

    autocomplete.blink-cmp = {
      enable = true;
      setupOpts = {
        signature.enabled = true;
      };
    };

    # Language
    lsp = {
      enable = true;
      formatOnSave = true;
      inlayHints.enable = true;
      lspkind.enable = true;
    };

    languages = {
      enableTreesitter = true;
      enableFormat = true;
      html.enable = true;
      css.enable = true;
      typescript.enable = true;
    };

    extraPackages = with pkgs; [tree-sitter ripgrep fd];

    # Keymaps
    keymaps = [
      # File Explorer
      {
        key = "<leader>e";
        mode = "n";
        action = ":Neotree toggle<CR>";
        desc = "Toggle Explorer";
      }
      # Telescope
      {
        key = "<leader>ff";
        mode = "n";
        action = ":Telescope find_files<CR>";
        desc = "Find Files";
      }
      {
        key = "<leader>fw";
        mode = "n";
        action = ":Telescope live_grep<CR>";
        desc = "Live Grep (Words)";
      }
      {
        key = "<leader>fb";
        mode = "n";
        action = ":Telescope buffers<CR>";
        desc = "Find Buffers";
      }
      {
        key = "<leader>fh";
        mode = "n";
        action = ":Telescope help_tags<CR>";
        desc = "Help Tags";
      }
      # Terminal
      {
        key = "<leader>t";
        mode = "n";
        action = ":ToggleTerm<CR>";
        desc = "Toggle Term Floating Terminal";
      }
      {
        key = "<Esc>";
        mode = "t";
        action = "<C-\\><C-n>";
        desc = "Exit Terminal Mode";
      }
      {
        key = "<leader>th";
        mode = "n";
        action = ":ToggleTerm direction=horizontal<CR>";
        desc = "Toggle Horizontal Terminal";
      }
      {
        key = "<leader>sl"; # "Server Logs"
        mode = "n";
        action = ":99ToggleTerm<CR>";
        desc = "Toggle Live-Server Logs";
      }
    ];

    luaConfigPost = ''
      -- Create an autocommand in pure Lua
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          -- Delay slightly to ensure the UI and ToggleTerm are fully loaded
          vim.defer_fn(function()
            -- Run live-server in a hidden toggleterm (id=99)
            -- We use the ToggleTerm lua API directly
            require("toggleterm").exec("live-server --port=3000 ./root", 99)

            vim.notify("Live Server started on port 8080", vim.log.levels.INFO)
          end, 100)
        end,
      })
    '';
  };
}
