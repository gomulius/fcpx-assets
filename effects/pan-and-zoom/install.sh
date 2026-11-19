#!/bin/bash
# Install the supplied native Motion effect; never operate Final Cut's UI.
set -eu
HERE="$(cd "$(dirname "$0")" && pwd)"
NAME='PM5 Pan and Zoom'
SOURCE="$HERE/$NAME"
CATEGORY="$HOME/Movies/Motion Templates.localized/Effects.localized/Photo Motion Lab"
DEST="$CATEGORY/$NAME"

if pgrep -f '^/Applications/Final Cut Pro.app/Contents/MacOS/Final Cut Pro$' >/dev/null; then
  echo 'Quit Final Cut Pro normally before installing this effect.' >&2
  exit 1
fi
if [ ! -f "$SOURCE/$NAME.moef" ]; then
  echo 'Template missing: keep install.sh beside the PM5 Pan and Zoom folder.' >&2
  exit 1
fi
if [ -e "$DEST" ]; then
  echo "Already installed: $DEST" >&2
  echo 'Move the existing effect folder outside Motion Templates as a backup first.' >&2
  exit 1
fi
mkdir -p "$CATEGORY"
# mkdir refuses an existing destination, including one created concurrently.
mkdir "$DEST"
if ! cp "$SOURCE/$NAME.moef" "$DEST/$NAME.moef"; then
  echo "Copy failed. Inspect the incomplete installation at: $DEST" >&2
  exit 1
fi
cmp "$SOURCE/$NAME.moef" "$DEST/$NAME.moef"
echo "Installed: $DEST"
echo 'Open Final Cut Pro, open Effects (Command-5), and search for PM5.'
