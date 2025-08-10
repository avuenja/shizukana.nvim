-- Default entry point - loads the configured style

vim.g.shizukana_variant = vim.g.shizukana_variant or "moon"
require("shizukana")._load(vim.g.shizukana_variant)
