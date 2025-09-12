#!/bin/bash

npx @marp-team/marp-cli@latest index.md -o index.html --theme dracula --theme-set ../../../../marp/dracula.css

npx @marp-team/marp-cli@latest questions-1.md -o questions-1.html --theme dracula --theme-set ../../../../marp/dracula.css
