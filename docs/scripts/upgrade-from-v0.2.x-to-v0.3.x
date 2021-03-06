#!/bin/bash

# Upgrade inventory variables for migration from debops.apt v0.1.x to v0.2.x.
# The script is idempotent.

git ls-files -z | xargs --null -I '{}' find '{}' -type f -print0 \
    | xargs --null sed --in-place --regexp-extended '
        s/apt__proxy_url:(.*)http:(.*)/apt__http_proxy_url:\1http:\2/g;
        s/apt__proxy_url:(.*)https:(.*)/apt__https_proxy_url:\1https:\2/g;
    '
