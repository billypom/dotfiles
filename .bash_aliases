# nice to use instead of bashrc

# automatically enable/disable virtual environment when cd'ing into dir
function cd() {
  builtin cd "$@"

  if [[ ! -z "$VIRTUAL_ENV" ]] ; then
    # If the current directory is not contained within the venv parent directory -> deactivate the venv.
    cur_dir=$(pwd -P)
    venv_dir="$(dirname "$VIRTUAL_ENV")"
    if [[ "$cur_dir" != "$venv_dir" && "$cur_dir" != "$venv_dir"/* ]] ; then
      deactivate
    fi
  fi

  if [[ -z "$VIRTUAL_ENV" ]] ; then
    # If a config file is found -> activate the virtual environment
    venv_cfg_filepath=$(find . -maxdepth 2 -type f -name 'pyvenv.cfg' -print -quit 2> /dev/null)
    if [[ ! -z "$venv_cfg_filepath" ]]; then
      # Assuming the virtual environment directory is the parent directory of where pyvenv.cfg was found
      venv_dir=$(dirname "$venv_cfg_filepath")
      if [[ -d "$venv_dir/bin" ]] ; then
        source "$venv_dir/bin/activate"
        echo "Activated virtual environment at $venv_dir"
      fi
    fi
  fi
}

# NVIDIA environment variables for wayland??
#export WLR_NO_HARDWARE_CURSORS=1
#export XDG_SESSION_TYPE="wayland"
#export MOZ_ENABLE_WAYLAND=1
#export MOZ_USE_XINPUT2=1
#export XWAYLAND_NO_GLAMOR=1

# Wine and Yabridge
export PATH="$PATH:$HOME/.local/share/yabridge" # yabridge
export WINEDEBUG=err,warn # Wine debug 
export PATH=/path/to/ntlm_auth/directory:$PATH # include ntlm_auth in path, from winbind package
# DXVK
export DXVK_HUD=full

# Fcitx east asian input
export INPUT_METHOD="fcitx"
export XMODIFIERS="@im=fcitx"
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx

# Use nvm (node version manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# dir/ls colors ?
test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)

# Aliases
alias vim='~/applications/nvim-linux64/bin/nvim' # nvim
alias o='xdg-open' # Open file explorer
alias py='python3'
pomfind() {
    find . -type f -exec grep -l "$1" {} + 2>/dev/null
}
# Difference between files
alias pomdiff='diff --color -u'

# convert audio
alias wav2ogg='for i in *.wav; do ffmpeg -i "$i" "${i%.*}.ogg"; done'
alias wav2320mp3='for i in *.wav; do ffmpeg -i "$i" -codec:a libmp3lame -b:a 320k "${i%.*}.mp3"; done'
alias wav2192mp3='for i in *.wav; do ffmpeg -i "$i" -codec:a libmp3lame -b:a 192k "${i%.*}.mp3"; done'
alias mp32ogg='for i in *.mp3; do ffmpeg -i "$i" "${i%.*}.ogg"; done'
alias webm2mp3='for i in *.webm; do ffmpeg -i "$i" -vn -c:a libmp3lame -q:a 0 "${i%.*}.mp3"; done'
alias flac2mp3='for i in *.flac; do ffmpeg -i "$i" -q:a 0 "${i%.*}.mp3"; done'
#  convert video
alias mkv2mp4='for i in *.mkv; do ffmpeg -i "$i" -codec copy "${i%.*}.mp4"; done'
alias mov2mp4='for i in *.mov; do ffmpeg -i "$i" -codec copy "${i%.*}.mp4"; done'
alias avi2mp4='for i in *.avi; do ffmpeg -i "$i" -codec copy "${i%.*}.mp4"; done'
alias mov2webm='for i in *.mov; do ffmpeg -i "$i" -c:v libvpx-vp9 -crf 20 -b:v 0 -b:a 128k -c:a libopus "${i%.*}.webm"; done'
alias webm2mp4='for i in *.webm; do ffmpeg -i "$i" -c copy "${i%.*}.mp4"; done'
alias vegaswebm2mp4='for i in *.webm; do ffmpeg -y -i "$i" -c:v libx264 -c:a aac -strict experimental -tune fastdecode -pix_fmt yuv420p -b:a 128k -ar 48000 "${i%.*}.mp4"; done'
alias mp42webm='for i in *.mp4; do ffmpeg -i "$i" -c:v libvpx-vp9 -crf 20 -b:v 0 -b:a 128k -c:a libopus "${i%.*}.webm"; done'
alias mp42wmv='for i in *.mp4; do ffmpeg -i "$i" -c:v wmv2 -b:v 0 -c:a wmav2 -b:a 128k "${i%.*}.wmv"; done'
alias mp42gif='for i in *.mp4; do ffmpeg -i "$i" -vf "fps=30,scale=320:-1:flags=lanczos" "${i%.*}.gif"; done'
alias hevc2avc='for i in *.mp4; do ffmpeg -i "$i" -map 0 -c:v libx265 -crf 20 -vf format=yuv420p -c:a copy "${i%.*}_converted.mp4"; done'
# youtubedl 
alias youtubemp3='~/utils/youtubedl/venv/bin/python3 ~/utils/youtubedl/audio.py'
alias youtubedl='~/utils/youtubedl/venv/bin/python3 ~/utils/youtubedl/video.py'
alias youtubech='~/utils/youtubedl/venv/bin/python3 ~/utils/youtubedl/channel.py'
# convert fonts ttf to woff
alias ttf2woff='fontforge -script ~/utils/ttf-to-woff.pe' # supply a ttf file after this
# video editing
function ffmtrim() { # cut/trim a video
    ffmpeg -i "$1" -ss "$2" -t "$3" -c copy "$4"
}
alias ffmtrim=ffmtrim # input.video start_seconds length_seconds output.video

# ChatGPT
alias gpt='~/applications/chatgpt-cli/venv/bin/python3 ~/applications/chatgpt-cli/src/chatgpt.py'

# Run stuff on open
neofetch



