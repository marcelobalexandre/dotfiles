-- https://github.com/ThePrimeagen/harpoon
return {
  "ThePrimeagen/harpoon",
  keys = {
    { "<leader>a", '<cmd>lua require("harpoon.mark").add_file()<CR>' },
    { "<C-e>", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>' },
    { "<leader>1", '<cmd>lua require("harpoon.ui").nav_file(1)<CR>' },
    { "<leader>2", '<cmd>lua require("harpoon.ui").nav_file(2)<CR>' },
    { "<leader>3", '<cmd>lua require("harpoon.ui").nav_file(3)<CR>' },
    { "<leader>4", '<cmd>lua require("harpoon.ui").nav_file(4)<CR>' },
  },
}
