#!/bin/bash
# Starts metos from the stick and opens it in its own window, like an app.
# Used by metos.desktop; can also be run by hand: bash start-linux.sh
cd "$(dirname "$0")" || exit 1
URL=http://127.0.0.1:8080/

running() { (exec 3<>/dev/tcp/127.0.0.1/8080) 2>/dev/null; }

# A second double-click only opens another window.
if ! running; then
  # sh in case the stick lost the file's "executable" mark (FAT, exFAT)
  METOS_NO_BROWSER=1 sh ./metos.com >/dev/null 2>&1 &
  for _ in $(seq 20); do running && break; sleep 0.5; done
fi

# A window with no tabs or address bar, in the first browser that can do it.
for b in brave-browser google-chrome google-chrome-stable chromium chromium-browser microsoft-edge; do
  if command -v "$b" >/dev/null; then exec "$b" --app="$URL"; fi
done
exec xdg-open "$URL"
