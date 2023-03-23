require("bufferline").setup{
    options = {
      numbers = "buffer_id",
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          text_align = "left",
          separator = true
        }
      }
    }
  }