if [ -n "$WAYLAND_DISPLAY" ]
    set -x GDK_BACKEND wayland
    set -x MOZ_ENABLE_WAYLAND 1
    set -x QT_QPA_PLATFORM wayland
    set -x SDL_VIDEODRIVER wayland
end
