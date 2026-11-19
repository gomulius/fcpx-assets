# Pan and Zoom

A lightweight native **Final Cut Pro effect** for adding gentle motion to still images. Drag it onto a photo, then set horizontal movement, vertical movement, and zoom in the Video inspector. No manual per-photo keyframes or compiled plug-in installation are required.

The installed name is **PM5 Pan and Zoom**, under **Photo Motion Lab**. These names are intentionally preserved from the working version so existing projects can continue to find it. PM3 and PM4 were development tests and are not included.

## Requirements and verification

- macOS and Final Cut Pro with native Motion-effect support.
- Created using a Motion 6.3 template and Apple's native Move and Grow/Shrink behaviors.
- Pan and zoom were manually confirmed working by the user in Final Cut Pro on macOS 26.5.2. Older releases have not been tested.
- Apple Motion is not required for normal installation/use of the supplied effect; it is needed to edit the template visually.
- No downloaded fonts, photo files, third-party effects, or runtime dependencies are included or required.

The template retains an internal 4K project-preset reference used during authoring. You do not need to create that path or install Motion just to use the effect.

## Install manually (Finder)

1. Download this repository using **Code → Download ZIP**, and double-click the downloaded ZIP to extract it.
2. Quit Final Cut Pro normally (**Final Cut Pro → Quit Final Cut Pro**, or **Command–Q**).
3. Open **Finder → Go → Go to Folder…** (**Shift–Command–G**).
4. Paste this exact path and press Return:

   ```text
   ~/Movies/Motion Templates.localized/Effects.localized/
   ```

5. If Finder cannot find it, open `~/Movies/` instead. Create a folder named `Motion Templates.localized`, open it, then create `Effects.localized` inside it. Finder may hide the `.localized` suffixes when displaying folder names; this is normal. Do not create duplicate folders if they already exist.
6. Inside `Effects.localized`, create a folder named **Photo Motion Lab** if it does not already exist.
7. In the extracted repository, open **effects → pan-and-zoom**. Copy the entire **PM5 Pan and Zoom** folder into **Photo Motion Lab**. Copy the folder, not just its `.moef` file.
8. If the effect is already installed, move the existing **PM5 Pan and Zoom** folder somewhere outside Motion Templates as a backup before copying the replacement.
9. Reopen Final Cut Pro. Open **Window → Go To → Effects** (**Command–5**), then search for **PM5** or select **Photo Motion Lab**.

The exact final file location must be:

```text
~/Movies/Motion Templates.localized/Effects.localized/Photo Motion Lab/PM5 Pan and Zoom/PM5 Pan and Zoom.moef
```

Do not rename the category, effect folder, or file: existing projects may otherwise report a missing effect.

## Install using Terminal (optional)

From Terminal, type `cd ` (including the space), drag this **pan-and-zoom** folder from Finder into Terminal, and press Return. Then run:

```bash
bash install.sh
```

The installer refuses to proceed while Final Cut Pro is running and refuses to overwrite an existing effect. No `sudo` is needed. For an update, back up the existing effect as described above first. The installer only copies the supplied template; it does not operate Final Cut's interface or change your library.

## Use

1. Select a photo in your timeline.
2. Drag **PM5 Pan and Zoom** from Effects onto that photo.
3. Open the **Video inspector** (**Command–4** if the inspector is hidden).
4. Adjust the controls in the effect section, then play the clip.

| Control | Purpose |
| --- | --- |
| **Horizontal Travel (pixels)** | Positive moves right; negative moves left; zero disables horizontal travel. |
| **Vertical Travel (pixels)** | Signed vertical travel. Reverse the sign to reverse direction; zero disables vertical travel. Positive is intended as up in Motion coordinates. |
| **Zoom Change** | Positive zooms in; negative zooms out; zero disables animated zoom. Use the combined control, or keep X and Y equal if expanded, to preserve proportions. |

The default combines a small horizontal pan with zoom in. For **zoom only**, set both Travel controls to `0`. For **pan only**, set Zoom Change to `0`. Combine all three for diagonal pan plus zoom.

Travel uses design pixels on a 3840 × 2160 canvas; it is not necessarily the exact pixel displacement in your output resolution. The initial scale is fixed at **110%** to provide an edge margin. The authored zoom change is **+5 percentage points**; percentage-style controls commonly display this as `5`, while raw numeric representations may use `0.05`. Reverse the sign of the displayed value for zoom out.

### Starting points

- Horizontal pan: Horizontal `80` or `-80`, Vertical `0`, Zoom `0`.
- Vertical pan: Horizontal `0`, Vertical `60` or `-60`, Zoom `0`.
- Gentle zoom in/out: both Travel controls `0`; use the default Zoom Change or its negative.

Use only one instance of the effect while testing. Applying it on top of PM3/PM4 or another transform effect stacks the transformations.

## Duration and image edges

The behaviors are authored over the template's full duration, with zoom in **Ramp to Final Value** mode rather than a continuous per-second rate. The project does not force the clip to the template's duration. Always preview the full movement after changing a photo's duration; a comprehensive range of clip lengths and frame rates has not been tested.

Large travel amounts or negative zoom can expose empty edges, especially when combined. Reduce travel/shrink, adjust the photo's framing, and preview the full clip. The fixed 110% starting scale intentionally crops a small amount of the image. It does not automatically detect faces or choose framing.

## Remove or reinstall

1. Quit Final Cut Pro.
2. In Finder, open the exact installation path above.
3. Move the **PM5 Pan and Zoom** folder out of **Photo Motion Lab** into a backup folder outside Motion Templates.
4. Reopen Final Cut Pro.

This removes the effect from the browser without deleting your media or project. Projects that use it may show a missing-effect warning until you reinstall it at the same path. To reinstall, repeat the installation steps.

## Troubleshooting

- **Effect not listed:** check the exact folder structure, avoid accidentally nesting the effect folder twice, and restart Final Cut Pro.
- **Image distorted:** keep zoom's X and Y values equal or use its combined control.
- **Unexpected movement:** remove stacked motion effects or disable Ken Burns while testing.
- **Crash after installation:** quit Final Cut, move this effect folder out of Motion Templates, then reopen. Preserve the macOS crash report for diagnosis. Do not reinstall older experimental templates.

## Template provenance

This asset uses a clean Motion-authored effect template with Apple's native Move and Grow/Shrink behaviors. It contains no rig-link or parameter-reference behaviors from the withdrawn early prototype. The packaged `.moef` is byte-for-byte identical to the PM5 version manually confirmed by the user; its embedded description still contains pre-validation wording from development.
