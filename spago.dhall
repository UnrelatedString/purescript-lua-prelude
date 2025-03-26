{ name = "purescript-lua-prelude"
, dependencies = [ ] : List Text
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
, backend = "pslua --foreign-path . --lua-output-file output/main.lua"
}
