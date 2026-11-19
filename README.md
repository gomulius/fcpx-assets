# FCPX Assets

A collection of reusable assets for **Final Cut Pro** (also known as FCPX): effects, titles, transitions, generators, and other editing tools as the collection grows.

Each asset lives in its own folder with its template files, requirements, usage notes, and installation instructions. Install only the assets you want; there is no repository-wide installer.

## Available assets

| Asset | Type | Description |
| --- | --- | --- |
| [Pan and Zoom](effects/pan-and-zoom/) | Effect | Gentle horizontal/vertical movement and zoom for still photos, with inspector controls and no manual per-photo keyframes. |

Pan and Zoom is the first asset in this collection. Additional assets can be added independently under the appropriate asset-type directory.

## Downloading and installing

Download the repository using **Code → Download ZIP**, then extract it, or clone it:

```bash
git clone https://github.com/gomulius/fcpx-assets.git
```

Follow the README inside the asset's folder. Native Motion templates are normally installed in the relevant category under `~/Movies/Motion Templates.localized/`. Keep template folder names intact: projects use their installation paths to locate effects.

Before installing or updating an asset, quit Final Cut Pro normally and keep a backup of any existing version. Test unfamiliar assets in a disposable project before using them in an important edit.

## Compatibility

Requirements and verification status are documented per asset. A template tested on one Final Cut Pro/macOS version is not a guarantee of compatibility with every release. Apple Motion is useful for editing native templates; individual assets specify whether it is needed for installation or use.

## Repository layout

```text
effects/
  pan-and-zoom/
    README.md
    install.sh
    PM5 Pan and Zoom/
      PM5 Pan and Zoom.moef
```

Future asset folders should include a README describing their purpose, controls, requirements, installation, removal, and known limitations.
