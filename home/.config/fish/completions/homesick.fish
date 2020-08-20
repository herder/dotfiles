function __fish_homesick_needs_command
    set cmd (commandline -opc)
    if [ (count $cmd) -eq 1 -a $cmd[1] = "homesick" ]
        return 0
    end
    return 1
end

function __fish_homesick_using_command
    set cmd (commandline -opc)
    if [ (count $cmd) -gt 1 ]
        if [ $argv[1] = $cmd[2] ]
            return 0
        end
    end
    return 1
end

# Castle
function __fish_homesick_castle
    homesick list | awk '{ print $1 }'
end

for c in 'cd' 'commit' 'destroy' 'diff' 'exec' 'link' 'open' 'pull' 'push' 'rc' 'show_path' 'status' 'unlink'
    complete -f -c homesick -n "__fish_homesick_using_command $c" -a "(__fish_homesick_castle)"
end

# Help
function __fish_homesick_help_topics
    set -l subcommands 'cd' 'clone' 'commit' 'destroy' 'diff' 'exec' 'exec_all' 'generate' 'help' 'link' 'list' 'open' 'pull' 'push' 'rc' 'show_path' 'status' 'track' 'unlink' 'version'
    printf "%s\thelp topic\n" $subcommands
end

complete -f -c homesick -n "__fish_homesick_using_command help" -a "(__fish_homesick_help_topics)"

# Subcommands
complete -f -c homesick -n "__fish_homesick_needs_command" -a cd        -d "Open a new shell in the root of the given castle"
complete -f -c homesick -n "__fish_homesick_needs_command" -a clone     -d "Clone +uri+ as a castle for homesick"
complete -f -c homesick -n "__fish_homesick_needs_command" -a commit    -d "Commit the specified castle's changes"
complete -f -c homesick -n "__fish_homesick_needs_command" -a destroy   -d "Delete all symlinks and remove the cloned repository"
complete -f -c homesick -n "__fish_homesick_needs_command" -a diff      -d "Shows the git diff of uncommitted changes in a castle"
complete -f -c homesick -n "__fish_homesick_needs_command" -a exec      -d "Execute a single shell command inside the root of a castle"
complete -f -c homesick -n "__fish_homesick_needs_command" -a exec_all  -d "Execute a single shell command inside the root of every cloned castle"
complete -f -c homesick -n "__fish_homesick_needs_command" -a generate  -d "generate a homesick-ready git repo at PATH"
complete -f -c homesick -n "__fish_homesick_needs_command" -a help      -d "Describe available commands or one specific command"
complete -f -c homesick -n "__fish_homesick_needs_command" -a link      -d "Symlinks all dotfiles from the specified castle"
complete -f -c homesick -n "__fish_homesick_needs_command" -a list      -d "List cloned castles"
complete -f -c homesick -n "__fish_homesick_needs_command" -a open      -d "Open your default editor in the root of the given castle"
complete -f -c homesick -n "__fish_homesick_needs_command" -a pull      -d "Update the specified castle"
complete -f -c homesick -n "__fish_homesick_needs_command" -a push      -d "Push the specified castle"
complete -f -c homesick -n "__fish_homesick_needs_command" -a rc        -d "Run the .homesickrc for the specified castle"
complete -f -c homesick -n "__fish_homesick_needs_command" -a show_path -d "Prints the path of a castle"
complete -f -c homesick -n "__fish_homesick_needs_command" -a status    -d "Shows the git status of a castle"
complete -f -c homesick -n "__fish_homesick_needs_command" -a track     -d "add a file to a castle"
complete -f -c homesick -n "__fish_homesick_needs_command" -a unlink    -d "Unsymlinks all dotfiles from the specified castle"
complete -f -c homesick -n "__fish_homesick_needs_command" -a version   -d "Display the current version of homesick"

# Options
complete -f -c homesick -l force   -s f -d "Overwrite files that already exist"
complete -f -c homesick -l pretend -s p -d "Run but do not make any changes"
complete -f -c homesick -l quiet   -s q -d "Suppress status output"
complete -f -c homesick -l skip    -s s -d "Skip files that already exist"
