return {
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "Gvdiffsplit", "Gread", "Gwrite", "GMove", "GDelete", "GBrowse" },
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    "tpope/vim-rhubarb",
    dependencies = { "tpope/vim-fugitive" },
  },
}
