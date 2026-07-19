--- Only auto-pair quotes after whitespace/brackets, not after a word.
return {
  "nvim-mini/mini.pairs",
  opts = {
    mappings = {
      ['"'] = {
        action = "closeopen",
        pair = '""',
        neigh_pattern = "[%s<(%[{][%s>)%]},:]",
        register = { cr = false },
      },
      ["'"] = {
        action = "closeopen",
        pair = "''",
        neigh_pattern = "[%s<(%[{][%s>)%]},:]",
        register = { cr = false },
      },
      ["`"] = {
        action = "closeopen",
        pair = "``",
        neigh_pattern = "[%s<(%[{][%s>)%]},:]",
        register = { cr = false },
      },
    },
  },
}
