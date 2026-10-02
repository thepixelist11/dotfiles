fish_add_path "$HOME/.volta/bin"

# CUDA / NVIDIA
set -gx __NV_PRIME_RENDER_OFFLOAD 1
set -gx __GLX_VENDOR_LIBRARY_NAME nvidia
set -gx __VK_LAYER_NV_optimus NVIDIA_only
set -gx LIBGL_DRIVERS_PATH /usr/lib/nvidia

# Editor / pager
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx PAGER less

# Deno
set -gx DENO_INSTALL "$HOME/.deno"
fish_add_path "$DENO_INSTALL/bin"
