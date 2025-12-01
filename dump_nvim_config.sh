#!/bin/bash

# Where your Neovim config lives
NVIM_CONFIG="${HOME}/.config/nvim"

OUTPUT="nvim_config_dump.txt"

echo "Dumping Neovim config from: $NVIM_CONFIG"
echo "Output -> $OUTPUT"
echo "======================================="

# Start fresh
echo "=== Neovim Config Dump ===" > "$OUTPUT"
echo "Generated: $(date)" >> "$OUTPUT"
echo "" >> "$OUTPUT"

###############################
# 1. Directory Structure
###############################
echo "=== Directory Tree ===" >> "$OUTPUT"
tree "$NVIM_CONFIG" -a --noreport >> "$OUTPUT" 2>/dev/null
echo "" >> "$OUTPUT"

###############################
# 2. Important Entry Files
###############################
FILES_TO_DUMP=(
  "init.lua"
  "lua/config/lazy.lua"
  "lua/config/options.lua"
  "lua/config/keymaps.lua"
)

echo "=== Important Config Files ===" >> "$OUTPUT"

for FILE in "${FILES_TO_DUMP[@]}"; do
  FULL="$NVIM_CONFIG/$FILE"
  if [[ -f "$FULL" ]]; then
    echo "--- $FILE ---" >> "$OUTPUT"
    cat "$FULL" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
  fi
done

###############################
# 3. Dump All Plugin Files
###############################
echo "=== Plugin Files (lua/plugins/*.lua) ===" >> "$OUTPUT"

PLUGIN_DIR="$NVIM_CONFIG/lua/plugins"

if [[ -d "$PLUGIN_DIR" ]]; then
  for p in "$PLUGIN_DIR"/*.lua; do
    echo "--- lua/plugins/$(basename "$p") ---" >> "$OUTPUT"
    cat "$p" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
  done
else
  echo "(No plugin directory found)" >> "$OUTPUT"
fi

###############################
# Done
###############################
echo "=== COMPLETE ===" >> "$OUTPUT"
echo "Neovim config dumped to $OUTPUT"
