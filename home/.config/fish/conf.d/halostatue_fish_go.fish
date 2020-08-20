if not command -sq go
    # If there is no go executable, stop with a warning.
    echo 1>&2 'Binary for go is not installed.'
    exit
end

function _halostatue_fish_go_update_path -a old_path new_path
    set -l i (contains -i $old_path/bin $fish_user_paths)
    and set -e fish_user_paths[$i]

    set i (contains -i $old_path/bin $PATH)
    and set -e PATH[$i]

    if test -n "$new_path"
        contains -- $new_path/bin $fish_user_paths
        or path:before $new_path/bin
    end
end

function _halostatue_fish_go_update_variable -a varname default
    set -l new_value (go env $varname)
    set -l old_value $$varname

    # Remove the Universal variant
    set -Uq $varname; and set -Ue $varname

    test -n "$default" -a -z "$new_value"
    and set new_value $default

    set -gx $varname $new_value
    _halostatue_fish_go_update_path $old_value $new_value
end

_halostatue_fish_go_update_variable GOROOT
_halostatue_fish_go_update_variable GOPATH $HOME/go
and mkdir -p $GOPATH

function _halostatue_fish_go_uninstall -e halostatue_fish_go_uninstall
    _halostatue_fish_go_update_path $GOROOT
    _halostatue_fish_go_update_path $GOPATH

    set -Uq GOPATH
    and set -e GOPATH

    set -Uq GOROOT
    and set -e GOROOT

    functions -e (functions -a | command awk '/_halostatue_fish_go_/')
end
