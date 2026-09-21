-- Treesitter -- native (Neovim 0.12) setup.
--
-- Neovim 0.12 provides treesitter highlighting, folding and incremental
-- selection in core, so nvim-treesitter no longer needs to drive any of
-- that. It is kept ONLY as a parser/query installer, which is what its
-- `main` branch does -- the old `master`-branch `nvim-treesitter.configs`
-- module system is gone.

return {
  -- Parser / query installer for Neovim's native treesitter.
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local TS = require("nvim-treesitter")
      TS.setup()

      -- Parsers to keep installed (the old `ensure_installed` list).
      local ensure = {
        "bash", "bibtex", "c", "cmake", "cuda", "go", "html", "java",
        "json", "latex", "lua", "markdown", "markdown_inline", "passwd",
        "python", "query", "rust", "ssh_config", "strace", "tiger",
        -- `verilog` was renamed upstream; Neovim maps ft=verilog to this lang
        "systemverilog", "vim", "vimdoc",
      }
      local available = TS.get_available()
      TS.install(vim.tbl_filter(function(lang)
        return vim.list_contains(available, lang)
      end, ensure))

      -- Turn on native highlighting for a buffer, installing the parser on
      -- demand if it is missing (the old `auto_install = true`).
      local function enable(buf, filetype)
        local lang = vim.treesitter.language.get_lang(filetype) or filetype
        local ok, loaded = pcall(vim.treesitter.language.add, lang)
        if ok and loaded then
          vim.treesitter.start(buf, lang)
        elseif vim.list_contains(available, lang) then
          TS.install({ lang }):await(function()
            if vim.api.nvim_buf_is_valid(buf) then
              vim.treesitter.start(buf, lang)
            end
          end)
        end
      end

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("user_treesitter", { clear = true }),
        callback = function(ev)
          enable(ev.buf, ev.match)
        end,
      })

      -- Buffers opened before this plugin finished loading miss the
      -- FileType event above, so enable them explicitly.
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].filetype ~= "" then
          enable(buf, vim.bo[buf].filetype)
        end
      end

      -- Incremental selection
      -- ----------------------------------------------------------------
      -- This is now native (Neovim 0.12), available in visual mode:
      --   an  grow to parent node    (:h v_an)
      --   in  shrink to child node   (:h v_in)
      --   ]n  select next node       (:h v_]n)
      --   [n  select previous node   (:h v_[n)
      -- Your old setup mapped <Leader>ss/si/sc/sd through the (removed)
      -- nvim-treesitter `incremental_selection` module.
    end,
  },

  -- Treesitter text objects (af / if / ac / ic / as).
  -- The `main` branch works directly with Neovim's native treesitter.
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    lazy = false,
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,
          -- Charwise 'v', linewise 'V', or blockwise '<c-v>' per capture.
          selection_modes = {
            ["@parameter.outer"] = "v",
            ["@function.outer"] = "V",
            ["@class.outer"] = "<c-v>",
          },
          -- Extend a textobject to include surrounding whitespace.
          include_surrounding_whitespace = true,
        },
      })

      -- In `main`, the keymaps are defined by you, not the plugin.
      local select = require("nvim-treesitter-textobjects.select").select_textobject
      local function map(key, capture, group, desc)
        vim.keymap.set({ "x", "o" }, key, function()
          select(capture, group)
        end, { desc = desc })
      end
      map("af", "@function.outer", "textobjects", "Select outer function")
      map("if", "@function.inner", "textobjects", "Select inner function")
      map("ac", "@class.outer", "textobjects", "Select outer class")
      map("ic", "@class.inner", "textobjects", "Select inner part of a class region")
      map("as", "@local.scope", "locals", "Select language scope")
    end,
  },
}
