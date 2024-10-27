# -------------
# --- Dconf ---
# -------------

dconf write /org/gnome/desktop/peripherals/mouse/accel-profile "'flat'"

# ----------------------
# --- Gnome Terminal ---
# ----------------------

PROFILE_NAME="sim0wn"
PROFILES=$(gsettings get org.gnome.Terminal.ProfilesList list | tr -d "[']," | xargs)
PROFILE_NAMES=$(
  echo "${PROFILES}" | xargs -I {} gsettings get org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:{}/ visible-name | tr -d "'" | xargs
)

if [[ ! "${PROFILE_NAMES}" =~ "${PROFILE_NAME}" ]]; then
  PROFILE=$(uuidgen)
  gsettings set org.gnome.Terminal.ProfilesList list "['${PROFILES}', '${PROFILE}']"
  gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${PROFILE}/ visible-name "'${PROFILE_NAME}'"
  gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${PROFILE}/ use-theme-colors "false"
  gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${PROFILE}/ background-color "'#191724'"
  gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${PROFILE}/ foreground-color "'#E0DEF4'"
  gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${PROFILE}/ palette "['#191724', '#FF4971', '#50FA7B', '#F4F99D', '#BD93F9', '#FF92D0', '#9A86FD', '#E0DEF4', '#6E6A86', '#FF4971', '#50FA7B', '#F4F99D', '#BD93F9', '#FF92D0', '#9A86FD', '#F1E3F6']"
  gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${PROFILE}/ background-transparency-percent "0"
  gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${PROFILE}/ font "'JetBrains Mono 12'"
  gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${PROFILE}/ use-system-font "false"
  gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${PROFILE}/ cursor-shape "'underline'"
  gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${PROFILE}/ scrollback-unlimited "true"
fi