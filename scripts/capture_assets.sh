#!/usr/bin/env bash
# =============================================================================
# Flutter Custom Animations — Visual Asset Capture Workflow
# =============================================================================
#
# PREREQUISITES
#   • Flutter SDK (stable channel)
#   • ffmpeg  ≥ 6.x  (brew install ffmpeg  /  apt install ffmpeg)
#   • macOS screen recorder (QuickTime / Screenshot.app) or OBS for Chrome
#
# RECOMMENDED CAPTURE SETTINGS
#   Resolution : 480 × 850  (portrait phone)
#   Frame rate : 30 fps or 60 fps
#   Format     : .mov (QuickTime) or .mp4 (OBS)
#
# LAUNCH EXAMPLE APP
#   macOS :  cd example && flutter run -d macos
#   Chrome:  cd example && flutter run -d chrome
#
# USAGE
#   chmod +x scripts/capture_assets.sh
#   ./scripts/capture_assets.sh effects      rec_effects.mov
#   ./scripts/capture_assets.sh widgets      rec_widgets.mov
#   ./scripts/capture_assets.sh transitions  rec_transitions.mov
#   ./scripts/capture_assets.sh builders     rec_builders.mov
#
#   Or convert all at once if recordings are named by convention:
#   ./scripts/capture_assets.sh all
# =============================================================================

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Output directories (mirrors gifs/ structure)
OUT_EFFECTS="${REPO_ROOT}/gifs/effects/effects_demo.gif"
OUT_WIDGETS="${REPO_ROOT}/gifs/widgets/widgets_demo.gif"
OUT_TRANSITIONS="${REPO_ROOT}/gifs/transitions/transitions_demo.gif"
OUT_BUILDERS="${REPO_ROOT}/gifs/builders/builders_demo.gif"

# Default recording filenames (when using `all` mode)
REC_EFFECTS="${REPO_ROOT}/rec_effects.mov"
REC_WIDGETS="${REPO_ROOT}/rec_widgets.mov"
REC_TRANSITIONS="${REPO_ROOT}/rec_transitions.mov"
REC_BUILDERS="${REPO_ROOT}/rec_builders.mov"

# ---------------------------------------------------------------------------
# convert_to_gif <input_file> <output_file>
#   High-quality two-pass palette GIF at 480px wide, 30 fps, infinite loop.
# ---------------------------------------------------------------------------
convert_to_gif() {
  local input="$1"
  local output="$2"

  echo "→ Converting '$(basename "$input")' → '$(basename "$output")' ..."

  ffmpeg -i "$input" \
    -vf "fps=30,scale=480:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
    -loop 0 \
    "$output" \
    -y

  echo "  ✓ Saved: ${output}"
}

# ---------------------------------------------------------------------------
# Main dispatch
# ---------------------------------------------------------------------------
MODE="${1:-}"
INPUT="${2:-}"

case "$MODE" in
  effects)
    [[ -z "$INPUT" ]] && { echo "Usage: $0 effects <recording.mov>"; exit 1; }
    convert_to_gif "$INPUT" "$OUT_EFFECTS"
    ;;
  widgets)
    [[ -z "$INPUT" ]] && { echo "Usage: $0 widgets <recording.mov>"; exit 1; }
    convert_to_gif "$INPUT" "$OUT_WIDGETS"
    ;;
  transitions)
    [[ -z "$INPUT" ]] && { echo "Usage: $0 transitions <recording.mov>"; exit 1; }
    convert_to_gif "$INPUT" "$OUT_TRANSITIONS"
    ;;
  builders)
    [[ -z "$INPUT" ]] && { echo "Usage: $0 builders <recording.mov>"; exit 1; }
    convert_to_gif "$INPUT" "$OUT_BUILDERS"
    ;;
  all)
    for pair in \
      "$REC_EFFECTS:$OUT_EFFECTS" \
      "$REC_WIDGETS:$OUT_WIDGETS" \
      "$REC_TRANSITIONS:$OUT_TRANSITIONS" \
      "$REC_BUILDERS:$OUT_BUILDERS"
    do
      src="${pair%%:*}"
      dst="${pair##*:}"
      if [[ -f "$src" ]]; then
        convert_to_gif "$src" "$dst"
      else
        echo "  ⚠  Recording not found, skipping: ${src}"
      fi
    done
    echo ""
    echo "Done. GIFs written to gifs/."
    ;;
  *)
    echo ""
    echo "Flutter Custom Animations — Asset Capture Script"
    echo ""
    echo "Usage:"
    echo "  $0 effects      <rec.mov>   → gifs/effects/effects_demo.gif"
    echo "  $0 widgets      <rec.mov>   → gifs/widgets/widgets_demo.gif"
    echo "  $0 transitions  <rec.mov>   → gifs/transitions/transitions_demo.gif"
    echo "  $0 builders     <rec.mov>   → gifs/builders/builders_demo.gif"
    echo "  $0 all                      → converts all rec_*.mov files at once"
    echo ""
    echo "Launch the example app first:"
    echo "  macOS  : cd example && flutter run -d macos"
    echo "  Chrome : cd example && flutter run -d chrome"
    echo ""
    exit 1
    ;;
esac
