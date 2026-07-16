return {
  "norcalli/nvim-colorizer.lua",
  config = function ()
    require("colorize").setup({
      "*", css = {rgb_fn = true},
    })
  end,
}
