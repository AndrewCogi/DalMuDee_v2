-- lazy.nvim plugin manager 자동 설치
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
   vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
   })
end
vim.opt.rtp:prepend(lazypath)

-- lazy 세팅 전, globals, options 설정 먼저 적용
require("config.globals")
require("config.options")

-- plugins 폴더 내에 있는 모든 플러그인 설치
local plugins = "plugins"
require("lazy").setup(plugins)

-- keymaps 설정 적용
require("config.keymaps")