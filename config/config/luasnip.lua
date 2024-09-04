local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node

ls.add_snippets("python", {
  s("printf", {
    t("print(f'"),
    i(1),
    t("')"),
  }),
  s("printn", {
    t("print('"),
    i(1),
    t({ "', end='\\n\\n')" }),
  }),
  s("getter", {
    t("@property"),
    t({ "", "def " }),
    i(1, "variable"),
    t("(self):"),
    t({ "", "    return self._" }),
    f(function(args)
      return args[1][1]
    end, { 1 }),
  }),
  s("setter", {
    t({ "@" }),
    f(function(args)
      return args[1][1] .. ".setter"
    end, { 1 }),
    t({ "", "def " }),
    i(1, "variable"),
    t("(self, "),
    f(function(args)
      return args[1][1] .. "):"
    end, { 1 }),
    c(2, { -- Nodo de elección para las dos variantes
      t({ "", "    self._" }), -- Variante 1
      t({ "", "    self.__" }), -- Variante 2
    }),
    f(function(args)
      return args[1][1]
    end, { 1 }),
    t(" = "),
    f(function(args)
      return args[1][1]
    end, { 1 }),
  }),
  s("setter", {
    t({ "@" }),
    f(function(args)
      return args[1][1] .. ".setter"
    end, { 1 }),
    t({ "", "def " }),
    i(1, "variable"),
    t("(self, "),
    f(function(args)
      return args[1][1] .. "):"
    end, { 1 }),
    t({ "", "    self._" }),
    f(function(args)
      return args[1][1]
    end, { 1 }),
    t(" = "),
    f(function(args)
      return args[1][1]
    end, { 1 }),
  }),
})
