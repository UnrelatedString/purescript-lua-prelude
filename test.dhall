let normal = ./spago.dhall
in  normal //
    { backend = ''
    pslua \
    --foreign-path . \
    --lua-output-file output/test.lua \
    --entry Test.Main
    ''
    }
