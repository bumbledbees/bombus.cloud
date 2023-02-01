#!/bin/bash
if cabal run; then
    for f in build/*.html; do
        tidy \
            -ashtml \
            -utf8 \
            -indent \
            -modify \
            --quiet yes \
            --indent-spaces 4 \
            --tidy-mark no \
            --sort-attributes alpha \
            --wrap 80 \
            $f
    done
    for f in build/*.css; do
        # put the lbrace on the same line as the selector
        sed -i -z 's/\(\S*\)\n{/\1 {/g' $f
    done
fi
