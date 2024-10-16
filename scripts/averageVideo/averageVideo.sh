ffmpeg -i "$1" -vf "select=not(mod(n\,10)),setpts=N/(30*TB)" ~/scripts/averageVideo/frames/frame_%04d.png
magick convert ~/scripts/averageVideo/frames/frame_*.png -evaluate-sequence mean output.png && rm ~/scripts/averageVideo/frames/*

