# Defined in /home/niklash/.config/fish/functions/bwu.fish @ line 1
function bwu --description 'Unlock the Bitwarden session'
  set -xU BW_SESSION (bw unlock --raw $argv[1])
end
