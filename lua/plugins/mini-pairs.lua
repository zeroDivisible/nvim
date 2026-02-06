--- This is done to help with pairing " after a word
--- Without this, typing 'foo bar baz<cursor>"' would have opened both opening
--- and closing quote, which is not what I want.
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
