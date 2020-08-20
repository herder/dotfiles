Time	Sum	Command
3043	789055	> builtin source /usr/share/fish/config.fish
99	99	-> set -g IFS \n\ \t
32	32	-> set -qg __fish_added_user_paths
34	34	-> set -g __fish_added_user_paths
10	36	-> if not set -q __fish_initialized
    set -U __fish_initialized 0
    if set -q __fish_init_2_39_8
        set __fish_initialized 2398
    else if set -q __fish_init_2_3_0
        set __fish_initialized 2300
    end
...
26	26	--> not set -q __fish_initialized
17	17	-> function __fish_default_command_not_found_handler
    printf "fish: Unknown command: %s\n" (string escape -- $argv[1]) >&2
...
17	607	-> if status --is-interactive
    # Enable truecolor/24-bit support for select terminals
    # Ignore Screen and emacs' ansi-term as they swallow the sequences, rendering the text white.
    if not set -q STY
        and not string match -q -- 'eterm*' $TERM
        and begin
            set -q KONSOLE_PROFILE_NAME # KDE's konsole
            or string match -q -- "*:*" $ITERM_SESSION_ID # Supporting versions of iTerm2 will include a colon here
            or string match -q -- "st-*" $TERM # suckless' st
            or test -n "$VTE_VERSION" -a "$VTE_VERSION" -ge 3600 # Should be all gtk3-vte-based terms after version 3.6.0.0
            or test "$COLORTERM" = truecolor -o "$COLORTERM" = 24bit # slang expects this
        end
        # Only set it if it isn't to allow override by setting to 0
        set -q fish_term24bit
        or set -g fish_term24bit 1
    end
else
    # Hook up the default as the principal command_not_found handler
    # in case we are not interactive
    function __fish_command_not_found_handler --on-event fish_command_not_found
        __fish_default_command_not_found_handler $argv
    end
...
27	27	--> status --is-interactive
31	563	--> if not set -q STY
        and not string match -q -- 'eterm*' $TERM
        and begin
            set -q KONSOLE_PROFILE_NAME # KDE's konsole
            or string match -q -- "*:*" $ITERM_SESSION_ID # Supporting versions of iTerm2 will include a colon here
            or string match -q -- "st-*" $TERM # suckless' st
            or test -n "$VTE_VERSION" -a "$VTE_VERSION" -ge 3600 # Should be all gtk3-vte-based terms after version 3.6.0.0
            or test "$COLORTERM" = truecolor -o "$COLORTERM" = 24bit # slang expects this
        end
        # Only set it if it isn't to allow override by setting to 0
        set -q fish_term24bit
        or set -g fish_term24bit 1
    ...
25	25	---> not set -q STY
88	88	---> not string match -q -- 'eterm*' $TERM
44	350	---> begin
            set -q KONSOLE_PROFILE_NAME # KDE's konsole
            or string match -q -- "*:*" $ITERM_SESSION_ID # Supporting versions of iTerm2 will include a colon here
            or string match -q -- "st-*" $TERM # suckless' st
            or test -n "$VTE_VERSION" -a "$VTE_VERSION" -ge 3600 # Should be all gtk3-vte-based terms after version 3.6.0.0
            or test "$COLORTERM" = truecolor -o "$COLORTERM" = 24bit # slang expects this
        ...
39	39	----> set -q KONSOLE_PROFILE_NAME
44	44	----> string match -q -- "*:*" $ITERM_SESSION_ID
41	41	----> string match -q -- "st-*" $TERM
105	105	----> test -n "$VTE_VERSION" -a "$VTE_VERSION" -ge 3600
77	77	----> test "$COLORTERM" = truecolor -o "$COLORTERM" = 24bit
26	26	---> set -q fish_term24bit
43	43	---> set -g fish_term24bit 1
32	32	-> set -l __extra_completionsdir
27	27	-> set -l __extra_functionsdir
27	27	-> set -l __extra_confdir
22	399	-> if test -f $__fish_data_dir/__fish_build_paths.fish
    source $__fish_data_dir/__fish_build_paths.fish
...
54	54	--> test -f $__fish_data_dir/__fish_build_paths.fish
214	323	--> source $__fish_data_dir/__fish_build_paths.fish
45	45	---> set __extra_completionsdir /usr/local/share/fish/vendor_completions.d
34	34	---> set __extra_functionsdir /usr/local/share/fish/vendor_functions.d
30	30	---> set __extra_confdir /usr/local/share/fish/vendor_conf.d
30	30	-> set -l xdg_data_dirs
28	848	-> if set -q XDG_DATA_DIRS
    set --path xdg_data_dirs $XDG_DATA_DIRS
    set xdg_data_dirs (string replace -r '([^/])/$' '$1' -- $xdg_data_dirs)/fish
else
    set xdg_data_dirs $__fish_data_dir
...
26	26	--> set -q XDG_DATA_DIRS
47	47	--> set --path xdg_data_dirs $XDG_DATA_DIRS
486	747	--> set xdg_data_dirs (string replace -r '([^/])/$' '$1' -- $xdg_data_dirs)/fish
261	261	---> string replace -r '([^/])/$' '$1' -- $xdg_data_dirs
93	93	-> set -l vendor_completionsdirs $xdg_data_dirs/vendor_completions.d
61	61	-> set -l vendor_functionsdirs $xdg_data_dirs/vendor_functions.d
53	53	-> set -l vendor_confdirs $xdg_data_dirs/vendor_conf.d
10	74	-> if not contains -- $__extra_completionsdir $vendor_completionsdirs
    set -a vendor_completionsdirs $__extra_completionsdir
...
64	64	--> not contains -- $__extra_completionsdir $vendor_completionsdirs
8	68	-> if not contains -- $__extra_functionsdir $vendor_functionsdirs
    set -a vendor_functionsdirs $__extra_functionsdir
...
60	60	--> not contains -- $__extra_functionsdir $vendor_functionsdirs
7	55	-> if not contains -- $__extra_confdir $vendor_confdirs
    set -a vendor_confdirs $__extra_confdir
...
48	48	--> not contains -- $__extra_confdir $vendor_confdirs
27	194	-> if not set -q fish_function_path
    set fish_function_path $__fish_config_dir/functions $__fish_sysconf_dir/functions $vendor_functionsdirs $__fish_data_dir/functions
else if not contains -- $__fish_data_dir/functions $fish_function_path
    set -a fish_function_path $__fish_data_dir/functions
...
25	25	--> not set -q fish_function_path
142	142	--> set fish_function_path $__fish_config_dir/functions $__fish_sysconf_dir/functions $vendor_functionsdirs $__fish_data_dir/functions
23	185	-> if not set -q fish_complete_path
    set fish_complete_path $__fish_config_dir/completions $__fish_sysconf_dir/completions $vendor_completionsdirs $__fish_data_dir/completions $__fish_user_data_dir/generated_completions
else if not contains -- $__fish_data_dir/completions $fish_complete_path
    set -a fish_complete_path $__fish_data_dir/completions
...
43	43	--> not set -q fish_complete_path
119	119	--> set fish_complete_path $__fish_config_dir/completions $__fish_sysconf_dir/completions $vendor_completionsdirs $__fish_data_dir/completions $__fish_user_data_dir/generated_completions
24	24	-> function : -d "no-op function"
    # for compatibility with sh, bash, and others.
    # Often used to insert a comment into a chain of commands without having
    # it eat up the remainder of the line, handy in Makefiles.
    # This command always succeeds
    true
...
9	151	-> if begin; not set -q FISH_UNIT_TESTS_RUNNING; and test -d /usr/xpg4/bin; end
    not contains -- /usr/xpg4/bin $PATH
    and set PATH /usr/xpg4/bin $PATH
...
32	142	--> begin; not set -q FISH_UNIT_TESTS_RUNNING; and test -d /usr/xpg4/bin; ...
48	48	---> not set -q FISH_UNIT_TESTS_RUNNING
62	62	---> test -d /usr/xpg4/bin
48	48	-> function __fish_reconstruct_path -d "Update PATH when fish_user_paths changes" --on-variable fish_user_paths
    set -l local_path $PATH

    for x in $__fish_added_user_paths
        set -l idx (contains --index -- $x $local_path)
        and set -e local_path[$idx]
    end

    set -g __fish_added_user_paths
    if set -q fish_user_paths
        # Explicitly split on ":" because $fish_user_paths might not be a path variable,
        # but $PATH definitely is.
        for x in (string split ":" -- $fish_user_paths[-1..1])
            if set -l idx (contains --index -- $x $local_path)
                set -e local_path[$idx]
            else
                set -ga __fish_added_user_paths $x
            end
            set -p local_path $x
        end
    end

    set -xg PATH $local_path
...
60	60	-> function fish_sigtrap_handler --on-signal TRAP --no-scope-shadowing --description "Signal handler for the TRAP signal. Launches a debug prompt."
    breakpoint
...
26	26	-> function __fish_on_interactive --on-event fish_prompt
    __fish_config_interactive
    functions -e __fish_on_interactive
...
578	2254	-> __fish_set_locale
1320	1342	--> source /usr/share/fish/functions/__fish_set_locale.fish
22	22	---> function __fish_set_locale
    set -l LOCALE_VARS
    set -a LOCALE_VARS LANG LANGUAGE LC_CTYPE LC_NUMERIC LC_TIME LC_COLLATE
    set -a LOCALE_VARS LC_MONETARY LC_MESSAGES LC_PAPER LC_NAME LC_ADDRESS
    set -a LOCALE_VARS LC_TELEPHONE LC_MEASUREMENT LC_IDENTIFICATION

    # We check LC_ALL to figure out if we have a locale but we don't set it later. That is because
    # locale.conf doesn't allow it so we should not set it.
    for locale_var in $LOCALE_VARS LC_ALL
        if set -q $locale_var
            return 0
        end
    end

    # Try to extract the locale from the kernel boot commandline. The splitting here is a bit weird,
    # but we operate under the assumption that the locale can't include whitespace. Other whitespace
    # shouldn't concern us, but a quoted "locale.LANG=SOMETHING" as a value to something else might.
    # Here the last definition of a variable takes precedence.
    if test -r /proc/cmdline
        for var in (string match -ra 'locale.[^=]+=\S+' < /proc/cmdline)
            set -l kv (string replace 'locale.' '' -- $var | string split '=')
            # Only set locale variables, not other stuff contained in these files - this also
            # automatically ignores comments.
            if contains -- $kv[1] $LOCALE_VARS
                and set -q kv[2]
                set -gx $kv[1] (string trim -c '\'"' -- $kv[2])
            end
        end
    end

    # Now read the config files we know are used by various OS distros.
    #
    # /etc/sysconfig/i18n is for old Red Hat derivatives (and possibly of no use anymore).
    #
    # /etc/env.d/02locale is from OpenRC.
    #
    # The rest are systemd inventions but also used elsewhere (e.g. Void Linux). systemd's
    # documentation is a bit unclear on this. We merge all the config files (and the commandline),
    # which seems to be what systemd itself does. (I.e. the value for a variable will be taken from
    # the highest-precedence source) We read the systemd files first since they are a newer
    # invention and therefore the rest are likely to be accumulated cruft.
    #
    # NOTE: Slackware puts the locale in /etc/profile.d/lang.sh, which we can't use because it's a
    # full POSIX-shell script.
    set -l user_cfg_dir (set -q XDG_CONFIG_HOME; and echo $XDG_CONFIG_HOME; or echo ~/.config)
    for f in $user_cfg_dir/locale.conf /etc/locale.conf /etc/env.d/02locale /etc/sysconfig/i18n
        if test -r $f
            while read -l kv
                set kv (string split '=' -- $kv)
                if contains -- $kv[1] $LOCALE_VARS
                    and set -q kv[2]
                    # Do not set already set variables again - this makes the merging happen.
                    if not set -q $kv[1]
                        set -gx $kv[1] (string trim -c '\'"' -- $kv[2])
                    end
                end
            end <$f
        end
    end

    # If we really cannot get anything, at least set character encoding to UTF-8.
    for locale_var in $LOCALE_VARS LC_ALL
        if set -q $locale_var
            return 0
        end
    end
    set -gx LC_CTYPE en_US.UTF-8
...
57	57	--> set -l LOCALE_VARS
45	45	--> set -a LOCALE_VARS LANG LANGUAGE LC_CTYPE LC_NUMERIC LC_TIME LC_COLLATE
40	40	--> set -a LOCALE_VARS LC_MONETARY LC_MESSAGES LC_PAPER LC_NAME LC_ADDRESS
36	36	--> set -a LOCALE_VARS LC_TELEPHONE LC_MEASUREMENT LC_IDENTIFICATION
77	156	--> for locale_var in $LOCALE_VARS LC_ALL
        if set -q $locale_var
            return 0
        end
    ...
18	79	---> if set -q $locale_var
            return 0
        ...
35	35	----> set -q $locale_var
26	26	----> return 0
35	35	-> function . -d 'Evaluate a file (deprecated, use "source")' --no-scope-shadowing --wraps source
    if [ (count $argv) -eq 0 ] && isatty 0
        echo "source: using source via '.' is deprecated, and stdin doesn't work."\n"Did you mean 'source' or './'?" >&2
        return 1
    else
        source $argv
    end
...
9	57	-> if test $__fish_initialized -lt 2300
    if set -q fish_user_abbreviations
        set -l fab
        for abbr in $fish_user_abbreviations
            set -a fab (string replace -r '^([^ =]+)=(.*)$' '$1 $2' -- $abbr)
        end
        set fish_user_abbreviations $fab
    end
...
48	48	--> test $__fish_initialized -lt 2300
7	31	-> if status --is-login
    if command -sq /usr/libexec/path_helper
        # Adapt construct_path from the macOS /usr/libexec/path_helper
        # executable for fish; see
        # https://opensource.apple.com/source/shell_cmds/shell_cmds-203/path_helper/path_helper.c.auto.html .
        function __fish_macos_set_env -d "set an environment variable like path_helper does (macOS only)"
            set -l result

            # Populate path according to config files
            for path_file in $argv[2] $argv[3]/*
                if [ -f $path_file ]
                    while read -l entry
                        if not contains -- $entry $result
                            test -n "$entry"
                            and set -a result $entry
                        end
                    end <$path_file
                end
            end

            # Merge in any existing path elements
            for existing_entry in $$argv[1]
                if not contains -- $existing_entry $result
                    set -a result $existing_entry
                end
            end

            set -xg $argv[1] $result
        end

        __fish_macos_set_env 'PATH' '/etc/paths' '/etc/paths.d'
        if [ -n "$MANPATH" ]
            __fish_macos_set_env 'MANPATH' '/etc/manpaths' '/etc/manpaths.d'
        end
        functions -e __fish_macos_set_env
    end

    #
    # Put linux consoles in unicode mode.
    #
    if test "$TERM" = linux
        and string match -qir '\.UTF' -- $LANG
        and command -sq unicode_start
        unicode_start
    end
...
24	24	--> status --is-login
91	5922	-> __fish_reconstruct_path
292	292	--> set -l local_path $PATH
55	55	--> for x in $__fish_added_user_paths
        set -l idx (contains --index -- $x $local_path)
        and set -e local_path[$idx]
    ...
36	36	--> set -g __fish_added_user_paths
21	5110	--> if set -q fish_user_paths
        # Explicitly split on ":" because $fish_user_paths might not be a path variable,
        # but $PATH definitely is.
        for x in (string split ":" -- $fish_user_paths[-1..1])
            if set -l idx (contains --index -- $x $local_path)
                set -e local_path[$idx]
            else
                set -ga __fish_added_user_paths $x
            end
            set -p local_path $x
        end
    ...
24	24	---> set -q fish_user_paths
383	5065	---> for x in (string split ":" -- $fish_user_paths[-1..1])
            if set -l idx (contains --index -- $x $local_path)
                set -e local_path[$idx]
            else
                set -ga __fish_added_user_paths $x
            end
            set -p local_path $x
        ...
216	216	----> string split ":" -- $fish_user_paths[-1..1]
27	985	----> if set -l idx (contains --index -- $x $local_path)
                set -e local_path[$idx]
            else
                set -ga __fish_added_user_paths $x
            ...
284	827	-----> set -l idx (contains --index -- $x $local_path)
543	543	------> contains --index -- $x $local_path
131	131	-----> set -e local_path[$idx]
99	99	----> set -p local_path $x
49	683	----> if set -l idx (contains --index -- $x $local_path)
                set -e local_path[$idx]
            else
                set -ga __fish_added_user_paths $x
            ...
248	506	-----> set -l idx (contains --index -- $x $local_path)
258	258	------> contains --index -- $x $local_path
128	128	-----> set -e local_path[$idx]
125	125	----> set -p local_path $x
39	799	----> if set -l idx (contains --index -- $x $local_path)
                set -e local_path[$idx]
            else
                set -ga __fish_added_user_paths $x
            ...
318	622	-----> set -l idx (contains --index -- $x $local_path)
304	304	------> contains --index -- $x $local_path
138	138	-----> set -e local_path[$idx]
119	119	----> set -p local_path $x
36	850	----> if set -l idx (contains --index -- $x $local_path)
                set -e local_path[$idx]
            else
                set -ga __fish_added_user_paths $x
            ...
325	627	-----> set -l idx (contains --index -- $x $local_path)
302	302	------> contains --index -- $x $local_path
187	187	-----> set -e local_path[$idx]
151	151	----> set -p local_path $x
24	544	----> if set -l idx (contains --index -- $x $local_path)
                set -e local_path[$idx]
            else
                set -ga __fish_added_user_paths $x
            ...
223	432	-----> set -l idx (contains --index -- $x $local_path)
209	209	------> contains --index -- $x $local_path
88	88	-----> set -e local_path[$idx]
111	111	----> set -p local_path $x
338	338	--> set -xg PATH $local_path
25	25	-> function __fish_expand_pid_args
    for arg in $argv
        if string match -qr '^%\d+$' -- $arg
            # set newargv $newargv (jobs -p $arg)
            jobs -p $arg
            if not test $status -eq 0
                return 1
            end
        else
            printf "%s\n" $arg
        end
    end
...
72	174	-> for jobbltn in bg fg wait disown
    function $jobbltn -V jobbltn
        builtin $jobbltn (__fish_expand_pid_args $argv)
    end
...
42	42	--> function $jobbltn -V jobbltn
        builtin $jobbltn (__fish_expand_pid_args $argv)
    ...
21	21	--> function $jobbltn -V jobbltn
        builtin $jobbltn (__fish_expand_pid_args $argv)
    ...
20	20	--> function $jobbltn -V jobbltn
        builtin $jobbltn (__fish_expand_pid_args $argv)
    ...
19	19	--> function $jobbltn -V jobbltn
        builtin $jobbltn (__fish_expand_pid_args $argv)
    ...
8	8	-> function kill
    command kill (__fish_expand_pid_args $argv)
...
45	45	-> set -l sourcelist
1059	774181	-> for file in $__fish_config_dir/conf.d/*.fish $__fish_sysconf_dir/conf.d/*.fish $vendor_confdirs/*.fish
    set -l basename (string replace -r '^.*/' '' -- $file)
    contains -- $basename $sourcelist
    and continue
    set sourcelist $sourcelist $basename
    # Also skip non-files or unreadable files.
    # This allows one to use e.g. symlinks to /dev/null to "mask" something (like in systemd).
    [ -f $file -a -r $file ]
    and source $file
...
656	787	--> set -l basename (string replace -r '^.*/' '' -- $file)
131	131	---> string replace -r '^.*/' '' -- $file
61	61	--> contains -- $basename $sourcelist
51	51	--> set sourcelist $sourcelist $basename
96	96	--> [ -f $file -a -r $file ]
278	176986	--> source $file
65	65	---> test -d ~/.linuxbrew
41	41	---> test -d /home/linuxbrew/.linuxbrew
478	176602	---> eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
175757	175757	----> /home/linuxbrew/.linuxbrew/bin/brew shellenv
36	36	----> set -gx HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew"
19	19	----> set -gx HOMEBREW_CELLAR "/home/linuxbrew/.linuxbrew/Cellar"
16	16	----> set -gx HOMEBREW_REPOSITORY "/home/linuxbrew/.linuxbrew/Homebrew"
11	11	----> set -q PATH
151	151	----> set -gx PATH "/home/linuxbrew/.linuxbrew/bin" "/home/linuxbrew/.linuxbrew/sbin" $PATH
28	28	----> set -q MANPATH
61	61	----> set -gx MANPATH "/home/linuxbrew/.linuxbrew/share/man" $MANPATH
13	13	----> set -q INFOPATH
32	32	----> set -gx INFOPATH "/home/linuxbrew/.linuxbrew/share/info" $INFOPATH
190	245	--> set -l basename (string replace -r '^.*/' '' -- $file)
55	55	---> string replace -r '^.*/' '' -- $file
36	36	--> contains -- $basename $sourcelist
24	24	--> set sourcelist $sourcelist $basename
48	48	--> [ -f $file -a -r $file ]
121	6189	--> source $file
19	6068	---> if status --is-interactive
  abbr --add --global be 'vim $DOTFILES_PATH/Brewfile'
  abbr --add --global con 'sshrc -A '
  abbr --add --global gfc 'clone'
  abbr --add uv "vim -c 'set nomore' -c 'PlugUpdate' -c 'qa!'"
...
17	17	----> status --is-interactive
275	2710	----> abbr --add --global be 'vim $DOTFILES_PATH/Brewfile'
1249	1293	-----> source /usr/share/fish/functions/abbr.fish
20	20	------> function abbr --description "Manage abbreviations"
    set -l options --stop-nonopt --exclusive 'a,r,e,l,s,q' --exclusive 'g,U'
    set -a options h/help a/add r/rename e/erase l/list s/show q/query
    set -a options g/global U/universal

    argparse -n abbr $options -- $argv
    or return

    if set -q _flag_help
        __fish_print_help abbr
        return 0
    end

    # If run with no options, treat it like --add if we have arguments, or
    # --show if we do not have any arguments.
    set -l _flag_add
    set -l _flag_show
    if not set -q _flag_add[1]
        and not set -q _flag_rename[1]
        and not set -q _flag_erase[1]
        and not set -q _flag_list[1]
        and not set -q _flag_show[1]
        and not set -q _flag_query[1]
        if set -q argv[1]
            set _flag_add --add
        else
            set _flag_show --show
        end
    end

    set -l abbr_scope
    if set -q _flag_global
        set abbr_scope --global
    else if set -q _flag_universal
        set abbr_scope --universal
    end

    if set -q _flag_add[1]
        __fish_abbr_add $argv
        return
    else if set -q _flag_erase[1]
        __fish_abbr_erase $argv
        return
    else if set -q _flag_rename[1]
        __fish_abbr_rename $argv
        return
    else if set -q _flag_list[1]
        __fish_abbr_list $argv
        return
    else if set -q _flag_show[1]
        __fish_abbr_show $argv
        return
    else if set -q _flag_query[1]
        # "--query": Check if abbrs exist.
        # If we don't have an argument, it's an automatic failure.
        set -q argv[1]; or return 1
        set -l escaped _fish_abbr_(string escape --style=var -- $argv)
        # We return 0 if any arg exists, whereas `set -q` returns the number of undefined arguments.
        # But we should be consistent with `type -q` and `command -q`.
        for var in $escaped
            set -q $escaped; and return 0
        end
        return 1
    else
        printf ( _ "%s: Could not figure out what to do!\n" ) abbr >&2
        return 127
    end
...
7	7	------> function __fish_abbr_add --no-scope-shadowing
    if not set -q argv[2]
        printf ( _ "%s %s: Requires at least two arguments\n" ) abbr --add >&2
        return 1
    end

    # Because of the way abbreviations are expanded there can't be any spaces in the key.
    set -l abbr_name $argv[1]
    set -l escaped_abbr_name (string escape -- $abbr_name)
    if string match -q "* *" -- $abbr_name
        set -l msg ( _ "%s %s: Abbreviation %s cannot have spaces in the word\n" )
        printf $msg abbr --add $escaped_abbr_name >&2
        return 1
    end

    set -l abbr_val "$argv[2..-1]"
    set -l abbr_var_name _fish_abbr_(string escape --style=var -- $abbr_name)

    if not set -q $abbr_var_name
        # We default to the universal scope if the user didn't explicitly specify a scope and the
        # abbreviation isn't already defined.
        set -q abbr_scope[1]
        or set abbr_scope --universal
    end
    true # make sure the next `set` command doesn't leak the previous status
    set $abbr_scope $abbr_var_name $abbr_val
...
5	5	------> function __fish_abbr_erase --no-scope-shadowing
    if set -q argv[2]
        printf ( _ "%s %s: Expected one argument\n" ) abbr --erase >&2
        return 1
    end

    # Because of the way abbreviations are expanded there can't be any spaces in the key.
    set -l abbr_name $argv[1]
    set -l escaped_name (string escape -- $abbr_name)
    if string match -q "* *" -- $abbr_old_name
        set -l msg ( _ "%s %s: Abbreviation %s cannot have spaces in the word\n" )
        printf $msg abbr --erase $escaped_name >&2
        return 1
    end

    set -l abbr_var_name _fish_abbr_(string escape --style=var -- $abbr_name)

    if not set -q $abbr_var_name
        printf ( _ "%s %s: No abbreviation named %s\n" ) abbr --erase $escaped_name >&2
        return 4 # like `set -e doesnt_exist`
    end

    set -e $abbr_var_name
...
4	4	------> function __fish_abbr_rename --no-scope-shadowing
    if test (count $argv) -ne 2
        printf ( _ "%s %s: Requires exactly two arguments\n" ) abbr --rename >&2
        return 1
    end

    set -l old_name $argv[1]
    set -l new_name $argv[2]
    set -l escaped_old_name (string escape -- $old_name)
    set -l escaped_new_name (string escape -- $new_name)
    if string match -q "* *" -- $old_name
        set -l msg ( _ "%s %s: Abbreviation %s cannot have spaces in the word\n" )
        printf $msg abbr --rename $escaped_old_name >&2
        return 1
    end
    if string match -q "* *" -- $new_name
        set -l msg ( _ "%s %s: Abbreviation %s cannot have spaces in the word\n" )
        printf $msg abbr --rename $escaped_new_name >&2
        return 1
    end

    set -l old_var_name _fish_abbr_(string escape --style=var -- $old_name)
    set -l new_var_name _fish_abbr_(string escape --style=var -- $new_name)

    if not set -q $old_var_name
        printf ( _ "%s %s: No abbreviation named %s\n" ) abbr --rename $escaped_old_name >&2
        return 1
    end
    if set -q $new_var_name
        set -l msg ( _ "%s %s: Abbreviation %s already exists, cannot rename %s\n" )
        printf $msg abbr --rename $escaped_new_name $escaped_old_name >&2
        return 1
    end

    set -l old_var_val $$old_var_name

    if not set -q abbr_scope[1]
        # User isn't forcing the scope so use the existing scope.
        if set -ql $old_var_name
            set abbr_scope --global
        else
            set abbr_scope --universal
        end
    end

    set -e $old_var_name
    set $abbr_scope $new_var_name $old_var_val
...
4	4	------> function __fish_abbr_list --no-scope-shadowing
    if set -q argv[1]
        printf ( _ "%s %s: Unexpected argument -- '%s'\n" ) abbr --erase $argv[1] >&2
        return 1
    end

    for var_name in (set --names)
        string match -q '_fish_abbr_*' $var_name
        or continue

        set -l abbr_name (string unescape --style=var (string sub -s 12 $var_name))
        echo $abbr_name
    end
...
4	4	------> function __fish_abbr_show --no-scope-shadowing
    if set -q argv[1]
        printf ( _ "%s %s: Unexpected argument -- '%s'\n" ) abbr --erase $argv[1] >&2
        return 1
    end

    for var_name in (set --names)
        string match -q '_fish_abbr_*' $var_name
        or continue

        set -l abbr_var_name $var_name
        set -l abbr_name (string unescape --style=var -- (string sub -s 12 $abbr_var_name))
        set -l abbr_name (string escape --style=script -- $abbr_name)
        set -l abbr_val $$abbr_var_name
        set -l abbr_val (string escape --style=script -- $abbr_val)

        if set -ql $abbr_var_name
            printf 'abbr -a %s -- %s %s\n' -l $abbr_name $abbr_val
        end
        if set -qg $abbr_var_name
            printf 'abbr -a %s -- %s %s\n' -g $abbr_name $abbr_val
        end
        if set -qU $abbr_var_name
            printf 'abbr -a %s -- %s %s\n' -U $abbr_name $abbr_val
        end
    end
...
34	34	-----> set -l options --stop-nonopt --exclusive 'a,r,e,l,s,q' --exclusive 'g,U'
25	25	-----> set -a options h/help a/add r/rename e/erase l/list s/show q/query
21	21	-----> set -a options g/global U/universal
80	80	-----> argparse -n abbr $options -- $argv
5	20	-----> if set -q _flag_help
        __fish_print_help abbr
        return 0
    ...
15	15	------> set -q _flag_help
14	14	-----> set -l _flag_add
13	13	-----> set -l _flag_show
14	117	-----> if not set -q _flag_add[1]
        and not set -q _flag_rename[1]
        and not set -q _flag_erase[1]
        and not set -q _flag_list[1]
        and not set -q _flag_show[1]
        and not set -q _flag_query[1]
        if set -q argv[1]
            set _flag_add --add
        else
            set _flag_show --show
        end
    ...
13	13	------> not set -q _flag_add[1]
11	11	------> not set -q _flag_rename[1]
11	11	------> not set -q _flag_erase[1]
11	11	------> not set -q _flag_list[1]
11	11	------> not set -q _flag_show[1]
11	11	------> not set -q _flag_query[1]
7	35	------> if set -q argv[1]
            set _flag_add --add
        else
            set _flag_show --show
        ...
12	12	-------> set -q argv[1]
16	16	-------> set _flag_add --add
15	15	-----> set -l abbr_scope
6	30	-----> if set -q _flag_global
        set abbr_scope --global
    else if set -q _flag_universal
        set abbr_scope --universal
    ...
10	10	------> set -q _flag_global
14	14	------> set abbr_scope --global
9	773	-----> if set -q _flag_add[1]
        __fish_abbr_add $argv
        return
    else if set -q _flag_erase[1]
        __fish_abbr_erase $argv
        return
    else if set -q _flag_rename[1]
        __fish_abbr_rename $argv
        return
    else if set -q _flag_list[1]
        __fish_abbr_list $argv
        return
    else if set -q _flag_show[1]
        __fish_abbr_show $argv
        return
    else if set -q _flag_query[1]
        # "--query": Check if abbrs exist.
        # If we don't have an argument, it's an automatic failure.
        set -q argv[1]; or return 1
        set -l escaped _fish_abbr_(string escape --style=var -- $argv)
        # We return 0 if any arg exists, whereas `set -q` returns the number of undefined arguments.
        # But we should be consistent with `type -q` and `command -q`.
        for var in $escaped
            set -q $escaped; and return 0
        end
        return 1
    else
        printf ( _ "%s: Could not figure out what to do!\n" ) abbr >&2
        return 127
    ...
11	11	------> set -q _flag_add[1]
55	742	------> __fish_abbr_add $argv
4	18	-------> if not set -q argv[2]
        printf ( _ "%s %s: Requires at least two arguments\n" ) abbr --add >&2
        return 1
    ...
14	14	--------> not set -q argv[2]
19	19	-------> set -l abbr_name $argv[1]
196	229	-------> set -l escaped_abbr_name (string escape -- $abbr_name)
33	33	--------> string escape -- $abbr_name
7	45	-------> if string match -q "* *" -- $abbr_name
        set -l msg ( _ "%s %s: Abbreviation %s cannot have spaces in the word\n" )
        printf $msg abbr --add $escaped_abbr_name >&2
        return 1
    ...
38	38	--------> string match -q "* *" -- $abbr_name
27	27	-------> set -l abbr_val "$argv[2..-1]"
165	197	-------> set -l abbr_var_name _fish_abbr_(string escape --style=var -- $abbr_name)
32	32	--------> string escape --style=var -- $abbr_name
12	52	-------> if not set -q $abbr_var_name
        # We default to the universal scope if the user didn't explicitly specify a scope and the
        # abbreviation isn't already defined.
        set -q abbr_scope[1]
        or set abbr_scope --universal
    ...
24	24	--------> not set -q $abbr_var_name
16	16	--------> set -q abbr_scope[1]
70	70	-------> true
30	30	-------> set $abbr_scope $abbr_var_name $abbr_val
11	11	------> return
56	1054	----> abbr --add --global con 'sshrc -A '
24	24	-----> set -l options --stop-nonopt --exclusive 'a,r,e,l,s,q' --exclusive 'g,U'
23	23	-----> set -a options h/help a/add r/rename e/erase l/list s/show q/query
19	19	-----> set -a options g/global U/universal
76	76	-----> argparse -n abbr $options -- $argv
5	18	-----> if set -q _flag_help
        __fish_print_help abbr
        return 0
    ...
13	13	------> set -q _flag_help
14	14	-----> set -l _flag_add
13	13	-----> set -l _flag_show
14	117	-----> if not set -q _flag_add[1]
        and not set -q _flag_rename[1]
        and not set -q _flag_erase[1]
        and not set -q _flag_list[1]
        and not set -q _flag_show[1]
        and not set -q _flag_query[1]
        if set -q argv[1]
            set _flag_add --add
        else
            set _flag_show --show
        end
    ...
12	12	------> not set -q _flag_add[1]
12	12	------> not set -q _flag_rename[1]
11	11	------> not set -q _flag_erase[1]
11	11	------> not set -q _flag_list[1]
10	10	------> not set -q _flag_show[1]
11	11	------> not set -q _flag_query[1]
8	36	------> if set -q argv[1]
            set _flag_add --add
        else
            set _flag_show --show
        ...
13	13	-------> set -q argv[1]
15	15	-------> set _flag_add --add
15	15	-----> set -l abbr_scope
7	31	-----> if set -q _flag_global
        set abbr_scope --global
    else if set -q _flag_universal
        set abbr_scope --universal
    ...
11	11	------> set -q _flag_global
13	13	------> set abbr_scope --global
8	648	-----> if set -q _flag_add[1]
        __fish_abbr_add $argv
        return
    else if set -q _flag_erase[1]
        __fish_abbr_erase $argv
        return
    else if set -q _flag_rename[1]
        __fish_abbr_rename $argv
        return
    else if set -q _flag_list[1]
        __fish_abbr_list $argv
        return
    else if set -q _flag_show[1]
        __fish_abbr_show $argv
        return
    else if set -q _flag_query[1]
        # "--query": Check if abbrs exist.
        # If we don't have an argument, it's an automatic failure.
        set -q argv[1]; or return 1
        set -l escaped _fish_abbr_(string escape --style=var -- $argv)
        # We return 0 if any arg exists, whereas `set -q` returns the number of undefined arguments.
        # But we should be consistent with `type -q` and `command -q`.
        for var in $escaped
            set -q $escaped; and return 0
        end
        return 1
    else
        printf ( _ "%s: Could not figure out what to do!\n" ) abbr >&2
        return 127
    ...
12	12	------> set -q _flag_add[1]
48	617	------> __fish_abbr_add $argv
4	17	-------> if not set -q argv[2]
        printf ( _ "%s %s: Requires at least two arguments\n" ) abbr --add >&2
        return 1
    ...
13	13	--------> not set -q argv[2]
19	19	-------> set -l abbr_name $argv[1]
200	232	-------> set -l escaped_abbr_name (string escape -- $abbr_name)
32	32	--------> string escape -- $abbr_name
8	44	-------> if string match -q "* *" -- $abbr_name
        set -l msg ( _ "%s %s: Abbreviation %s cannot have spaces in the word\n" )
        printf $msg abbr --add $escaped_abbr_name >&2
        return 1
    ...
36	36	--------> string match -q "* *" -- $abbr_name
27	27	-------> set -l abbr_val "$argv[2..-1]"
114	147	-------> set -l abbr_var_name _fish_abbr_(string escape --style=var -- $abbr_name)
33	33	--------> string escape --style=var -- $abbr_name
8	42	-------> if not set -q $abbr_var_name
        # We default to the universal scope if the user didn't explicitly specify a scope and the
        # abbreviation isn't already defined.
        set -q abbr_scope[1]
        or set abbr_scope --universal
    ...
20	20	--------> not set -q $abbr_var_name
14	14	--------> set -q abbr_scope[1]
15	15	-------> true
26	26	-------> set $abbr_scope $abbr_var_name $abbr_val
11	11	------> return
69	1089	----> abbr --add --global gfc 'clone'
23	23	-----> set -l options --stop-nonopt --exclusive 'a,r,e,l,s,q' --exclusive 'g,U'
23	23	-----> set -a options h/help a/add r/rename e/erase l/list s/show q/query
19	19	-----> set -a options g/global U/universal
76	76	-----> argparse -n abbr $options -- $argv
5	18	-----> if set -q _flag_help
        __fish_print_help abbr
        return 0
    ...
13	13	------> set -q _flag_help
14	14	-----> set -l _flag_add
13	13	-----> set -l _flag_show
16	117	-----> if not set -q _flag_add[1]
        and not set -q _flag_rename[1]
        and not set -q _flag_erase[1]
        and not set -q _flag_list[1]
        and not set -q _flag_show[1]
        and not set -q _flag_query[1]
        if set -q argv[1]
            set _flag_add --add
        else
            set _flag_show --show
        end
    ...
12	12	------> not set -q _flag_add[1]
11	11	------> not set -q _flag_rename[1]
11	11	------> not set -q _flag_erase[1]
11	11	------> not set -q _flag_list[1]
11	11	------> not set -q _flag_show[1]
11	11	------> not set -q _flag_query[1]
6	34	------> if set -q argv[1]
            set _flag_add --add
        else
            set _flag_show --show
        ...
13	13	-------> set -q argv[1]
15	15	-------> set _flag_add --add
14	14	-----> set -l abbr_scope
14	40	-----> if set -q _flag_global
        set abbr_scope --global
    else if set -q _flag_universal
        set abbr_scope --universal
    ...
12	12	------> set -q _flag_global
14	14	------> set abbr_scope --global
10	663	-----> if set -q _flag_add[1]
        __fish_abbr_add $argv
        return
    else if set -q _flag_erase[1]
        __fish_abbr_erase $argv
        return
    else if set -q _flag_rename[1]
        __fish_abbr_rename $argv
        return
    else if set -q _flag_list[1]
        __fish_abbr_list $argv
        return
    else if set -q _flag_show[1]
        __fish_abbr_show $argv
        return
    else if set -q _flag_query[1]
        # "--query": Check if abbrs exist.
        # If we don't have an argument, it's an automatic failure.
        set -q argv[1]; or return 1
        set -l escaped _fish_abbr_(string escape --style=var -- $argv)
        # We return 0 if any arg exists, whereas `set -q` returns the number of undefined arguments.
        # But we should be consistent with `type -q` and `command -q`.
        for var in $escaped
            set -q $escaped; and return 0
        end
        return 1
    else
        printf ( _ "%s: Could not figure out what to do!\n" ) abbr >&2
        return 127
    ...
11	11	------> set -q _flag_add[1]
54	630	------> __fish_abbr_add $argv
5	18	-------> if not set -q argv[2]
        printf ( _ "%s %s: Requires at least two arguments\n" ) abbr --add >&2
        return 1
    ...
13	13	--------> not set -q argv[2]
18	18	-------> set -l abbr_name $argv[1]
161	218	-------> set -l escaped_abbr_name (string escape -- $abbr_name)
57	57	--------> string escape -- $abbr_name
5	37	-------> if string match -q "* *" -- $abbr_name
        set -l msg ( _ "%s %s: Abbreviation %s cannot have spaces in the word\n" )
        printf $msg abbr --add $escaped_abbr_name >&2
        return 1
    ...
32	32	--------> string match -q "* *" -- $abbr_name
26	26	-------> set -l abbr_val "$argv[2..-1]"
115	149	-------> set -l abbr_var_name _fish_abbr_(string escape --style=var -- $abbr_name)
34	34	--------> string escape --style=var -- $abbr_name
13	59	-------> if not set -q $abbr_var_name
        # We default to the universal scope if the user didn't explicitly specify a scope and the
        # abbreviation isn't already defined.
        set -q abbr_scope[1]
        or set abbr_scope --universal
    ...
29	29	--------> not set -q $abbr_var_name
17	17	--------> set -q abbr_scope[1]
19	19	-------> true
32	32	-------> set $abbr_scope $abbr_var_name $abbr_val
12	12	------> return
83	1179	----> abbr --add uv "vim -c 'set nomore' -c 'PlugUpdate' -c 'qa!'"
27	27	-----> set -l options --stop-nonopt --exclusive 'a,r,e,l,s,q' --exclusive 'g,U'
26	26	-----> set -a options h/help a/add r/rename e/erase l/list s/show q/query
47	47	-----> set -a options g/global U/universal
85	85	-----> argparse -n abbr $options -- $argv
5	21	-----> if set -q _flag_help
        __fish_print_help abbr
        return 0
    ...
16	16	------> set -q _flag_help
16	16	-----> set -l _flag_add
15	15	-----> set -l _flag_show
17	136	-----> if not set -q _flag_add[1]
        and not set -q _flag_rename[1]
        and not set -q _flag_erase[1]
        and not set -q _flag_list[1]
        and not set -q _flag_show[1]
        and not set -q _flag_query[1]
        if set -q argv[1]
            set _flag_add --add
        else
            set _flag_show --show
        end
    ...
14	14	------> not set -q _flag_add[1]
14	14	------> not set -q _flag_rename[1]
13	13	------> not set -q _flag_erase[1]
12	12	------> not set -q _flag_list[1]
13	13	------> not set -q _flag_show[1]
13	13	------> not set -q _flag_query[1]
9	40	------> if set -q argv[1]
            set _flag_add --add
        else
            set _flag_show --show
        ...
14	14	-------> set -q argv[1]
17	17	-------> set _flag_add --add
18	18	-----> set -l abbr_scope
8	32	-----> if set -q _flag_global
        set abbr_scope --global
    else if set -q _flag_universal
        set abbr_scope --universal
    ...
12	12	------> set -q _flag_global
12	12	------> set -q _flag_universal
10	673	-----> if set -q _flag_add[1]
        __fish_abbr_add $argv
        return
    else if set -q _flag_erase[1]
        __fish_abbr_erase $argv
        return
    else if set -q _flag_rename[1]
        __fish_abbr_rename $argv
        return
    else if set -q _flag_list[1]
        __fish_abbr_list $argv
        return
    else if set -q _flag_show[1]
        __fish_abbr_show $argv
        return
    else if set -q _flag_query[1]
        # "--query": Check if abbrs exist.
        # If we don't have an argument, it's an automatic failure.
        set -q argv[1]; or return 1
        set -l escaped _fish_abbr_(string escape --style=var -- $argv)
        # We return 0 if any arg exists, whereas `set -q` returns the number of undefined arguments.
        # But we should be consistent with `type -q` and `command -q`.
        for var in $escaped
            set -q $escaped; and return 0
        end
        return 1
    else
        printf ( _ "%s: Could not figure out what to do!\n" ) abbr >&2
        return 127
    ...
14	14	------> set -q _flag_add[1]
52	635	------> __fish_abbr_add $argv
5	21	-------> if not set -q argv[2]
        printf ( _ "%s %s: Requires at least two arguments\n" ) abbr --add >&2
        return 1
    ...
16	16	--------> not set -q argv[2]
23	23	-------> set -l abbr_name $argv[1]
169	203	-------> set -l escaped_abbr_name (string escape -- $abbr_name)
34	34	--------> string escape -- $abbr_name
6	37	-------> if string match -q "* *" -- $abbr_name
        set -l msg ( _ "%s %s: Abbreviation %s cannot have spaces in the word\n" )
        printf $msg abbr --add $escaped_abbr_name >&2
        return 1
    ...
31	31	--------> string match -q "* *" -- $abbr_name
26	26	-------> set -l abbr_val "$argv[2..-1]"
155	189	-------> set -l abbr_var_name _fish_abbr_(string escape --style=var -- $abbr_name)
34	34	--------> string escape --style=var -- $abbr_name
5	26	-------> if not set -q $abbr_var_name
        # We default to the universal scope if the user didn't explicitly specify a scope and the
        # abbreviation isn't already defined.
        set -q abbr_scope[1]
        or set abbr_scope --universal
    ...
21	21	--------> not set -q $abbr_var_name
17	17	-------> true
41	41	-------> set $abbr_scope $abbr_var_name $abbr_val
14	14	------> return
156	212	--> set -l basename (string replace -r '^.*/' '' -- $file)
56	56	---> string replace -r '^.*/' '' -- $file
33	33	--> contains -- $basename $sourcelist
27	27	--> set sourcelist $sourcelist $basename
49	49	--> [ -f $file -a -r $file ]
103	6464	--> source $file
12	6361	---> if test -f /home/niklash/.autojump/share/autojump/autojump.fish; . /home/niklash/.autojump/share/autojump/autojump.fish; ...
29	29	----> test -f /home/niklash/.autojump/share/autojump/autojump.fish
26	6320	----> . /home/niklash/.autojump/share/autojump/autojump.fish
12	6294	-----> if [ (count $argv) -eq 0 ] && isatty 0
        echo "source: using source via '.' is deprecated, and stdin doesn't work."\n"Did you mean 'source' or './'?" >&2
        return 1
    else
        source $argv
    ...
176	319	------> [ (count $argv) -eq 0 ]
143	143	-------> count $argv
682	5963	------> source $argv
37	37	-------> set -gx AUTOJUMP_SOURCED 1
15	263	-------> if test -d ~/.autojump
    set -x PATH ~/.autojump/bin $PATH
...
38	38	--------> test -d ~/.autojump
210	210	--------> set -x PATH ~/.autojump/bin $PATH
6	25	-------> if not set -q OSTYPE
    set -gx OSTYPE (bash -c 'echo ${OSTYPE}')
...
19	19	--------> not set -q OSTYPE
129	129	-------> complete -x -c j -a '(autojump --complete (commandline -t))'
21	2477	-------> if test (uname) = "Darwin"
    set -gx AUTOJUMP_ERROR_PATH ~/Library/autojump/errors.log
else if test -d "$XDG_DATA_HOME"
    set -gx AUTOJUMP_ERROR_PATH $XDG_DATA_HOME/autojump/errors.log
else
    set -gx AUTOJUMP_ERROR_PATH ~/.local/share/autojump/errors.log
...
171	2389	--------> test (uname) = "Darwin"
2218	2218	---------> uname
29	29	--------> test -d "$XDG_DATA_HOME"
38	38	--------> set -gx AUTOJUMP_ERROR_PATH ~/.local/share/autojump/errors.log
9	2311	-------> if test ! -d (dirname $AUTOJUMP_ERROR_PATH)
    mkdir -p (dirname $AUTOJUMP_ERROR_PATH)
...
212	2302	--------> test ! -d (dirname $AUTOJUMP_ERROR_PATH)
2090	2090	---------> dirname $AUTOJUMP_ERROR_PATH
17	17	-------> function __aj_add --on-variable PWD
    status --is-command-substitution; and return
    autojump --add (pwd) >/dev/null 2>>$AUTOJUMP_ERROR_PATH &
...
7	7	-------> function __aj_err
    # TODO(ting|#247): set error file location
    echo -e $argv 1>&2; false
...
5	5	-------> function j
    switch "$argv"
        case '-*' '--*'
            autojump $argv
        case '*'
            set -l output (autojump $argv)
            # Check for . and attempt a regular cd
            if [ $output = "." ]
                cd $argv
            else
                if test -d "$output"
                    set_color red
                    echo $output
                    set_color normal
                    cd $output
                else
                    __aj_err "autojump: directory '"$argv"' not found"
                    __aj_err "\n$output\n"
                    __aj_err "Try `autojump --help` for more information."
                end
            end
    end
...
4	4	-------> function jc
    switch "$argv"
        case '-*'
            j $argv
        case '*'
            j (pwd) $argv
    end
...
3	3	-------> function jo
    set -l output (autojump $argv)
    if test -d "$output"
        switch $OSTYPE
            case 'linux*'
                xdg-open (autojump $argv)
            case 'darwin*'
                open (autojump $argv)
            case cygwin
                cygstart "" (cygpath -w -a (pwd))
            case '*'
                __aj_err "Unknown operating system: \"$OSTYPE\""
        end
    else
        __aj_err "autojump: directory '"$argv"' not found"
        __aj_err "\n$output\n"
        __aj_err "Try `autojump --help` for more information."
    end
...
3	3	-------> function jco
    switch "$argv"
        case '-*'
            j $argv
        case '*'
            jo (pwd) $argv
    end
...
235	311	--> set -l basename (string replace -r '^.*/' '' -- $file)
76	76	---> string replace -r '^.*/' '' -- $file
47	47	--> contains -- $basename $sourcelist
34	34	--> set sourcelist $sourcelist $basename
54	54	--> [ -f $file -a -r $file ]
211	227	--> source $file
16	16	---> function _nvm_uninstall -e nvm_uninstall
    if test -s "$nvm_config/version"
        read -l ver <$nvm_config/version
        if set -l i (contains -i -- "$nvm_config/$ver/bin" $fish_user_paths)
            set -e fish_user_paths[$i]
        end
        command rm -f $nvm_config/version
    end

    for name in (set -n | command awk '/^nvm_/')
        set -e "$name"
    end

    functions -e (functions -a | command awk '/^_nvm_/')
...
219	277	--> set -l basename (string replace -r '^.*/' '' -- $file)
58	58	---> string replace -r '^.*/' '' -- $file
48	48	--> contains -- $basename $sourcelist
35	35	--> set sourcelist $sourcelist $basename
55	55	--> [ -f $file -a -r $file ]
143	553168	--> source $file
23	23	---> set -q XDG_DATA_HOME
32	32	---> set -gx OMF_PATH "$HOME/.local/share/omf"
491	552970	---> source $OMF_PATH/init.fish
11	34	----> if not set -q OMF_CONFIG
  set -q XDG_CONFIG_HOME; or set -l XDG_CONFIG_HOME "$HOME/.config"
  set -gx OMF_CONFIG "$XDG_CONFIG_HOME/omf"
...
23	23	-----> not set -q OMF_CONFIG
31	31	----> test -f $OMF_CONFIG/before.init.fish
81	81	----> emit perf:timer:start "Oh My Fish initialisation"
27	27	----> test -f $OMF_CONFIG/theme
55	55	----> read -l theme < $OMF_CONFIG/theme
36	36	----> set -l core_function_path $OMF_PATH/lib{,/git}
395	395	----> set -l theme_function_path {$OMF_CONFIG,$OMF_PATH}/themes*/$theme{,/functions}
69	69	----> set fish_function_path $fish_function_path[1] \
                       $core_function_path \
                       $theme_function_path \
                       $fish_function_path[2..-1]
99	99	----> emit perf:timer:start "Oh My Fish init installed packages"
666	549956	----> require --path {$OMF_PATH,$OMF_CONFIG}/pkg/*
592	605	-----> source /home/niklash/.local/share/omf/lib/require.fish
13	13	------> function require
  set packages $argv

  if test -z "$packages"
    echo 'usage: require <name>...'
    echo '       require --path <path>...'
    echo '       require --no-bundle --path <path>...'
    return 1
  end

  # If bundle should be
  if set index (contains -i -- --no-bundle $packages)
    set -e packages[$index]
    set ignore_bundle
  end

  # Requiring absolute paths
  if set index (contains -i -- --path $packages)
    set -e packages[$index]
    set package_path $packages

  # Requiring specific packages from default paths
  else
    set package_path {$OMF_PATH,$OMF_CONFIG}/pkg*/$packages

    # Exit with error if no package paths were generated
    test -z "$package_path"
      and return 1
  end

  set function_path $package_path/functions*
  set complete_path $package_path/completions*
  set init_path $package_path/init.fish*
  set conf_path $package_path/conf.d/*.fish

  # Autoload functions
  test -n "$function_path"
    and set fish_function_path $fish_function_path[1] \
                               $function_path \
                               $fish_function_path[2..-1]

  # Autoload completions
  test -n "$complete_path"
    and set fish_complete_path $fish_complete_path[1] \
                               $complete_path \
                               $fish_complete_path[2..-1]

  for init in $init_path
    emit perf:timer:start $init
    set -l IFS '/'
    echo $init | read -la components

    set path (printf '/%s' $components[1..-2])

    contains $path $omf_init_path
      and continue

    set package $components[-2]

    if not set -q ignore_bundle
      set bundle $path/bundle
      set dependencies

      if test -f $bundle
        set -l IFS ' '
        while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
      end
    end

    source $init $path

    emit init_$package $path

    set -g omf_init_path $omf_init_path $path
    emit perf:timer:finish $init
  end

  for conf in $conf_path
    source $conf
  end

  return 0
...
82	82	-----> set packages $argv
7	53	-----> if test -z "$packages"
    echo 'usage: require <name>...'
    echo '       require --path <path>...'
    echo '       require --no-bundle --path <path>...'
    return 1
  ...
46	46	------> test -z "$packages"
10	386	-----> if set index (contains -i -- --no-bundle $packages)
    set -e packages[$index]
    set ignore_bundle
  ...
211	376	------> set index (contains -i -- --no-bundle $packages)
165	165	-------> contains -i -- --no-bundle $packages
25	442	-----> if set index (contains -i -- --path $packages)
    set -e packages[$index]
    set package_path $packages

  # Requiring specific packages from default paths
  else
    set package_path {$OMF_PATH,$OMF_CONFIG}/pkg*/$packages

    # Exit with error if no package paths were generated
    test -z "$package_path"
      and return 1
  ...
180	260	------> set index (contains -i -- --path $packages)
80	80	-------> contains -i -- --path $packages
60	60	------> set -e packages[$index]
97	97	------> set package_path $packages
1719	1719	-----> set function_path $package_path/functions*
1913	1913	-----> set complete_path $package_path/completions*
1481	1481	-----> set init_path $package_path/init.fish*
1240	1240	-----> set conf_path $package_path/conf.d/*.fish
48	48	-----> test -n "$function_path"
92	92	-----> set fish_function_path $fish_function_path[1] \
                               $function_path \
                               $fish_function_path[2..-1]
29	29	-----> test -n "$complete_path"
60	60	-----> set fish_complete_path $fish_complete_path[1] \
                               $complete_path \
                               $fish_complete_path[2..-1]
789	539921	-----> for init in $init_path
    emit perf:timer:start $init
    set -l IFS '/'
    echo $init | read -la components

    set path (printf '/%s' $components[1..-2])

    contains $path $omf_init_path
      and continue

    set package $components[-2]

    if not set -q ignore_bundle
      set bundle $path/bundle
      set dependencies

      if test -f $bundle
        set -l IFS ' '
        while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
      end
    end

    source $init $path

    emit init_$package $path

    set -g omf_init_path $omf_init_path $path
    emit perf:timer:finish $init
  ...
289	289	------> emit perf:timer:start $init
32	32	------> set -l IFS '/'
471	471	------> echo $init | read -la components
184	429	------> set path (printf '/%s' $components[1..-2])
245	245	-------> printf '/%s' $components[1..-2]
204	204	------> contains $path $omf_init_path
28	28	------> set package $components[-2]
14	110	------> if not set -q ignore_bundle
      set bundle $path/bundle
      set dependencies

      if test -f $bundle
        set -l IFS ' '
        while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
      end
    ...
17	17	-------> not set -q ignore_bundle
25	25	-------> set bundle $path/bundle
20	20	-------> set dependencies
6	34	-------> if test -f $bundle
        set -l IFS ' '
        while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
      ...
28	28	--------> test -f $bundle
379	803	------> source $init $path
36	36	-------> set paths $ANDROID_HOME/{tool?,platform-tool?}
9	388	-------> if test (count $paths) -gt 0
  set -l IFS /
  echo $paths[1] | read -la components
  set -e components[-1]
  printf '/%s' $components | read -l root

  set -gx PATH $PATH $paths
  set -gx ANDROID_HOME $root
...
157	379	--------> test (count $paths) -gt 0
222	222	---------> count $paths
40	40	------> emit init_$package $path
31	31	------> set -g omf_init_path $omf_init_path $path
27	27	------> emit perf:timer:finish $init
24	24	------> emit perf:timer:start $init
22	22	------> set -l IFS '/'
223	223	------> echo $init | read -la components
154	216	------> set path (printf '/%s' $components[1..-2])
62	62	-------> printf '/%s' $components[1..-2]
33	33	------> contains $path $omf_init_path
23	23	------> set package $components[-2]
15	105	------> if not set -q ignore_bundle
      set bundle $path/bundle
      set dependencies

      if test -f $bundle
        set -l IFS ' '
        while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
      end
    ...
16	16	-------> not set -q ignore_bundle
23	23	-------> set bundle $path/bundle
18	18	-------> set dependencies
4	33	-------> if test -f $bundle
        set -l IFS ' '
        while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
      ...
29	29	--------> test -f $bundle
179	14276	------> source $init $path
21	21	-------> set -q autojump_fish
32	32	-------> set -g autojump_fish ~/.autojump/share/autojump/autojump.fish
14	10241	-------> if test -f $autojump_fish
  . $autojump_fish
...
31	31	--------> test -f $autojump_fish
38	10196	--------> . $autojump_fish
20	10158	---------> if [ (count $argv) -eq 0 ] && isatty 0
        echo "source: using source via '.' is deprecated, and stdin doesn't work."\n"Did you mean 'source' or './'?" >&2
        return 1
    else
        source $argv
    ...
148	208	----------> [ (count $argv) -eq 0 ]
60	60	-----------> count $argv
724	9930	----------> source $argv
37	37	-----------> set -gx AUTOJUMP_SOURCED 1
15	260	-----------> if test -d ~/.autojump
    set -x PATH ~/.autojump/bin $PATH
...
36	36	------------> test -d ~/.autojump
209	209	------------> set -x PATH ~/.autojump/bin $PATH
7	26	-----------> if not set -q OSTYPE
    set -gx OSTYPE (bash -c 'echo ${OSTYPE}')
...
19	19	------------> not set -q OSTYPE
264	264	-----------> complete -x -c j -a '(autojump --complete (commandline -t))'
75	3959	-----------> if test (uname) = "Darwin"
    set -gx AUTOJUMP_ERROR_PATH ~/Library/autojump/errors.log
else if test -d "$XDG_DATA_HOME"
    set -gx AUTOJUMP_ERROR_PATH $XDG_DATA_HOME/autojump/errors.log
else
    set -gx AUTOJUMP_ERROR_PATH ~/.local/share/autojump/errors.log
...
262	3751	------------> test (uname) = "Darwin"
3489	3489	-------------> uname
60	60	------------> test -d "$XDG_DATA_HOME"
73	73	------------> set -gx AUTOJUMP_ERROR_PATH ~/.local/share/autojump/errors.log
23	4577	-----------> if test ! -d (dirname $AUTOJUMP_ERROR_PATH)
    mkdir -p (dirname $AUTOJUMP_ERROR_PATH)
...
373	4554	------------> test ! -d (dirname $AUTOJUMP_ERROR_PATH)
4181	4181	-------------> dirname $AUTOJUMP_ERROR_PATH
37	37	-----------> function __aj_add --on-variable PWD
    status --is-command-substitution; and return
    autojump --add (pwd) >/dev/null 2>>$AUTOJUMP_ERROR_PATH &
...
13	13	-----------> function __aj_err
    # TODO(ting|#247): set error file location
    echo -e $argv 1>&2; false
...
10	10	-----------> function j
    switch "$argv"
        case '-*' '--*'
            autojump $argv
        case '*'
            set -l output (autojump $argv)
            # Check for . and attempt a regular cd
            if [ $output = "." ]
                cd $argv
            else
                if test -d "$output"
                    set_color red
                    echo $output
                    set_color normal
                    cd $output
                else
                    __aj_err "autojump: directory '"$argv"' not found"
                    __aj_err "\n$output\n"
                    __aj_err "Try `autojump --help` for more information."
                end
            end
    end
...
8	8	-----------> function jc
    switch "$argv"
        case '-*'
            j $argv
        case '*'
            j (pwd) $argv
    end
...
7	7	-----------> function jo
    set -l output (autojump $argv)
    if test -d "$output"
        switch $OSTYPE
            case 'linux*'
                xdg-open (autojump $argv)
            case 'darwin*'
                open (autojump $argv)
            case cygwin
                cygstart "" (cygpath -w -a (pwd))
            case '*'
                __aj_err "Unknown operating system: \"$OSTYPE\""
        end
    else
        __aj_err "autojump: directory '"$argv"' not found"
        __aj_err "\n$output\n"
        __aj_err "Try `autojump --help` for more information."
    end
...
8	8	-----------> function jco
    switch "$argv"
        case '-*'
            j $argv
        case '*'
            jo (pwd) $argv
    end
...
40	3803	-------> if not which autojump >/dev/null ^/dev/null
  echo 'Autojump is not installed. Please install it first from https://github.com/wting/autojump#installation' >&2
...
3763	3763	--------> not which autojump >/dev/null ^/dev/null
132	132	------> emit init_$package $path
101	101	------> set -g omf_init_path $omf_init_path $path
82	82	------> emit perf:timer:finish $init
62	62	------> emit perf:timer:start $init
47	47	------> set -l IFS '/'
456	456	------> echo $init | read -la components
371	507	------> set path (printf '/%s' $components[1..-2])
136	136	-------> printf '/%s' $components[1..-2]
88	88	------> contains $path $omf_init_path
51	51	------> set package $components[-2]
30	209	------> if not set -q ignore_bundle
      set bundle $path/bundle
      set dependencies

      if test -f $bundle
        set -l IFS ' '
        while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
      end
    ...
32	32	-------> not set -q ignore_bundle
44	44	-------> set bundle $path/bundle
35	35	-------> set dependencies
10	68	-------> if test -f $bundle
        set -l IFS ' '
        while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
      ...
58	58	--------> test -f $bundle
207	259	------> source $init $path
52	52	-------> set -g __bak_re '(.*)\.[0-9]{8,8}_[0-9]{6,6}\.bak\/*$'
58	58	------> emit init_$package $path
52	52	------> set -g omf_init_path $omf_init_path $path
44	44	------> emit perf:timer:finish $init
41	41	------> emit perf:timer:start $init
37	37	------> set -l IFS '/'
377	377	------> echo $init | read -la components
239	355	------> set path (printf '/%s' $components[1..-2])
116	116	-------> printf '/%s' $components[1..-2]
65	65	------> contains $path $omf_init_path
72	72	------> set package $components[-2]
26	183	------> if not set -q ignore_bundle
      set bundle $path/bundle
      set dependencies

      if test -f $bundle
        set -l IFS ' '
        while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
      end
    ...
30	30	-------> not set -q ignore_bundle
38	38	-------> set bundle $path/bundle
31	31	-------> set dependencies
9	58	-------> if test -f $bundle
        set -l IFS ' '
        while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
      ...
49	49	--------> test -f $bundle
220	18884	------> source $init $path
51	18664	-------> if not which hub >/dev/null
  echo "Please install 'hub' first!"
else
  eval (hub alias -s)
  complete -c hub -w git
...
3731	3731	--------> not which hub >/dev/null
704	14827	--------> eval (hub alias -s)
9011	9011	---------> hub alias -s
784	5112	---------> alias git=hub
930	964	----------> source /usr/share/fish/functions/alias.fish
34	34	-----------> function alias --description 'Creates a function wrapping a command'
    set -l options 'h/help' 's/save'
    argparse -n alias --max-args=2 $options -- $argv
    or return

    if set -q _flag_help
        __fish_print_help alias
        return 0
    end

    set -l name
    set -l body
    set -l prefix
    set -l first_word
    set -l wrapped_cmd

    if not set -q argv[1]
        # Print the known aliases.
        for func in (functions -n)
            set -l output (functions $func | string match -r -- "^function .* --description 'alias (.*)'")
            if set -q output[2]
                set output (string replace -r -- '^'$func'[= ]' '' $output[2])
                echo alias $func (string escape -- $output[1])
            end
        end
        return 0
    else if not set -q argv[2]
        # Alias definition of the form "name=value".
        set -l tmp (string split -m 1 "=" -- $argv) ""
        set name $tmp[1]
        set body $tmp[2]
    else
        # Alias definition of the form "name value".
        set name $argv[1]
        set body $argv[2]
    end

    # sanity check
    if test -z "$name"
        printf ( _ "%s: Name cannot be empty\n") alias
        return 1
    else if test -z "$body"
        printf ( _ "%s: Body cannot be empty\n") alias
        return 1
    end

    # Extract the first command from the body.
    printf '%s\n' $body | read -lt first_word body

    # Prevent the alias from immediately running into an infinite recursion if
    # $body starts with the same command as $name.
    if test $first_word = $name
        if contains $name (builtin --names)
            set prefix builtin
        else
            set prefix command
        end
    end
    set -l cmd_string (string escape -- "alias $argv")
    set wrapped_cmd (string join ' ' -- $first_word $body | string escape)
    echo "function $name --wraps $wrapped_cmd --description $cmd_string; $prefix $first_word $body \$argv; end" | source
    if set -q _flag_save
        funcsave $name
    end
    #echo "function $name --wraps $wrapped_cmd --description $cmd_string; $prefix $first_word $body \$argv; end"
...
67	67	----------> set -l options 'h/help' 's/save'
74	74	----------> argparse -n alias --max-args=2 $options -- $argv
13	41	----------> if set -q _flag_help
        __fish_print_help alias
        return 0
    ...
28	28	-----------> set -q _flag_help
30	30	----------> set -l name
27	27	----------> set -l body
24	24	----------> set -l prefix
28	28	----------> set -l first_word
27	27	----------> set -l wrapped_cmd
42	938	----------> if not set -q argv[1]
        # Print the known aliases.
        for func in (functions -n)
            set -l output (functions $func | string match -r -- "^function .* --description 'alias (.*)'")
            if set -q output[2]
                set output (string replace -r -- '^'$func'[= ]' '' $output[2])
                echo alias $func (string escape -- $output[1])
            end
        end
        return 0
    else if not set -q argv[2]
        # Alias definition of the form "name=value".
        set -l tmp (string split -m 1 "=" -- $argv) ""
        set name $tmp[1]
        set body $tmp[2]
    else
        # Alias definition of the form "name value".
        set name $argv[1]
        set body $argv[2]
    ...
25	25	-----------> not set -q argv[1]
21	21	-----------> not set -q argv[2]
381	756	-----------> set -l tmp (string split -m 1 "=" -- $argv) ""
375	375	------------> string split -m 1 "=" -- $argv
58	58	-----------> set name $tmp[1]
36	36	-----------> set body $tmp[2]
17	84	----------> if test -z "$name"
        printf ( _ "%s: Name cannot be empty\n") alias
        return 1
    else if test -z "$body"
        printf ( _ "%s: Body cannot be empty\n") alias
        return 1
    ...
40	40	-----------> test -z "$name"
27	27	-----------> test -z "$body"
313	313	----------> printf '%s\n' $body | read -lt first_word body
18	86	----------> if test $first_word = $name
        if contains $name (builtin --names)
            set prefix builtin
        else
            set prefix command
        end
    ...
68	68	-----------> test $first_word = $name
339	420	----------> set -l cmd_string (string escape -- "alias $argv")
81	81	-----------> string escape -- "alias $argv"
356	751	----------> set wrapped_cmd (string join ' ' -- $first_word $body | string escape)
395	395	-----------> string join ' ' -- $first_word $body | string escape
368	405	----------> echo "function $name --wraps $wrapped_cmd --description $cmd_string; $prefix $first_word $body \$argv; end" | source
37	37	-----------> function git --wraps hub --description 'alias git=hub';  hub  $argv; ...
13	49	----------> if set -q _flag_save
        funcsave $name
    ...
36	36	-----------> set -q _flag_save
55	55	--------> complete -c hub -w git
58	58	------> emit init_$package $path
63	63	------> set -g omf_init_path $omf_init_path $path
43	43	------> emit perf:timer:finish $init
40	40	------> emit perf:timer:start $init
35	35	------> set -l IFS '/'
358	358	------> echo $init | read -la components
218	320	------> set path (printf '/%s' $components[1..-2])
102	102	-------> printf '/%s' $components[1..-2]
65	65	------> contains $path $omf_init_path
40	40	------> set package $components[-2]
24	174	------> if not set -q ignore_bundle
      set bundle $path/bundle
      set dependencies

      if test -f $bundle
        set -l IFS ' '
        while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
      end
    ...
26	26	-------> not set -q ignore_bundle
37	37	-------> set bundle $path/bundle
28	28	-------> set dependencies
9	59	-------> if test -f $bundle
        set -l IFS ' '
        while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
      ...
50	50	--------> test -f $bundle
396	1205	------> source $init $path
59	59	-------> set -l linuxbrew_bin_path "$HOME/.linuxbrew/bin"
42	42	-------> set -l linuxbrew_sbin_path "$HOME/.linuxbrew/sbin"
39	39	-------> set -l linuxbrew_manpath "$HOME/.linuxbrew/share/man"
36	36	-------> set -l linuxbrew_infopath "$HOME/.linuxbrew/share/info"
265	265	-------> contains -- $linuxbrew_bin_path $PATH
187	187	-------> contains -- $linuxbrew_sbin_path $PATH
26	26	-------> set -q MANPATH
92	92	-------> contains -- $linuxbrew_manpath $MANPATH
63	63	-------> contains -- $linuxbrew_infopath $INFOPATH
53	53	------> emit init_$package $path
55	55	------> set -g omf_init_path $omf_init_path $path
43	43	------> emit perf:timer:finish $init
42	42	------> emit perf:timer:start $init
36	36	------> set -l IFS '/'
355	355	------> echo $init | read -la components
260	359	------> set path (printf '/%s' $components[1..-2])
99	99	-------> printf '/%s' $components[1..-2]
76	76	------> contains $path $omf_init_path
52	52	------> set package $components[-2]
26	195	------> if not set -q ignore_bundle
      set bundle $path/bundle
      set dependencies

      if test -f $bundle
        set -l IFS ' '
        while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
      end
    ...
40	40	-------> not set -q ignore_bundle
43	43	-------> set bundle $path/bundle
30	30	-------> set dependencies
10	56	-------> if test -f $bundle
        set -l IFS ' '
        while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
      ...
46	46	--------> test -f $bundle
3524	190819	------> source $init $path
31	31	-------> status --is-interactive
-2606	187264	-------> source (nodenv init - | psub)
1731	82488	--------> nodenv init - | psub
823	858	---------> source /usr/share/fish/functions/psub.fish
35	35	----------> function psub --description "Read from stdin into a file and output the filename. Remove the file when the command that called psub exits."
    set -l options -x 'f,F' -x 'F,s' 'h/help' 'f/file' 'F/fifo' 's/suffix=' 'T-testing'
    argparse -n psub --max-args=0 $options -- $argv
    or return

    if set -q _flag_help
        __fish_print_help psub
        return 0
    end

    set -l dirname
    set -l filename
    set -l funcname

    if not status --is-command-substitution
        printf (_ "%s: Not inside of command substitution") psub >&2
        return 1
    end

    set -l tmpdir /tmp
    set -q TMPDIR
    and set tmpdir $TMPDIR

    if set -q _flag_fifo
        # Write output to pipe. This needs to be done in the background so
        # that the command substitution exits without needing to wait for
        # all the commands to exit.
        set dirname (mktemp -d $tmpdir/.psub.XXXXXXXXXX)
        or return
        set filename $dirname/psub.fifo"$_flag_suffix"
        command mkfifo $filename
        # Note that if we were to do the obvious `cat >$filename &`, we would deadlock
        # because $filename may be opened before the fork. Use tee to ensure it is opened
        # after the fork.
        command tee $filename >/dev/null &
    else if test -z "$_flag_suffix"
        set filename (mktemp $tmpdir/.psub.XXXXXXXXXX)
        command cat >$filename
    else
        set dirname (mktemp -d $tmpdir/.psub.XXXXXXXXXX)
        set filename "$dirname/psub$_flag_suffix"
        command cat >$filename
    end

    # Write filename to stdout
    echo $filename

    # This flag isn't documented. It's strictly for our unit tests.
    if set -q _flag_testing
        return
    end

    # Find unique function name
    while true
        set funcname __fish_psub_(random)
        if not functions $funcname >/dev/null 2>/dev/null
            break
        end
    end

    # Make sure we erase file when caller exits
    function $funcname --on-job-exit caller --inherit-variable filename --inherit-variable dirname --inherit-variable funcname
        command rm $filename
        if test -n "$dirname"
            command rmdir $dirname
        end
        functions -e $funcname
    end

...
84	84	---------> set -l options -x 'f,F' -x 'F,s' 'h/help' 'f/file' 'F/fifo' 's/suffix=' 'T-testing'
98	98	---------> argparse -n psub --max-args=0 $options -- $argv
10	34	---------> if set -q _flag_help
        __fish_print_help psub
        return 0
    ...
24	24	----------> set -q _flag_help
26	26	---------> set -l dirname
25	25	---------> set -l filename
22	22	---------> set -l funcname
7	29	---------> if not status --is-command-substitution
        printf (_ "%s: Not inside of command substitution") psub >&2
        return 1
    ...
22	22	----------> not status --is-command-substitution
26	26	---------> set -l tmpdir /tmp
18	18	---------> set -q TMPDIR
73	77082	---------> if set -q _flag_fifo
        # Write output to pipe. This needs to be done in the background so
        # that the command substitution exits without needing to wait for
        # all the commands to exit.
        set dirname (mktemp -d $tmpdir/.psub.XXXXXXXXXX)
        or return
        set filename $dirname/psub.fifo"$_flag_suffix"
        command mkfifo $filename
        # Note that if we were to do the obvious `cat >$filename &`, we would deadlock
        # because $filename may be opened before the fork. Use tee to ensure it is opened
        # after the fork.
        command tee $filename >/dev/null &
    else if test -z "$_flag_suffix"
        set filename (mktemp $tmpdir/.psub.XXXXXXXXXX)
        command cat >$filename
    else
        set dirname (mktemp -d $tmpdir/.psub.XXXXXXXXXX)
        set filename "$dirname/psub$_flag_suffix"
        command cat >$filename
    ...
17	17	----------> set -q _flag_fifo
29	29	----------> test -z "$_flag_suffix"
367	3471	----------> set filename (mktemp $tmpdir/.psub.XXXXXXXXXX)
3104	3104	-----------> mktemp $tmpdir/.psub.XXXXXXXXXX
73492	73492	----------> command cat >$filename
115	115	---------> echo $filename
15	51	---------> if set -q _flag_testing
        return
    ...
36	36	----------> set -q _flag_testing
36	2225	---------> while true
        set funcname __fish_psub_(random)
        if not functions $funcname >/dev/null 2>/dev/null
            break
        end
    ...
361	361	----------> true
419	876	----------> set funcname __fish_psub_(random)
457	457	-----------> random
29	952	----------> if not functions $funcname >/dev/null 2>/dev/null
            break
        ...
895	895	-----------> not functions $funcname >/dev/null 2>/dev/null
28	28	-----------> break
64	64	---------> function $funcname --on-job-exit caller --inherit-variable filename --inherit-variable dirname --inherit-variable funcname
        command rm $filename
        if test -n "$dirname"
            command rmdir $dirname
        end
        functions -e $funcname
    ...
478	478	--------> set -gx PATH '/home/niklash/.nodenv/shims' $PATH
51	51	--------> set -gx NODENV_SHELL fish
471	41481	--------> source '/home/linuxbrew/.linuxbrew/Cellar/nodenv/1.3.2/libexec/../completions/nodenv.fish'
20	20	---------> function __fish_nodenv_needs_command
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 -a $cmd[1] = 'nodenv' ]
    return 0
  end
  return 1
...
16	16	---------> function __fish_nodenv_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
...
109	109	---------> complete -f -c nodenv -n '__fish_nodenv_needs_command' -a '(nodenv commands)'
1123	40865	---------> for cmd in (nodenv commands)
  complete -f -c nodenv -n "__fish_nodenv_using_command $cmd" -a \
    "(nodenv completions (commandline -opc)[2..-1])"
...
37006	37006	----------> nodenv commands
198	198	----------> complete -f -c nodenv -n "__fish_nodenv_using_command $cmd" -a \
    "(nodenv completions (commandline -opc)[2..-1])"
126	126	----------> complete -f -c nodenv -n "__fish_nodenv_using_command $cmd" -a \
    "(nodenv completions (commandline -opc)[2..-1])"
112	112	----------> complete -f -c nodenv -n "__fish_nodenv_using_command $cmd" -a \
    "(nodenv completions (commandline -opc)[2..-1])"
102	102	----------> complete -f -c nodenv -n "__fish_nodenv_using_command $cmd" -a \
    "(nodenv completions (commandline -opc)[2..-1])"
96	96	----------> complete -f -c nodenv -n "__fish_nodenv_using_command $cmd" -a \
    "(nodenv completions (commandline -opc)[2..-1])"
96	96	----------> complete -f -c nodenv -n "__fish_nodenv_using_command $cmd" -a \
    "(nodenv completions (commandline -opc)[2..-1])"
95	95	----------> complete -f -c nodenv -n "__fish_nodenv_using_command $cmd" -a \
    "(nodenv completions (commandline -opc)[2..-1])"
96	96	----------> complete -f -c nodenv -n "__fish_nodenv_using_command $cmd" -a \
    "(nodenv completions (commandline -opc)[2..-1])"
95	95	----------> complete -f -c nodenv -n "__fish_nodenv_using_command $cmd" -a \
    "(nodenv completions (commandline -opc)[2..-1])"
96	96	----------> complete -f -c nodenv -n "__fish_nodenv_using_command $cmd" -a \
    "(nodenv completions (commandline -opc)[2..-1])"
103	103	----------> complete -f -c nodenv -n "__fish_nodenv_using_command $cmd" -a \
    "(nodenv completions (commandline -opc)[2..-1])"
96	96	----------> complete -f -c nodenv -n "__fish_nodenv_using_command $cmd" -a \
    "(nodenv completions (commandline -opc)[2..-1])"
95	95	----------> complete -f -c nodenv -n "__fish_nodenv_using_command $cmd" -a \
    "(nodenv completions (commandline -opc)[2..-1])"
96	96	----------> complete -f -c nodenv -n "__fish_nodenv_using_command $cmd" -a \
    "(nodenv completions (commandline -opc)[2..-1])"
95	95	----------> complete -f -c nodenv -n "__fish_nodenv_using_command $cmd" -a \
    "(nodenv completions (commandline -opc)[2..-1])"
98	98	----------> complete -f -c nodenv -n "__fish_nodenv_using_command $cmd" -a \
    "(nodenv completions (commandline -opc)[2..-1])"
130	130	----------> complete -f -c nodenv -n "__fish_nodenv_using_command $cmd" -a \
    "(nodenv completions (commandline -opc)[2..-1])"
101	101	----------> complete -f -c nodenv -n "__fish_nodenv_using_command $cmd" -a \
    "(nodenv completions (commandline -opc)[2..-1])"
99	99	----------> complete -f -c nodenv -n "__fish_nodenv_using_command $cmd" -a \
    "(nodenv completions (commandline -opc)[2..-1])"
98	98	----------> complete -f -c nodenv -n "__fish_nodenv_using_command $cmd" -a \
    "(nodenv completions (commandline -opc)[2..-1])"
97	97	----------> complete -f -c nodenv -n "__fish_nodenv_using_command $cmd" -a \
    "(nodenv completions (commandline -opc)[2..-1])"
96	96	----------> complete -f -c nodenv -n "__fish_nodenv_using_command $cmd" -a \
    "(nodenv completions (commandline -opc)[2..-1])"
96	96	----------> complete -f -c nodenv -n "__fish_nodenv_using_command $cmd" -a \
    "(nodenv completions (commandline -opc)[2..-1])"
96	96	----------> complete -f -c nodenv -n "__fish_nodenv_using_command $cmd" -a \
    "(nodenv completions (commandline -opc)[2..-1])"
130	130	----------> complete -f -c nodenv -n "__fish_nodenv_using_command $cmd" -a \
    "(nodenv completions (commandline -opc)[2..-1])"
98	98	----------> complete -f -c nodenv -n "__fish_nodenv_using_command $cmd" -a \
    "(nodenv completions (commandline -opc)[2..-1])"
62053	62053	--------> command nodenv rehash 2>/dev/null
38	38	--------> function nodenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell
    source (nodenv "sh-$command" $argv|psub)
  case '*'
    command nodenv "$command" $argv
  end
...
108	3281	--------> __fish_psub_29858 JOB_EXIT 5 0
2782	2782	---------> command rm $filename
8	306	---------> if test -n "$dirname"
            command rmdir $dirname
        ...
298	298	----------> test -n "$dirname"
85	85	---------> functions -e $funcname
73	73	------> emit init_$package $path
81	81	------> set -g omf_init_path $omf_init_path $path
47	47	------> emit perf:timer:finish $init
44	44	------> emit perf:timer:start $init
39	39	------> set -l IFS '/'
323	323	------> echo $init | read -la components
237	348	------> set path (printf '/%s' $components[1..-2])
111	111	-------> printf '/%s' $components[1..-2]
76	76	------> contains $path $omf_init_path
42	42	------> set package $components[-2]
24	4071	------> if not set -q ignore_bundle
      set bundle $path/bundle
      set dependencies

      if test -f $bundle
        set -l IFS ' '
        while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
      end
    ...
27	27	-------> not set -q ignore_bundle
38	38	-------> set bundle $path/bundle
29	29	-------> set dependencies
23	3953	-------> if test -f $bundle
        set -l IFS ' '
        while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
      ...
51	51	--------> test -f $bundle
40	40	--------> set -l IFS ' '
86	3839	--------> while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
73	73	---------> read -l type dependency
38	38	---------> test "$type" != package
572	3551	---------> require "$dependency"
943	964	----------> source /home/niklash/.local/share/omf/lib/require.fish
21	21	-----------> function require
  set packages $argv

  if test -z "$packages"
    echo 'usage: require <name>...'
    echo '       require --path <path>...'
    echo '       require --no-bundle --path <path>...'
    return 1
  end

  # If bundle should be
  if set index (contains -i -- --no-bundle $packages)
    set -e packages[$index]
    set ignore_bundle
  end

  # Requiring absolute paths
  if set index (contains -i -- --path $packages)
    set -e packages[$index]
    set package_path $packages

  # Requiring specific packages from default paths
  else
    set package_path {$OMF_PATH,$OMF_CONFIG}/pkg*/$packages

    # Exit with error if no package paths were generated
    test -z "$package_path"
      and return 1
  end

  set function_path $package_path/functions*
  set complete_path $package_path/completions*
  set init_path $package_path/init.fish*
  set conf_path $package_path/conf.d/*.fish

  # Autoload functions
  test -n "$function_path"
    and set fish_function_path $fish_function_path[1] \
                               $function_path \
                               $fish_function_path[2..-1]

  # Autoload completions
  test -n "$complete_path"
    and set fish_complete_path $fish_complete_path[1] \
                               $complete_path \
                               $fish_complete_path[2..-1]

  for init in $init_path
    emit perf:timer:start $init
    set -l IFS '/'
    echo $init | read -la components

    set path (printf '/%s' $components[1..-2])

    contains $path $omf_init_path
      and continue

    set package $components[-2]

    if not set -q ignore_bundle
      set bundle $path/bundle
      set dependencies

      if test -f $bundle
        set -l IFS ' '
        while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
      end
    end

    source $init $path

    emit init_$package $path

    set -g omf_init_path $omf_init_path $path
    emit perf:timer:finish $init
  end

  for conf in $conf_path
    source $conf
  end

  return 0
...
52	52	----------> set packages $argv
11	45	----------> if test -z "$packages"
    echo 'usage: require <name>...'
    echo '       require --path <path>...'
    echo '       require --no-bundle --path <path>...'
    return 1
  ...
34	34	-----------> test -z "$packages"
11	279	----------> if set index (contains -i -- --no-bundle $packages)
    set -e packages[$index]
    set ignore_bundle
  ...
199	268	-----------> set index (contains -i -- --no-bundle $packages)
69	69	------------> contains -i -- --no-bundle $packages
28	768	----------> if set index (contains -i -- --path $packages)
    set -e packages[$index]
    set package_path $packages

  # Requiring specific packages from default paths
  else
    set package_path {$OMF_PATH,$OMF_CONFIG}/pkg*/$packages

    # Exit with error if no package paths were generated
    test -z "$package_path"
      and return 1
  ...
190	253	-----------> set index (contains -i -- --path $packages)
63	63	------------> contains -i -- --path $packages
449	449	-----------> set package_path {$OMF_PATH,$OMF_CONFIG}/pkg*/$packages
38	38	-----------> test -z "$package_path"
147	147	----------> set function_path $package_path/functions*
133	133	----------> set complete_path $package_path/completions*
139	139	----------> set init_path $package_path/init.fish*
167	167	----------> set conf_path $package_path/conf.d/*.fish
34	34	----------> test -n "$function_path"
141	141	----------> set fish_function_path $fish_function_path[1] \
                               $function_path \
                               $fish_function_path[2..-1]
33	33	----------> test -n "$complete_path"
34	34	----------> for init in $init_path
    emit perf:timer:start $init
    set -l IFS '/'
    echo $init | read -la components

    set path (printf '/%s' $components[1..-2])

    contains $path $omf_init_path
      and continue

    set package $components[-2]

    if not set -q ignore_bundle
      set bundle $path/bundle
      set dependencies

      if test -f $bundle
        set -l IFS ' '
        while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
      end
    end

    source $init $path

    emit init_$package $path

    set -g omf_init_path $omf_init_path $path
    emit perf:timer:finish $init
  ...
24	24	----------> for conf in $conf_path
    source $conf
  ...
19	19	----------> return 0
49	49	---------> set dependencies $dependencies $dependency
42	42	---------> read -l type dependency
644	675	------> source $init $path
31	31	-------> function init -a path --on-event init_nvm
  if type -q fenv
    set -q NVM_DIR; or set -gx NVM_DIR ~/.nvm
    set -g nvm_prefix $NVM_DIR

    type -q brew;
      and test -e (brew --prefix)/Cellar/nvm;
        and set -g nvm_prefix (brew --prefix nvm)

    fenv source $nvm_prefix/nvm.sh >/dev/null 2>&1
  end

...
376	56521	------> emit init_$package $path
87	56145	-------> init /home/niklash/.local/share/omf/pkg/nvm
32	56058	--------> if type -q fenv
    set -q NVM_DIR; or set -gx NVM_DIR ~/.nvm
    set -g nvm_prefix $NVM_DIR

    type -q brew;
      and test -e (brew --prefix)/Cellar/nvm;
        and set -g nvm_prefix (brew --prefix nvm)

    fenv source $nvm_prefix/nvm.sh >/dev/null 2>&1
  ...
622	3857	---------> type -q fenv
1330	1355	----------> source /usr/share/fish/functions/type.fish
25	25	-----------> function type --description 'Print the type of a command'
    # For legacy reasons, no argument simply causes an unsuccessful return.
    set -q argv[1]
    or return 1

    set -l options 'h/help' 'a/all' 's/short' 'f/no-functions' 't/type' 'p/path' 'P/force-path' 'q/quiet'
    argparse -n type -x t,p,P $options -- $argv
    or return

    if set -q _flag_help
        __fish_print_help type
        return 0
    end

    set -l res 1
    set -l mode normal
    set -l multi no
    set -l selection all
    set -l short no

    # Technically all four of these flags are mutually exclusive. However, we allow -q to be used
    # with the other three because old versions of this function explicitly allowed it by making
    # --quiet have precedence.
    if set -q _flag_quiet
        set mode quiet
    else if set -q _flag_type
        set mode type
    else if set -q _flag_path
        set mode path
    else if set -q _flag_force_path
        set mode path
        set selection files
    end

    set -q _flag_all
    and set multi yes

    set -q _flag_short
    and set short yes

    set -q _flag_no_functions
    and set selection files

    # Check all possible types for the remaining arguments.
    for i in $argv
        # Found will be set to 1 if a match is found.
        set -l found 0

        if test $selection != files
            if functions -q -- $i
                set res 0
                set found 1
                switch $mode
                    case normal
                        printf (_ '%s is a function') $i
                        if test $short != yes
                            echo (_ ' with definition')
                            functions $i
                        else
                            set -l func_path (functions --details $i)
                            if not contains -- $func_path - stdin
                                printf (_ ' (defined in %s)') $func_path
                            end
                            echo
                        end
                    case type
                        echo (_ 'function')
                    case path
                        set -l func_path (functions --details $i)
                        switch $func_path
                            case "-"
                            case "n/a"
                            case "stdin"
                                break
                            case "*"
                                echo $func_path
                        end
                end
                if test $multi != yes
                    continue
                end
            end

            if contains -- $i (builtin -n)
                set res 0
                set found 1
                switch $mode
                    case normal
                        printf (_ '%s is a builtin\n') $i

                    case type
                        echo (_ 'builtin')
                end
                if test $multi != yes
                    continue
                end
            end
        end

        set -l paths
        if test $multi != yes
            set paths (command -s -- $i)
        else
            set paths (command -sa -- $i)
        end
        for path in $paths
            set res 0
            set found 1
            switch $mode
                case normal
                    printf (_ '%s is %s\n') $i $path
                case type
                    echo (_ 'file')
                case path
                    echo $path
            end
            if test $multi != yes
                continue
            end
        end

        if test $found = 0
            and test $mode != quiet
            and test $mode != path
            printf (_ "%s: Could not find '%s'\n") type $i >&2
        end
    end

    return $res
...
40	40	----------> set -q argv[1]
64	64	----------> set -l options 'h/help' 'a/all' 's/short' 'f/no-functions' 't/type' 'p/path' 'P/force-path' 'q/quiet'
115	115	----------> argparse -n type -x t,p,P $options -- $argv
5	31	----------> if set -q _flag_help
        __fish_print_help type
        return 0
    ...
26	26	-----------> set -q _flag_help
30	30	----------> set -l res 1
29	29	----------> set -l mode normal
26	26	----------> set -l multi no
28	28	----------> set -l selection all
24	24	----------> set -l short no
13	60	----------> if set -q _flag_quiet
        set mode quiet
    else if set -q _flag_type
        set mode type
    else if set -q _flag_path
        set mode path
    else if set -q _flag_force_path
        set mode path
        set selection files
    ...
21	21	-----------> set -q _flag_quiet
26	26	-----------> set mode quiet
22	22	----------> set -q _flag_all
19	19	----------> set -q _flag_short
19	19	----------> set -q _flag_no_functions
42	1341	----------> for i in $argv
        # Found will be set to 1 if a match is found.
        set -l found 0

        if test $selection != files
            if functions -q -- $i
                set res 0
                set found 1
                switch $mode
                    case normal
                        printf (_ '%s is a function') $i
                        if test $short != yes
                            echo (_ ' with definition')
                            functions $i
                        else
                            set -l func_path (functions --details $i)
                            if not contains -- $func_path - stdin
                                printf (_ ' (defined in %s)') $func_path
                            end
                            echo
                        end
                    case type
                        echo (_ 'function')
                    case path
                        set -l func_path (functions --details $i)
                        switch $func_path
                            case "-"
                            case "n/a"
                            case "stdin"
                                break
                            case "*"
                                echo $func_path
                        end
                end
                if test $multi != yes
                    continue
                end
            end

            if contains -- $i (builtin -n)
                set res 0
                set found 1
                switch $mode
                    case normal
                        printf (_ '%s is a builtin\n') $i

                    case type
                        echo (_ 'builtin')
                end
                if test $multi != yes
                    continue
                end
            end
        end

        set -l paths
        if test $multi != yes
            set paths (command -s -- $i)
        else
            set paths (command -sa -- $i)
        end
        for path in $paths
            set res 0
            set found 1
            switch $mode
                case normal
                    printf (_ '%s is %s\n') $i $path
                case type
                    echo (_ 'file')
                case path
                    echo $path
            end
            if test $multi != yes
                continue
            end
        end

        if test $found = 0
            and test $mode != quiet
            and test $mode != path
            printf (_ "%s: Could not find '%s'\n") type $i >&2
        end
    ...
29	29	-----------> set -l found 0
11	1270	-----------> if test $selection != files
            if functions -q -- $i
                set res 0
                set found 1
                switch $mode
                    case normal
                        printf (_ '%s is a function') $i
                        if test $short != yes
                            echo (_ ' with definition')
                            functions $i
                        else
                            set -l func_path (functions --details $i)
                            if not contains -- $func_path - stdin
                                printf (_ ' (defined in %s)') $func_path
                            end
                            echo
                        end
                    case type
                        echo (_ 'function')
                    case path
                        set -l func_path (functions --details $i)
                        switch $func_path
                            case "-"
                            case "n/a"
                            case "stdin"
                                break
                            case "*"
                                echo $func_path
                        end
                end
                if test $multi != yes
                    continue
                end
            end

            if contains -- $i (builtin -n)
                set res 0
                set found 1
                switch $mode
                    case normal
                        printf (_ '%s is a builtin\n') $i

                    case type
                        echo (_ 'builtin')
                end
                if test $multi != yes
                    continue
                end
            end
        ...
36	36	------------> test $selection != files
26	1223	------------> if functions -q -- $i
                set res 0
                set found 1
                switch $mode
                    case normal
                        printf (_ '%s is a function') $i
                        if test $short != yes
                            echo (_ ' with definition')
                            functions $i
                        else
                            set -l func_path (functions --details $i)
                            if not contains -- $func_path - stdin
                                printf (_ ' (defined in %s)') $func_path
                            end
                            echo
                        end
                    case type
                        echo (_ 'function')
                    case path
                        set -l func_path (functions --details $i)
                        switch $func_path
                            case "-"
                            case "n/a"
                            case "stdin"
                                break
                            case "*"
                                echo $func_path
                        end
                end
                if test $multi != yes
                    continue
                end
            ...
549	1018	-------------> functions -q -- $i
443	469	--------------> source /home/niklash/.local/share/omf/pkg/foreign-env/functions/fenv.fish
26	26	---------------> function fenv -d "Run bash scripts and import variables modified by them"
  if test (count $argv) -gt 0
    if test -z (echo $argv | sed 's/[ \t]//g')
      return 0
    end

    fenv.main $argv
    return $status
  else
    echo (set_color red)'error:' (set_color normal)'parameter missing'
    echo (set_color cyan)'usage:' (set_color normal)'fenv <bash command>'
    return 23  # EINVAL
  end
...
53	53	-------------> set res 0
30	30	-------------> set found 1
24	24	-------------> switch $mode
                    case normal
                        printf (_ '%s is a function') $i
                        if test $short != yes
                            echo (_ ' with definition')
                            functions $i
                        else
                            set -l func_path (functions --details $i)
                            if not contains -- $func_path - stdin
                                printf (_ ' (defined in %s)') $func_path
                            end
                            echo
                        end
                    case type
                        echo (_ 'function')
                    case path
                        set -l func_path (functions --details $i)
                        switch $func_path
                            case "-"
                            case "n/a"
                            case "stdin"
                                break
                            case "*"
                                echo $func_path
                        end
                ...
17	72	-------------> if test $multi != yes
                    continue
                ...
35	35	--------------> test $multi != yes
20	20	--------------> continue
32	32	----------> return $res
26	26	---------> set -q NVM_DIR
41	41	---------> set -g nvm_prefix $NVM_DIR
183	2616	---------> type -q brew
27	27	----------> set -q argv[1]
60	60	----------> set -l options 'h/help' 'a/all' 's/short' 'f/no-functions' 't/type' 'p/path' 'P/force-path' 'q/quiet'
105	105	----------> argparse -n type -x t,p,P $options -- $argv
4	30	----------> if set -q _flag_help
        __fish_print_help type
        return 0
    ...
26	26	-----------> set -q _flag_help
28	28	----------> set -l res 1
27	27	----------> set -l mode normal
25	25	----------> set -l multi no
25	25	----------> set -l selection all
23	23	----------> set -l short no
14	59	----------> if set -q _flag_quiet
        set mode quiet
    else if set -q _flag_type
        set mode type
    else if set -q _flag_path
        set mode path
    else if set -q _flag_force_path
        set mode path
        set selection files
    ...
20	20	-----------> set -q _flag_quiet
25	25	-----------> set mode quiet
22	22	----------> set -q _flag_all
19	19	----------> set -q _flag_short
18	18	----------> set -q _flag_no_functions
60	1936	----------> for i in $argv
        # Found will be set to 1 if a match is found.
        set -l found 0

        if test $selection != files
            if functions -q -- $i
                set res 0
                set found 1
                switch $mode
                    case normal
                        printf (_ '%s is a function') $i
                        if test $short != yes
                            echo (_ ' with definition')
                            functions $i
                        else
                            set -l func_path (functions --details $i)
                            if not contains -- $func_path - stdin
                                printf (_ ' (defined in %s)') $func_path
                            end
                            echo
                        end
                    case type
                        echo (_ 'function')
                    case path
                        set -l func_path (functions --details $i)
                        switch $func_path
                            case "-"
                            case "n/a"
                            case "stdin"
                                break
                            case "*"
                                echo $func_path
                        end
                end
                if test $multi != yes
                    continue
                end
            end

            if contains -- $i (builtin -n)
                set res 0
                set found 1
                switch $mode
                    case normal
                        printf (_ '%s is a builtin\n') $i

                    case type
                        echo (_ 'builtin')
                end
                if test $multi != yes
                    continue
                end
            end
        end

        set -l paths
        if test $multi != yes
            set paths (command -s -- $i)
        else
            set paths (command -sa -- $i)
        end
        for path in $paths
            set res 0
            set found 1
            switch $mode
                case normal
                    printf (_ '%s is %s\n') $i $path
                case type
                    echo (_ 'file')
                case path
                    echo $path
            end
            if test $multi != yes
                continue
            end
        end

        if test $found = 0
            and test $mode != quiet
            and test $mode != path
            printf (_ "%s: Could not find '%s'\n") type $i >&2
        end
    ...
29	29	-----------> set -l found 0
20	1222	-----------> if test $selection != files
            if functions -q -- $i
                set res 0
                set found 1
                switch $mode
                    case normal
                        printf (_ '%s is a function') $i
                        if test $short != yes
                            echo (_ ' with definition')
                            functions $i
                        else
                            set -l func_path (functions --details $i)
                            if not contains -- $func_path - stdin
                                printf (_ ' (defined in %s)') $func_path
                            end
                            echo
                        end
                    case type
                        echo (_ 'function')
                    case path
                        set -l func_path (functions --details $i)
                        switch $func_path
                            case "-"
                            case "n/a"
                            case "stdin"
                                break
                            case "*"
                                echo $func_path
                        end
                end
                if test $multi != yes
                    continue
                end
            end

            if contains -- $i (builtin -n)
                set res 0
                set found 1
                switch $mode
                    case normal
                        printf (_ '%s is a builtin\n') $i

                    case type
                        echo (_ 'builtin')
                end
                if test $multi != yes
                    continue
                end
            end
        ...
34	34	------------> test $selection != files
5	343	------------> if functions -q -- $i
                set res 0
                set found 1
                switch $mode
                    case normal
                        printf (_ '%s is a function') $i
                        if test $short != yes
                            echo (_ ' with definition')
                            functions $i
                        else
                            set -l func_path (functions --details $i)
                            if not contains -- $func_path - stdin
                                printf (_ ' (defined in %s)') $func_path
                            end
                            echo
                        end
                    case type
                        echo (_ 'function')
                    case path
                        set -l func_path (functions --details $i)
                        switch $func_path
                            case "-"
                            case "n/a"
                            case "stdin"
                                break
                            case "*"
                                echo $func_path
                        end
                end
                if test $multi != yes
                    continue
                end
            ...
338	338	-------------> functions -q -- $i
7	825	------------> if contains -- $i (builtin -n)
                set res 0
                set found 1
                switch $mode
                    case normal
                        printf (_ '%s is a builtin\n') $i

                    case type
                        echo (_ 'builtin')
                end
                if test $multi != yes
                    continue
                end
            ...
706	818	-------------> contains -- $i (builtin -n)
112	112	--------------> builtin -n
41	41	-----------> set -l paths
15	364	-----------> if test $multi != yes
            set paths (command -s -- $i)
        else
            set paths (command -sa -- $i)
        ...
37	37	------------> test $multi != yes
202	312	------------> set paths (command -s -- $i)
110	110	-------------> command -s -- $i
46	187	-----------> for path in $paths
            set res 0
            set found 1
            switch $mode
                case normal
                    printf (_ '%s is %s\n') $i $path
                case type
                    echo (_ 'file')
                case path
                    echo $path
            end
            if test $multi != yes
                continue
            end
        ...
35	35	------------> set res 0
28	28	------------> set found 1
18	18	------------> switch $mode
                case normal
                    printf (_ '%s is %s\n') $i $path
                case type
                    echo (_ 'file')
                case path
                    echo $path
            ...
10	60	------------> if test $multi != yes
                continue
            ...
30	30	-------------> test $multi != yes
20	20	-------------> continue
5	33	-----------> if test $found = 0
            and test $mode != quiet
            and test $mode != path
            printf (_ "%s: Could not find '%s'\n") type $i >&2
        ...
28	28	------------> test $found = 0
29	29	----------> return $res
266	26928	---------> test -e (brew --prefix)/Cellar/nvm
26662	26662	----------> brew --prefix
177	22558	---------> fenv source $nvm_prefix/nvm.sh >/dev/null 2>&1
27	22381	----------> if test (count $argv) -gt 0
    if test -z (echo $argv | sed 's/[ \t]//g')
      return 0
    end

    fenv.main $argv
    return $status
  else
    echo (set_color red)'error:' (set_color normal)'parameter missing'
    echo (set_color cyan)'usage:' (set_color normal)'fenv <bash command>'
    return 23  # EINVAL
  ...
234	610	-----------> test (count $argv) -gt 0
376	376	------------> count $argv
8	4645	-----------> if test -z (echo $argv | sed 's/[ \t]//g')
      return 0
    ...
249	4637	------------> test -z (echo $argv | sed 's/[ \t]//g')
4388	4388	-------------> echo $argv | sed 's/[ \t]//g'
507	17021	-----------> fenv.main $argv
650	666	------------> source /home/niklash/.local/share/omf/pkg/foreign-env/functions/fenv.main.fish
16	16	-------------> function fenv.main
  set program $argv
  set divider (fenv.parse.divider)
  set previous_env (bash -c 'env')

  # Need to ensure that the two calls to env (here and above) have the same
  # nesting level within bash shells so that the SHLVL variable does not differ.
  set program_execution (bash -c "$program && echo && echo '$divider' && env" 2>&1)
  set program_status $status

  if not contains -- "$divider" $program_execution
    printf '%s\n' $program_execution
    return $program_status
  end

  set program_output (fenv.parse.before $program_execution)

  if test $program_status != 0
    printf "%s\n" $program_output
    return $program_status
  end

  set new_env (fenv.parse.after $program_execution)

  fenv.apply (fenv.parse.diff $previous_env $divider $new_env)

  test (count $program_output) -gt 1
    and printf "%s\n" $program_output[1..-2]
    or  printf $program_output
  return $program_status
...
68	68	------------> set program $argv
333	1133	------------> set divider (fenv.parse.divider)
444	800	-------------> fenv.parse.divider
269	284	--------------> source /home/niklash/.local/share/omf/pkg/foreign-env/functions/fenv.parse.divider.fish
15	15	---------------> function fenv.parse.divider
    echo '---DIVIDER---'
...
72	72	--------------> echo '---DIVIDER---'
1791	8380	------------> set previous_env (bash -c 'env')
6589	6589	-------------> bash -c 'env'
365	5556	------------> set program_execution (bash -c "$program && echo && echo '$divider' && env" 2>&1)
5191	5191	-------------> bash -c "$program && echo && echo '$divider' && env" 2>&1
58	58	------------> set program_status $status
25	653	------------> if not contains -- "$divider" $program_execution
    printf '%s\n' $program_execution
    return $program_status
  ...
72	72	-------------> not contains -- "$divider" $program_execution
511	511	-------------> printf '%s\n' $program_execution
45	45	-------------> return $program_status
78	78	-----------> return $status
96	96	------> set -g omf_init_path $omf_init_path $path
55	55	------> emit perf:timer:finish $init
47	47	------> emit perf:timer:start $init
39	39	------> set -l IFS '/'
417	417	------> echo $init | read -la components
342	468	------> set path (printf '/%s' $components[1..-2])
126	126	-------> printf '/%s' $components[1..-2]
95	95	------> contains $path $omf_init_path
49	49	------> set package $components[-2]
27	187	------> if not set -q ignore_bundle
      set bundle $path/bundle
      set dependencies

      if test -f $bundle
        set -l IFS ' '
        while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
      end
    ...
29	29	-------> not set -q ignore_bundle
40	40	-------> set bundle $path/bundle
30	30	-------> set dependencies
10	61	-------> if test -f $bundle
        set -l IFS ' '
        while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
      ...
51	51	--------> test -f $bundle
369	11266	------> source $init $path
49	49	-------> set -g OMF_MISSING_ARG   1
33	33	-------> set -g OMF_UNKNOWN_OPT   2
34	34	-------> set -g OMF_INVALID_ARG   3
44	44	-------> set -g OMF_UNKNOWN_ERR   4
24	24	-------> function omf::em
  set_color cyan 2> /dev/null
...
14	14	-------> function omf::dim
  set_color 555 2> /dev/null
...
12	12	-------> function omf::err
  set_color red --bold 2> /dev/null
...
12	12	-------> function omf::under
  set_color --underline 2> /dev/null
...
11	11	-------> function omf::off
  set_color normal 2> /dev/null
...
740	10664	-------> autoload $path/functions/{compat,core,index,packages,themes,bundle,util,repo,cli,search}
844	891	--------> source /home/niklash/.local/share/omf/lib/autoload.fish
20	20	---------> function autoload
  switch "$argv[1]"
  case '-e' '--erase'
    test (count $argv) -ge 2
      and __autoload_erase $argv[2..-1]
      or echo "usage: autoload $argv[1] <path>..." >&2
  case "-*" "--*"
    echo "autoload: invalid option $argv[1]"
    return 1
  case '*'
    test (count $argv) -ge 1
      and __autoload_insert $argv
      or echo "usage: autoload <path>..." >&2
  end
...
15	15	---------> function __autoload_insert
  set -l function_path
  set -l complete_path
  for path in $argv
    not test -d "$path"; and continue
    set -l IFS '/'
    echo $path | read -la components
    if test "x$components[-1]" = xcompletions
      contains -- $path $fish_complete_path
        or set complete_path $complete_path $path
    else
      contains -- $path $fish_function_path
        or set function_path $function_path $path
    end;
  end;
  test -n "$function_path"
    and set fish_function_path $fish_function_path[1] $function_path $fish_function_path[2..-1]
  test -n "$complete_path"
    and set fish_complete_path $fish_complete_path[1] $complete_path $fish_complete_path[2..-1]
  return 0
...
12	12	---------> function __autoload_erase
  set -l function_indexes
  set -l complete_indexes
  for path in $argv
    set -l IFS '/'
    echo $path | read -la components
    test "x$components[-1]" = xcompletions
      and set complete_indexes $complete_indexes (contains -i $path $fish_complete_path)
      or  set function_indexes $function_indexes (contains -i $path $fish_function_path)
  end;
  test -n "$function_indexes"
    and set -e fish_function_path["$function_indexes"]
  test -n "$complete_indexes"
    and set -e fish_complete_path["$complete_indexes"]
  return 0
...
65	9033	--------> switch "$argv[1]"
  case '-e' '--erase'
    test (count $argv) -ge 2
      and __autoload_erase $argv[2..-1]
      or echo "usage: autoload $argv[1] <path>..." >&2
  case "-*" "--*"
    echo "autoload: invalid option $argv[1]"
    return 1
  case '*'
    test (count $argv) -ge 1
      and __autoload_insert $argv
      or echo "usage: autoload <path>..." >&2
  ...
313	677	---------> test (count $argv) -ge 1
364	364	----------> count $argv
158	8291	---------> __autoload_insert $argv
47	47	----------> set -l function_path
32	32	----------> set -l complete_path
368	7764	----------> for path in $argv
    not test -d "$path"; and continue
    set -l IFS '/'
    echo $path | read -la components
    if test "x$components[-1]" = xcompletions
      contains -- $path $fish_complete_path
        or set complete_path $complete_path $path
    else
      contains -- $path $fish_function_path
        or set function_path $function_path $path
    end;
  ...
64	64	-----------> not test -d "$path"
43	43	-----------> set -l IFS '/'
389	389	-----------> echo $path | read -la components
30	248	-----------> if test "x$components[-1]" = xcompletions
      contains -- $path $fish_complete_path
        or set complete_path $complete_path $path
    else
      contains -- $path $fish_function_path
        or set function_path $function_path $path
    ...
50	50	------------> test "x$components[-1]" = xcompletions
119	119	------------> contains -- $path $fish_function_path
49	49	------------> set function_path $function_path $path
52	52	-----------> not test -d "$path"
37	37	-----------> set -l IFS '/'
358	358	-----------> echo $path | read -la components
25	250	-----------> if test "x$components[-1]" = xcompletions
      contains -- $path $fish_complete_path
        or set complete_path $complete_path $path
    else
      contains -- $path $fish_function_path
        or set function_path $function_path $path
    ...
43	43	------------> test "x$components[-1]" = xcompletions
132	132	------------> contains -- $path $fish_function_path
50	50	------------> set function_path $function_path $path
49	49	-----------> not test -d "$path"
36	36	-----------> set -l IFS '/'
418	418	-----------> echo $path | read -la components
38	320	-----------> if test "x$components[-1]" = xcompletions
      contains -- $path $fish_complete_path
        or set complete_path $complete_path $path
    else
      contains -- $path $fish_function_path
        or set function_path $function_path $path
    ...
68	68	------------> test "x$components[-1]" = xcompletions
151	151	------------> contains -- $path $fish_function_path
63	63	------------> set function_path $function_path $path
59	59	-----------> not test -d "$path"
41	41	-----------> set -l IFS '/'
439	439	-----------> echo $path | read -la components
40	347	-----------> if test "x$components[-1]" = xcompletions
      contains -- $path $fish_complete_path
        or set complete_path $complete_path $path
    else
      contains -- $path $fish_function_path
        or set function_path $function_path $path
    ...
65	65	------------> test "x$components[-1]" = xcompletions
170	170	------------> contains -- $path $fish_function_path
72	72	------------> set function_path $function_path $path
59	59	-----------> not test -d "$path"
41	41	-----------> set -l IFS '/'
436	436	-----------> echo $path | read -la components
38	316	-----------> if test "x$components[-1]" = xcompletions
      contains -- $path $fish_complete_path
        or set complete_path $complete_path $path
    else
      contains -- $path $fish_function_path
        or set function_path $function_path $path
    ...
65	65	------------> test "x$components[-1]" = xcompletions
146	146	------------> contains -- $path $fish_function_path
67	67	------------> set function_path $function_path $path
58	58	-----------> not test -d "$path"
41	41	-----------> set -l IFS '/'
433	433	-----------> echo $path | read -la components
37	317	-----------> if test "x$components[-1]" = xcompletions
      contains -- $path $fish_complete_path
        or set complete_path $complete_path $path
    else
      contains -- $path $fish_function_path
        or set function_path $function_path $path
    ...
65	65	------------> test "x$components[-1]" = xcompletions
146	146	------------> contains -- $path $fish_function_path
69	69	------------> set function_path $function_path $path
58	58	-----------> not test -d "$path"
41	41	-----------> set -l IFS '/'
428	428	-----------> echo $path | read -la components
36	322	-----------> if test "x$components[-1]" = xcompletions
      contains -- $path $fish_complete_path
        or set complete_path $complete_path $path
    else
      contains -- $path $fish_function_path
        or set function_path $function_path $path
    ...
66	66	------------> test "x$components[-1]" = xcompletions
148	148	------------> contains -- $path $fish_function_path
72	72	------------> set function_path $function_path $path
57	57	-----------> not test -d "$path"
41	41	-----------> set -l IFS '/'
431	431	-----------> echo $path | read -la components
36	322	-----------> if test "x$components[-1]" = xcompletions
      contains -- $path $fish_complete_path
        or set complete_path $complete_path $path
    else
      contains -- $path $fish_function_path
        or set function_path $function_path $path
    ...
65	65	------------> test "x$components[-1]" = xcompletions
146	146	------------> contains -- $path $fish_function_path
75	75	------------> set function_path $function_path $path
58	58	-----------> not test -d "$path"
41	41	-----------> set -l IFS '/'
405	405	-----------> echo $path | read -la components
28	270	-----------> if test "x$components[-1]" = xcompletions
      contains -- $path $fish_complete_path
        or set complete_path $complete_path $path
    else
      contains -- $path $fish_function_path
        or set function_path $function_path $path
    ...
48	48	------------> test "x$components[-1]" = xcompletions
125	125	------------> contains -- $path $fish_function_path
69	69	------------> set function_path $function_path $path
50	50	-----------> not test -d "$path"
21	21	-----------> continue
51	51	----------> test -n "$function_path"
180	180	----------> set fish_function_path $fish_function_path[1] $function_path $fish_function_path[2..-1]
37	37	----------> test -n "$complete_path"
22	22	----------> return 0
474	474	------> emit init_$package $path
71	71	------> set -g omf_init_path $omf_init_path $path
52	52	------> emit perf:timer:finish $init
47	47	------> emit perf:timer:start $init
36	36	------> set -l IFS '/'
722	722	------> echo $init | read -la components
246	728	------> set path (printf '/%s' $components[1..-2])
482	482	-------> printf '/%s' $components[1..-2]
451	451	------> contains $path $omf_init_path
43	43	------> set package $components[-2]
23	169	------> if not set -q ignore_bundle
      set bundle $path/bundle
      set dependencies

      if test -f $bundle
        set -l IFS ' '
        while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
      end
    ...
27	27	-------> not set -q ignore_bundle
38	38	-------> set bundle $path/bundle
29	29	-------> set dependencies
8	52	-------> if test -f $bundle
        set -l IFS ' '
        while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
      ...
44	44	--------> test -f $bundle
645	3133	------> source $init $path
37	37	-------> set -q PYENV_ROOT
48	48	-------> set -l PYENV_ROOT $HOME/.pyenv
375	375	-------> set PATH $PYENV_ROOT/libexec/pyenv $PYENV_ROOT/libexec $PYENV_ROOT/shims $PYENV_ROOT/bin $PATH 2> /dev/null
690	2028	-------> setenv PYENV_SHELL fish
501	532	--------> source /usr/share/fish/functions/setenv.fish
31	31	---------> function setenv --description 'Set an env var for csh compatibility.'
    # No arguments should cause the current env vars to be displayed.
    if not set -q argv[1]
        env
        return
    end

    # A single argument should set the named var to nothing.
    if not set -q argv[2]
        set -gx $argv[1] ''
        return
    end

    # `setenv` accepts only two arguments: the var name and the value. If there are more than two
    # args it is an error. The error message is verbatim from csh.
    if set -q argv[3]
        printf (_ '%s: Too many arguments\n') setenv >&2
        return 1
    end

    # We have exactly two arguments as required by the csh `setenv` command.
    set -l var $argv[1]
    set -l val $argv[2]

    # Validate the variable name.
    if not string match -qr '^\w+$' -- $var
        # This message is verbatim from csh. We don't really need to do this but if we don't fish
        # will display a different error message which might confuse someone expecting the csh
        # message.
        printf (_ '%s: Variable name must contain alphanumeric characters\n') setenv >&2
        return 1
    end

    # We need to special case some vars to be compatible with fish. In particular how they are
    # treated as arrays split on colon characters. All other var values are treated literally.
    if contains -- $var PATH CDPATH MANPATH
        set -gx $var (string split -- ':' $val)
    else
        set -gx $var $val
    end
...
13	52	--------> if not set -q argv[1]
        env
        return
    ...
39	39	---------> not set -q argv[1]
10	35	--------> if not set -q argv[2]
        set -gx $argv[1] ''
        return
    ...
25	25	---------> not set -q argv[2]
7	30	--------> if set -q argv[3]
        printf (_ '%s: Too many arguments\n') setenv >&2
        return 1
    ...
23	23	---------> set -q argv[3]
45	45	--------> set -l var $argv[1]
35	35	--------> set -l val $argv[2]
11	478	--------> if not string match -qr '^\w+$' -- $var
        # This message is verbatim from csh. We don't really need to do this but if we don't fish
        # will display a different error message which might confuse someone expecting the csh
        # message.
        printf (_ '%s: Variable name must contain alphanumeric characters\n') setenv >&2
        return 1
    ...
467	467	---------> not string match -qr '^\w+$' -- $var
25	131	--------> if contains -- $var PATH CDPATH MANPATH
        set -gx $var (string split -- ':' $val)
    else
        set -gx $var $val
    ...
58	58	---------> contains -- $var PATH CDPATH MANPATH
48	48	---------> set -gx $var $val
65	65	------> emit init_$package $path
69	69	------> set -g omf_init_path $omf_init_path $path
51	51	------> emit perf:timer:finish $init
48	48	------> emit perf:timer:start $init
36	36	------> set -l IFS '/'
360	360	------> echo $init | read -la components
249	357	------> set path (printf '/%s' $components[1..-2])
108	108	-------> printf '/%s' $components[1..-2]
106	106	------> contains $path $omf_init_path
40	40	------> set package $components[-2]
23	167	------> if not set -q ignore_bundle
      set bundle $path/bundle
      set dependencies

      if test -f $bundle
        set -l IFS ' '
        while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
      end
    ...
26	26	-------> not set -q ignore_bundle
36	36	-------> set bundle $path/bundle
28	28	-------> set dependencies
9	54	-------> if test -f $bundle
        set -l IFS ' '
        while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
      ...
45	45	--------> test -f $bundle
382	197501	------> source $init $path
12	3633	-------> if not type -fq rbenv; and set -q RBENV_ROOT; and not contains "$RBENV_ROOT/bin" $PATH
  set PATH $RBENV_ROOT/bin $PATH
...
713	3621	--------> not type -fq rbenv
1390	1422	---------> source /usr/share/fish/functions/type.fish
32	32	----------> function type --description 'Print the type of a command'
    # For legacy reasons, no argument simply causes an unsuccessful return.
    set -q argv[1]
    or return 1

    set -l options 'h/help' 'a/all' 's/short' 'f/no-functions' 't/type' 'p/path' 'P/force-path' 'q/quiet'
    argparse -n type -x t,p,P $options -- $argv
    or return

    if set -q _flag_help
        __fish_print_help type
        return 0
    end

    set -l res 1
    set -l mode normal
    set -l multi no
    set -l selection all
    set -l short no

    # Technically all four of these flags are mutually exclusive. However, we allow -q to be used
    # with the other three because old versions of this function explicitly allowed it by making
    # --quiet have precedence.
    if set -q _flag_quiet
        set mode quiet
    else if set -q _flag_type
        set mode type
    else if set -q _flag_path
        set mode path
    else if set -q _flag_force_path
        set mode path
        set selection files
    end

    set -q _flag_all
    and set multi yes

    set -q _flag_short
    and set short yes

    set -q _flag_no_functions
    and set selection files

    # Check all possible types for the remaining arguments.
    for i in $argv
        # Found will be set to 1 if a match is found.
        set -l found 0

        if test $selection != files
            if functions -q -- $i
                set res 0
                set found 1
                switch $mode
                    case normal
                        printf (_ '%s is a function') $i
                        if test $short != yes
                            echo (_ ' with definition')
                            functions $i
                        else
                            set -l func_path (functions --details $i)
                            if not contains -- $func_path - stdin
                                printf (_ ' (defined in %s)') $func_path
                            end
                            echo
                        end
                    case type
                        echo (_ 'function')
                    case path
                        set -l func_path (functions --details $i)
                        switch $func_path
                            case "-"
                            case "n/a"
                            case "stdin"
                                break
                            case "*"
                                echo $func_path
                        end
                end
                if test $multi != yes
                    continue
                end
            end

            if contains -- $i (builtin -n)
                set res 0
                set found 1
                switch $mode
                    case normal
                        printf (_ '%s is a builtin\n') $i

                    case type
                        echo (_ 'builtin')
                end
                if test $multi != yes
                    continue
                end
            end
        end

        set -l paths
        if test $multi != yes
            set paths (command -s -- $i)
        else
            set paths (command -sa -- $i)
        end
        for path in $paths
            set res 0
            set found 1
            switch $mode
                case normal
                    printf (_ '%s is %s\n') $i $path
                case type
                    echo (_ 'file')
                case path
                    echo $path
            end
            if test $multi != yes
                continue
            end
        end

        if test $found = 0
            and test $mode != quiet
            and test $mode != path
            printf (_ "%s: Could not find '%s'\n") type $i >&2
        end
    end

    return $res
...
37	37	---------> set -q argv[1]
65	65	---------> set -l options 'h/help' 'a/all' 's/short' 'f/no-functions' 't/type' 'p/path' 'P/force-path' 'q/quiet'
131	131	---------> argparse -n type -x t,p,P $options -- $argv
10	37	---------> if set -q _flag_help
        __fish_print_help type
        return 0
    ...
27	27	----------> set -q _flag_help
31	31	---------> set -l res 1
30	30	---------> set -l mode normal
28	28	---------> set -l multi no
27	27	---------> set -l selection all
25	25	---------> set -l short no
20	72	---------> if set -q _flag_quiet
        set mode quiet
    else if set -q _flag_type
        set mode type
    else if set -q _flag_path
        set mode path
    else if set -q _flag_force_path
        set mode path
        set selection files
    ...
22	22	----------> set -q _flag_quiet
30	30	----------> set mode quiet
22	22	---------> set -q _flag_all
21	21	---------> set -q _flag_short
21	21	---------> set -q _flag_no_functions
28	28	---------> set selection files
75	882	---------> for i in $argv
        # Found will be set to 1 if a match is found.
        set -l found 0

        if test $selection != files
            if functions -q -- $i
                set res 0
                set found 1
                switch $mode
                    case normal
                        printf (_ '%s is a function') $i
                        if test $short != yes
                            echo (_ ' with definition')
                            functions $i
                        else
                            set -l func_path (functions --details $i)
                            if not contains -- $func_path - stdin
                                printf (_ ' (defined in %s)') $func_path
                            end
                            echo
                        end
                    case type
                        echo (_ 'function')
                    case path
                        set -l func_path (functions --details $i)
                        switch $func_path
                            case "-"
                            case "n/a"
                            case "stdin"
                                break
                            case "*"
                                echo $func_path
                        end
                end
                if test $multi != yes
                    continue
                end
            end

            if contains -- $i (builtin -n)
                set res 0
                set found 1
                switch $mode
                    case normal
                        printf (_ '%s is a builtin\n') $i

                    case type
                        echo (_ 'builtin')
                end
                if test $multi != yes
                    continue
                end
            end
        end

        set -l paths
        if test $multi != yes
            set paths (command -s -- $i)
        else
            set paths (command -sa -- $i)
        end
        for path in $paths
            set res 0
            set found 1
            switch $mode
                case normal
                    printf (_ '%s is %s\n') $i $path
                case type
                    echo (_ 'file')
                case path
                    echo $path
            end
            if test $multi != yes
                continue
            end
        end

        if test $found = 0
            and test $mode != quiet
            and test $mode != path
            printf (_ "%s: Could not find '%s'\n") type $i >&2
        end
    ...
32	32	----------> set -l found 0
9	46	----------> if test $selection != files
            if functions -q -- $i
                set res 0
                set found 1
                switch $mode
                    case normal
                        printf (_ '%s is a function') $i
                        if test $short != yes
                            echo (_ ' with definition')
                            functions $i
                        else
                            set -l func_path (functions --details $i)
                            if not contains -- $func_path - stdin
                                printf (_ ' (defined in %s)') $func_path
                            end
                            echo
                        end
                    case type
                        echo (_ 'function')
                    case path
                        set -l func_path (functions --details $i)
                        switch $func_path
                            case "-"
                            case "n/a"
                            case "stdin"
                                break
                            case "*"
                                echo $func_path
                        end
                end
                if test $multi != yes
                    continue
                end
            end

            if contains -- $i (builtin -n)
                set res 0
                set found 1
                switch $mode
                    case normal
                        printf (_ '%s is a builtin\n') $i

                    case type
                        echo (_ 'builtin')
                end
                if test $multi != yes
                    continue
                end
            end
        ...
37	37	-----------> test $selection != files
30	30	----------> set -l paths
26	436	----------> if test $multi != yes
            set paths (command -s -- $i)
        else
            set paths (command -sa -- $i)
        ...
31	31	-----------> test $multi != yes
237	379	-----------> set paths (command -s -- $i)
142	142	------------> command -s -- $i
49	225	----------> for path in $paths
            set res 0
            set found 1
            switch $mode
                case normal
                    printf (_ '%s is %s\n') $i $path
                case type
                    echo (_ 'file')
                case path
                    echo $path
            end
            if test $multi != yes
                continue
            end
        ...
57	57	-----------> set res 0
31	31	-----------> set found 1
18	18	-----------> switch $mode
                case normal
                    printf (_ '%s is %s\n') $i $path
                case type
                    echo (_ 'file')
                case path
                    echo $path
            ...
16	70	-----------> if test $multi != yes
                continue
            ...
32	32	------------> test $multi != yes
22	22	------------> continue
10	38	----------> if test $found = 0
            and test $mode != quiet
            and test $mode != path
            printf (_ "%s: Could not find '%s'\n") type $i >&2
        ...
28	28	-----------> test $found = 0
29	29	---------> return $res
13	193486	-------> if type -q rbenv
  if command rbenv init - | grep --quiet "function"
    set -gx __RBENV_SUPPORTS_FISH true
    source (rbenv init - | psub)
  else
    if not set -q RBENV_ROOT
      set -x RBENV_ROOT "$HOME/.rbenv"
    end

    if not contains $RBENV_ROOT/shims $PATH
      set PATH $RBENV_ROOT/shims $PATH
    end
  end
else
  echo "Please install 'rbenv' first, or set \$RBENV_ROOT!"
...
210	2152	--------> type -q rbenv
28	28	---------> set -q argv[1]
59	59	---------> set -l options 'h/help' 'a/all' 's/short' 'f/no-functions' 't/type' 'p/path' 'P/force-path' 'q/quiet'
105	105	---------> argparse -n type -x t,p,P $options -- $argv
9	33	---------> if set -q _flag_help
        __fish_print_help type
        return 0
    ...
24	24	----------> set -q _flag_help
29	29	---------> set -l res 1
29	29	---------> set -l mode normal
27	27	---------> set -l multi no
29	29	---------> set -l selection all
29	29	---------> set -l short no
20	69	---------> if set -q _flag_quiet
        set mode quiet
    else if set -q _flag_type
        set mode type
    else if set -q _flag_path
        set mode path
    else if set -q _flag_force_path
        set mode path
        set selection files
    ...
21	21	----------> set -q _flag_quiet
28	28	----------> set mode quiet
21	21	---------> set -q _flag_all
20	20	---------> set -q _flag_short
21	21	---------> set -q _flag_no_functions
64	1409	---------> for i in $argv
        # Found will be set to 1 if a match is found.
        set -l found 0

        if test $selection != files
            if functions -q -- $i
                set res 0
                set found 1
                switch $mode
                    case normal
                        printf (_ '%s is a function') $i
                        if test $short != yes
                            echo (_ ' with definition')
                            functions $i
                        else
                            set -l func_path (functions --details $i)
                            if not contains -- $func_path - stdin
                                printf (_ ' (defined in %s)') $func_path
                            end
                            echo
                        end
                    case type
                        echo (_ 'function')
                    case path
                        set -l func_path (functions --details $i)
                        switch $func_path
                            case "-"
                            case "n/a"
                            case "stdin"
                                break
                            case "*"
                                echo $func_path
                        end
                end
                if test $multi != yes
                    continue
                end
            end

            if contains -- $i (builtin -n)
                set res 0
                set found 1
                switch $mode
                    case normal
                        printf (_ '%s is a builtin\n') $i

                    case type
                        echo (_ 'builtin')
                end
                if test $multi != yes
                    continue
                end
            end
        end

        set -l paths
        if test $multi != yes
            set paths (command -s -- $i)
        else
            set paths (command -sa -- $i)
        end
        for path in $paths
            set res 0
            set found 1
            switch $mode
                case normal
                    printf (_ '%s is %s\n') $i $path
                case type
                    echo (_ 'file')
                case path
                    echo $path
            end
            if test $multi != yes
                continue
            end
        end

        if test $found = 0
            and test $mode != quiet
            and test $mode != path
            printf (_ "%s: Could not find '%s'\n") type $i >&2
        end
    ...
30	30	----------> set -l found 0
28	1315	----------> if test $selection != files
            if functions -q -- $i
                set res 0
                set found 1
                switch $mode
                    case normal
                        printf (_ '%s is a function') $i
                        if test $short != yes
                            echo (_ ' with definition')
                            functions $i
                        else
                            set -l func_path (functions --details $i)
                            if not contains -- $func_path - stdin
                                printf (_ ' (defined in %s)') $func_path
                            end
                            echo
                        end
                    case type
                        echo (_ 'function')
                    case path
                        set -l func_path (functions --details $i)
                        switch $func_path
                            case "-"
                            case "n/a"
                            case "stdin"
                                break
                            case "*"
                                echo $func_path
                        end
                end
                if test $multi != yes
                    continue
                end
            end

            if contains -- $i (builtin -n)
                set res 0
                set found 1
                switch $mode
                    case normal
                        printf (_ '%s is a builtin\n') $i

                    case type
                        echo (_ 'builtin')
                end
                if test $multi != yes
                    continue
                end
            end
        ...
35	35	-----------> test $selection != files
26	1252	-----------> if functions -q -- $i
                set res 0
                set found 1
                switch $mode
                    case normal
                        printf (_ '%s is a function') $i
                        if test $short != yes
                            echo (_ ' with definition')
                            functions $i
                        else
                            set -l func_path (functions --details $i)
                            if not contains -- $func_path - stdin
                                printf (_ ' (defined in %s)') $func_path
                            end
                            echo
                        end
                    case type
                        echo (_ 'function')
                    case path
                        set -l func_path (functions --details $i)
                        switch $func_path
                            case "-"
                            case "n/a"
                            case "stdin"
                                break
                            case "*"
                                echo $func_path
                        end
                end
                if test $multi != yes
                    continue
                end
            ...
677	1046	------------> functions -q -- $i
350	369	-------------> source /home/niklash/.config/fish/functions/rbenv.fish
19	19	--------------> function rbenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell
    . (rbenv "sh-$command" $argv|psub)
  case '*'
    command rbenv "$command" $argv
  end
...
48	48	------------> set res 0
30	30	------------> set found 1
24	24	------------> switch $mode
                    case normal
                        printf (_ '%s is a function') $i
                        if test $short != yes
                            echo (_ ' with definition')
                            functions $i
                        else
                            set -l func_path (functions --details $i)
                            if not contains -- $func_path - stdin
                                printf (_ ' (defined in %s)') $func_path
                            end
                            echo
                        end
                    case type
                        echo (_ 'function')
                    case path
                        set -l func_path (functions --details $i)
                        switch $func_path
                            case "-"
                            case "n/a"
                            case "stdin"
                                break
                            case "*"
                                echo $func_path
                        end
                ...
21	78	------------> if test $multi != yes
                    continue
                ...
36	36	-------------> test $multi != yes
21	21	-------------> continue
34	34	---------> return $res
1443	191321	--------> if command rbenv init - | grep --quiet "function"
    set -gx __RBENV_SUPPORTS_FISH true
    source (rbenv init - | psub)
  else
    if not set -q RBENV_ROOT
      set -x RBENV_ROOT "$HOME/.rbenv"
    end

    if not contains $RBENV_ROOT/shims $PATH
      set PATH $RBENV_ROOT/shims $PATH
    end
  ...
1547	79435	---------> command rbenv init - | grep --quiet "function"
203	4846	----------> source /usr/share/fish/functions/grep.fish
32	4643	-----------> if echo | command grep --color=auto "" >/dev/null 2>&1
    function grep
        command grep --color=auto $argv
    end
...
4589	4589	------------> echo | command grep --color=auto "" >/dev/null 2>&1
22	22	------------> function grep
        command grep --color=auto $argv
    ...
73042	73042	----------> command grep --color=auto $argv
30	30	---------> set -gx __RBENV_SUPPORTS_FISH true
-1049	110413	---------> source (rbenv init - | psub)
587	51328	----------> rbenv init - | psub
250	262	-----------> source /usr/share/fish/functions/psub.fish
12	12	------------> function psub --description "Read from stdin into a file and output the filename. Remove the file when the command that called psub exits."
    set -l options -x 'f,F' -x 'F,s' 'h/help' 'f/file' 'F/fifo' 's/suffix=' 'T-testing'
    argparse -n psub --max-args=0 $options -- $argv
    or return

    if set -q _flag_help
        __fish_print_help psub
        return 0
    end

    set -l dirname
    set -l filename
    set -l funcname

    if not status --is-command-substitution
        printf (_ "%s: Not inside of command substitution") psub >&2
        return 1
    end

    set -l tmpdir /tmp
    set -q TMPDIR
    and set tmpdir $TMPDIR

    if set -q _flag_fifo
        # Write output to pipe. This needs to be done in the background so
        # that the command substitution exits without needing to wait for
        # all the commands to exit.
        set dirname (mktemp -d $tmpdir/.psub.XXXXXXXXXX)
        or return
        set filename $dirname/psub.fifo"$_flag_suffix"
        command mkfifo $filename
        # Note that if we were to do the obvious `cat >$filename &`, we would deadlock
        # because $filename may be opened before the fork. Use tee to ensure it is opened
        # after the fork.
        command tee $filename >/dev/null &
    else if test -z "$_flag_suffix"
        set filename (mktemp $tmpdir/.psub.XXXXXXXXXX)
        command cat >$filename
    else
        set dirname (mktemp -d $tmpdir/.psub.XXXXXXXXXX)
        set filename "$dirname/psub$_flag_suffix"
        command cat >$filename
    end

    # Write filename to stdout
    echo $filename

    # This flag isn't documented. It's strictly for our unit tests.
    if set -q _flag_testing
        return
    end

    # Find unique function name
    while true
        set funcname __fish_psub_(random)
        if not functions $funcname >/dev/null 2>/dev/null
            break
        end
    end

    # Make sure we erase file when caller exits
    function $funcname --on-job-exit caller --inherit-variable filename --inherit-variable dirname --inherit-variable funcname
        command rm $filename
        if test -n "$dirname"
            command rmdir $dirname
        end
        functions -e $funcname
    end

...
23	23	-----------> set command $argv[1]
12	12	-----------> set -e argv[1]
33	45404	-----------> switch "$command"
  case rehash shell
    . (rbenv "sh-$command" $argv|psub)
  case '*'
    command rbenv "$command" $argv
  ...
45371	45371	------------> command rbenv "$command" $argv
61	61	-----------> set -l options -x 'f,F' -x 'F,s' 'h/help' 'f/file' 'F/fifo' 's/suffix=' 'T-testing'
66	66	-----------> argparse -n psub --max-args=0 $options -- $argv
7	22	-----------> if set -q _flag_help
        __fish_print_help psub
        return 0
    ...
15	15	------------> set -q _flag_help
16	16	-----------> set -l dirname
13	13	-----------> set -l filename
14	14	-----------> set -l funcname
5	18	-----------> if not status --is-command-substitution
        printf (_ "%s: Not inside of command substitution") psub >&2
        return 1
    ...
13	13	------------> not status --is-command-substitution
16	16	-----------> set -l tmpdir /tmp
11	11	-----------> set -q TMPDIR
27	3699	-----------> if set -q _flag_fifo
        # Write output to pipe. This needs to be done in the background so
        # that the command substitution exits without needing to wait for
        # all the commands to exit.
        set dirname (mktemp -d $tmpdir/.psub.XXXXXXXXXX)
        or return
        set filename $dirname/psub.fifo"$_flag_suffix"
        command mkfifo $filename
        # Note that if we were to do the obvious `cat >$filename &`, we would deadlock
        # because $filename may be opened before the fork. Use tee to ensure it is opened
        # after the fork.
        command tee $filename >/dev/null &
    else if test -z "$_flag_suffix"
        set filename (mktemp $tmpdir/.psub.XXXXXXXXXX)
        command cat >$filename
    else
        set dirname (mktemp -d $tmpdir/.psub.XXXXXXXXXX)
        set filename "$dirname/psub$_flag_suffix"
        command cat >$filename
    ...
11	11	------------> set -q _flag_fifo
18	18	------------> test -z "$_flag_suffix"
207	2057	------------> set filename (mktemp $tmpdir/.psub.XXXXXXXXXX)
1850	1850	-------------> mktemp $tmpdir/.psub.XXXXXXXXXX
1586	1586	------------> command cat >$filename
50	50	-----------> echo $filename
6	20	-----------> if set -q _flag_testing
        return
    ...
14	14	------------> set -q _flag_testing
18	1005	-----------> while true
        set funcname __fish_psub_(random)
        if not functions $funcname >/dev/null 2>/dev/null
            break
        end
    ...
235	235	------------> true
214	417	------------> set funcname __fish_psub_(random)
203	203	-------------> random
11	335	------------> if not functions $funcname >/dev/null 2>/dev/null
            break
        ...
312	312	-------------> not functions $funcname >/dev/null 2>/dev/null
12	12	-------------> break
29	29	-----------> function $funcname --on-job-exit caller --inherit-variable filename --inherit-variable dirname --inherit-variable funcname
        command rm $filename
        if test -n "$dirname"
            command rmdir $dirname
        end
        functions -e $funcname
    ...
197	197	----------> set -gx PATH '/home/niklash/.rbenv/shims' $PATH
21	21	----------> set -gx RBENV_SHELL fish
242	30306	----------> source '/home/linuxbrew/.linuxbrew/Cellar/rbenv/1.1.2/libexec/../completions/rbenv.fish'
21	21	-----------> function __fish_rbenv_needs_command
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 -a $cmd[1] = 'rbenv' ]
    return 0
  end
  return 1
...
10	10	-----------> function __fish_rbenv_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
...
554	554	-----------> complete -f -c rbenv -n '__fish_rbenv_needs_command' -a '(rbenv commands)'
407	29479	-----------> for cmd in (rbenv commands)
  complete -f -c rbenv -n "__fish_rbenv_using_command $cmd" -a \
    "(rbenv completions (commandline -opc)[2..-1])"
...
132	27868	------------> rbenv commands
65	65	-------------> set command $argv[1]
43	43	-------------> set -e argv[1]
54	27628	-------------> switch "$command"
  case rehash shell
    . (rbenv "sh-$command" $argv|psub)
  case '*'
    command rbenv "$command" $argv
  ...
27574	27574	--------------> command rbenv "$command" $argv
92	92	------------> complete -f -c rbenv -n "__fish_rbenv_using_command $cmd" -a \
    "(rbenv completions (commandline -opc)[2..-1])"
54	54	------------> complete -f -c rbenv -n "__fish_rbenv_using_command $cmd" -a \
    "(rbenv completions (commandline -opc)[2..-1])"
47	47	------------> complete -f -c rbenv -n "__fish_rbenv_using_command $cmd" -a \
    "(rbenv completions (commandline -opc)[2..-1])"
46	46	------------> complete -f -c rbenv -n "__fish_rbenv_using_command $cmd" -a \
    "(rbenv completions (commandline -opc)[2..-1])"
44	44	------------> complete -f -c rbenv -n "__fish_rbenv_using_command $cmd" -a \
    "(rbenv completions (commandline -opc)[2..-1])"
45	45	------------> complete -f -c rbenv -n "__fish_rbenv_using_command $cmd" -a \
    "(rbenv completions (commandline -opc)[2..-1])"
44	44	------------> complete -f -c rbenv -n "__fish_rbenv_using_command $cmd" -a \
    "(rbenv completions (commandline -opc)[2..-1])"
43	43	------------> complete -f -c rbenv -n "__fish_rbenv_using_command $cmd" -a \
    "(rbenv completions (commandline -opc)[2..-1])"
43	43	------------> complete -f -c rbenv -n "__fish_rbenv_using_command $cmd" -a \
    "(rbenv completions (commandline -opc)[2..-1])"
43	43	------------> complete -f -c rbenv -n "__fish_rbenv_using_command $cmd" -a \
    "(rbenv completions (commandline -opc)[2..-1])"
43	43	------------> complete -f -c rbenv -n "__fish_rbenv_using_command $cmd" -a \
    "(rbenv completions (commandline -opc)[2..-1])"
42	42	------------> complete -f -c rbenv -n "__fish_rbenv_using_command $cmd" -a \
    "(rbenv completions (commandline -opc)[2..-1])"
42	42	------------> complete -f -c rbenv -n "__fish_rbenv_using_command $cmd" -a \
    "(rbenv completions (commandline -opc)[2..-1])"
42	42	------------> complete -f -c rbenv -n "__fish_rbenv_using_command $cmd" -a \
    "(rbenv completions (commandline -opc)[2..-1])"
42	42	------------> complete -f -c rbenv -n "__fish_rbenv_using_command $cmd" -a \
    "(rbenv completions (commandline -opc)[2..-1])"
42	42	------------> complete -f -c rbenv -n "__fish_rbenv_using_command $cmd" -a \
    "(rbenv completions (commandline -opc)[2..-1])"
42	42	------------> complete -f -c rbenv -n "__fish_rbenv_using_command $cmd" -a \
    "(rbenv completions (commandline -opc)[2..-1])"
42	42	------------> complete -f -c rbenv -n "__fish_rbenv_using_command $cmd" -a \
    "(rbenv completions (commandline -opc)[2..-1])"
44	44	------------> complete -f -c rbenv -n "__fish_rbenv_using_command $cmd" -a \
    "(rbenv completions (commandline -opc)[2..-1])"
45	45	------------> complete -f -c rbenv -n "__fish_rbenv_using_command $cmd" -a \
    "(rbenv completions (commandline -opc)[2..-1])"
43	43	------------> complete -f -c rbenv -n "__fish_rbenv_using_command $cmd" -a \
    "(rbenv completions (commandline -opc)[2..-1])"
44	44	------------> complete -f -c rbenv -n "__fish_rbenv_using_command $cmd" -a \
    "(rbenv completions (commandline -opc)[2..-1])"
43	43	------------> complete -f -c rbenv -n "__fish_rbenv_using_command $cmd" -a \
    "(rbenv completions (commandline -opc)[2..-1])"
45	45	------------> complete -f -c rbenv -n "__fish_rbenv_using_command $cmd" -a \
    "(rbenv completions (commandline -opc)[2..-1])"
56	56	------------> complete -f -c rbenv -n "__fish_rbenv_using_command $cmd" -a \
    "(rbenv completions (commandline -opc)[2..-1])"
46	46	------------> complete -f -c rbenv -n "__fish_rbenv_using_command $cmd" -a \
    "(rbenv completions (commandline -opc)[2..-1])"
28189	28189	----------> command rbenv rehash 2>/dev/null
23	23	----------> function rbenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell
    source (rbenv "sh-$command" $argv|psub)
  case '*'
    command rbenv "$command" $argv
  end
...
51	1398	----------> __fish_psub_7658 JOB_EXIT 5 0
1270	1270	-----------> command rm $filename
4	35	-----------> if test -n "$dirname"
            command rmdir $dirname
        ...
31	31	------------> test -n "$dirname"
42	42	-----------> functions -e $funcname
37	37	------> emit init_$package $path
40	40	------> set -g omf_init_path $omf_init_path $path
26	26	------> emit perf:timer:finish $init
23	23	------> emit perf:timer:start $init
17	17	------> set -l IFS '/'
236	236	------> echo $init | read -la components
186	252	------> set path (printf '/%s' $components[1..-2])
66	66	-------> printf '/%s' $components[1..-2]
53	53	------> contains $path $omf_init_path
22	22	------> set package $components[-2]
12	86	------> if not set -q ignore_bundle
      set bundle $path/bundle
      set dependencies

      if test -f $bundle
        set -l IFS ' '
        while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
      end
    ...
13	13	-------> not set -q ignore_bundle
18	18	-------> set bundle $path/bundle
14	14	-------> set dependencies
5	29	-------> if test -f $bundle
        set -l IFS ' '
        while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
      ...
24	24	--------> test -f $bundle
124	298	------> source $init $path
25	25	-------> set -l rustup_path $HOME/.cargo/bin
3	18	-------> if [ $CARGO_HOME ]
  set rustup_path $CARGO_HOME/bin
...
15	15	--------> [ $CARGO_HOME ]
131	131	-------> contains -- $rustup_path $PATH
32	32	------> emit init_$package $path
35	35	------> set -g omf_init_path $omf_init_path $path
26	26	------> emit perf:timer:finish $init
23	23	------> emit perf:timer:start $init
17	17	------> set -l IFS '/'
236	236	------> echo $init | read -la components
176	239	------> set path (printf '/%s' $components[1..-2])
63	63	-------> printf '/%s' $components[1..-2]
53	53	------> contains $path $omf_init_path
22	22	------> set package $components[-2]
12	3733	------> if not set -q ignore_bundle
      set bundle $path/bundle
      set dependencies

      if test -f $bundle
        set -l IFS ' '
        while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
      end
    ...
13	13	-------> not set -q ignore_bundle
18	18	-------> set bundle $path/bundle
13	13	-------> set dependencies
11	3677	-------> if test -f $bundle
        set -l IFS ' '
        while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
      ...
25	25	--------> test -f $bundle
19	19	--------> set -l IFS ' '
47	3622	--------> while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
34	34	---------> read -l type dependency
17	17	---------> test "$type" != package
390	1870	---------> require "$dependency"
406	415	----------> source /home/niklash/.local/share/omf/lib/require.fish
9	9	-----------> function require
  set packages $argv

  if test -z "$packages"
    echo 'usage: require <name>...'
    echo '       require --path <path>...'
    echo '       require --no-bundle --path <path>...'
    return 1
  end

  # If bundle should be
  if set index (contains -i -- --no-bundle $packages)
    set -e packages[$index]
    set ignore_bundle
  end

  # Requiring absolute paths
  if set index (contains -i -- --path $packages)
    set -e packages[$index]
    set package_path $packages

  # Requiring specific packages from default paths
  else
    set package_path {$OMF_PATH,$OMF_CONFIG}/pkg*/$packages

    # Exit with error if no package paths were generated
    test -z "$package_path"
      and return 1
  end

  set function_path $package_path/functions*
  set complete_path $package_path/completions*
  set init_path $package_path/init.fish*
  set conf_path $package_path/conf.d/*.fish

  # Autoload functions
  test -n "$function_path"
    and set fish_function_path $fish_function_path[1] \
                               $function_path \
                               $fish_function_path[2..-1]

  # Autoload completions
  test -n "$complete_path"
    and set fish_complete_path $fish_complete_path[1] \
                               $complete_path \
                               $fish_complete_path[2..-1]

  for init in $init_path
    emit perf:timer:start $init
    set -l IFS '/'
    echo $init | read -la components

    set path (printf '/%s' $components[1..-2])

    contains $path $omf_init_path
      and continue

    set package $components[-2]

    if not set -q ignore_bundle
      set bundle $path/bundle
      set dependencies

      if test -f $bundle
        set -l IFS ' '
        while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
      end
    end

    source $init $path

    emit init_$package $path

    set -g omf_init_path $omf_init_path $path
    emit perf:timer:finish $init
  end

  for conf in $conf_path
    source $conf
  end

  return 0
...
28	28	----------> set packages $argv
6	21	----------> if test -z "$packages"
    echo 'usage: require <name>...'
    echo '       require --path <path>...'
    echo '       require --no-bundle --path <path>...'
    return 1
  ...
15	15	-----------> test -z "$packages"
7	191	----------> if set index (contains -i -- --no-bundle $packages)
    set -e packages[$index]
    set ignore_bundle
  ...
148	184	-----------> set index (contains -i -- --no-bundle $packages)
36	36	------------> contains -i -- --no-bundle $packages
15	428	----------> if set index (contains -i -- --path $packages)
    set -e packages[$index]
    set package_path $packages

  # Requiring specific packages from default paths
  else
    set package_path {$OMF_PATH,$OMF_CONFIG}/pkg*/$packages

    # Exit with error if no package paths were generated
    test -z "$package_path"
      and return 1
  ...
146	187	-----------> set index (contains -i -- --path $packages)
41	41	------------> contains -i -- --path $packages
208	208	-----------> set package_path {$OMF_PATH,$OMF_CONFIG}/pkg*/$packages
18	18	-----------> test -z "$package_path"
64	64	----------> set function_path $package_path/functions*
57	57	----------> set complete_path $package_path/completions*
55	55	----------> set init_path $package_path/init.fish*
58	58	----------> set conf_path $package_path/conf.d/*.fish
14	14	----------> test -n "$function_path"
98	98	----------> set fish_function_path $fish_function_path[1] \
                               $function_path \
                               $fish_function_path[2..-1]
16	16	----------> test -n "$complete_path"
15	15	----------> for init in $init_path
    emit perf:timer:start $init
    set -l IFS '/'
    echo $init | read -la components

    set path (printf '/%s' $components[1..-2])

    contains $path $omf_init_path
      and continue

    set package $components[-2]

    if not set -q ignore_bundle
      set bundle $path/bundle
      set dependencies

      if test -f $bundle
        set -l IFS ' '
        while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
      end
    end

    source $init $path

    emit init_$package $path

    set -g omf_init_path $omf_init_path $path
    emit perf:timer:finish $init
  ...
11	11	----------> for conf in $conf_path
    source $conf
  ...
9	9	----------> return 0
22	22	---------> set dependencies $dependencies $dependency
28	28	---------> read -l type dependency
16	16	---------> test "$type" != package
318	1546	---------> require "$dependency"
551	561	----------> source /home/niklash/.local/share/omf/lib/require.fish
10	10	-----------> function require
  set packages $argv

  if test -z "$packages"
    echo 'usage: require <name>...'
    echo '       require --path <path>...'
    echo '       require --no-bundle --path <path>...'
    return 1
  end

  # If bundle should be
  if set index (contains -i -- --no-bundle $packages)
    set -e packages[$index]
    set ignore_bundle
  end

  # Requiring absolute paths
  if set index (contains -i -- --path $packages)
    set -e packages[$index]
    set package_path $packages

  # Requiring specific packages from default paths
  else
    set package_path {$OMF_PATH,$OMF_CONFIG}/pkg*/$packages

    # Exit with error if no package paths were generated
    test -z "$package_path"
      and return 1
  end

  set function_path $package_path/functions*
  set complete_path $package_path/completions*
  set init_path $package_path/init.fish*
  set conf_path $package_path/conf.d/*.fish

  # Autoload functions
  test -n "$function_path"
    and set fish_function_path $fish_function_path[1] \
                               $function_path \
                               $fish_function_path[2..-1]

  # Autoload completions
  test -n "$complete_path"
    and set fish_complete_path $fish_complete_path[1] \
                               $complete_path \
                               $fish_complete_path[2..-1]

  for init in $init_path
    emit perf:timer:start $init
    set -l IFS '/'
    echo $init | read -la components

    set path (printf '/%s' $components[1..-2])

    contains $path $omf_init_path
      and continue

    set package $components[-2]

    if not set -q ignore_bundle
      set bundle $path/bundle
      set dependencies

      if test -f $bundle
        set -l IFS ' '
        while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
      end
    end

    source $init $path

    emit init_$package $path

    set -g omf_init_path $omf_init_path $path
    emit perf:timer:finish $init
  end

  for conf in $conf_path
    source $conf
  end

  return 0
...
23	23	----------> set packages $argv
3	19	----------> if test -z "$packages"
    echo 'usage: require <name>...'
    echo '       require --path <path>...'
    echo '       require --no-bundle --path <path>...'
    return 1
  ...
16	16	-----------> test -z "$packages"
4	331	----------> if set index (contains -i -- --no-bundle $packages)
    set -e packages[$index]
    set ignore_bundle
  ...
118	327	-----------> set index (contains -i -- --no-bundle $packages)
209	209	------------> contains -i -- --no-bundle $packages
12	294	----------> if set index (contains -i -- --path $packages)
    set -e packages[$index]
    set package_path $packages

  # Requiring specific packages from default paths
  else
    set package_path {$OMF_PATH,$OMF_CONFIG}/pkg*/$packages

    # Exit with error if no package paths were generated
    test -z "$package_path"
      and return 1
  ...
76	105	-----------> set index (contains -i -- --path $packages)
29	29	------------> contains -i -- --path $packages
153	153	-----------> set package_path {$OMF_PATH,$OMF_CONFIG}/pkg*/$packages
15	15	-----------> test -z "$package_path"
9	9	-----------> return 1
23	23	---------> set dependencies $dependencies $dependency
19	19	---------> read -l type dependency
122	137	------> source $init $path
15	15	-------> function init -a path --on-event init_ssh-config.d
  config ssh-config.d --set ssh_config ~/.ssh/config
  config ssh-config.d --set ssh_config_dir ~/.ssh/config.d/
  config ssh-config.d --set warn \
"# ssh-config.d: This ssh config file was automatically generated by
# ssh-config.d: ssh-config.d fish plugin from *.config files, located in
# ssh-config.d: ~/.ssh/config.d/. All changes will be overwritten without
# ssh-config.d: backup on following ssh execution. To change this behaviour
# ssh-config.d: (enable backup), delete all lines, containing 'ssh-config.d'.

"
...
220	16418	------> emit init_$package $path
30	16198	-------> init /home/niklash/.local/share/omf/pkg/ssh-config.d
189	6239	--------> config ssh-config.d --set ssh_config ~/.ssh/config
492	507	---------> source /home/niklash/.local/share/omf/pkg/config/functions/config.fish
15	15	----------> function config -d "Get and set package configuration" -a package action key value
  # Set up FISH_CONFIG.
  if not set -q FISH_CONFIG
    if set -q OMF_CONFIG
      set FISH_CONFIG "$OMF_CONFIG"
    else if set -q XDG_CONFIG_HOME
      set FISH_CONFIG "$XDG_CONFIG_HOME"
    else
      set FISH_CONFIG "$HOME/.config"
    end
  end

  # Check if the user needs some help.
  if begin; not set -q argv[1]; or contains -- -h $argv; or contains -- --help $argv; end
    test "$package" = -h
      or test "$package" = --help
      and set package ""

    config.help "$package"
    return 0
  end

  if test -z "$package" -o "$package" = . -o "$package" = ..
    echo "You must specify a valid package name."
    return 1
  end

  # Match the action given.
  switch "$action"
    case -l --list ''
      for file in $FISH_CONFIG/$package/**
        if test -f "$file"
          printf "%s=%s\n" (realpath --relative-base="$FISH_CONFIG/$package" "$file" | tr -s '/' '.') (cat $file)
        end
      end

    # For any of the below actions, we need to do some additional
    # argument parsing.
    case -g --get -q --query -s --set -u --unset
      if test -z "$key"
        echo "You must specify a key name."
        return 1
      end

      # Expand the key name into a directory tree.
      set key (echo -n "$key" | tr -s '.' '/')

      # Match which of the above actions was given.
      switch "$action"
        case -g --get
          if begin; test "$value" = -d; or test "$value" = --default; end
            if not set -q argv[5]
              echo "You must specify a default value."
              return 1
            end

            set default "$argv[5]"
          end

          if test -f $FISH_CONFIG/$package/$key
            cat $FISH_CONFIG/$package/$key
          else if set -q default
            echo -n "$default"
          else
            return 1
          end

        case -q --query
          test -f $FISH_CONFIG/$package/$key

        case -s --set
          mkdir -p (dirname $FISH_CONFIG/$package/$key)

          # Check for any additional options.
          switch "$value"
            case ''
              echo "You must specify a value to set."
              return 1

            case -e --edit
              set -l editor "$EDITOR"
              if not set -q EDITOR
                echo "No editor in `\$EDITOR` is specified."

                if type -q vim
                  set editor vim
                else if type -q nano
                  set editor nano
                else
                  return 1
                end

                echo "Using `$editor` as editor."
              end

              eval $editor $FISH_CONFIG/$package/$key

            case '*'
              echo -n "$value" > $FISH_CONFIG/$package/$key
          end

        case -u --unset
          rm $FISH_CONFIG/$package/$key
      end

    case '*'
      echo "Unknown action '$action'."
      config.help "$package"
      return 1
  end
...
6	60	---------> if not set -q FISH_CONFIG
    if set -q OMF_CONFIG
      set FISH_CONFIG "$OMF_CONFIG"
    else if set -q XDG_CONFIG_HOME
      set FISH_CONFIG "$XDG_CONFIG_HOME"
    else
      set FISH_CONFIG "$HOME/.config"
    end
  ...
17	17	----------> not set -q FISH_CONFIG
4	37	----------> if set -q OMF_CONFIG
      set FISH_CONFIG "$OMF_CONFIG"
    else if set -q XDG_CONFIG_HOME
      set FISH_CONFIG "$XDG_CONFIG_HOME"
    else
      set FISH_CONFIG "$HOME/.config"
    ...
11	11	-----------> set -q OMF_CONFIG
22	22	-----------> set FISH_CONFIG "$OMF_CONFIG"
2	80	---------> if begin; not set -q argv[1]; or contains -- -h $argv; or contains -- --help $argv; end
    test "$package" = -h
      or test "$package" = --help
      and set package ""

    config.help "$package"
    return 0
  ...
7	78	----------> begin; not set -q argv[1]; or contains -- -h $argv; or contains -- --help $argv; ...
13	13	-----------> not set -q argv[1]
32	32	-----------> contains -- -h $argv
26	26	-----------> contains -- --help $argv
1	29	---------> if test -z "$package" -o "$package" = . -o "$package" = ..
    echo "You must specify a valid package name."
    return 1
  ...
28	28	----------> test -z "$package" -o "$package" = . -o "$package" = ..
21	5374	---------> switch "$action"
    case -l --list ''
      for file in $FISH_CONFIG/$package/**
        if test -f "$file"
          printf "%s=%s\n" (realpath --relative-base="$FISH_CONFIG/$package" "$file" | tr -s '/' '.') (cat $file)
        end
      end

    # For any of the below actions, we need to do some additional
    # argument parsing.
    case -g --get -q --query -s --set -u --unset
      if test -z "$key"
        echo "You must specify a key name."
        return 1
      end

      # Expand the key name into a directory tree.
      set key (echo -n "$key" | tr -s '.' '/')

      # Match which of the above actions was given.
      switch "$action"
        case -g --get
          if begin; test "$value" = -d; or test "$value" = --default; end
            if not set -q argv[5]
              echo "You must specify a default value."
              return 1
            end

            set default "$argv[5]"
          end

          if test -f $FISH_CONFIG/$package/$key
            cat $FISH_CONFIG/$package/$key
          else if set -q default
            echo -n "$default"
          else
            return 1
          end

        case -q --query
          test -f $FISH_CONFIG/$package/$key

        case -s --set
          mkdir -p (dirname $FISH_CONFIG/$package/$key)

          # Check for any additional options.
          switch "$value"
            case ''
              echo "You must specify a value to set."
              return 1

            case -e --edit
              set -l editor "$EDITOR"
              if not set -q EDITOR
                echo "No editor in `\$EDITOR` is specified."

                if type -q vim
                  set editor vim
                else if type -q nano
                  set editor nano
                else
                  return 1
                end

                echo "Using `$editor` as editor."
              end

              eval $editor $FISH_CONFIG/$package/$key

            case '*'
              echo -n "$value" > $FISH_CONFIG/$package/$key
          end

        case -u --unset
          rm $FISH_CONFIG/$package/$key
      end

    case '*'
      echo "Unknown action '$action'."
      config.help "$package"
      return 1
  ...
1	14	----------> if test -z "$key"
        echo "You must specify a key name."
        return 1
      ...
13	13	-----------> test -z "$key"
137	1722	----------> set key (echo -n "$key" | tr -s '.' '/')
1585	1585	-----------> echo -n "$key" | tr -s '.' '/'
32	3617	----------> switch "$action"
        case -g --get
          if begin; test "$value" = -d; or test "$value" = --default; end
            if not set -q argv[5]
              echo "You must specify a default value."
              return 1
            end

            set default "$argv[5]"
          end

          if test -f $FISH_CONFIG/$package/$key
            cat $FISH_CONFIG/$package/$key
          else if set -q default
            echo -n "$default"
          else
            return 1
          end

        case -q --query
          test -f $FISH_CONFIG/$package/$key

        case -s --set
          mkdir -p (dirname $FISH_CONFIG/$package/$key)

          # Check for any additional options.
          switch "$value"
            case ''
              echo "You must specify a value to set."
              return 1

            case -e --edit
              set -l editor "$EDITOR"
              if not set -q EDITOR
                echo "No editor in `\$EDITOR` is specified."

                if type -q vim
                  set editor vim
                else if type -q nano
                  set editor nano
                else
                  return 1
                end

                echo "Using `$editor` as editor."
              end

              eval $editor $FISH_CONFIG/$package/$key

            case '*'
              echo -n "$value" > $FISH_CONFIG/$package/$key
          end

        case -u --unset
          rm $FISH_CONFIG/$package/$key
      ...
1941	3357	-----------> mkdir -p (dirname $FISH_CONFIG/$package/$key)
1416	1416	------------> dirname $FISH_CONFIG/$package/$key
28	228	-----------> switch "$value"
            case ''
              echo "You must specify a value to set."
              return 1

            case -e --edit
              set -l editor "$EDITOR"
              if not set -q EDITOR
                echo "No editor in `\$EDITOR` is specified."

                if type -q vim
                  set editor vim
                else if type -q nano
                  set editor nano
                else
                  return 1
                end

                echo "Using `$editor` as editor."
              end

              eval $editor $FISH_CONFIG/$package/$key

            case '*'
              echo -n "$value" > $FISH_CONFIG/$package/$key
          ...
200	200	------------> echo -n "$value" > $FISH_CONFIG/$package/$key
85	4964	--------> config ssh-config.d --set ssh_config_dir ~/.ssh/config.d/
6	60	---------> if not set -q FISH_CONFIG
    if set -q OMF_CONFIG
      set FISH_CONFIG "$OMF_CONFIG"
    else if set -q XDG_CONFIG_HOME
      set FISH_CONFIG "$XDG_CONFIG_HOME"
    else
      set FISH_CONFIG "$HOME/.config"
    end
  ...
17	17	----------> not set -q FISH_CONFIG
4	37	----------> if set -q OMF_CONFIG
      set FISH_CONFIG "$OMF_CONFIG"
    else if set -q XDG_CONFIG_HOME
      set FISH_CONFIG "$XDG_CONFIG_HOME"
    else
      set FISH_CONFIG "$HOME/.config"
    ...
11	11	-----------> set -q OMF_CONFIG
22	22	-----------> set FISH_CONFIG "$OMF_CONFIG"
2	80	---------> if begin; not set -q argv[1]; or contains -- -h $argv; or contains -- --help $argv; end
    test "$package" = -h
      or test "$package" = --help
      and set package ""

    config.help "$package"
    return 0
  ...
7	78	----------> begin; not set -q argv[1]; or contains -- -h $argv; or contains -- --help $argv; ...
13	13	-----------> not set -q argv[1]
32	32	-----------> contains -- -h $argv
26	26	-----------> contains -- --help $argv
2	30	---------> if test -z "$package" -o "$package" = . -o "$package" = ..
    echo "You must specify a valid package name."
    return 1
  ...
28	28	----------> test -z "$package" -o "$package" = . -o "$package" = ..
20	4709	---------> switch "$action"
    case -l --list ''
      for file in $FISH_CONFIG/$package/**
        if test -f "$file"
          printf "%s=%s\n" (realpath --relative-base="$FISH_CONFIG/$package" "$file" | tr -s '/' '.') (cat $file)
        end
      end

    # For any of the below actions, we need to do some additional
    # argument parsing.
    case -g --get -q --query -s --set -u --unset
      if test -z "$key"
        echo "You must specify a key name."
        return 1
      end

      # Expand the key name into a directory tree.
      set key (echo -n "$key" | tr -s '.' '/')

      # Match which of the above actions was given.
      switch "$action"
        case -g --get
          if begin; test "$value" = -d; or test "$value" = --default; end
            if not set -q argv[5]
              echo "You must specify a default value."
              return 1
            end

            set default "$argv[5]"
          end

          if test -f $FISH_CONFIG/$package/$key
            cat $FISH_CONFIG/$package/$key
          else if set -q default
            echo -n "$default"
          else
            return 1
          end

        case -q --query
          test -f $FISH_CONFIG/$package/$key

        case -s --set
          mkdir -p (dirname $FISH_CONFIG/$package/$key)

          # Check for any additional options.
          switch "$value"
            case ''
              echo "You must specify a value to set."
              return 1

            case -e --edit
              set -l editor "$EDITOR"
              if not set -q EDITOR
                echo "No editor in `\$EDITOR` is specified."

                if type -q vim
                  set editor vim
                else if type -q nano
                  set editor nano
                else
                  return 1
                end

                echo "Using `$editor` as editor."
              end

              eval $editor $FISH_CONFIG/$package/$key

            case '*'
              echo -n "$value" > $FISH_CONFIG/$package/$key
          end

        case -u --unset
          rm $FISH_CONFIG/$package/$key
      end

    case '*'
      echo "Unknown action '$action'."
      config.help "$package"
      return 1
  ...
2	15	----------> if test -z "$key"
        echo "You must specify a key name."
        return 1
      ...
13	13	-----------> test -z "$key"
184	1431	----------> set key (echo -n "$key" | tr -s '.' '/')
1247	1247	-----------> echo -n "$key" | tr -s '.' '/'
26	3243	----------> switch "$action"
        case -g --get
          if begin; test "$value" = -d; or test "$value" = --default; end
            if not set -q argv[5]
              echo "You must specify a default value."
              return 1
            end

            set default "$argv[5]"
          end

          if test -f $FISH_CONFIG/$package/$key
            cat $FISH_CONFIG/$package/$key
          else if set -q default
            echo -n "$default"
          else
            return 1
          end

        case -q --query
          test -f $FISH_CONFIG/$package/$key

        case -s --set
          mkdir -p (dirname $FISH_CONFIG/$package/$key)

          # Check for any additional options.
          switch "$value"
            case ''
              echo "You must specify a value to set."
              return 1

            case -e --edit
              set -l editor "$EDITOR"
              if not set -q EDITOR
                echo "No editor in `\$EDITOR` is specified."

                if type -q vim
                  set editor vim
                else if type -q nano
                  set editor nano
                else
                  return 1
                end

                echo "Using `$editor` as editor."
              end

              eval $editor $FISH_CONFIG/$package/$key

            case '*'
              echo -n "$value" > $FISH_CONFIG/$package/$key
          end

        case -u --unset
          rm $FISH_CONFIG/$package/$key
      ...
1770	2993	-----------> mkdir -p (dirname $FISH_CONFIG/$package/$key)
1223	1223	------------> dirname $FISH_CONFIG/$package/$key
28	224	-----------> switch "$value"
            case ''
              echo "You must specify a value to set."
              return 1

            case -e --edit
              set -l editor "$EDITOR"
              if not set -q EDITOR
                echo "No editor in `\$EDITOR` is specified."

                if type -q vim
                  set editor vim
                else if type -q nano
                  set editor nano
                else
                  return 1
                end

                echo "Using `$editor` as editor."
              end

              eval $editor $FISH_CONFIG/$package/$key

            case '*'
              echo -n "$value" > $FISH_CONFIG/$package/$key
          ...
196	196	------------> echo -n "$value" > $FISH_CONFIG/$package/$key
86	4965	--------> config ssh-config.d --set warn \
"# ssh-config.d: This ssh config file was automatically generated by
# ssh-config.d: ssh-config.d fish plugin from *.config files, located in
# ssh-config.d: ~/.ssh/config.d/. All changes will be overwritten without
# ssh-config.d: backup on following ssh execution. To change this behaviour
# ssh-config.d: (enable backup), delete all lines, containing 'ssh-config.d'.

"
6	61	---------> if not set -q FISH_CONFIG
    if set -q OMF_CONFIG
      set FISH_CONFIG "$OMF_CONFIG"
    else if set -q XDG_CONFIG_HOME
      set FISH_CONFIG "$XDG_CONFIG_HOME"
    else
      set FISH_CONFIG "$HOME/.config"
    end
  ...
18	18	----------> not set -q FISH_CONFIG
4	37	----------> if set -q OMF_CONFIG
      set FISH_CONFIG "$OMF_CONFIG"
    else if set -q XDG_CONFIG_HOME
      set FISH_CONFIG "$XDG_CONFIG_HOME"
    else
      set FISH_CONFIG "$HOME/.config"
    ...
12	12	-----------> set -q OMF_CONFIG
21	21	-----------> set FISH_CONFIG "$OMF_CONFIG"
2	86	---------> if begin; not set -q argv[1]; or contains -- -h $argv; or contains -- --help $argv; end
    test "$package" = -h
      or test "$package" = --help
      and set package ""

    config.help "$package"
    return 0
  ...
8	84	----------> begin; not set -q argv[1]; or contains -- -h $argv; or contains -- --help $argv; ...
14	14	-----------> not set -q argv[1]
34	34	-----------> contains -- -h $argv
28	28	-----------> contains -- --help $argv
3	30	---------> if test -z "$package" -o "$package" = . -o "$package" = ..
    echo "You must specify a valid package name."
    return 1
  ...
27	27	----------> test -z "$package" -o "$package" = . -o "$package" = ..
30	4702	---------> switch "$action"
    case -l --list ''
      for file in $FISH_CONFIG/$package/**
        if test -f "$file"
          printf "%s=%s\n" (realpath --relative-base="$FISH_CONFIG/$package" "$file" | tr -s '/' '.') (cat $file)
        end
      end

    # For any of the below actions, we need to do some additional
    # argument parsing.
    case -g --get -q --query -s --set -u --unset
      if test -z "$key"
        echo "You must specify a key name."
        return 1
      end

      # Expand the key name into a directory tree.
      set key (echo -n "$key" | tr -s '.' '/')

      # Match which of the above actions was given.
      switch "$action"
        case -g --get
          if begin; test "$value" = -d; or test "$value" = --default; end
            if not set -q argv[5]
              echo "You must specify a default value."
              return 1
            end

            set default "$argv[5]"
          end

          if test -f $FISH_CONFIG/$package/$key
            cat $FISH_CONFIG/$package/$key
          else if set -q default
            echo -n "$default"
          else
            return 1
          end

        case -q --query
          test -f $FISH_CONFIG/$package/$key

        case -s --set
          mkdir -p (dirname $FISH_CONFIG/$package/$key)

          # Check for any additional options.
          switch "$value"
            case ''
              echo "You must specify a value to set."
              return 1

            case -e --edit
              set -l editor "$EDITOR"
              if not set -q EDITOR
                echo "No editor in `\$EDITOR` is specified."

                if type -q vim
                  set editor vim
                else if type -q nano
                  set editor nano
                else
                  return 1
                end

                echo "Using `$editor` as editor."
              end

              eval $editor $FISH_CONFIG/$package/$key

            case '*'
              echo -n "$value" > $FISH_CONFIG/$package/$key
          end

        case -u --unset
          rm $FISH_CONFIG/$package/$key
      end

    case '*'
      echo "Unknown action '$action'."
      config.help "$package"
      return 1
  ...
2	15	----------> if test -z "$key"
        echo "You must specify a key name."
        return 1
      ...
13	13	-----------> test -z "$key"
184	1439	----------> set key (echo -n "$key" | tr -s '.' '/')
1255	1255	-----------> echo -n "$key" | tr -s '.' '/'
23	3218	----------> switch "$action"
        case -g --get
          if begin; test "$value" = -d; or test "$value" = --default; end
            if not set -q argv[5]
              echo "You must specify a default value."
              return 1
            end

            set default "$argv[5]"
          end

          if test -f $FISH_CONFIG/$package/$key
            cat $FISH_CONFIG/$package/$key
          else if set -q default
            echo -n "$default"
          else
            return 1
          end

        case -q --query
          test -f $FISH_CONFIG/$package/$key

        case -s --set
          mkdir -p (dirname $FISH_CONFIG/$package/$key)

          # Check for any additional options.
          switch "$value"
            case ''
              echo "You must specify a value to set."
              return 1

            case -e --edit
              set -l editor "$EDITOR"
              if not set -q EDITOR
                echo "No editor in `\$EDITOR` is specified."

                if type -q vim
                  set editor vim
                else if type -q nano
                  set editor nano
                else
                  return 1
                end

                echo "Using `$editor` as editor."
              end

              eval $editor $FISH_CONFIG/$package/$key

            case '*'
              echo -n "$value" > $FISH_CONFIG/$package/$key
          end

        case -u --unset
          rm $FISH_CONFIG/$package/$key
      ...
1697	2968	-----------> mkdir -p (dirname $FISH_CONFIG/$package/$key)
1271	1271	------------> dirname $FISH_CONFIG/$package/$key
35	227	-----------> switch "$value"
            case ''
              echo "You must specify a value to set."
              return 1

            case -e --edit
              set -l editor "$EDITOR"
              if not set -q EDITOR
                echo "No editor in `\$EDITOR` is specified."

                if type -q vim
                  set editor vim
                else if type -q nano
                  set editor nano
                else
                  return 1
                end

                echo "Using `$editor` as editor."
              end

              eval $editor $FISH_CONFIG/$package/$key

            case '*'
              echo -n "$value" > $FISH_CONFIG/$package/$key
          ...
192	192	------------> echo -n "$value" > $FISH_CONFIG/$package/$key
54	54	------> set -g omf_init_path $omf_init_path $path
42	42	------> emit perf:timer:finish $init
28	28	------> emit perf:timer:start $init
18	18	------> set -l IFS '/'
227	227	------> echo $init | read -la components
187	434	------> set path (printf '/%s' $components[1..-2])
247	247	-------> printf '/%s' $components[1..-2]
53	53	------> contains $path $omf_init_path
23	23	------> set package $components[-2]
13	86	------> if not set -q ignore_bundle
      set bundle $path/bundle
      set dependencies

      if test -f $bundle
        set -l IFS ' '
        while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
      end
    ...
13	13	-------> not set -q ignore_bundle
18	18	-------> set bundle $path/bundle
14	14	-------> set dependencies
4	28	-------> if test -f $bundle
        set -l IFS ' '
        while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
      ...
24	24	--------> test -f $bundle
305	2190	------> source $init $path
223	223	-------> set_color normal
180	225	-------> set -l cn (set_color normal 2>/dev/null)
45	45	--------> set_color normal 2>/dev/null
192	252	-------> set -g vi_mode_normal  (set_color blue 2>/dev/null)'n'$cn
60	60	--------> set_color blue 2>/dev/null
106	163	-------> set -g vi_mode_replace (set_color red 2>/dev/null)'r'$cn
57	57	--------> set_color red 2>/dev/null
90	137	-------> set -g vi_mode_REPLACE (set_color --background=red 2>/dev/null)'R'$cn
47	47	--------> set_color --background=red 2>/dev/null
85	127	-------> set -g vi_mode_insert  (set_color green 2>/dev/null)'i'$cn
42	42	--------> set_color green 2>/dev/null
75	116	-------> set -g vi_mode_delete  (set_color red 2>/dev/null)'d'$cn
41	41	--------> set_color red 2>/dev/null
75	116	-------> set -g vi_mode_change  (set_color yellow 2>/dev/null)'c'$cn
41	41	--------> set_color yellow 2>/dev/null
79	120	-------> set -g vi_mode_g       (set_color blue 2>/dev/null)'g'$cn
41	41	--------> set_color blue 2>/dev/null
75	115	-------> set -g vi_mode_lower   (set_color blue 2>/dev/null)'u'$cn
40	40	--------> set_color blue 2>/dev/null
70	111	-------> set -g vi_mode_upper   (set_color blue 2>/dev/null)'U'$cn
41	41	--------> set_color blue 2>/dev/null
71	111	-------> set -g vi_mode_swapcase (set_color blue 2>/dev/null)'~'$cn
40	40	--------> set_color blue 2>/dev/null
20	20	-------> set -g __vi_mode_undo_cmdline ''
14	14	-------> set -g __vi_mode_undo_cmdline_pos 0
8	35	-------> if test -z $vi_mode_default
    set -g vi_mode_default vi_mode_insert
...
14	14	--------> test -z $vi_mode_default
13	13	--------> set -g vi_mode_default vi_mode_insert
35	35	------> emit init_$package $path
37	37	------> set -g omf_init_path $omf_init_path $path
25	25	------> emit perf:timer:finish $init
28	1208	-----> for conf in $conf_path
    source $conf
  ...
159	226	------> source $conf
18	18	-------> set -q FZF_TMUX_HEIGHT
10	10	-------> set -q FZF_DEFAULT_OPTS
10	10	-------> set -q FZF_LEGACY_KEYBINDINGS
9	9	-------> set -q FZF_PREVIEW_FILE_CMD
9	9	-------> set -q FZF_PREVIEW_DIR_CMD
11	11	-------> function fzf_uninstall -e fzf_uninstall
    # disabled until we figure out a sensible way to ensure user overrides
    # are not erased
    # set -l _vars (set | command grep -E "^FZF.*\$" | command awk '{print $1;}')
    # for var in $_vars
    #     eval (set -e $var)
    # end
...
284	954	------> source $conf
27	641	-------> if test "$FZF_LEGACY_KEYBINDINGS" -eq 1
    bind \ct '__fzf_find_file'
    bind \cr '__fzf_reverse_isearch'
    bind \ec '__fzf_cd'
    bind \eC '__fzf_cd --hidden'
    bind \cg '__fzf_open'
    bind \co '__fzf_open --editor'

    if bind -M insert >/dev/null 2>/dev/null
        bind -M insert \ct '__fzf_find_file'
        bind -M insert \cr '__fzf_reverse_isearch'
        bind -M insert \ec '__fzf_cd'
        bind -M insert \eC '__fzf_cd --hidden'
        bind -M insert \cg '__fzf_open'
        bind -M insert \co '__fzf_open --editor'
    end
else
    bind \co '__fzf_find_file'
    bind \cr '__fzf_reverse_isearch'
    bind \ec '__fzf_cd'
    bind \eC '__fzf_cd --hidden'
    bind \eO '__fzf_open'
    bind \eo '__fzf_open --editor'

    if bind -M insert >/dev/null 2>/dev/null
        bind -M insert \co '__fzf_find_file'
        bind -M insert \cr '__fzf_reverse_isearch'
        bind -M insert \ec '__fzf_cd'
        bind -M insert \eC '__fzf_cd --hidden'
        bind -M insert \eO '__fzf_open'
        bind -M insert \eo '__fzf_open --editor'
    end
...
26	26	--------> test "$FZF_LEGACY_KEYBINDINGS" -eq 1
204	204	--------> bind \ct '__fzf_find_file'
36	36	--------> bind \cr '__fzf_reverse_isearch'
39	39	--------> bind \ec '__fzf_cd'
35	35	--------> bind \eC '__fzf_cd --hidden'
31	31	--------> bind \cg '__fzf_open'
22	22	--------> bind \co '__fzf_open --editor'
20	221	--------> if bind -M insert >/dev/null 2>/dev/null
        bind -M insert \ct '__fzf_find_file'
        bind -M insert \cr '__fzf_reverse_isearch'
        bind -M insert \ec '__fzf_cd'
        bind -M insert \eC '__fzf_cd --hidden'
        bind -M insert \cg '__fzf_open'
        bind -M insert \co '__fzf_open --editor'
    ...
54	54	---------> bind -M insert >/dev/null 2>/dev/null
30	30	---------> bind -M insert \ct '__fzf_find_file'
23	23	---------> bind -M insert \cr '__fzf_reverse_isearch'
25	25	---------> bind -M insert \ec '__fzf_cd'
24	24	---------> bind -M insert \eC '__fzf_cd --hidden'
23	23	---------> bind -M insert \cg '__fzf_open'
22	22	---------> bind -M insert \co '__fzf_open --editor'
5	19	-------> if set -q FZF_COMPLETE
    bind \t '__fzf_complete'
    if bind -M insert >/dev/null 2>/dev/null
        bind -M insert \t '__fzf_complete'
    end
...
14	14	--------> set -q FZF_COMPLETE
10	10	-------> function fzf_key_bindings_uninstall -e fzf_key_bindings_uninstall
    # disabled until we figure out a sensible way to ensure user overrides
    # are not erased
    # set -l _bindings (bind -a | sed -En "s/(')?__fzf.*\$//p" | sed 's/bind/bind -e/')
    # for binding in $_bindings
    #     eval $binding
    # end
...
11	11	-----> return 0
31	31	----> emit perf:timer:finish "Oh My Fish init installed packages"
269	359	----> functions -q fish_user_key_bindings
82	90	-----> source /home/niklash/.config/fish/functions/fish_user_key_bindings.fish
8	8	------> function fish_user_key_bindings
  fzf_key_bindings
  bind -M insert -k nul accept-autosuggestion
...
241	241	----> not functions -q __original_fish_user_key_bindings
32	32	----> functions -c fish_user_key_bindings __original_fish_user_key_bindings
6	6	----> function fish_user_key_bindings
  test -f $OMF_CONFIG/theme
    and read -l theme < $OMF_CONFIG/theme
    or set -l theme default
  test -e $OMF_CONFIG/key_bindings.fish;
    and source $OMF_CONFIG/key_bindings.fish
  # Prepare packages key bindings paths
  set -l key_bindings {$OMF_CONFIG,$OMF_PATH}/pkg/*/key_bindings.fish \
                      {$OMF_CONFIG,$OMF_PATH}/themes*/$theme/key_bindings.fish
  # Source all keybindings collected
  for file in $key_bindings
    source $file
  end
  # Call original key bindings if existent
  functions -q __original_fish_user_key_bindings
    and __original_fish_user_key_bindings
...
25	25	----> emit perf:timer:start "Oh My Fish init user config path"
70	775	----> require --no-bundle --path $OMF_CONFIG
26	26	-----> set packages $argv
5	22	-----> if test -z "$packages"
    echo 'usage: require <name>...'
    echo '       require --path <path>...'
    echo '       require --no-bundle --path <path>...'
    return 1
  ...
17	17	------> test -z "$packages"
9	207	-----> if set index (contains -i -- --no-bundle $packages)
    set -e packages[$index]
    set ignore_bundle
  ...
124	161	------> set index (contains -i -- --no-bundle $packages)
37	37	-------> contains -i -- --no-bundle $packages
23	23	------> set -e packages[$index]
14	14	------> set ignore_bundle
8	165	-----> if set index (contains -i -- --path $packages)
    set -e packages[$index]
    set package_path $packages

  # Requiring specific packages from default paths
  else
    set package_path {$OMF_PATH,$OMF_CONFIG}/pkg*/$packages

    # Exit with error if no package paths were generated
    test -z "$package_path"
      and return 1
  ...
86	119	------> set index (contains -i -- --path $packages)
33	33	-------> contains -i -- --path $packages
21	21	------> set -e packages[$index]
17	17	------> set package_path $packages
71	71	-----> set function_path $package_path/functions*
53	53	-----> set complete_path $package_path/completions*
49	49	-----> set init_path $package_path/init.fish*
48	48	-----> set conf_path $package_path/conf.d/*.fish
16	16	-----> test -n "$function_path"
12	12	-----> test -n "$complete_path"
14	14	-----> for init in $init_path
    emit perf:timer:start $init
    set -l IFS '/'
    echo $init | read -la components

    set path (printf '/%s' $components[1..-2])

    contains $path $omf_init_path
      and continue

    set package $components[-2]

    if not set -q ignore_bundle
      set bundle $path/bundle
      set dependencies

      if test -f $bundle
        set -l IFS ' '
        while read -l type dependency
          test "$type" != package
            and continue
          require "$dependency"
          set dependencies $dependencies $dependency
        end < $bundle
      end
    end

    source $init $path

    emit init_$package $path

    set -g omf_init_path $omf_init_path $path
    emit perf:timer:finish $init
  ...
11	11	-----> for conf in $conf_path
    source $conf
  ...
11	11	-----> return 0
27	27	----> emit perf:timer:finish "Oh My Fish init user config path"
159	159	----> set -l theme_conf_path {$OMF_CONFIG,$OMF_PATH}/themes*/$theme/conf.d
14	14	----> for conf in $theme_conf_path/*.fish
  source $conf
...
27	27	----> emit perf:timer:finish "Oh My Fish initialisation"
130	358	--> set -l basename (string replace -r '^.*/' '' -- $file)
228	228	---> string replace -r '^.*/' '' -- $file
37	37	--> contains -- $basename $sourcelist
25	25	--> set sourcelist $sourcelist $basename
37	37	--> [ -f $file -a -r $file ]
168	531	--> source $file
8	122	---> if not command -s rbenv > /dev/null
    echo "rbenv: command not found. See https://github.com/rbenv/rbenv"
    exit 1
...
114	114	----> not command -s rbenv > /dev/null
24	24	---> set -l rbenv_root ''
8	43	---> if test -z "$RBENV_ROOT"
    set rbenv_root "$HOME/.rbenv"
    set -x RBENV_ROOT "$HOME/.rbenv"
else
    set rbenv_root "$RBENV_ROOT"
...
17	17	----> test -z "$RBENV_ROOT"
18	18	----> set rbenv_root "$RBENV_ROOT"
4	111	---> if not contains $rbenv_root/shims $PATH
    set -x PATH $rbenv_root/shims $PATH
...
107	107	----> not contains $rbenv_root/shims $PATH
17	17	---> set -x RBENV_SHELL fish
7	46	---> if test ! -d "$rbenv_root/shims"; or test ! -d "$rbenv_root/versions"
    command mkdir -p $rbenv_root/{shims,versions}
...
21	21	----> test ! -d "$rbenv_root/shims"
18	18	----> test ! -d "$rbenv_root/versions"
127	172	--> set -l basename (string replace -r '^.*/' '' -- $file)
45	45	---> string replace -r '^.*/' '' -- $file
37	37	--> contains -- $basename $sourcelist
25	25	--> set sourcelist $sourcelist $basename
34	34	--> [ -f $file -a -r $file ]
382	12600	--> source $file
30	30	---> set __fish_sdkman_init "$HOME/.sdkman/bin/sdkman-init.sh"
21	21	---> set __fish_sdkman_noexport_init "$HOME/.config/fisher/github.com/reitzig/sdkman-for-fish/sdkman-noexport-init.sh"
5	30	---> if not test -f "$__fish_sdkman_init"
    exit 0
...
25	25	----> not test -f "$__fish_sdkman_init"
15	2611	---> if  begin       not test -f "$__fish_sdkman_noexport_init";
          or    env test "$__fish_sdkman_init" -nt "$__fish_sdkman_noexport_init"
    end
    mkdir -p (dirname $__fish_sdkman_noexport_init)
    sed -E -e 's/^(\s*).*(export|to_path).*$/\1:/g' "$__fish_sdkman_init" \
        > "$__fish_sdkman_noexport_init"
...
16	2596	----> begin       not test -f "$__fish_sdkman_noexport_init";
          or    env test "$__fish_sdkman_init" -nt "$__fish_sdkman_noexport_init"
    ...
25	25	-----> not test -f "$__fish_sdkman_noexport_init"
2555	2555	-----> env test "$__fish_sdkman_init" -nt "$__fish_sdkman_noexport_init"
9	9	---> function __fish_sdkman_run_in_bash
    # We need to leave stdin and stdout of sdk free for user interaction.
    # So, pipe relevant environment variables (which might have changed)
    # through a file.
    # But since now getting the exit code of sdk itself is a hassle,
    # pipe it as well.
    #
    # TODO: Can somebody get this to work without the overhead of a file?
    set pipe (mktemp)
    bash -c "$argv[1];
             echo -e \"\$?\" > $pipe;
             env | grep -e '^SDKMAN_\|^PATH' >> $pipe;
             env | grep -i -E \"^(`echo \${SDKMAN_CANDIDATES_CSV} | sed 's/,/|/g'`)_HOME\" >> $pipe;
             echo \"SDKMAN_OFFLINE_MODE=\${SDKMAN_OFFLINE_MODE}\" >> $pipe" # it's not an environment variable!
    set bashDump (cat $pipe; rm $pipe)

    set sdkStatus $bashDump[1]
    set bashEnv $bashDump[2..-1]

    # If SDKMAN! succeeded, copy relevant environment variables
    # to the current shell (they might have changed)
    if [ $sdkStatus = 0 ]
        for line in $bashEnv
            set parts (string split "=" $line)
            set var $parts[1]
            set value (string join "=" $parts[2..-1])

            switch "$var"
            case "PATH"
                # Special treatment: need fish list instead
                # of colon-separated list.
                set value (string split : "$value")
            end

            if test -n value
                set -gx $var $value
                # Note: This makes SDKMAN_OFFLINE_MODE an environment variable.
                #       That gives it the behaviour we _want_!
            end
        end
    end

    return $sdkStatus
...
11	9517	---> if not set -q SDKMAN_DIR; or test (ls -ld "$SDKMAN_DIR" | awk '{print $3}') != (whoami)
    set -e SDKMAN_DIR
    __fish_sdkman_run_in_bash "source $__fish_sdkman_init"
...
19	19	----> not set -q SDKMAN_DIR
275	9487	----> test (ls -ld "$SDKMAN_DIR" | awk '{print $3}') != (whoami)
1533	7601	-----> ls -ld "$SDKMAN_DIR" | awk '{print $3}'
269	2073	------> source /usr/share/fish/functions/ls.fish
34	1804	-------> for opt in --color=auto -G --color -F
    if command ls $opt / >/dev/null 2>/dev/null

        function ls --description "List contents of directory" -V opt
            isatty stdout
            and set -a opt -F
            command ls $opt $argv
        end

        if [ $opt = --color=auto ] && ! set -qx LS_COLORS && set -l cmd (command -s {g,}dircolors)[1]
            set -l colorfile
            for file in ~/.dir_colors ~/.dircolors /etc/DIR_COLORS
                if test -f $file
                    set colorfile $file
                    break
                end
            end
            # Here we rely on the legacy behavior of `dircolors -c` producing output
            # suitable for csh in order to extract just the data we're interested in.
            set -gx LS_COLORS ($cmd -c $colorfile | string split ' ')[3]
            # The value should always be quoted but be conservative and check first.
            if string match -qr '^([\'"]).*\1$' -- $LS_COLORS
                set LS_COLORS (string match -r '^.(.*).$' $LS_COLORS)[2]
            end
        end

        break
    end
...
22	1770	--------> if command ls $opt / >/dev/null 2>/dev/null

        function ls --description "List contents of directory" -V opt
            isatty stdout
            and set -a opt -F
            command ls $opt $argv
        end

        if [ $opt = --color=auto ] && ! set -qx LS_COLORS && set -l cmd (command -s {g,}dircolors)[1]
            set -l colorfile
            for file in ~/.dir_colors ~/.dircolors /etc/DIR_COLORS
                if test -f $file
                    set colorfile $file
                    break
                end
            end
            # Here we rely on the legacy behavior of `dircolors -c` producing output
            # suitable for csh in order to extract just the data we're interested in.
            set -gx LS_COLORS ($cmd -c $colorfile | string split ' ')[3]
            # The value should always be quoted but be conservative and check first.
            if string match -qr '^([\'"]).*\1$' -- $LS_COLORS
                set LS_COLORS (string match -r '^.(.*).$' $LS_COLORS)[2]
            end
        end

        break
    ...
1664	1664	---------> command ls $opt / >/dev/null 2>/dev/null
24	24	---------> function ls --description "List contents of directory" -V opt
            isatty stdout
            and set -a opt -F
            command ls $opt $argv
        ...
9	51	---------> if [ $opt = --color=auto ] && ! set -qx LS_COLORS && set -l cmd (command -s {g,}dircolors)[1]
            set -l colorfile
            for file in ~/.dir_colors ~/.dircolors /etc/DIR_COLORS
                if test -f $file
                    set colorfile $file
                    break
                end
            end
            # Here we rely on the legacy behavior of `dircolors -c` producing output
            # suitable for csh in order to extract just the data we're interested in.
            set -gx LS_COLORS ($cmd -c $colorfile | string split ' ')[3]
            # The value should always be quoted but be conservative and check first.
            if string match -qr '^([\'"]).*\1$' -- $LS_COLORS
                set LS_COLORS (string match -r '^.(.*).$' $LS_COLORS)[2]
            end
        ...
27	27	----------> [ $opt = --color=auto ]
15	15	----------> ! set -qx LS_COLORS
9	9	---------> break
415	1985	------> isatty stdout
215	230	-------> source /usr/share/fish/functions/isatty.fish
15	15	--------> function isatty -d "Tests if a file descriptor is a tty"
    set -l options 'h/help'
    argparse -n isatty $options -- $argv
    or return

    if set -q _flag_help
        __fish_print_help isatty
        return 0
    end

    if set -q argv[2]
        printf (_ "%s: Too many arguments") isatty >&2
        return 1
    end

    set -l fd
    switch "$argv"
        case stdin ''
            set fd 0
        case stdout
            set fd 1
        case stderr
            set fd 2
        case '*'
            set fd $argv[1]
    end

    # Use `command test` because `builtin test` doesn't open the regular fd's.
    # See https://github.com/fish-shell/fish-shell/issues/1228
    # Too often `command test` is some bogus Go binary, I don't know why. Use [ because
    # it's less likely to be something surprising. See #5665
    command [ -t "$fd" ]
...
27	27	-------> set -l options 'h/help'
28	28	-------> argparse -n isatty $options -- $argv
4	17	-------> if set -q _flag_help
        __fish_print_help isatty
        return 0
    ...
13	13	--------> set -q _flag_help
2	14	-------> if set -q argv[2]
        printf (_ "%s: Too many arguments") isatty >&2
        return 1
    ...
12	12	--------> set -q argv[2]
14	14	-------> set -l fd
16	30	-------> switch "$argv"
        case stdin ''
            set fd 0
        case stdout
            set fd 1
        case stderr
            set fd 2
        case '*'
            set fd $argv[1]
    ...
14	14	--------> set fd 1
1210	1210	-------> command [ -t "$fd" ]
2010	2010	------> command ls $opt $argv
1611	1611	-----> whoami
187	247	--> set -l basename (string replace -r '^.*/' '' -- $file)
60	60	---> string replace -r '^.*/' '' -- $file
49	49	--> contains -- $basename $sourcelist
29	29	--> set sourcelist $sourcelist $basename
41	41	--> [ -f $file -a -r $file ]
86	12813	--> source $file
4788	12727	---> starship init fish | source
-1487	7939	----> source ("/home/niklash/.cargo/bin/starship" init fish --print-full-init | psub)
1048	5825	-----> "/home/niklash/.cargo/bin/starship" init fish --print-full-init | psub
413	430	------> source /usr/share/fish/functions/psub.fish
17	17	-------> function psub --description "Read from stdin into a file and output the filename. Remove the file when the command that called psub exits."
    set -l options -x 'f,F' -x 'F,s' 'h/help' 'f/file' 'F/fifo' 's/suffix=' 'T-testing'
    argparse -n psub --max-args=0 $options -- $argv
    or return

    if set -q _flag_help
        __fish_print_help psub
        return 0
    end

    set -l dirname
    set -l filename
    set -l funcname

    if not status --is-command-substitution
        printf (_ "%s: Not inside of command substitution") psub >&2
        return 1
    end

    set -l tmpdir /tmp
    set -q TMPDIR
    and set tmpdir $TMPDIR

    if set -q _flag_fifo
        # Write output to pipe. This needs to be done in the background so
        # that the command substitution exits without needing to wait for
        # all the commands to exit.
        set dirname (mktemp -d $tmpdir/.psub.XXXXXXXXXX)
        or return
        set filename $dirname/psub.fifo"$_flag_suffix"
        command mkfifo $filename
        # Note that if we were to do the obvious `cat >$filename &`, we would deadlock
        # because $filename may be opened before the fork. Use tee to ensure it is opened
        # after the fork.
        command tee $filename >/dev/null &
    else if test -z "$_flag_suffix"
        set filename (mktemp $tmpdir/.psub.XXXXXXXXXX)
        command cat >$filename
    else
        set dirname (mktemp -d $tmpdir/.psub.XXXXXXXXXX)
        set filename "$dirname/psub$_flag_suffix"
        command cat >$filename
    end

    # Write filename to stdout
    echo $filename

    # This flag isn't documented. It's strictly for our unit tests.
    if set -q _flag_testing
        return
    end

    # Find unique function name
    while true
        set funcname __fish_psub_(random)
        if not functions $funcname >/dev/null 2>/dev/null
            break
        end
    end

    # Make sure we erase file when caller exits
    function $funcname --on-job-exit caller --inherit-variable filename --inherit-variable dirname --inherit-variable funcname
        command rm $filename
        if test -n "$dirname"
            command rmdir $dirname
        end
        functions -e $funcname
    end

...
43	43	------> set -l options -x 'f,F' -x 'F,s' 'h/help' 'f/file' 'F/fifo' 's/suffix=' 'T-testing'
48	48	------> argparse -n psub --max-args=0 $options -- $argv
5	17	------> if set -q _flag_help
        __fish_print_help psub
        return 0
    ...
12	12	-------> set -q _flag_help
12	12	------> set -l dirname
11	11	------> set -l filename
10	10	------> set -l funcname
4	14	------> if not status --is-command-substitution
        printf (_ "%s: Not inside of command substitution") psub >&2
        return 1
    ...
10	10	-------> not status --is-command-substitution
12	12	------> set -l tmpdir /tmp
8	8	------> set -q TMPDIR
34	3117	------> if set -q _flag_fifo
        # Write output to pipe. This needs to be done in the background so
        # that the command substitution exits without needing to wait for
        # all the commands to exit.
        set dirname (mktemp -d $tmpdir/.psub.XXXXXXXXXX)
        or return
        set filename $dirname/psub.fifo"$_flag_suffix"
        command mkfifo $filename
        # Note that if we were to do the obvious `cat >$filename &`, we would deadlock
        # because $filename may be opened before the fork. Use tee to ensure it is opened
        # after the fork.
        command tee $filename >/dev/null &
    else if test -z "$_flag_suffix"
        set filename (mktemp $tmpdir/.psub.XXXXXXXXXX)
        command cat >$filename
    else
        set dirname (mktemp -d $tmpdir/.psub.XXXXXXXXXX)
        set filename "$dirname/psub$_flag_suffix"
        command cat >$filename
    ...
8	8	-------> set -q _flag_fifo
14	14	-------> test -z "$_flag_suffix"
209	1720	-------> set filename (mktemp $tmpdir/.psub.XXXXXXXXXX)
1511	1511	--------> mktemp $tmpdir/.psub.XXXXXXXXXX
1341	1341	-------> command cat >$filename
44	44	------> echo $filename
5	19	------> if set -q _flag_testing
        return
    ...
14	14	-------> set -q _flag_testing
16	965	------> while true
        set funcname __fish_psub_(random)
        if not functions $funcname >/dev/null 2>/dev/null
            break
        end
    ...
193	193	-------> true
209	411	-------> set funcname __fish_psub_(random)
202	202	--------> random
12	345	-------> if not functions $funcname >/dev/null 2>/dev/null
            break
        ...
321	321	--------> not functions $funcname >/dev/null 2>/dev/null
12	12	--------> break
27	27	------> function $funcname --on-job-exit caller --inherit-variable filename --inherit-variable dirname --inherit-variable funcname
        command rm $filename
        if test -n "$dirname"
            command rmdir $dirname
        end
        functions -e $funcname
    ...
9	9	-----> function fish_prompt
    switch "$fish_key_bindings"
        case fish_hybrid_key_bindings fish_vi_key_bindings
            set keymap "$fish_bind_mode"
        case '*'
            set keymap insert
    end
    set -l exit_code $status
    # Account for changes in variable name between v2.7 and v3.0
    set -l starship_duration "$CMD_DURATION$cmd_duration"
    "/home/niklash/.cargo/bin/starship" prompt --status=$exit_code --keymap=$keymap --cmd-duration=$starship_duration --jobs=(count (jobs -p))
...
25	25	-----> set VIRTUAL_ENV_DISABLE_PROMPT 1
6	6	-----> function fish_mode_prompt; ...
197	1735	-----> export STARSHIP_SHELL="fish"
93	100	------> source /home/niklash/.config/fish/functions/export.fish
7	7	-------> function export
  set arr (echo $argv|tr = \n)
  set -gx $arr[1] $arr[2]
...
190	1409	------> set arr (echo $argv|tr = \n)
1219	1219	-------> echo $argv|tr = \n
29	29	------> set -gx $arr[1] $arr[2]
38	1826	-----> __fish_psub_30806 JOB_EXIT 4 0
1710	1710	------> command rm $filename
2	32	------> if test -n "$dirname"
            command rmdir $dirname
        ...
30	30	-------> test -n "$dirname"
46	46	------> functions -e $funcname
191	251	--> set -l basename (string replace -r '^.*/' '' -- $file)
60	60	---> string replace -r '^.*/' '' -- $file
48	48	--> contains -- $basename $sourcelist
30	30	--> set sourcelist $sourcelist $basename
42	42	--> [ -f $file -a -r $file ]
88	152	--> source $file
64	64	---> set -gx MANPATH $MANPATH /usr/share/man /usr/local/share/man /opt/man /usr/X11R6/man
57	57	> builtin source /etc/fish/config.fish
98	105	> source /usr/share/fish/functions/fish_title.fish
7	7	-> function fish_title
    # emacs is basically the only term that can't handle it.
    if not set -q INSIDE_EMACS
        echo (status current-command) (__fish_pwd)
    end
...
33	3035	> fish_title
8	3002	-> if not set -q INSIDE_EMACS
        echo (status current-command) (__fish_pwd)
    ...
17	17	--> not set -q INSIDE_EMACS
305	2977	--> echo (status current-command) (__fish_pwd)
19	19	---> status current-command
409	2653	---> __fish_pwd
123	2041	----> source /usr/share/fish/functions/__fish_pwd.fish
189	1918	-----> switch (uname)
    case 'CYGWIN_*'
        function __fish_pwd --description "Show current path"
            pwd | sed -e 's-^/cygdrive/\(.\)/\?-\u\1:/-'
        end
    case '*'
        function __fish_pwd --description "Show current path"
            pwd
        end
...
1718	1718	------> uname
11	11	------> function __fish_pwd --description "Show current path"
            pwd
        ...
203	203	----> pwd
99	108	> source /home/niklash/.local/share/omf/themes/default/fish_right_prompt.fish
9	9	-> function fish_right_prompt
  set_color $fish_color_autosuggestion 2> /dev/null; or set_color 555
  date "+%H:%M:%S"
  set_color normal
...
25	58095	> __fish_on_interactive
412	58043	-> __fish_config_interactive
1655	1672	--> source /usr/share/fish/functions/__fish_config_interactive.fish
17	17	---> function __fish_config_interactive -d "Initializations that should be performed when entering interactive mode"
    if test $__fish_initialized -lt 3000
        # Perform transitions relevant to going from fish 2.x to 3.x.

        # Migrate old universal abbreviations to the new scheme.
        __fish_abbr_old | source
    end

    # Make sure this function is only run once.
    if set -q __fish_config_interactive_done
        return
    end

    set -g __fish_config_interactive_done
    set -g __fish_active_key_bindings

    if not set -q fish_greeting
        set -l line1 (_ 'Welcome to fish, the friendly interactive shell')
        set -l line2 ''
        if test $__fish_initialized -lt 2300
            set line2 \n(_ 'Type `help` for instructions on how to use fish')
        end
        set -U fish_greeting "$line1$line2"
    end

    if set -q fish_private_mode; and string length -q -- $fish_greeting
        set -l line (_ "fish is running in private mode, history will not be persisted.")
        set -g fish_greeting $fish_greeting.\n$line
    end

    # usage: __init_uvar VARIABLE VALUES...
    function __init_uvar -d "Sets a universal variable if it's not already set"
        if not set --query $argv[1]
            set --universal $argv
        end
    end

    #
    # If we are starting up for the first time, set various defaults.
    if test $__fish_initialized -lt 3100

        # Regular syntax highlighting colors
        __init_uvar fish_color_normal normal
        __init_uvar fish_color_command 005fd7
        __init_uvar fish_color_param 00afff
        __init_uvar fish_color_redirection 00afff
        __init_uvar fish_color_comment 990000
        __init_uvar fish_color_error ff0000
        __init_uvar fish_color_escape 00a6b2
        __init_uvar fish_color_operator 00a6b2
        __init_uvar fish_color_end 009900
        __init_uvar fish_color_quote 999900
        __init_uvar fish_color_autosuggestion 555 brblack
        __init_uvar fish_color_user brgreen
        __init_uvar fish_color_host normal
        __init_uvar fish_color_host_remote yellow
        __init_uvar fish_color_valid_path --underline
        __init_uvar fish_color_status red

        __init_uvar fish_color_cwd green
        __init_uvar fish_color_cwd_root red

        # Background color for matching quotes and parenthesis
        __init_uvar fish_color_match --background=brblue

        # Background color for search matches
        __init_uvar fish_color_search_match bryellow --background=brblack

        # Background color for selections
        __init_uvar fish_color_selection white --bold --background=brblack

        # XXX fish_color_cancel was added in 2.6, but this was added to post-2.3 initialization
        # when 2.4 and 2.5 were already released
        __init_uvar fish_color_cancel -r

        # Pager colors
        __init_uvar fish_pager_color_prefix white --bold --underline
        __init_uvar fish_pager_color_completion
        __init_uvar fish_pager_color_description B3A06D yellow
        __init_uvar fish_pager_color_progress brwhite --background=cyan

        #
        # Directory history colors
        #
        __init_uvar fish_color_history_current --bold
    end

    #
    # Generate man page completions if not present.
    #
    # Don't do this if we're being invoked as part of running unit tests.
    if not set -q FISH_UNIT_TESTS_RUNNING
        if not test -d $__fish_user_data_dir/generated_completions
            # Generating completions from man pages needs python (see issue #3588).

            # We cannot simply do `fish_update_completions &` because it is a function.
            # We cannot do `eval` since it is a function.
            # We don't want to call `fish -c` since that is unnecessary and sources config.fish again.
            # Hence we'll call python directly.
            # c_m_p.py should work with any python version.
            set -l update_args -B $__fish_data_dir/tools/create_manpage_completions.py --manpath --cleanup-in '~/.config/fish/completions' --cleanup-in '~/.config/fish/generated_completions'
            for py in python{3,2,}
                if command -sq $py
                    set -l c $py $update_args
                    # Run python directly in the background and swallow all output
                    $c (: fish_update_completions: generating completions from man pages) >/dev/null 2>&1 &
                    # Then disown the job so that it continues to run in case of an early exit (#6269)
                    disown 2>&1 >/dev/null
                    break
                end
            end
        end
    end

    #
    # Print a greeting.
    # fish_greeting can be a function (preferred) or a variable.
    #
    if status --is-interactive
        if functions -q fish_greeting
            fish_greeting
        else
            # The greeting used to be skipped when fish_greeting was empty (not just undefined)
            # Keep it that way to not print superfluous newlines on old configuration
            test -n "$fish_greeting"
            and echo $fish_greeting
        end
    end

    #
    # This event handler makes sure the prompt is repainted when
    # fish_color_cwd{,_root} changes value. Like all event handlers, it can't be
    # autoloaded.
    #
    set -l varargs --on-variable fish_key_bindings
    for var in user host cwd{,_root} status
        set -a varargs --on-variable fish_color_$var
    end
    function __fish_repaint $varargs -d "Event handler, repaints the prompt when fish_color_cwd* changes"
        if status --is-interactive
            set -e __fish_prompt_cwd
            commandline -f repaint 2>/dev/null
        end
    end

    #
    # Completions for SysV startup scripts. These aren't bound to any
    # specific command, so they can't be autoloaded.
    #
    if test -d /etc/init.d
        complete -x -p "/etc/init.d/*" -a start --description 'Start service'
        complete -x -p "/etc/init.d/*" -a stop --description 'Stop service'
        complete -x -p "/etc/init.d/*" -a status --description 'Print service status'
        complete -x -p "/etc/init.d/*" -a restart --description 'Stop and then start service'
        complete -x -p "/etc/init.d/*" -a reload --description 'Reload service configuration'
    end

    #
    # We want to show our completions for the [ (test) builtin, but
    # we don't want to create a [.fish. test.fish will not be loaded until
    # the user tries [ interactively.
    #
    complete -c [ --wraps test
    complete -c ! --wraps not

    #
    # Only a few builtins take filenames; initialize the rest with no file completions
    #
    complete -c(builtin -n | string match -rv '(source|cd|exec|realpath|set|\\[|test|for)') --no-files

    # Reload key bindings when binding variable change
    function __fish_reload_key_bindings -d "Reload key bindings when binding variable change" --on-variable fish_key_bindings
        # Make sure some key bindings are set
        __init_uvar fish_key_bindings fish_default_key_bindings

        # Do nothing if the key bindings didn't actually change.
        # This could be because the variable was set to the existing value
        # or because it was a local variable.
        # If fish_key_bindings is empty on the first run, we still need to set the defaults.
        if test "$fish_key_bindings" = "$__fish_active_key_bindings" -a -n "$fish_key_bindings"
            return
        end
        # Check if fish_key_bindings is a valid function.
        # If not, either keep the previous bindings (if any) or revert to default.
        # Also print an error so the user knows.
        if not functions -q "$fish_key_bindings"
            echo "There is no fish_key_bindings function called: '$fish_key_bindings'" >&2
            # We need to see if this is a defined function, otherwise we'd be in an endless loop.
            if functions -q $__fish_active_key_bindings
                echo "Keeping $__fish_active_key_bindings" >&2
                # Set the variable to the old value so this error doesn't happen again.
                set fish_key_bindings $__fish_active_key_bindings
                return 1
            else if functions -q fish_default_key_bindings
                echo "Reverting to default bindings" >&2
                set fish_key_bindings fish_default_key_bindings
                # Return because we are called again
                return 0
            else
                # If we can't even find the default bindings, something is broken.
                # Without it, we would eventually run into the stack size limit, but that'd print hundreds of duplicate lines
                # so we should give up earlier.
                echo "Cannot find fish_default_key_bindings, falling back to very simple bindings." >&2
                echo "Most likely something is wrong with your installation." >&2
                return 0
            end
        end
        set -g __fish_active_key_bindings "$fish_key_bindings"
        set -g fish_bind_mode default
        if test "$fish_key_bindings" = fish_default_key_bindings
            # Redirect stderr per #1155
            fish_default_key_bindings 2>/dev/null
        else
            $fish_key_bindings 2>/dev/null
        end
        # Load user key bindings if they are defined
        if functions --query fish_user_key_bindings >/dev/null
            fish_user_key_bindings 2>/dev/null
        end
    end

    # Load key bindings
    __fish_reload_key_bindings

    if not set -q FISH_UNIT_TESTS_RUNNING
        # Enable bracketed paste before every prompt (see __fish_shared_bindings for the bindings).
        # Disable it for unit tests so we don't have to add the sequences to bind.expect
        function __fish_enable_bracketed_paste --on-event fish_prompt
            printf "\e[?2004h"
        end

        # Disable BP before every command because that might not support it.
        function __fish_disable_bracketed_paste --on-event fish_preexec --on-event fish_exit
            printf "\e[?2004l"
        end

        # Tell the terminal we support BP. Since we are in __f_c_i, the first fish_prompt
        # has already fired.
        __fish_enable_bracketed_paste
    end

    # Similarly, enable TMUX's focus reporting when in tmux.
    # This will be handled by
    # - The keybindings (reading the sequence and triggering an event)
    # - Any listeners (like the vi-cursor)
    if set -q TMUX
        and not set -q FISH_UNIT_TESTS_RUNNING
        function __fish_enable_focus --on-event fish_postexec
            echo -n \e\[\?1004h
        end
        function __fish_disable_focus --on-event fish_preexec
            echo -n \e\[\?1004l
        end
        # Note: Don't call this initially because, even though we're in a fish_prompt event,
        # tmux reacts sooo quickly that we'll still get a sequence before we're prepared for it.
        # So this means that we won't get focus events until you've run at least one command, but that's preferable
        # to always seeing `^[[I` when starting fish.
        # __fish_enable_focus
    end

    function __fish_winch_handler --on-signal WINCH -d "Repaint screen when window changes size"
        commandline -f repaint >/dev/null 2>/dev/null
    end

    # Notify terminals when $PWD changes (issue #906).
    # VTE based terminals, Terminal.app, and iTerm.app (TODO) support this.
    if test 0"$VTE_VERSION" -ge 3405 -o "$TERM_PROGRAM" = "Apple_Terminal" -a (string match -r '\d+' 0"$TERM_PROGRAM_VERSION") -ge 309
        function __update_cwd_osc --on-variable PWD --description 'Notify capable terminals when $PWD changes'
            if status --is-command-substitution || set -q INSIDE_EMACS
                return
            end
            printf \e\]7\;file://%s%s\a $hostname (string escape --style=url $PWD)
        end
        __update_cwd_osc # Run once because we might have already inherited a PWD from an old tab
    end

    ### Command-not-found handlers
    # This can be overridden by defining a new __fish_command_not_found_handler function
    if not type -q __fish_command_not_found_handler
        # Read the OS/Distro from /etc/os-release.
        # This has a "ID=" line that defines the exact distribution,
        # and an "ID_LIKE=" line that defines what it is derived from or otherwise like.
        # For our purposes, we use both.
        set -l os
        if test -r /etc/os-release
            set os (string match -r '^ID(?:_LIKE)?\s*=.*' < /etc/os-release | \
            string replace -r '^ID(?:_LIKE)?\s*=(.*)' '$1' | string trim -c '\'"' | string split " ")
        end

        # First check if we are on OpenSUSE since SUSE's handler has no options
        # but the same name and path as Ubuntu's.
        if contains -- suse $os || contains -- sles $os && type -q command-not-found
            function __fish_command_not_found_handler --on-event fish_command_not_found
                /usr/bin/command-not-found $argv[1]
            end
            # Check for Fedora's handler
        else if test -f /usr/libexec/pk-command-not-found
            function __fish_command_not_found_handler --on-event fish_command_not_found
                /usr/libexec/pk-command-not-found $argv[1]
            end
            # Check in /usr/lib, this is where modern Ubuntus place this command
        else if test -f /usr/lib/command-not-found
            function __fish_command_not_found_handler --on-event fish_command_not_found
                /usr/lib/command-not-found -- $argv[1]
            end
            # Check for NixOS handler
        else if test -f /run/current-system/sw/bin/command-not-found
            function __fish_command_not_found_handler --on-event fish_command_not_found
                /run/current-system/sw/bin/command-not-found $argv
            end
            # Ubuntu Feisty places this command in the regular path instead
        else if type -q command-not-found
            function __fish_command_not_found_handler --on-event fish_command_not_found
                command-not-found -- $argv[1]
            end
            # pkgfile is an optional, but official, package on Arch Linux
            # it ships with example handlers for bash and zsh, so we'll follow that format
        else if type -p -q pkgfile
            function __fish_command_not_found_handler --on-event fish_command_not_found
                set -l __packages (pkgfile --binaries --verbose -- $argv[1] 2>/dev/null)
                if test $status -eq 0
                    printf "%s may be found in the following packages:\n" "$argv[1]"
                    printf "  %s\n" $__packages
                else
                    __fish_default_command_not_found_handler $argv[1]
                end
            end
            # Use standard fish command not found handler otherwise
        else
            function __fish_command_not_found_handler --on-event fish_command_not_found
                __fish_default_command_not_found_handler $argv[1]
            end
        end
    end

    # Bump this whenever some code below needs to run once when upgrading to a new version.
    # The universal variable __fish_initialized is initialized in share/config.fish.
    set __fish_initialized 3100
...
3	33	--> if test $__fish_initialized -lt 3000
        # Perform transitions relevant to going from fish 2.x to 3.x.

        # Migrate old universal abbreviations to the new scheme.
        __fish_abbr_old | source
    ...
30	30	---> test $__fish_initialized -lt 3000
3	16	--> if set -q __fish_config_interactive_done
        return
    ...
13	13	---> set -q __fish_config_interactive_done
18	18	--> set -g __fish_config_interactive_done
14	14	--> set -g __fish_active_key_bindings
1	12	--> if not set -q fish_greeting
        set -l line1 (_ 'Welcome to fish, the friendly interactive shell')
        set -l line2 ''
        if test $__fish_initialized -lt 2300
            set line2 \n(_ 'Type `help` for instructions on how to use fish')
        end
        set -U fish_greeting "$line1$line2"
    ...
11	11	---> not set -q fish_greeting
1	11	--> if set -q fish_private_mode; and string length -q -- $fish_greeting
        set -l line (_ "fish is running in private mode, history will not be persisted.")
        set -g fish_greeting $fish_greeting.\n$line
    ...
10	10	---> set -q fish_private_mode
9	9	--> function __init_uvar -d "Sets a universal variable if it's not already set"
        if not set --query $argv[1]
            set --universal $argv
        end
    ...
2	19	--> if test $__fish_initialized -lt 3100

        # Regular syntax highlighting colors
        __init_uvar fish_color_normal normal
        __init_uvar fish_color_command 005fd7
        __init_uvar fish_color_param 00afff
        __init_uvar fish_color_redirection 00afff
        __init_uvar fish_color_comment 990000
        __init_uvar fish_color_error ff0000
        __init_uvar fish_color_escape 00a6b2
        __init_uvar fish_color_operator 00a6b2
        __init_uvar fish_color_end 009900
        __init_uvar fish_color_quote 999900
        __init_uvar fish_color_autosuggestion 555 brblack
        __init_uvar fish_color_user brgreen
        __init_uvar fish_color_host normal
        __init_uvar fish_color_host_remote yellow
        __init_uvar fish_color_valid_path --underline
        __init_uvar fish_color_status red

        __init_uvar fish_color_cwd green
        __init_uvar fish_color_cwd_root red

        # Background color for matching quotes and parenthesis
        __init_uvar fish_color_match --background=brblue

        # Background color for search matches
        __init_uvar fish_color_search_match bryellow --background=brblack

        # Background color for selections
        __init_uvar fish_color_selection white --bold --background=brblack

        # XXX fish_color_cancel was added in 2.6, but this was added to post-2.3 initialization
        # when 2.4 and 2.5 were already released
        __init_uvar fish_color_cancel -r

        # Pager colors
        __init_uvar fish_pager_color_prefix white --bold --underline
        __init_uvar fish_pager_color_completion
        __init_uvar fish_pager_color_description B3A06D yellow
        __init_uvar fish_pager_color_progress brwhite --background=cyan

        #
        # Directory history colors
        #
        __init_uvar fish_color_history_current --bold
    ...
17	17	---> test $__fish_initialized -lt 3100
12	50	--> if not set -q FISH_UNIT_TESTS_RUNNING
        if not test -d $__fish_user_data_dir/generated_completions
            # Generating completions from man pages needs python (see issue #3588).

            # We cannot simply do `fish_update_completions &` because it is a function.
            # We cannot do `eval` since it is a function.
            # We don't want to call `fish -c` since that is unnecessary and sources config.fish again.
            # Hence we'll call python directly.
            # c_m_p.py should work with any python version.
            set -l update_args -B $__fish_data_dir/tools/create_manpage_completions.py --manpath --cleanup-in '~/.config/fish/completions' --cleanup-in '~/.config/fish/generated_completions'
            for py in python{3,2,}
                if command -sq $py
                    set -l c $py $update_args
                    # Run python directly in the background and swallow all output
                    $c (: fish_update_completions: generating completions from man pages) >/dev/null 2>&1 &
                    # Then disown the job so that it continues to run in case of an early exit (#6269)
                    disown 2>&1 >/dev/null
                    break
                end
            end
        end
    ...
11	11	---> not set -q FISH_UNIT_TESTS_RUNNING
2	27	---> if not test -d $__fish_user_data_dir/generated_completions
            # Generating completions from man pages needs python (see issue #3588).

            # We cannot simply do `fish_update_completions &` because it is a function.
            # We cannot do `eval` since it is a function.
            # We don't want to call `fish -c` since that is unnecessary and sources config.fish again.
            # Hence we'll call python directly.
            # c_m_p.py should work with any python version.
            set -l update_args -B $__fish_data_dir/tools/create_manpage_completions.py --manpath --cleanup-in '~/.config/fish/completions' --cleanup-in '~/.config/fish/generated_completions'
            for py in python{3,2,}
                if command -sq $py
                    set -l c $py $update_args
                    # Run python directly in the background and swallow all output
                    $c (: fish_update_completions: generating completions from man pages) >/dev/null 2>&1 &
                    # Then disown the job so that it continues to run in case of an early exit (#6269)
                    disown 2>&1 >/dev/null
                    break
                end
            end
        ...
25	25	----> not test -d $__fish_user_data_dir/generated_completions
7	296	--> if status --is-interactive
        if functions -q fish_greeting
            fish_greeting
        else
            # The greeting used to be skipped when fish_greeting was empty (not just undefined)
            # Keep it that way to not print superfluous newlines on old configuration
            test -n "$fish_greeting"
            and echo $fish_greeting
        end
    ...
12	12	---> status --is-interactive
7	277	---> if functions -q fish_greeting
            fish_greeting
        else
            # The greeting used to be skipped when fish_greeting was empty (not just undefined)
            # Keep it that way to not print superfluous newlines on old configuration
            test -n "$fish_greeting"
            and echo $fish_greeting
        ...
213	213	----> functions -q fish_greeting
19	19	----> test -n "$fish_greeting"
38	38	----> echo $fish_greeting
20	20	--> set -l varargs --on-variable fish_key_bindings
36	126	--> for var in user host cwd{,_root} status
        set -a varargs --on-variable fish_color_$var
    ...
22	22	---> set -a varargs --on-variable fish_color_$var
18	18	---> set -a varargs --on-variable fish_color_$var
16	16	---> set -a varargs --on-variable fish_color_$var
17	17	---> set -a varargs --on-variable fish_color_$var
17	17	---> set -a varargs --on-variable fish_color_$var
32	32	--> function __fish_repaint $varargs -d "Event handler, repaints the prompt when fish_color_cwd* changes"
        if status --is-interactive
            set -e __fish_prompt_cwd
            commandline -f repaint 2>/dev/null
        end
    ...
14	363	--> if test -d /etc/init.d
        complete -x -p "/etc/init.d/*" -a start --description 'Start service'
        complete -x -p "/etc/init.d/*" -a stop --description 'Stop service'
        complete -x -p "/etc/init.d/*" -a status --description 'Print service status'
        complete -x -p "/etc/init.d/*" -a restart --description 'Stop and then start service'
        complete -x -p "/etc/init.d/*" -a reload --description 'Reload service configuration'
    ...
16	16	---> test -d /etc/init.d
217	217	---> complete -x -p "/etc/init.d/*" -a start --description 'Start service'
30	30	---> complete -x -p "/etc/init.d/*" -a stop --description 'Stop service'
30	30	---> complete -x -p "/etc/init.d/*" -a status --description 'Print service status'
28	28	---> complete -x -p "/etc/init.d/*" -a restart --description 'Stop and then start service'
28	28	---> complete -x -p "/etc/init.d/*" -a reload --description 'Reload service configuration'
23	23	--> complete -c [ --wraps test
20	20	--> complete -c ! --wraps not
255	509	--> complete -c(builtin -n | string match -rv '(source|cd|exec|realpath|set|\\[|test|for)') --no-files
254	254	---> builtin -n | string match -rv '(source|cd|exec|realpath|set|\\[|test|for)'
15	15	--> function __fish_reload_key_bindings -d "Reload key bindings when binding variable change" --on-variable fish_key_bindings
        # Make sure some key bindings are set
        __init_uvar fish_key_bindings fish_default_key_bindings

        # Do nothing if the key bindings didn't actually change.
        # This could be because the variable was set to the existing value
        # or because it was a local variable.
        # If fish_key_bindings is empty on the first run, we still need to set the defaults.
        if test "$fish_key_bindings" = "$__fish_active_key_bindings" -a -n "$fish_key_bindings"
            return
        end
        # Check if fish_key_bindings is a valid function.
        # If not, either keep the previous bindings (if any) or revert to default.
        # Also print an error so the user knows.
        if not functions -q "$fish_key_bindings"
            echo "There is no fish_key_bindings function called: '$fish_key_bindings'" >&2
            # We need to see if this is a defined function, otherwise we'd be in an endless loop.
            if functions -q $__fish_active_key_bindings
                echo "Keeping $__fish_active_key_bindings" >&2
                # Set the variable to the old value so this error doesn't happen again.
                set fish_key_bindings $__fish_active_key_bindings
                return 1
            else if functions -q fish_default_key_bindings
                echo "Reverting to default bindings" >&2
                set fish_key_bindings fish_default_key_bindings
                # Return because we are called again
                return 0
            else
                # If we can't even find the default bindings, something is broken.
                # Without it, we would eventually run into the stack size limit, but that'd print hundreds of duplicate lines
                # so we should give up earlier.
                echo "Cannot find fish_default_key_bindings, falling back to very simple bindings." >&2
                echo "Most likely something is wrong with your installation." >&2
                return 0
            end
        end
        set -g __fish_active_key_bindings "$fish_key_bindings"
        set -g fish_bind_mode default
        if test "$fish_key_bindings" = fish_default_key_bindings
            # Redirect stderr per #1155
            fish_default_key_bindings 2>/dev/null
        else
            $fish_key_bindings 2>/dev/null
        end
        # Load user key bindings if they are defined
        if functions --query fish_user_key_bindings >/dev/null
            fish_user_key_bindings 2>/dev/null
        end
    ...
47	48701	--> __fish_reload_key_bindings
34	58	---> __init_uvar fish_key_bindings fish_default_key_bindings
2	24	----> if not set --query $argv[1]
            set --universal $argv
        ...
22	22	-----> not set --query $argv[1]
2	31	---> if test "$fish_key_bindings" = "$__fish_active_key_bindings" -a -n "$fish_key_bindings"
            return
        ...
29	29	----> test "$fish_key_bindings" = "$__fish_active_key_bindings" -a -n "$fish_key_bindings"
2	2015	---> if not functions -q "$fish_key_bindings"
            echo "There is no fish_key_bindings function called: '$fish_key_bindings'" >&2
            # We need to see if this is a defined function, otherwise we'd be in an endless loop.
            if functions -q $__fish_active_key_bindings
                echo "Keeping $__fish_active_key_bindings" >&2
                # Set the variable to the old value so this error doesn't happen again.
                set fish_key_bindings $__fish_active_key_bindings
                return 1
            else if functions -q fish_default_key_bindings
                echo "Reverting to default bindings" >&2
                set fish_key_bindings fish_default_key_bindings
                # Return because we are called again
                return 0
            else
                # If we can't even find the default bindings, something is broken.
                # Without it, we would eventually run into the stack size limit, but that'd print hundreds of duplicate lines
                # so we should give up earlier.
                echo "Cannot find fish_default_key_bindings, falling back to very simple bindings." >&2
                echo "Most likely something is wrong with your installation." >&2
                return 0
            end
        ...
302	2013	----> not functions -q "$fish_key_bindings"
1693	1711	-----> source /usr/share/fish/functions/fish_vi_key_bindings.fish
18	18	------> function fish_vi_key_bindings --description 'vi-like key bindings for fish'
    if contains -- -h $argv
        or contains -- --help $argv
        echo "Sorry but this function doesn't support -h or --help"
        return 1
    end

    # Erase all bindings if not explicitly requested otherwise to
    # allow for hybrid bindings.
    # This needs to be checked here because if we are called again
    # via the variable handler the argument will be gone.
    set -l rebind true
    if test "$argv[1]" = "--no-erase"
        set rebind false
        set -e argv[1]
    else
        bind --erase --all --preset # clear earlier bindings, if any
    end

    # Allow just calling this function to correctly set the bindings.
    # Because it's a rather discoverable name, users will execute it
    # and without this would then have subtly broken bindings.
    if test "$fish_key_bindings" != "fish_vi_key_bindings"
        and test "$rebind" = "true"
        # Allow the user to set the variable universally.
        set -q fish_key_bindings
        or set -g fish_key_bindings
        # This triggers the handler, which calls us again and ensures the user_key_bindings
        # are executed.
        set fish_key_bindings fish_vi_key_bindings
        return
    end

    set -l init_mode insert
    # These are only the special vi-style keys
    # not end/home, we share those.
    set -l eol_keys \$ g\$
    set -l bol_keys \^ 0 g\^

    if contains -- $argv[1] insert default visual
        set init_mode $argv[1]
    else if set -q argv[1]
        # We should still go on so the bindings still get set.
        echo "Unknown argument $argv" >&2
    end

    # Inherit shared key bindings.
    # Do this first so vi-bindings win over default.
    for mode in insert default visual
        __fish_shared_key_bindings -s -M $mode
    end

    bind -s --preset -M insert \r execute
    bind -s --preset -M insert \n execute

    bind -s --preset -M insert "" self-insert
    # Space expands abbrs _and_ inserts itself.
    bind -s --preset -M insert " " self-insert expand-abbr

    # Add a way to switch from insert to normal (command) mode.
    # Note if we are paging, we want to stay in insert mode
    # See #2871
    bind -s --preset -M insert \e "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char repaint-mode; end"

    # Default (command) mode
    bind -s --preset :q exit
    bind -s --preset -m insert \cc __fish_cancel_commandline
    bind -s --preset -M default h backward-char
    bind -s --preset -M default l forward-char
    bind -s --preset -m insert \n execute
    bind -s --preset -m insert \r execute
    bind -s --preset -m insert i repaint-mode
    bind -s --preset -m insert I beginning-of-line repaint-mode
    bind -s --preset -m insert a forward-char repaint-mode
    bind -s --preset -m insert A end-of-line repaint-mode
    bind -s --preset -m visual v begin-selection repaint-mode

    #bind -s --preset -m insert o "commandline -a \n" down-line repaint-mode
    #bind -s --preset -m insert O beginning-of-line "commandline -i \n" up-line repaint-mode # doesn't work

    bind -s --preset gg beginning-of-buffer
    bind -s --preset G end-of-buffer

    for key in $eol_keys
        bind -s --preset $key end-of-line
    end
    for key in $bol_keys
        bind -s --preset $key beginning-of-line
    end

    bind -s --preset u history-search-backward
    bind -s --preset \cr history-search-forward

    bind -s --preset [ history-token-search-backward
    bind -s --preset ] history-token-search-forward

    bind -s --preset k up-or-search
    bind -s --preset j down-or-search
    bind -s --preset b backward-word
    bind -s --preset B backward-bigword
    bind -s --preset ge backward-word
    bind -s --preset gE backward-bigword
    bind -s --preset w forward-word forward-char
    bind -s --preset W forward-bigword forward-char
    bind -s --preset e forward-char forward-word backward-char
    bind -s --preset E forward-bigword backward-char

    # OS X SnowLeopard doesn't have these keys. Don't show an annoying error message.
    # Vi/Vim doesn't support these keys in insert mode but that seems silly so we do so anyway.
    bind -s --preset -M insert -k home beginning-of-line 2>/dev/null
    bind -s --preset -M default -k home beginning-of-line 2>/dev/null
    bind -s --preset -M insert -k end end-of-line 2>/dev/null
    bind -s --preset -M default -k end end-of-line 2>/dev/null

    # Vi moves the cursor back if, after deleting, it is at EOL.
    # To emulate that, move forward, then backward, which will be a NOP
    # if there is something to move forward to.
    bind -s --preset -M default x delete-char forward-char backward-char
    bind -s --preset -M default X backward-delete-char
    bind -s --preset -M insert -k dc delete-char forward-char backward-char
    bind -s --preset -M default -k dc delete-char forward-char backward-char

    # Backspace deletes a char in insert mode, but not in normal/default mode.
    bind -s --preset -M insert -k backspace backward-delete-char
    bind -s --preset -M default -k backspace backward-char
    bind -s --preset -M insert \ch backward-delete-char
    bind -s --preset -M default \ch backward-char
    bind -s --preset -M insert \x7f backward-delete-char
    bind -s --preset -M default \x7f backward-char
    bind -s --preset -M insert \e\[3\;2~ backward-delete-char # Mavericks Terminal.app shift-ctrl-delete
    bind -s --preset -M default \e\[3\;2~ backward-delete-char # Mavericks Terminal.app shift-ctrl-delete

    bind -s --preset dd kill-whole-line
    bind -s --preset D kill-line
    bind -s --preset d\$ kill-line
    bind -s --preset d\^ backward-kill-line
    bind -s --preset d0 backward-kill-line
    bind -s --preset dw kill-word
    bind -s --preset dW kill-bigword
    bind -s --preset diw forward-char forward-char backward-word kill-word
    bind -s --preset diW forward-char forward-char backward-bigword kill-bigword
    bind -s --preset daw forward-char forward-char backward-word kill-word
    bind -s --preset daW forward-char forward-char backward-bigword kill-bigword
    bind -s --preset de kill-word
    bind -s --preset dE kill-bigword
    bind -s --preset db backward-kill-word
    bind -s --preset dB backward-kill-bigword
    bind -s --preset dge backward-kill-word
    bind -s --preset dgE backward-kill-bigword
    bind -s --preset df begin-selection forward-jump kill-selection end-selection
    bind -s --preset dt begin-selection forward-jump backward-char kill-selection end-selection
    bind -s --preset dF begin-selection backward-jump kill-selection end-selection
    bind -s --preset dT begin-selection backward-jump forward-char kill-selection end-selection

    bind -s --preset -m insert s delete-char repaint-mode
    bind -s --preset -m insert S kill-whole-line repaint-mode
    bind -s --preset -m insert cc kill-whole-line repaint-mode
    bind -s --preset -m insert C kill-line repaint-mode
    bind -s --preset -m insert c\$ kill-line repaint-mode
    bind -s --preset -m insert c\^ backward-kill-line repaint-mode
    bind -s --preset -m insert cw kill-word repaint-mode
    bind -s --preset -m insert cW kill-bigword repaint-mode
    bind -s --preset -m insert ciw forward-char forward-char backward-word kill-word repaint-mode
    bind -s --preset -m insert ciW forward-char forward-char backward-bigword kill-bigword repaint-mode
    bind -s --preset -m insert caw forward-char forward-char backward-word kill-word repaint-mode
    bind -s --preset -m insert caW forward-char forward-char backward-bigword kill-bigword repaint-mode
    bind -s --preset -m insert ce kill-word repaint-mode
    bind -s --preset -m insert cE kill-bigword repaint-mode
    bind -s --preset -m insert cb backward-kill-word repaint-mode
    bind -s --preset -m insert cB backward-kill-bigword repaint-mode
    bind -s --preset -m insert cge backward-kill-word repaint-mode
    bind -s --preset -m insert cgE backward-kill-bigword repaint-mode

    bind -s --preset '~' capitalize-word
    bind -s --preset gu downcase-word
    bind -s --preset gU upcase-word

    bind -s --preset J end-of-line delete-char
    bind -s --preset K 'man (commandline -t) 2>/dev/null; or echo -n \a'

    bind -s --preset yy kill-whole-line yank
    bind -s --preset Y kill-whole-line yank
    bind -s --preset y\$ kill-line yank
    bind -s --preset y\^ backward-kill-line yank
    bind -s --preset yw kill-word yank
    bind -s --preset yW kill-bigword yank
    bind -s --preset yiw forward-char forward-char backward-word kill-word yank
    bind -s --preset yiW forward-char forward-char backward-bigword kill-bigword yank
    bind -s --preset yaw forward-char forward-char backward-word kill-word yank
    bind -s --preset yaW forward-char forward-char backward-bigword kill-bigword yank
    bind -s --preset ye kill-word yank
    bind -s --preset yE kill-bigword yank
    bind -s --preset yb backward-kill-word yank
    bind -s --preset yB backward-kill-bigword yank
    bind -s --preset yge backward-kill-word yank
    bind -s --preset ygE backward-kill-bigword yank

    bind -s --preset f forward-jump
    bind -s --preset F backward-jump
    bind -s --preset t forward-jump-till
    bind -s --preset T backward-jump-till
    bind -s --preset ';' repeat-jump
    bind -s --preset , repeat-jump-reverse

    # in emacs yank means paste
    bind -s --preset p yank
    bind -s --preset P backward-char yank
    bind -s --preset gp yank-pop

    bind -s --preset '"*p' "commandline -i ( xsel -p; echo )[1]"
    bind -s --preset '"*P' backward-char "commandline -i ( xsel -p; echo )[1]"

    #
    # Lowercase r, enters replace_one mode
    #
    bind -s --preset -m replace_one r repaint-mode
    bind -s --preset -M replace_one -m default '' delete-char self-insert backward-char repaint-mode
    bind -s --preset -M replace_one -m default \r 'commandline -f delete-char; commandline -i \n; commandline -f backward-char; commandline -f repaint-mode'
    bind -s --preset -M replace_one -m default \e cancel repaint-mode

    #
    # Uppercase R, enters replace mode
    #
    bind -s --preset -m replace R repaint-mode
    bind -s --preset -M replace '' delete-char self-insert
    bind -s --preset -M replace -m insert \r execute repaint-mode
    bind -s --preset -M replace -m default \e cancel repaint-mode
    # in vim (and maybe in vi), <BS> deletes the changes
    # but this binding just move cursor backward, not delete the changes
    bind -s --preset -M replace -k backspace backward-char

    #
    # visual mode
    #
    bind -s --preset -M visual h backward-char
    bind -s --preset -M visual l forward-char

    bind -s --preset -M visual k up-line
    bind -s --preset -M visual j down-line

    bind -s --preset -M visual b backward-word
    bind -s --preset -M visual B backward-bigword
    bind -s --preset -M visual ge backward-word
    bind -s --preset -M visual gE backward-bigword
    bind -s --preset -M visual w forward-word
    bind -s --preset -M visual W forward-bigword
    bind -s --preset -M visual e forward-word
    bind -s --preset -M visual E forward-bigword
    bind -s --preset -M visual o swap-selection-start-stop repaint-mode

    bind -s --preset -M visual f forward-jump
    bind -s --preset -M visual t forward-jump-till
    bind -s --preset -M visual F backward-jump
    bind -s --preset -M visual T backward-jump-till

    for key in $eol_keys
        bind -s --preset -M visual $key end-of-line
    end
    for key in $bol_keys
        bind -s --preset -M visual $key beginning-of-line
    end

    bind -s --preset -M visual -m insert c kill-selection end-selection repaint-mode
    bind -s --preset -M visual -m default d kill-selection end-selection repaint-mode
    bind -s --preset -M visual -m default x kill-selection end-selection repaint-mode
    bind -s --preset -M visual -m default X kill-whole-line end-selection repaint-mode
    bind -s --preset -M visual -m default y kill-selection yank end-selection repaint-mode
    bind -s --preset -M visual -m default '"*y' "commandline -s | xsel -p; commandline -f end-selection repaint-mode"

    bind -s --preset -M visual -m default \cc end-selection repaint-mode
    bind -s --preset -M visual -m default \e end-selection repaint-mode

    # Make it easy to turn an unexecuted command into a comment in the shell history. Also, remove
    # the commenting chars so the command can be further edited then executed.
    bind -s --preset -M default \# __fish_toggle_comment_commandline
    bind -s --preset -M visual \# __fish_toggle_comment_commandline
    bind -s --preset -M replace \# __fish_toggle_comment_commandline

    # Set the cursor shape
    # After executing once, this will have defined functions listening for the variable.
    # Therefore it needs to be before setting fish_bind_mode.
    fish_vi_cursor

    set fish_bind_mode $init_mode

...
30	30	---> set -g __fish_active_key_bindings "$fish_key_bindings"
14	14	---> set -g fish_bind_mode default
15	37444	---> if test "$fish_key_bindings" = fish_default_key_bindings
            # Redirect stderr per #1155
            fish_default_key_bindings 2>/dev/null
        else
            $fish_key_bindings 2>/dev/null
        ...
15	15	----> test "$fish_key_bindings" = fish_default_key_bindings
595	37414	----> $fish_key_bindings 2>/dev/null
5	49	-----> if contains -- -h $argv
        or contains -- --help $argv
        echo "Sorry but this function doesn't support -h or --help"
        return 1
    ...
27	27	------> contains -- -h $argv
17	17	------> contains -- --help $argv
14	14	-----> set -l rebind true
6	44	-----> if test "$argv[1]" = "--no-erase"
        set rebind false
        set -e argv[1]
    else
        bind --erase --all --preset # clear earlier bindings, if any
    ...
15	15	------> test "$argv[1]" = "--no-erase"
23	23	------> bind --erase --all --preset
2	19	-----> if test "$fish_key_bindings" != "fish_vi_key_bindings"
        and test "$rebind" = "true"
        # Allow the user to set the variable universally.
        set -q fish_key_bindings
        or set -g fish_key_bindings
        # This triggers the handler, which calls us again and ensures the user_key_bindings
        # are executed.
        set fish_key_bindings fish_vi_key_bindings
        return
    ...
17	17	------> test "$fish_key_bindings" != "fish_vi_key_bindings"
44	44	-----> set -l init_mode insert
17	17	-----> set -l eol_keys \$ g\$
13	13	-----> set -l bol_keys \^ 0 g\^
5	36	-----> if contains -- $argv[1] insert default visual
        set init_mode $argv[1]
    else if set -q argv[1]
        # We should still go on so the bindings still get set.
        echo "Unknown argument $argv" >&2
    ...
22	22	------> contains -- $argv[1] insert default visual
9	9	------> set -q argv[1]
60	24281	-----> for mode in insert default visual
        __fish_shared_key_bindings -s -M $mode
    ...
605	8008	------> __fish_shared_key_bindings -s -M $mode
876	903	-------> source /usr/share/fish/functions/__fish_shared_key_bindings.fish
13	13	--------> function __fish_shared_key_bindings -d "Bindings shared between emacs and vi mode"
    # These are some bindings that are supposed to be shared between vi mode and default mode.
    # They are supposed to be unrelated to text-editing (or movement).
    # This takes $argv so the vi-bindings can pass the mode they are valid in.

    if contains -- -h $argv
        or contains -- --help $argv
        echo "Sorry but this function doesn't support -h or --help"
        return 1
    end

    bind --preset $argv \cy yank
    or return # protect against invalid $argv
    bind --preset $argv \ey yank-pop

    # Left/Right arrow
    bind --preset $argv -k right forward-char
    bind --preset $argv -k left backward-char
    bind --preset $argv \e\[C forward-char
    bind --preset $argv \e\[D backward-char
    # Some terminals output these when they're in in keypad mode.
    bind --preset $argv \eOC forward-char
    bind --preset $argv \eOD backward-char

    bind --preset $argv -k ppage beginning-of-history
    bind --preset $argv -k npage end-of-history

    # Interaction with the system clipboard.
    bind --preset $argv \cx fish_clipboard_copy
    bind --preset $argv \cv fish_clipboard_paste

    bind --preset $argv \e cancel
    bind --preset $argv \t complete
    bind --preset $argv \cs pager-toggle-search
    # shift-tab does a tab complete followed by a search.
    bind --preset $argv --key btab complete-and-search

    bind --preset $argv \e\n "commandline -i \n"
    bind --preset $argv \e\r "commandline -i \n"

    bind --preset $argv -k down down-or-search
    bind --preset $argv -k up up-or-search
    bind --preset $argv \e\[A up-or-search
    bind --preset $argv \e\[B down-or-search
    bind --preset $argv \eOA up-or-search
    bind --preset $argv \eOB down-or-search

    bind --preset $argv -k sright forward-bigword
    bind --preset $argv -k sleft backward-bigword

    # Alt-left/Alt-right
    bind --preset $argv \e\eOC nextd-or-forward-word
    bind --preset $argv \e\eOD prevd-or-backward-word
    bind --preset $argv \e\e\[C nextd-or-forward-word
    bind --preset $argv \e\e\[D prevd-or-backward-word
    bind --preset $argv \eO3C nextd-or-forward-word
    bind --preset $argv \eO3D prevd-or-backward-word
    bind --preset $argv \e\[3C nextd-or-forward-word
    bind --preset $argv \e\[3D prevd-or-backward-word
    bind --preset $argv \e\[1\;3C nextd-or-forward-word
    bind --preset $argv \e\[1\;3D prevd-or-backward-word
    bind --preset $argv \e\[1\;9C nextd-or-forward-word #iTerm2
    bind --preset $argv \e\[1\;9D prevd-or-backward-word #iTerm2

    # Alt-up/Alt-down
    bind --preset $argv \e\eOA history-token-search-backward
    bind --preset $argv \e\eOB history-token-search-forward
    bind --preset $argv \e\e\[A history-token-search-backward
    bind --preset $argv \e\e\[B history-token-search-forward
    bind --preset $argv \eO3A history-token-search-backward
    bind --preset $argv \eO3B history-token-search-forward
    bind --preset $argv \e\[3A history-token-search-backward
    bind --preset $argv \e\[3B history-token-search-forward
    bind --preset $argv \e\[1\;3A history-token-search-backward
    bind --preset $argv \e\[1\;3B history-token-search-forward
    bind --preset $argv \e\[1\;9A history-token-search-backward # iTerm2
    bind --preset $argv \e\[1\;9B history-token-search-forward # iTerm2
    # Bash compatibility
    # https://github.com/fish-shell/fish-shell/issues/89
    bind --preset $argv \e. history-token-search-backward

    bind --preset $argv \el __fish_list_current_token
    bind --preset $argv \ew __fish_whatis_current_token
    # ncurses > 6.0 sends a "delete scrollback" sequence along with clear.
    # This string replace removes it.
    bind --preset $argv \cl 'echo -n (clear | string replace \e\[3J ""); commandline -f repaint'
    bind --preset $argv \cc __fish_cancel_commandline
    bind --preset $argv \cu backward-kill-line
    bind --preset $argv \cw backward-kill-path-component
    bind --preset $argv \e\[F end-of-line
    bind --preset $argv \e\[H beginning-of-line

    bind --preset $argv \ed 'set -l cmd (commandline); if test -z "$cmd"; echo; dirh; commandline -f repaint; else; commandline -f kill-word; end'
    bind --preset $argv \cd delete-or-exit

    # Prepend 'sudo ' to the current commandline
    bind --preset $argv \es __fish_prepend_sudo

    # Allow reading manpages by pressing F1 (many GUI applications) or Alt+h (like in zsh).
    bind --preset $argv -k f1 __fish_man_page
    bind --preset $argv \eh __fish_man_page

    # This will make sure the output of the current command is paged using the default pager when
    # you press Meta-p.
    # If none is set, less will be used.
    bind --preset $argv \ep '__fish_paginate'

    # Make it easy to turn an unexecuted command into a comment in the shell history. Also,
    # remove the commenting chars so the command can be further edited then executed.
    bind --preset $argv \e\# __fish_toggle_comment_commandline

    # The [meta-e] and [meta-v] keystrokes invoke an external editor on the command buffer.
    bind --preset $argv \ee edit_command_buffer
    bind --preset $argv \ev edit_command_buffer

    # Tmux' focus events.
    # Exclude paste mode because that should get _everything_ literally.
    for mode in (bind --list-modes | string match -v paste)
        # We only need the in-focus event currently (to redraw the vi-cursor).
        bind --preset -M $mode \e\[I 'emit fish_focus_in'
        bind --preset -M $mode \e\[O false
        bind --preset -M $mode \e\[\?1004h false
    end

    # Support for "bracketed paste"
    # The way it works is that we acknowledge our support by printing
    # \e\[?2004h
    # then the terminal will "bracket" every paste in
    # \e\[200~ and \e\[201~
    # Every character in between those two will be part of the paste and should not cause a binding to execute (like \n executing commands).
    #
    # We enable it after every command and disable it before (in __fish_config_interactive.fish)
    #
    # Support for this seems to be ubiquitous - emacs enables it unconditionally (!) since 25.1
    # (though it only supports it since then, it seems to be the last term to gain support).
    #
    # NOTE: This is more of a "security" measure than a proper feature.
    # The better way to paste remains the `fish_clipboard_paste` function (bound to \cv by default).
    # We don't disable highlighting here, so it will be redone after every character (which can be slow),
    # and it doesn't handle "paste-stop" sequences in the paste (which the terminal needs to strip).
    #
    # See http://thejh.net/misc/website-terminal-copy-paste.

    # Bind the starting sequence in every bind mode, even user-defined ones.
    # Exclude paste mode or there'll be an additional binding after switching between emacs and vi
    for mode in (bind --list-modes | string match -v paste)
        bind --preset -M $mode -m paste \e\[200~ '__fish_start_bracketed_paste'
    end
    # This sequence ends paste-mode and returns to the previous mode we have saved before.
    bind --preset -M paste \e\[201~ '__fish_stop_bracketed_paste'
    # In paste-mode, everything self-inserts except for the sequence to get out of it
    bind --preset -M paste "" self-insert
    # Without this, a \r will overwrite the other text, rendering it invisible - which makes the exercise kinda pointless.
    bind --preset -M paste \r "commandline -i \n"

    # We usually just pass the text through as-is to facilitate pasting code,
    # but when the current token contains an unbalanced single-quote (`'`),
    # we escape all single-quotes and backslashes, effectively turning the paste
    # into one literal token, to facilitate pasting non-code (e.g. markdown or git commitishes)
    bind --preset -M paste "'" "__fish_commandline_insert_escaped \' \$__fish_paste_quoted"
    bind --preset -M paste \\ "__fish_commandline_insert_escaped \\\ \$__fish_paste_quoted"
    # Only insert spaces if we're either quoted or not at the beginning of the commandline
    # - this strips leading spaces if they would trigger histignore.
    bind --preset -M paste " " self-insert-notfirst
...
9	9	--------> function __fish_commandline_insert_escaped --description 'Insert the first arg escaped if a second arg is given'
    if set -q argv[2]
        commandline -i \\$argv[1]
    else
        commandline -i $argv[1]
    end
...
3	3	--------> function __fish_start_bracketed_paste
    # Save the last bind mode so we can restore it.
    set -g __fish_last_bind_mode $fish_bind_mode
    # If the token is currently single-quoted,
    # we escape single-quotes (and backslashes).
    __fish_commandline_is_singlequoted
    and set -g __fish_paste_quoted 1
...
2	2	--------> function __fish_stop_bracketed_paste
    # Restore the last bind mode.
    set fish_bind_mode $__fish_last_bind_mode
    set -e __fish_paste_quoted
    commandline -f force-repaint
...
4	56	-------> if contains -- -h $argv
        or contains -- --help $argv
        echo "Sorry but this function doesn't support -h or --help"
        return 1
    ...
30	30	--------> contains -- -h $argv
22	22	--------> contains -- --help $argv
44	44	-------> bind --preset $argv \cy yank
32	32	-------> bind --preset $argv \ey yank-pop
48	48	-------> bind --preset $argv -k right forward-char
41	41	-------> bind --preset $argv -k left backward-char
43	43	-------> bind --preset $argv \e\[C forward-char
38	38	-------> bind --preset $argv \e\[D backward-char
37	37	-------> bind --preset $argv \eOC forward-char
34	34	-------> bind --preset $argv \eOD backward-char
38	38	-------> bind --preset $argv -k ppage beginning-of-history
26	26	-------> bind --preset $argv -k npage end-of-history
23	23	-------> bind --preset $argv \cx fish_clipboard_copy
21	21	-------> bind --preset $argv \cv fish_clipboard_paste
23	23	-------> bind --preset $argv \e cancel
21	21	-------> bind --preset $argv \t complete
23	23	-------> bind --preset $argv \cs pager-toggle-search
23	23	-------> bind --preset $argv --key btab complete-and-search
23	23	-------> bind --preset $argv \e\n "commandline -i \n"
24	24	-------> bind --preset $argv \e\r "commandline -i \n"
22	22	-------> bind --preset $argv -k down down-or-search
24	24	-------> bind --preset $argv -k up up-or-search
23	23	-------> bind --preset $argv \e\[A up-or-search
21	21	-------> bind --preset $argv \e\[B down-or-search
21	21	-------> bind --preset $argv \eOA up-or-search
20	20	-------> bind --preset $argv \eOB down-or-search
22	22	-------> bind --preset $argv -k sright forward-bigword
21	21	-------> bind --preset $argv -k sleft backward-bigword
21	21	-------> bind --preset $argv \e\eOC nextd-or-forward-word
23	23	-------> bind --preset $argv \e\eOD prevd-or-backward-word
22	22	-------> bind --preset $argv \e\e\[C nextd-or-forward-word
22	22	-------> bind --preset $argv \e\e\[D prevd-or-backward-word
47	47	-------> bind --preset $argv \eO3C nextd-or-forward-word
60	60	-------> bind --preset $argv \eO3D prevd-or-backward-word
50	50	-------> bind --preset $argv \e\[3C nextd-or-forward-word
44	44	-------> bind --preset $argv \e\[3D prevd-or-backward-word
40	40	-------> bind --preset $argv \e\[1\;3C nextd-or-forward-word
38	38	-------> bind --preset $argv \e\[1\;3D prevd-or-backward-word
37	37	-------> bind --preset $argv \e\[1\;9C nextd-or-forward-word
37	37	-------> bind --preset $argv \e\[1\;9D prevd-or-backward-word
41	41	-------> bind --preset $argv \e\eOA history-token-search-backward
38	38	-------> bind --preset $argv \e\eOB history-token-search-forward
38	38	-------> bind --preset $argv \e\e\[A history-token-search-backward
37	37	-------> bind --preset $argv \e\e\[B history-token-search-forward
36	36	-------> bind --preset $argv \eO3A history-token-search-backward
39	39	-------> bind --preset $argv \eO3B history-token-search-forward
38	38	-------> bind --preset $argv \e\[3A history-token-search-backward
38	38	-------> bind --preset $argv \e\[3B history-token-search-forward
39	39	-------> bind --preset $argv \e\[1\;3A history-token-search-backward
35	35	-------> bind --preset $argv \e\[1\;3B history-token-search-forward
36	36	-------> bind --preset $argv \e\[1\;9A history-token-search-backward
37	37	-------> bind --preset $argv \e\[1\;9B history-token-search-forward
38	38	-------> bind --preset $argv \e. history-token-search-backward
37	37	-------> bind --preset $argv \el __fish_list_current_token
35	35	-------> bind --preset $argv \ew __fish_whatis_current_token
42	42	-------> bind --preset $argv \cl 'echo -n (clear | string replace \e\[3J ""); commandline -f repaint'
37	37	-------> bind --preset $argv \cc __fish_cancel_commandline
36	36	-------> bind --preset $argv \cu backward-kill-line
35	35	-------> bind --preset $argv \cw backward-kill-path-component
38	38	-------> bind --preset $argv \e\[F end-of-line
38	38	-------> bind --preset $argv \e\[H beginning-of-line
40	40	-------> bind --preset $argv \ed 'set -l cmd (commandline); if test -z "$cmd"; echo; dirh; commandline -f repaint; else; commandline -f kill-word; end'
36	36	-------> bind --preset $argv \cd delete-or-exit
36	36	-------> bind --preset $argv \es __fish_prepend_sudo
38	38	-------> bind --preset $argv -k f1 __fish_man_page
42	42	-------> bind --preset $argv \eh __fish_man_page
42	42	-------> bind --preset $argv \ep '__fish_paginate'
77	77	-------> bind --preset $argv \e\# __fish_toggle_comment_commandline
39	39	-------> bind --preset $argv \ee edit_command_buffer
41	41	-------> bind --preset $argv \ev edit_command_buffer
394	1901	-------> for mode in (bind --list-modes | string match -v paste)
        # We only need the in-focus event currently (to redraw the vi-cursor).
        bind --preset -M $mode \e\[I 'emit fish_focus_in'
        bind --preset -M $mode \e\[O false
        bind --preset -M $mode \e\[\?1004h false
    ...
566	566	--------> bind --list-modes | string match -v paste
251	251	--------> bind --preset -M $mode \e\[I 'emit fish_focus_in'
145	145	--------> bind --preset -M $mode \e\[O false
140	140	--------> bind --preset -M $mode \e\[\?1004h false
140	140	--------> bind --preset -M $mode \e\[I 'emit fish_focus_in'
130	130	--------> bind --preset -M $mode \e\[O false
135	135	--------> bind --preset -M $mode \e\[\?1004h false
434	1512	-------> for mode in (bind --list-modes | string match -v paste)
        bind --preset -M $mode -m paste \e\[200~ '__fish_start_bracketed_paste'
    ...
749	749	--------> bind --list-modes | string match -v paste
200	200	--------> bind --preset -M $mode -m paste \e\[200~ '__fish_start_bracketed_paste'
129	129	--------> bind --preset -M $mode -m paste \e\[200~ '__fish_start_bracketed_paste'
124	124	-------> bind --preset -M paste \e\[201~ '__fish_stop_bracketed_paste'
99	99	-------> bind --preset -M paste "" self-insert
105	105	-------> bind --preset -M paste \r "commandline -i \n"
126	126	-------> bind --preset -M paste "'" "__fish_commandline_insert_escaped \' \$__fish_paste_quoted"
120	120	-------> bind --preset -M paste \\ "__fish_commandline_insert_escaped \\\ \$__fish_paste_quoted"
101	101	-------> bind --preset -M paste " " self-insert-notfirst
542	10387	------> __fish_shared_key_bindings -s -M $mode
21	230	-------> if contains -- -h $argv
        or contains -- --help $argv
        echo "Sorry but this function doesn't support -h or --help"
        return 1
    ...
113	113	--------> contains -- -h $argv
96	96	--------> contains -- --help $argv
128	128	-------> bind --preset $argv \cy yank
121	121	-------> bind --preset $argv \ey yank-pop
130	130	-------> bind --preset $argv -k right forward-char
126	126	-------> bind --preset $argv -k left backward-char
134	134	-------> bind --preset $argv \e\[C forward-char
128	128	-------> bind --preset $argv \e\[D backward-char
126	126	-------> bind --preset $argv \eOC forward-char
119	119	-------> bind --preset $argv \eOD backward-char
133	133	-------> bind --preset $argv -k ppage beginning-of-history
126	126	-------> bind --preset $argv -k npage end-of-history
117	117	-------> bind --preset $argv \cx fish_clipboard_copy
89	89	-------> bind --preset $argv \cv fish_clipboard_paste
64	64	-------> bind --preset $argv \e cancel
64	64	-------> bind --preset $argv \t complete
64	64	-------> bind --preset $argv \cs pager-toggle-search
69	69	-------> bind --preset $argv --key btab complete-and-search
70	70	-------> bind --preset $argv \e\n "commandline -i \n"
68	68	-------> bind --preset $argv \e\r "commandline -i \n"
65	65	-------> bind --preset $argv -k down down-or-search
73	73	-------> bind --preset $argv -k up up-or-search
67	67	-------> bind --preset $argv \e\[A up-or-search
65	65	-------> bind --preset $argv \e\[B down-or-search
75	75	-------> bind --preset $argv \eOA up-or-search
107	107	-------> bind --preset $argv \eOB down-or-search
69	69	-------> bind --preset $argv -k sright forward-bigword
61	61	-------> bind --preset $argv -k sleft backward-bigword
67	67	-------> bind --preset $argv \e\eOC nextd-or-forward-word
70	70	-------> bind --preset $argv \e\eOD prevd-or-backward-word
83	83	-------> bind --preset $argv \e\e\[C nextd-or-forward-word
117	117	-------> bind --preset $argv \e\e\[D prevd-or-backward-word
108	108	-------> bind --preset $argv \eO3C nextd-or-forward-word
111	111	-------> bind --preset $argv \eO3D prevd-or-backward-word
160	160	-------> bind --preset $argv \e\[3C nextd-or-forward-word
118	118	-------> bind --preset $argv \e\[3D prevd-or-backward-word
111	111	-------> bind --preset $argv \e\[1\;3C nextd-or-forward-word
114	114	-------> bind --preset $argv \e\[1\;3D prevd-or-backward-word
143	143	-------> bind --preset $argv \e\[1\;9C nextd-or-forward-word
111	111	-------> bind --preset $argv \e\[1\;9D prevd-or-backward-word
110	110	-------> bind --preset $argv \e\eOA history-token-search-backward
112	112	-------> bind --preset $argv \e\eOB history-token-search-forward
110	110	-------> bind --preset $argv \e\e\[A history-token-search-backward
112	112	-------> bind --preset $argv \e\e\[B history-token-search-forward
112	112	-------> bind --preset $argv \eO3A history-token-search-backward
130	130	-------> bind --preset $argv \eO3B history-token-search-forward
129	129	-------> bind --preset $argv \e\[3A history-token-search-backward
125	125	-------> bind --preset $argv \e\[3B history-token-search-forward
87	87	-------> bind --preset $argv \e\[1\;3A history-token-search-backward
72	72	-------> bind --preset $argv \e\[1\;3B history-token-search-forward
67	67	-------> bind --preset $argv \e\[1\;9A history-token-search-backward
68	68	-------> bind --preset $argv \e\[1\;9B history-token-search-forward
67	67	-------> bind --preset $argv \e. history-token-search-backward
65	65	-------> bind --preset $argv \el __fish_list_current_token
65	65	-------> bind --preset $argv \ew __fish_whatis_current_token
71	71	-------> bind --preset $argv \cl 'echo -n (clear | string replace \e\[3J ""); commandline -f repaint'
65	65	-------> bind --preset $argv \cc __fish_cancel_commandline
64	64	-------> bind --preset $argv \cu backward-kill-line
63	63	-------> bind --preset $argv \cw backward-kill-path-component
68	68	-------> bind --preset $argv \e\[F end-of-line
72	72	-------> bind --preset $argv \e\[H beginning-of-line
73	73	-------> bind --preset $argv \ed 'set -l cmd (commandline); if test -z "$cmd"; echo; dirh; commandline -f repaint; else; commandline -f kill-word; end'
66	66	-------> bind --preset $argv \cd delete-or-exit
64	64	-------> bind --preset $argv \es __fish_prepend_sudo
72	72	-------> bind --preset $argv -k f1 __fish_man_page
65	65	-------> bind --preset $argv \eh __fish_man_page
69	69	-------> bind --preset $argv \ep '__fish_paginate'
67	67	-------> bind --preset $argv \e\# __fish_toggle_comment_commandline
64	64	-------> bind --preset $argv \ee edit_command_buffer
62	62	-------> bind --preset $argv \ev edit_command_buffer
412	1605	-------> for mode in (bind --list-modes | string match -v paste)
        # We only need the in-focus event currently (to redraw the vi-cursor).
        bind --preset -M $mode \e\[I 'emit fish_focus_in'
        bind --preset -M $mode \e\[O false
        bind --preset -M $mode \e\[\?1004h false
    ...
708	708	--------> bind --list-modes | string match -v paste
168	168	--------> bind --preset -M $mode \e\[I 'emit fish_focus_in'
74	74	--------> bind --preset -M $mode \e\[O false
62	62	--------> bind --preset -M $mode \e\[\?1004h false
66	66	--------> bind --preset -M $mode \e\[I 'emit fish_focus_in'
58	58	--------> bind --preset -M $mode \e\[O false
57	57	--------> bind --preset -M $mode \e\[\?1004h false
327	1360	-------> for mode in (bind --list-modes | string match -v paste)
        bind --preset -M $mode -m paste \e\[200~ '__fish_start_bracketed_paste'
    ...
773	773	--------> bind --list-modes | string match -v paste
168	168	--------> bind --preset -M $mode -m paste \e\[200~ '__fish_start_bracketed_paste'
92	92	--------> bind --preset -M $mode -m paste \e\[200~ '__fish_start_bracketed_paste'
77	77	-------> bind --preset -M paste \e\[201~ '__fish_stop_bracketed_paste'
74	74	-------> bind --preset -M paste "" self-insert
77	77	-------> bind --preset -M paste \r "commandline -i \n"
85	85	-------> bind --preset -M paste "'" "__fish_commandline_insert_escaped \' \$__fish_paste_quoted"
69	69	-------> bind --preset -M paste \\ "__fish_commandline_insert_escaped \\\ \$__fish_paste_quoted"
61	61	-------> bind --preset -M paste " " self-insert-notfirst
287	5826	------> __fish_shared_key_bindings -s -M $mode
15	162	-------> if contains -- -h $argv
        or contains -- --help $argv
        echo "Sorry but this function doesn't support -h or --help"
        return 1
    ...
81	81	--------> contains -- -h $argv
66	66	--------> contains -- --help $argv
104	104	-------> bind --preset $argv \cy yank
100	100	-------> bind --preset $argv \ey yank-pop
98	98	-------> bind --preset $argv -k right forward-char
86	86	-------> bind --preset $argv -k left backward-char
69	69	-------> bind --preset $argv \e\[C forward-char
65	65	-------> bind --preset $argv \e\[D backward-char
56	56	-------> bind --preset $argv \eOC forward-char
54	54	-------> bind --preset $argv \eOD backward-char
70	70	-------> bind --preset $argv -k ppage beginning-of-history
66	66	-------> bind --preset $argv -k npage end-of-history
58	58	-------> bind --preset $argv \cx fish_clipboard_copy
63	63	-------> bind --preset $argv \cv fish_clipboard_paste
75	75	-------> bind --preset $argv \e cancel
63	63	-------> bind --preset $argv \t complete
57	57	-------> bind --preset $argv \cs pager-toggle-search
63	63	-------> bind --preset $argv --key btab complete-and-search
44	44	-------> bind --preset $argv \e\n "commandline -i \n"
37	37	-------> bind --preset $argv \e\r "commandline -i \n"
36	36	-------> bind --preset $argv -k down down-or-search
40	40	-------> bind --preset $argv -k up up-or-search
37	37	-------> bind --preset $argv \e\[A up-or-search
34	34	-------> bind --preset $argv \e\[B down-or-search
31	31	-------> bind --preset $argv \eOA up-or-search
31	31	-------> bind --preset $argv \eOB down-or-search
35	35	-------> bind --preset $argv -k sright forward-bigword
31	31	-------> bind --preset $argv -k sleft backward-bigword
36	36	-------> bind --preset $argv \e\eOC nextd-or-forward-word
38	38	-------> bind --preset $argv \e\eOD prevd-or-backward-word
38	38	-------> bind --preset $argv \e\e\[C nextd-or-forward-word
37	37	-------> bind --preset $argv \e\e\[D prevd-or-backward-word
36	36	-------> bind --preset $argv \eO3C nextd-or-forward-word
38	38	-------> bind --preset $argv \eO3D prevd-or-backward-word
37	37	-------> bind --preset $argv \e\[3C nextd-or-forward-word
38	38	-------> bind --preset $argv \e\[3D prevd-or-backward-word
37	37	-------> bind --preset $argv \e\[1\;3C nextd-or-forward-word
37	37	-------> bind --preset $argv \e\[1\;3D prevd-or-backward-word
35	35	-------> bind --preset $argv \e\[1\;9C nextd-or-forward-word
36	36	-------> bind --preset $argv \e\[1\;9D prevd-or-backward-word
36	36	-------> bind --preset $argv \e\eOA history-token-search-backward
37	37	-------> bind --preset $argv \e\eOB history-token-search-forward
37	37	-------> bind --preset $argv \e\e\[A history-token-search-backward
38	38	-------> bind --preset $argv \e\e\[B history-token-search-forward
36	36	-------> bind --preset $argv \eO3A history-token-search-backward
37	37	-------> bind --preset $argv \eO3B history-token-search-forward
36	36	-------> bind --preset $argv \e\[3A history-token-search-backward
39	39	-------> bind --preset $argv \e\[3B history-token-search-forward
37	37	-------> bind --preset $argv \e\[1\;3A history-token-search-backward
37	37	-------> bind --preset $argv \e\[1\;3B history-token-search-forward
37	37	-------> bind --preset $argv \e\[1\;9A history-token-search-backward
36	36	-------> bind --preset $argv \e\[1\;9B history-token-search-forward
35	35	-------> bind --preset $argv \e. history-token-search-backward
34	34	-------> bind --preset $argv \el __fish_list_current_token
35	35	-------> bind --preset $argv \ew __fish_whatis_current_token
37	37	-------> bind --preset $argv \cl 'echo -n (clear | string replace \e\[3J ""); commandline -f repaint'
34	34	-------> bind --preset $argv \cc __fish_cancel_commandline
34	34	-------> bind --preset $argv \cu backward-kill-line
32	32	-------> bind --preset $argv \cw backward-kill-path-component
35	35	-------> bind --preset $argv \e\[F end-of-line
36	36	-------> bind --preset $argv \e\[H beginning-of-line
38	38	-------> bind --preset $argv \ed 'set -l cmd (commandline); if test -z "$cmd"; echo; dirh; commandline -f repaint; else; commandline -f kill-word; end'
34	34	-------> bind --preset $argv \cd delete-or-exit
33	33	-------> bind --preset $argv \es __fish_prepend_sudo
37	37	-------> bind --preset $argv -k f1 __fish_man_page
35	35	-------> bind --preset $argv \eh __fish_man_page
36	36	-------> bind --preset $argv \ep '__fish_paginate'
34	34	-------> bind --preset $argv \e\# __fish_toggle_comment_commandline
34	34	-------> bind --preset $argv \ee edit_command_buffer
34	34	-------> bind --preset $argv \ev edit_command_buffer
185	1072	-------> for mode in (bind --list-modes | string match -v paste)
        # We only need the in-focus event currently (to redraw the vi-cursor).
        bind --preset -M $mode \e\[I 'emit fish_focus_in'
        bind --preset -M $mode \e\[O false
        bind --preset -M $mode \e\[\?1004h false
    ...
529	529	--------> bind --list-modes | string match -v paste
85	85	--------> bind --preset -M $mode \e\[I 'emit fish_focus_in'
36	36	--------> bind --preset -M $mode \e\[O false
31	31	--------> bind --preset -M $mode \e\[\?1004h false
33	33	--------> bind --preset -M $mode \e\[I 'emit fish_focus_in'
32	32	--------> bind --preset -M $mode \e\[O false
31	31	--------> bind --preset -M $mode \e\[\?1004h false
39	39	--------> bind --preset -M $mode \e\[I 'emit fish_focus_in'
35	35	--------> bind --preset -M $mode \e\[O false
36	36	--------> bind --preset -M $mode \e\[\?1004h false
187	1145	-------> for mode in (bind --list-modes | string match -v paste)
        bind --preset -M $mode -m paste \e\[200~ '__fish_start_bracketed_paste'
    ...
793	793	--------> bind --list-modes | string match -v paste
86	86	--------> bind --preset -M $mode -m paste \e\[200~ '__fish_start_bracketed_paste'
48	48	--------> bind --preset -M $mode -m paste \e\[200~ '__fish_start_bracketed_paste'
31	31	--------> bind --preset -M $mode -m paste \e\[200~ '__fish_start_bracketed_paste'
24	24	-------> bind --preset -M paste \e\[201~ '__fish_stop_bracketed_paste'
25	25	-------> bind --preset -M paste "" self-insert
24	24	-------> bind --preset -M paste \r "commandline -i \n"
25	25	-------> bind --preset -M paste "'" "__fish_commandline_insert_escaped \' \$__fish_paste_quoted"
24	24	-------> bind --preset -M paste \\ "__fish_commandline_insert_escaped \\\ \$__fish_paste_quoted"
22	22	-------> bind --preset -M paste " " self-insert-notfirst
27	27	-----> bind -s --preset -M insert \r execute
24	24	-----> bind -s --preset -M insert \n execute
23	23	-----> bind -s --preset -M insert "" self-insert
24	24	-----> bind -s --preset -M insert " " self-insert expand-abbr
27	27	-----> bind -s --preset -M insert \e "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char repaint-mode; end"
22	22	-----> bind -s --preset :q exit
23	23	-----> bind -s --preset -m insert \cc __fish_cancel_commandline
22	22	-----> bind -s --preset -M default h backward-char
22	22	-----> bind -s --preset -M default l forward-char
24	24	-----> bind -s --preset -m insert \n execute
23	23	-----> bind -s --preset -m insert \r execute
21	21	-----> bind -s --preset -m insert i repaint-mode
23	23	-----> bind -s --preset -m insert I beginning-of-line repaint-mode
23	23	-----> bind -s --preset -m insert a forward-char repaint-mode
22	22	-----> bind -s --preset -m insert A end-of-line repaint-mode
24	24	-----> bind -s --preset -m visual v begin-selection repaint-mode
23	23	-----> bind -s --preset gg beginning-of-buffer
22	22	-----> bind -s --preset G end-of-buffer
30	86	-----> for key in $eol_keys
        bind -s --preset $key end-of-line
    ...
29	29	------> bind -s --preset $key end-of-line
27	27	------> bind -s --preset $key end-of-line
23	99	-----> for key in $bol_keys
        bind -s --preset $key beginning-of-line
    ...
25	25	------> bind -s --preset $key beginning-of-line
25	25	------> bind -s --preset $key beginning-of-line
26	26	------> bind -s --preset $key beginning-of-line
21	21	-----> bind -s --preset u history-search-backward
24	24	-----> bind -s --preset \cr history-search-forward
22	22	-----> bind -s --preset [ history-token-search-backward
23	23	-----> bind -s --preset ] history-token-search-forward
21	21	-----> bind -s --preset k up-or-search
22	22	-----> bind -s --preset j down-or-search
21	21	-----> bind -s --preset b backward-word
21	21	-----> bind -s --preset B backward-bigword
23	23	-----> bind -s --preset ge backward-word
22	22	-----> bind -s --preset gE backward-bigword
23	23	-----> bind -s --preset w forward-word forward-char
23	23	-----> bind -s --preset W forward-bigword forward-char
24	24	-----> bind -s --preset e forward-char forward-word backward-char
22	22	-----> bind -s --preset E forward-bigword backward-char
57	57	-----> bind -s --preset -M insert -k home beginning-of-line 2>/dev/null
69	69	-----> bind -s --preset -M default -k home beginning-of-line 2>/dev/null
64	64	-----> bind -s --preset -M insert -k end end-of-line 2>/dev/null
64	64	-----> bind -s --preset -M default -k end end-of-line 2>/dev/null
47	47	-----> bind -s --preset -M default x delete-char forward-char backward-char
42	42	-----> bind -s --preset -M default X backward-delete-char
51	51	-----> bind -s --preset -M insert -k dc delete-char forward-char backward-char
52	52	-----> bind -s --preset -M default -k dc delete-char forward-char backward-char
42	42	-----> bind -s --preset -M insert -k backspace backward-delete-char
43	43	-----> bind -s --preset -M default -k backspace backward-char
29	29	-----> bind -s --preset -M insert \ch backward-delete-char
26	26	-----> bind -s --preset -M default \ch backward-char
26	26	-----> bind -s --preset -M insert \x7f backward-delete-char
24	24	-----> bind -s --preset -M default \x7f backward-char
28	28	-----> bind -s --preset -M insert \e\[3\;2~ backward-delete-char
27	27	-----> bind -s --preset -M default \e\[3\;2~ backward-delete-char
23	23	-----> bind -s --preset dd kill-whole-line
22	22	-----> bind -s --preset D kill-line
25	25	-----> bind -s --preset d\$ kill-line
39	39	-----> bind -s --preset d\^ backward-kill-line
25	25	-----> bind -s --preset d0 backward-kill-line
23	23	-----> bind -s --preset dw kill-word
23	23	-----> bind -s --preset dW kill-bigword
26	26	-----> bind -s --preset diw forward-char forward-char backward-word kill-word
26	26	-----> bind -s --preset diW forward-char forward-char backward-bigword kill-bigword
24	24	-----> bind -s --preset daw forward-char forward-char backward-word kill-word
28	28	-----> bind -s --preset daW forward-char forward-char backward-bigword kill-bigword
44	44	-----> bind -s --preset de kill-word
55	55	-----> bind -s --preset dE kill-bigword
57	57	-----> bind -s --preset db backward-kill-word
57	57	-----> bind -s --preset dB backward-kill-bigword
58	58	-----> bind -s --preset dge backward-kill-word
60	60	-----> bind -s --preset dgE backward-kill-bigword
61	61	-----> bind -s --preset df begin-selection forward-jump kill-selection end-selection
62	62	-----> bind -s --preset dt begin-selection forward-jump backward-char kill-selection end-selection
62	62	-----> bind -s --preset dF begin-selection backward-jump kill-selection end-selection
61	61	-----> bind -s --preset dT begin-selection backward-jump forward-char kill-selection end-selection
60	60	-----> bind -s --preset -m insert s delete-char repaint-mode
59	59	-----> bind -s --preset -m insert S kill-whole-line repaint-mode
60	60	-----> bind -s --preset -m insert cc kill-whole-line repaint-mode
58	58	-----> bind -s --preset -m insert C kill-line repaint-mode
66	66	-----> bind -s --preset -m insert c\$ kill-line repaint-mode
64	64	-----> bind -s --preset -m insert c\^ backward-kill-line repaint-mode
60	60	-----> bind -s --preset -m insert cw kill-word repaint-mode
60	60	-----> bind -s --preset -m insert cW kill-bigword repaint-mode
72	72	-----> bind -s --preset -m insert ciw forward-char forward-char backward-word kill-word repaint-mode
70	70	-----> bind -s --preset -m insert ciW forward-char forward-char backward-bigword kill-bigword repaint-mode
69	69	-----> bind -s --preset -m insert caw forward-char forward-char backward-word kill-word repaint-mode
66	66	-----> bind -s --preset -m insert caW forward-char forward-char backward-bigword kill-bigword repaint-mode
109	109	-----> bind -s --preset -m insert ce kill-word repaint-mode
62	62	-----> bind -s --preset -m insert cE kill-bigword repaint-mode
62	62	-----> bind -s --preset -m insert cb backward-kill-word repaint-mode
60	60	-----> bind -s --preset -m insert cB backward-kill-bigword repaint-mode
65	65	-----> bind -s --preset -m insert cge backward-kill-word repaint-mode
66	66	-----> bind -s --preset -m insert cgE backward-kill-bigword repaint-mode
62	62	-----> bind -s --preset '~' capitalize-word
58	58	-----> bind -s --preset gu downcase-word
57	57	-----> bind -s --preset gU upcase-word
67	67	-----> bind -s --preset J end-of-line delete-char
62	62	-----> bind -s --preset K 'man (commandline -t) 2>/dev/null; or echo -n \a'
60	60	-----> bind -s --preset yy kill-whole-line yank
58	58	-----> bind -s --preset Y kill-whole-line yank
65	65	-----> bind -s --preset y\$ kill-line yank
63	63	-----> bind -s --preset y\^ backward-kill-line yank
58	58	-----> bind -s --preset yw kill-word yank
60	60	-----> bind -s --preset yW kill-bigword yank
67	67	-----> bind -s --preset yiw forward-char forward-char backward-word kill-word yank
93	93	-----> bind -s --preset yiW forward-char forward-char backward-bigword kill-bigword yank
71	71	-----> bind -s --preset yaw forward-char forward-char backward-word kill-word yank
67	67	-----> bind -s --preset yaW forward-char forward-char backward-bigword kill-bigword yank
59	59	-----> bind -s --preset ye kill-word yank
61	61	-----> bind -s --preset yE kill-bigword yank
59	59	-----> bind -s --preset yb backward-kill-word yank
59	59	-----> bind -s --preset yB backward-kill-bigword yank
62	62	-----> bind -s --preset yge backward-kill-word yank
62	62	-----> bind -s --preset ygE backward-kill-bigword yank
56	56	-----> bind -s --preset f forward-jump
55	55	-----> bind -s --preset F backward-jump
54	54	-----> bind -s --preset t forward-jump-till
63	63	-----> bind -s --preset T backward-jump-till
113	113	-----> bind -s --preset ';' repeat-jump
100	100	-----> bind -s --preset , repeat-jump-reverse
97	97	-----> bind -s --preset p yank
106	106	-----> bind -s --preset P backward-char yank
102	102	-----> bind -s --preset gp yank-pop
120	120	-----> bind -s --preset '"*p' "commandline -i ( xsel -p; echo )[1]"
117	117	-----> bind -s --preset '"*P' backward-char "commandline -i ( xsel -p; echo )[1]"
98	98	-----> bind -s --preset -m replace_one r repaint-mode
78	78	-----> bind -s --preset -M replace_one -m default '' delete-char self-insert backward-char repaint-mode
75	75	-----> bind -s --preset -M replace_one -m default \r 'commandline -f delete-char; commandline -i \n; commandline -f backward-char; commandline -f repaint-mode'
80	80	-----> bind -s --preset -M replace_one -m default \e cancel repaint-mode
61	61	-----> bind -s --preset -m replace R repaint-mode
62	62	-----> bind -s --preset -M replace '' delete-char self-insert
67	67	-----> bind -s --preset -M replace -m insert \r execute repaint-mode
65	65	-----> bind -s --preset -M replace -m default \e cancel repaint-mode
62	62	-----> bind -s --preset -M replace -k backspace backward-char
58	58	-----> bind -s --preset -M visual h backward-char
56	56	-----> bind -s --preset -M visual l forward-char
57	57	-----> bind -s --preset -M visual k up-line
60	60	-----> bind -s --preset -M visual j down-line
60	60	-----> bind -s --preset -M visual b backward-word
57	57	-----> bind -s --preset -M visual B backward-bigword
61	61	-----> bind -s --preset -M visual ge backward-word
95	95	-----> bind -s --preset -M visual gE backward-bigword
61	61	-----> bind -s --preset -M visual w forward-word
57	57	-----> bind -s --preset -M visual W forward-bigword
59	59	-----> bind -s --preset -M visual e forward-word
58	58	-----> bind -s --preset -M visual E forward-bigword
61	61	-----> bind -s --preset -M visual o swap-selection-start-stop repaint-mode
61	61	-----> bind -s --preset -M visual f forward-jump
59	59	-----> bind -s --preset -M visual t forward-jump-till
60	60	-----> bind -s --preset -M visual F backward-jump
58	58	-----> bind -s --preset -M visual T backward-jump-till
118	264	-----> for key in $eol_keys
        bind -s --preset -M visual $key end-of-line
    ...
75	75	------> bind -s --preset -M visual $key end-of-line
71	71	------> bind -s --preset -M visual $key end-of-line
53	258	-----> for key in $bol_keys
        bind -s --preset -M visual $key beginning-of-line
    ...
69	69	------> bind -s --preset -M visual $key beginning-of-line
67	67	------> bind -s --preset -M visual $key beginning-of-line
69	69	------> bind -s --preset -M visual $key beginning-of-line
67	67	-----> bind -s --preset -M visual -m insert c kill-selection end-selection repaint-mode
64	64	-----> bind -s --preset -M visual -m default d kill-selection end-selection repaint-mode
66	66	-----> bind -s --preset -M visual -m default x kill-selection end-selection repaint-mode
63	63	-----> bind -s --preset -M visual -m default X kill-whole-line end-selection repaint-mode
75	75	-----> bind -s --preset -M visual -m default y kill-selection yank end-selection repaint-mode
83	83	-----> bind -s --preset -M visual -m default '"*y' "commandline -s | xsel -p; commandline -f end-selection repaint-mode"
66	66	-----> bind -s --preset -M visual -m default \cc end-selection repaint-mode
61	61	-----> bind -s --preset -M visual -m default \e end-selection repaint-mode
65	65	-----> bind -s --preset -M default \# __fish_toggle_comment_commandline
62	62	-----> bind -s --preset -M visual \# __fish_toggle_comment_commandline
62	62	-----> bind -s --preset -M replace \# __fish_toggle_comment_commandline
831	3316	-----> fish_vi_cursor
1855	1890	------> source /usr/share/fish/functions/fish_vi_cursor.fish
35	35	-------> function fish_vi_cursor -d 'Set cursor shape for different vi modes'
    # If we're not interactive, there is effectively no bind mode.
    if not status is-interactive
        return
    end

    # This is hard to test in expect, since the exact sequences depend on the environment.
    # Instead disable it.
    if set -q FISH_UNIT_TESTS_RUNNING
        return
    end

    # Emacs Makes All Cursors Suck
    if set -q INSIDE_EMACS
        return
    end

    # vte-based terms set $TERM = xterm*, but only gained support in 2015.
    # From https://bugzilla.gnome.org/show_bug.cgi?id=720821, it appears it was version 0.40.0
    if set -q VTE_VERSION
        and test "$VTE_VERSION" -lt 4000 2>/dev/null
        return
    end

    # Similarly, genuine XTerm can do it since v280.
    if set -q XTERM_VERSION
        and not test (string replace -r "XTerm\((\d+)\)" '$1' -- "$XTERM_VERSION") -ge 280 2>/dev/null
        return
    end

    # We need one of these terms.
    # It would be lovely if we could rely on terminfo, but:
    # - The "Ss" entry isn't a thing in macOS' old and crusty terminfo
    # - It is set for xterm, and everyone and their dog claims to be xterm
    #
    # So we just don't care about $TERM, unless it is one of the few terminals that actually have their own entry.
    #
    # Note: Previous versions also checked $TMUX, and made sure that then $TERM was screen* or tmux*.
    # We don't care, since we *cannot* handle term-in-a-terms 100% correctly.
    if not set -q KONSOLE_PROFILE_NAME
        and not set -q ITERM_PROFILE
        and not set -q VTE_VERSION # which version is already checked above
        and not set -q XTERM_VERSION
        and not string match -rq '^st(-.*)$' -- $TERM
        and not string match -q 'xterm-kitty*' -- $TERM
        and not string match -q 'rxvt*' -- $TERM
        return
    end

    # HACK: Explicitly disable on ITERM because of #3696, which is weirdness with multi-line prompts.
    # We allow an explicit "--force-iterm" as first argument to skip this.
    # It's recommended only if you don't use a multi-line prompt.
    if contains -- $argv[1] --force-iterm
        set -e argv[1]
    else if set -q ITERM_PROFILE
        return
    end

    set -l terminal $argv[1]
    set -q terminal[1]
    or set terminal auto

    set -l function
    switch "$terminal"
        case auto
            # TODO: Konsole as of 18.08 knows the xterm sequences,
            # but there's still bugs with it (as of konsole 19.04.0).
            #
            # If it is fixed, we'd have to read $KONSOLE_VERSION for a while,
            # though that was only introduced in 18.08 as well.
            if set -q KONSOLE_PROFILE_NAME
                set function __fish_cursor_konsole
            else if set -q ITERM_PROFILE
                set function __fish_cursor_1337
            else
                set function __fish_cursor_xterm
            end
        case konsole
            set function __fish_cursor_konsole
        case xterm
            set function __fish_cursor_xterm
    end

    set -l tmux_prefix
    set -l tmux_postfix
    if set -q TMUX
        set tmux_prefix echo -ne "'\ePtmux;\e'"
        set tmux_postfix echo -ne "'\e\\\\'"
    end

    set -q fish_cursor_unknown
    or set -g fish_cursor_unknown block blink

    echo "
          function fish_vi_cursor_handle --on-variable fish_bind_mode --on-event fish_postexec --on-event fish_focus_in
              set -l varname fish_cursor_\$fish_bind_mode
              if not set -q \$varname
                set varname fish_cursor_unknown
              end
              $tmux_prefix
              $function \$\$varname
              $tmux_postfix
          end
         " | source

    echo "
          function fish_vi_cursor_handle_preexec --on-event fish_preexec
              set -l varname fish_cursor_default
              if not set -q \$varname
                set varname fish_cursor_unknown
              end
              $tmux_prefix
              $function \$\$varname
              $tmux_postfix
          end
         " | source
...
9	49	------> if not status is-interactive
        return
    ...
40	40	-------> not status is-interactive
5	41	------> if set -q FISH_UNIT_TESTS_RUNNING
        return
    ...
36	36	-------> set -q FISH_UNIT_TESTS_RUNNING
5	30	------> if set -q INSIDE_EMACS
        return
    ...
25	25	-------> set -q INSIDE_EMACS
5	29	------> if set -q VTE_VERSION
        and test "$VTE_VERSION" -lt 4000 2>/dev/null
        return
    ...
24	24	-------> set -q VTE_VERSION
4	27	------> if set -q XTERM_VERSION
        and not test (string replace -r "XTerm\((\d+)\)" '$1' -- "$XTERM_VERSION") -ge 280 2>/dev/null
        return
    ...
23	23	-------> set -q XTERM_VERSION
45	419	------> if not set -q KONSOLE_PROFILE_NAME
        and not set -q ITERM_PROFILE
        and not set -q VTE_VERSION # which version is already checked above
        and not set -q XTERM_VERSION
        and not string match -rq '^st(-.*)$' -- $TERM
        and not string match -q 'xterm-kitty*' -- $TERM
        and not string match -q 'rxvt*' -- $TERM
        return
    ...
24	24	-------> not set -q KONSOLE_PROFILE_NAME
22	22	-------> not set -q ITERM_PROFILE
21	21	-------> not set -q VTE_VERSION
21	21	-------> not set -q XTERM_VERSION
114	114	-------> not string match -rq '^st(-.*)$' -- $TERM
74	74	-------> not string match -q 'xterm-kitty*' -- $TERM
65	65	-------> not string match -q 'rxvt*' -- $TERM
33	33	-------> return
75	75	-----> set fish_bind_mode $init_mode
14	9062	---> if functions --query fish_user_key_bindings >/dev/null
            fish_user_key_bindings 2>/dev/null
        ...
108	108	----> functions --query fish_user_key_bindings >/dev/null
93	8940	----> fish_user_key_bindings 2>/dev/null
66	66	-----> test -f $OMF_CONFIG/theme
106	106	-----> read -l theme < $OMF_CONFIG/theme
76	76	-----> test -e $OMF_CONFIG/key_bindings.fish
2551	2551	-----> set -l key_bindings {$OMF_CONFIG,$OMF_PATH}/pkg/*/key_bindings.fish \
                      {$OMF_CONFIG,$OMF_PATH}/themes*/$theme/key_bindings.fish
43	2516	-----> for file in $key_bindings
    source $file
  ...
181	2473	------> source $file
58	58	-------> bind \eH '__fzf_autojump'
25	2234	-------> if bind -M insert >/dev/null ^/dev/null
  bind -M insert \eH '__fzf_autojump'
...
2106	2106	--------> bind -M insert >/dev/null ^/dev/null
103	103	--------> bind -M insert \eH '__fzf_autojump'
66	66	-----> functions -q __original_fish_user_key_bindings
45	3466	-----> __original_fish_user_key_bindings
287	3384	------> fzf_key_bindings
1332	1342	-------> source /home/niklash/.config/fish/functions/fzf_key_bindings.fish
10	10	--------> function fzf_key_bindings

  # Store current token in $dir as root for the 'find' command
  function fzf-file-widget -d "List files and folders"
    set -l commandline (__fzf_parse_commandline)
    set -l dir $commandline[1]
    set -l fzf_query $commandline[2]

    # "-path \$dir'*/\\.*'" matches hidden files/folders inside $dir but not
    # $dir itself, even if hidden.
    test -n "$FZF_CTRL_T_COMMAND"; or set -l FZF_CTRL_T_COMMAND "
    command find -L \$dir -mindepth 1 \\( -path \$dir'*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' \\) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | sed 's@^\./@@'"

    test -n "$FZF_TMUX_HEIGHT"; or set FZF_TMUX_HEIGHT 40%
    begin
      set -lx FZF_DEFAULT_OPTS "--height $FZF_TMUX_HEIGHT --reverse $FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS"
      eval "$FZF_CTRL_T_COMMAND | "(__fzfcmd)' -m --query "'$fzf_query'"' | while read -l r; set result $result $r; end
    end
    if [ -z "$result" ]
      commandline -f repaint
      return
    else
      # Remove last token from commandline.
      commandline -t ""
    end
    for i in $result
      commandline -it -- (string escape $i)
      commandline -it -- ' '
    end
    commandline -f repaint
  end

  function fzf-history-widget -d "Show command history"
    test -n "$FZF_TMUX_HEIGHT"; or set FZF_TMUX_HEIGHT 40%
    begin
      set -lx FZF_DEFAULT_OPTS "--height $FZF_TMUX_HEIGHT $FZF_DEFAULT_OPTS --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS +m"

      set -l FISH_MAJOR (echo $version | cut -f1 -d.)
      set -l FISH_MINOR (echo $version | cut -f2 -d.)

      # history's -z flag is needed for multi-line support.
      # history's -z flag was added in fish 2.4.0, so don't use it for versions
      # before 2.4.0.
      if [ "$FISH_MAJOR" -gt 2 -o \( "$FISH_MAJOR" -eq 2 -a "$FISH_MINOR" -ge 4 \) ];
        history -z | eval (__fzfcmd) --read0 --print0 -q '(commandline)' | read -lz result
        and commandline -- $result
      else
        history | eval (__fzfcmd) -q '(commandline)' | read -l result
        and commandline -- $result
      end
    end
    commandline -f repaint
  end

  function fzf-cd-widget -d "Change directory"
    set -l commandline (__fzf_parse_commandline)
    set -l dir $commandline[1]
    set -l fzf_query $commandline[2]

    test -n "$FZF_ALT_C_COMMAND"; or set -l FZF_ALT_C_COMMAND "
    command find -L \$dir -mindepth 1 \\( -path \$dir'*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' \\) -prune \
    -o -type d -print 2> /dev/null | sed 's@^\./@@'"
    test -n "$FZF_TMUX_HEIGHT"; or set FZF_TMUX_HEIGHT 40%
    begin
      set -lx FZF_DEFAULT_OPTS "--height $FZF_TMUX_HEIGHT --reverse $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS"
      eval "$FZF_ALT_C_COMMAND | "(__fzfcmd)' +m --query "'$fzf_query'"' | read -l result

      if [ -n "$result" ]
        cd $result

        # Remove last token from commandline.
        commandline -t ""
      end
    end

    commandline -f repaint
  end

  function __fzfcmd
    test -n "$FZF_TMUX"; or set FZF_TMUX 0
    test -n "$FZF_TMUX_HEIGHT"; or set FZF_TMUX_HEIGHT 40%
    if [ -n "$FZF_TMUX_OPTS" ]
      echo "fzf-tmux $FZF_TMUX_OPTS -- "
    else if [ $FZF_TMUX -eq 1 ]
      echo "fzf-tmux -d$FZF_TMUX_HEIGHT -- "
    else
      echo "fzf"
    end
  end

  bind \ct fzf-file-widget
  bind \cr fzf-history-widget
  bind \ec fzf-cd-widget

  if bind -M insert > /dev/null 2>&1
    bind -M insert \ct fzf-file-widget
    bind -M insert \cr fzf-history-widget
    bind -M insert \ec fzf-cd-widget
  end

  function __fzf_parse_commandline -d 'Parse the current command line token and return split of existing filepath and rest of token'
    # eval is used to do shell expansion on paths
    set -l commandline (eval "printf '%s' "(commandline -t))

    if [ -z $commandline ]
      # Default to current directory with no --query
      set dir '.'
      set fzf_query ''
    else
      set dir (__fzf_get_dir $commandline)

      if [ "$dir" = "." -a (string sub -l 1 $commandline) != '.' ]
        # if $dir is "." but commandline is not a relative path, this means no file path found
        set fzf_query $commandline
      else
        # Also remove trailing slash after dir, to "split" input properly
        set fzf_query (string replace -r "^$dir/?" '' "$commandline")
      end
    end

    echo $dir
    echo $fzf_query
  end

  function __fzf_get_dir -d 'Find the longest existing filepath from input string'
    set dir $argv

    # Strip all trailing slashes. Ignore if $dir is root dir (/)
    if [ (string length $dir) -gt 1 ]
      set dir (string replace -r '/*$' '' $dir)
    end

    # Iteratively check if dir exists and strip tail end of path
    while [ ! -d "$dir" ]
      # If path is absolute, this can keep going until ends up at /
      # If path is relative, this can keep going until entire input is consumed, dirname returns "."
      set dir (dirname "$dir")
    end

    echo $dir
  end

...
18	18	-------> function fzf-file-widget -d "List files and folders"
    set -l commandline (__fzf_parse_commandline)
    set -l dir $commandline[1]
    set -l fzf_query $commandline[2]

    # "-path \$dir'*/\\.*'" matches hidden files/folders inside $dir but not
    # $dir itself, even if hidden.
    test -n "$FZF_CTRL_T_COMMAND"; or set -l FZF_CTRL_T_COMMAND "
    command find -L \$dir -mindepth 1 \\( -path \$dir'*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' \\) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | sed 's@^\./@@'"

    test -n "$FZF_TMUX_HEIGHT"; or set FZF_TMUX_HEIGHT 40%
    begin
      set -lx FZF_DEFAULT_OPTS "--height $FZF_TMUX_HEIGHT --reverse $FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS"
      eval "$FZF_CTRL_T_COMMAND | "(__fzfcmd)' -m --query "'$fzf_query'"' | while read -l r; set result $result $r; end
    end
    if [ -z "$result" ]
      commandline -f repaint
      return
    else
      # Remove last token from commandline.
      commandline -t ""
    end
    for i in $result
      commandline -it -- (string escape $i)
      commandline -it -- ' '
    end
    commandline -f repaint
  ...
8	8	-------> function fzf-history-widget -d "Show command history"
    test -n "$FZF_TMUX_HEIGHT"; or set FZF_TMUX_HEIGHT 40%
    begin
      set -lx FZF_DEFAULT_OPTS "--height $FZF_TMUX_HEIGHT $FZF_DEFAULT_OPTS --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS +m"

      set -l FISH_MAJOR (echo $version | cut -f1 -d.)
      set -l FISH_MINOR (echo $version | cut -f2 -d.)

      # history's -z flag is needed for multi-line support.
      # history's -z flag was added in fish 2.4.0, so don't use it for versions
      # before 2.4.0.
      if [ "$FISH_MAJOR" -gt 2 -o \( "$FISH_MAJOR" -eq 2 -a "$FISH_MINOR" -ge 4 \) ];
        history -z | eval (__fzfcmd) --read0 --print0 -q '(commandline)' | read -lz result
        and commandline -- $result
      else
        history | eval (__fzfcmd) -q '(commandline)' | read -l result
        and commandline -- $result
      end
    end
    commandline -f repaint
  ...
6	6	-------> function fzf-cd-widget -d "Change directory"
    set -l commandline (__fzf_parse_commandline)
    set -l dir $commandline[1]
    set -l fzf_query $commandline[2]

    test -n "$FZF_ALT_C_COMMAND"; or set -l FZF_ALT_C_COMMAND "
    command find -L \$dir -mindepth 1 \\( -path \$dir'*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' \\) -prune \
    -o -type d -print 2> /dev/null | sed 's@^\./@@'"
    test -n "$FZF_TMUX_HEIGHT"; or set FZF_TMUX_HEIGHT 40%
    begin
      set -lx FZF_DEFAULT_OPTS "--height $FZF_TMUX_HEIGHT --reverse $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS"
      eval "$FZF_ALT_C_COMMAND | "(__fzfcmd)' +m --query "'$fzf_query'"' | read -l result

      if [ -n "$result" ]
        cd $result

        # Remove last token from commandline.
        commandline -t ""
      end
    end

    commandline -f repaint
  ...
4	4	-------> function __fzfcmd
    test -n "$FZF_TMUX"; or set FZF_TMUX 0
    test -n "$FZF_TMUX_HEIGHT"; or set FZF_TMUX_HEIGHT 40%
    if [ -n "$FZF_TMUX_OPTS" ]
      echo "fzf-tmux $FZF_TMUX_OPTS -- "
    else if [ $FZF_TMUX -eq 1 ]
      echo "fzf-tmux -d$FZF_TMUX_HEIGHT -- "
    else
      echo "fzf"
    end
  ...
46	46	-------> bind \ct fzf-file-widget
31	31	-------> bind \cr fzf-history-widget
27	27	-------> bind \ec fzf-cd-widget
26	1594	-------> if bind -M insert > /dev/null 2>&1
    bind -M insert \ct fzf-file-widget
    bind -M insert \cr fzf-history-widget
    bind -M insert \ec fzf-cd-widget
  ...
1456	1456	--------> bind -M insert > /dev/null 2>&1
54	54	--------> bind -M insert \ct fzf-file-widget
31	31	--------> bind -M insert \cr fzf-history-widget
27	27	--------> bind -M insert \ec fzf-cd-widget
13	13	-------> function __fzf_parse_commandline -d 'Parse the current command line token and return split of existing filepath and rest of token'
    # eval is used to do shell expansion on paths
    set -l commandline (eval "printf '%s' "(commandline -t))

    if [ -z $commandline ]
      # Default to current directory with no --query
      set dir '.'
      set fzf_query ''
    else
      set dir (__fzf_get_dir $commandline)

      if [ "$dir" = "." -a (string sub -l 1 $commandline) != '.' ]
        # if $dir is "." but commandline is not a relative path, this means no file path found
        set fzf_query $commandline
      else
        # Also remove trailing slash after dir, to "split" input properly
        set fzf_query (string replace -r "^$dir/?" '' "$commandline")
      end
    end

    echo $dir
    echo $fzf_query
  ...
8	8	-------> function __fzf_get_dir -d 'Find the longest existing filepath from input string'
    set dir $argv

    # Strip all trailing slashes. Ignore if $dir is root dir (/)
    if [ (string length $dir) -gt 1 ]
      set dir (string replace -r '/*$' '' $dir)
    end

    # Iteratively check if dir exists and strip tail end of path
    while [ ! -d "$dir" ]
      # If path is absolute, this can keep going until ends up at /
      # If path is relative, this can keep going until entire input is consumed, dirname returns "."
      set dir (dirname "$dir")
    end

    echo $dir
  ...
37	37	------> bind -M insert -k nul accept-autosuggestion
9	127	--> if not set -q FISH_UNIT_TESTS_RUNNING
        # Enable bracketed paste before every prompt (see __fish_shared_bindings for the bindings).
        # Disable it for unit tests so we don't have to add the sequences to bind.expect
        function __fish_enable_bracketed_paste --on-event fish_prompt
            printf "\e[?2004h"
        end

        # Disable BP before every command because that might not support it.
        function __fish_disable_bracketed_paste --on-event fish_preexec --on-event fish_exit
            printf "\e[?2004l"
        end

        # Tell the terminal we support BP. Since we are in __f_c_i, the first fish_prompt
        # has already fired.
        __fish_enable_bracketed_paste
    ...
21	21	---> not set -q FISH_UNIT_TESTS_RUNNING
10	10	---> function __fish_enable_bracketed_paste --on-event fish_prompt
            printf "\e[?2004h"
        ...
10	10	---> function __fish_disable_bracketed_paste --on-event fish_preexec --on-event fish_exit
            printf "\e[?2004l"
        ...
25	77	---> __fish_enable_bracketed_paste
52	52	----> printf "\e[?2004h"
6	51	--> if set -q TMUX
        and not set -q FISH_UNIT_TESTS_RUNNING
        function __fish_enable_focus --on-event fish_postexec
            echo -n \e\[\?1004h
        end
        function __fish_disable_focus --on-event fish_preexec
            echo -n \e\[\?1004l
        end
        # Note: Don't call this initially because, even though we're in a fish_prompt event,
        # tmux reacts sooo quickly that we'll still get a sequence before we're prepared for it.
        # So this means that we won't get focus events until you've run at least one command, but that's preferable
        # to always seeing `^[[I` when starting fish.
        # __fish_enable_focus
    ...
17	17	---> set -q TMUX
14	14	---> not set -q FISH_UNIT_TESTS_RUNNING
9	9	---> function __fish_enable_focus --on-event fish_postexec
            echo -n \e\[\?1004h
        ...
5	5	---> function __fish_disable_focus --on-event fish_preexec
            echo -n \e\[\?1004l
        ...
14	14	--> function __fish_winch_handler --on-signal WINCH -d "Repaint screen when window changes size"
        commandline -f repaint >/dev/null 2>/dev/null
    ...
4	250	--> if test 0"$VTE_VERSION" -ge 3405 -o "$TERM_PROGRAM" = "Apple_Terminal" -a (string match -r '\d+' 0"$TERM_PROGRAM_VERSION") -ge 309
        function __update_cwd_osc --on-variable PWD --description 'Notify capable terminals when $PWD changes'
            if status --is-command-substitution || set -q INSIDE_EMACS
                return
            end
            printf \e\]7\;file://%s%s\a $hostname (string escape --style=url $PWD)
        end
        __update_cwd_osc # Run once because we might have already inherited a PWD from an old tab
    ...
185	246	---> test 0"$VTE_VERSION" -ge 3405 -o "$TERM_PROGRAM" = "Apple_Terminal" -a (string match -r '\d+' 0"$TERM_PROGRAM_VERSION") -ge 309
61	61	----> string match -r '\d+' 0"$TERM_PROGRAM_VERSION"
26	5204	--> if not type -q __fish_command_not_found_handler
        # Read the OS/Distro from /etc/os-release.
        # This has a "ID=" line that defines the exact distribution,
        # and an "ID_LIKE=" line that defines what it is derived from or otherwise like.
        # For our purposes, we use both.
        set -l os
        if test -r /etc/os-release
            set os (string match -r '^ID(?:_LIKE)?\s*=.*' < /etc/os-release | \
            string replace -r '^ID(?:_LIKE)?\s*=(.*)' '$1' | string trim -c '\'"' | string split " ")
        end

        # First check if we are on OpenSUSE since SUSE's handler has no options
        # but the same name and path as Ubuntu's.
        if contains -- suse $os || contains -- sles $os && type -q command-not-found
            function __fish_command_not_found_handler --on-event fish_command_not_found
                /usr/bin/command-not-found $argv[1]
            end
            # Check for Fedora's handler
        else if test -f /usr/libexec/pk-command-not-found
            function __fish_command_not_found_handler --on-event fish_command_not_found
                /usr/libexec/pk-command-not-found $argv[1]
            end
            # Check in /usr/lib, this is where modern Ubuntus place this command
        else if test -f /usr/lib/command-not-found
            function __fish_command_not_found_handler --on-event fish_command_not_found
                /usr/lib/command-not-found -- $argv[1]
            end
            # Check for NixOS handler
        else if test -f /run/current-system/sw/bin/command-not-found
            function __fish_command_not_found_handler --on-event fish_command_not_found
                /run/current-system/sw/bin/command-not-found $argv
            end
            # Ubuntu Feisty places this command in the regular path instead
        else if type -q command-not-found
            function __fish_command_not_found_handler --on-event fish_command_not_found
                command-not-found -- $argv[1]
            end
            # pkgfile is an optional, but official, package on Arch Linux
            # it ships with example handlers for bash and zsh, so we'll follow that format
        else if type -p -q pkgfile
            function __fish_command_not_found_handler --on-event fish_command_not_found
                set -l __packages (pkgfile --binaries --verbose -- $argv[1] 2>/dev/null)
                if test $status -eq 0
                    printf "%s may be found in the following packages:\n" "$argv[1]"
                    printf "  %s\n" $__packages
                else
                    __fish_default_command_not_found_handler $argv[1]
                end
            end
            # Use standard fish command not found handler otherwise
        else
            function __fish_command_not_found_handler --on-event fish_command_not_found
                __fish_default_command_not_found_handler $argv[1]
            end
        end
    ...
688	4278	---> not type -q __fish_command_not_found_handler
1091	1107	----> source /usr/share/fish/functions/type.fish
16	16	-----> function type --description 'Print the type of a command'
    # For legacy reasons, no argument simply causes an unsuccessful return.
    set -q argv[1]
    or return 1

    set -l options 'h/help' 'a/all' 's/short' 'f/no-functions' 't/type' 'p/path' 'P/force-path' 'q/quiet'
    argparse -n type -x t,p,P $options -- $argv
    or return

    if set -q _flag_help
        __fish_print_help type
        return 0
    end

    set -l res 1
    set -l mode normal
    set -l multi no
    set -l selection all
    set -l short no

    # Technically all four of these flags are mutually exclusive. However, we allow -q to be used
    # with the other three because old versions of this function explicitly allowed it by making
    # --quiet have precedence.
    if set -q _flag_quiet
        set mode quiet
    else if set -q _flag_type
        set mode type
    else if set -q _flag_path
        set mode path
    else if set -q _flag_force_path
        set mode path
        set selection files
    end

    set -q _flag_all
    and set multi yes

    set -q _flag_short
    and set short yes

    set -q _flag_no_functions
    and set selection files

    # Check all possible types for the remaining arguments.
    for i in $argv
        # Found will be set to 1 if a match is found.
        set -l found 0

        if test $selection != files
            if functions -q -- $i
                set res 0
                set found 1
                switch $mode
                    case normal
                        printf (_ '%s is a function') $i
                        if test $short != yes
                            echo (_ ' with definition')
                            functions $i
                        else
                            set -l func_path (functions --details $i)
                            if not contains -- $func_path - stdin
                                printf (_ ' (defined in %s)') $func_path
                            end
                            echo
                        end
                    case type
                        echo (_ 'function')
                    case path
                        set -l func_path (functions --details $i)
                        switch $func_path
                            case "-"
                            case "n/a"
                            case "stdin"
                                break
                            case "*"
                                echo $func_path
                        end
                end
                if test $multi != yes
                    continue
                end
            end

            if contains -- $i (builtin -n)
                set res 0
                set found 1
                switch $mode
                    case normal
                        printf (_ '%s is a builtin\n') $i

                    case type
                        echo (_ 'builtin')
                end
                if test $multi != yes
                    continue
                end
            end
        end

        set -l paths
        if test $multi != yes
            set paths (command -s -- $i)
        else
            set paths (command -sa -- $i)
        end
        for path in $paths
            set res 0
            set found 1
            switch $mode
                case normal
                    printf (_ '%s is %s\n') $i $path
                case type
                    echo (_ 'file')
                case path
                    echo $path
            end
            if test $multi != yes
                continue
            end
        end

        if test $found = 0
            and test $mode != quiet
            and test $mode != path
            printf (_ "%s: Could not find '%s'\n") type $i >&2
        end
    end

    return $res
...
26	26	----> set -q argv[1]
42	42	----> set -l options 'h/help' 'a/all' 's/short' 'f/no-functions' 't/type' 'p/path' 'P/force-path' 'q/quiet'
69	69	----> argparse -n type -x t,p,P $options -- $argv
3	19	----> if set -q _flag_help
        __fish_print_help type
        return 0
    ...
16	16	-----> set -q _flag_help
18	18	----> set -l res 1
17	17	----> set -l mode normal
16	16	----> set -l multi no
16	16	----> set -l selection all
14	14	----> set -l short no
11	45	----> if set -q _flag_quiet
        set mode quiet
    else if set -q _flag_type
        set mode type
    else if set -q _flag_path
        set mode path
    else if set -q _flag_force_path
        set mode path
        set selection files
    ...
11	11	-----> set -q _flag_quiet
23	23	-----> set mode quiet
21	21	----> set -q _flag_all
19	19	----> set -q _flag_short
18	18	----> set -q _flag_no_functions
65	2119	----> for i in $argv
        # Found will be set to 1 if a match is found.
        set -l found 0

        if test $selection != files
            if functions -q -- $i
                set res 0
                set found 1
                switch $mode
                    case normal
                        printf (_ '%s is a function') $i
                        if test $short != yes
                            echo (_ ' with definition')
                            functions $i
                        else
                            set -l func_path (functions --details $i)
                            if not contains -- $func_path - stdin
                                printf (_ ' (defined in %s)') $func_path
                            end
                            echo
                        end
                    case type
                        echo (_ 'function')
                    case path
                        set -l func_path (functions --details $i)
                        switch $func_path
                            case "-"
                            case "n/a"
                            case "stdin"
                                break
                            case "*"
                                echo $func_path
                        end
                end
                if test $multi != yes
                    continue
                end
            end

            if contains -- $i (builtin -n)
                set res 0
                set found 1
                switch $mode
                    case normal
                        printf (_ '%s is a builtin\n') $i

                    case type
                        echo (_ 'builtin')
                end
                if test $multi != yes
                    continue
                end
            end
        end

        set -l paths
        if test $multi != yes
            set paths (command -s -- $i)
        else
            set paths (command -sa -- $i)
        end
        for path in $paths
            set res 0
            set found 1
            switch $mode
                case normal
                    printf (_ '%s is %s\n') $i $path
                case type
                    echo (_ 'file')
                case path
                    echo $path
            end
            if test $multi != yes
                continue
            end
        end

        if test $found = 0
            and test $mode != quiet
            and test $mode != path
            printf (_ "%s: Could not find '%s'\n") type $i >&2
        end
    ...
28	28	-----> set -l found 0
15	1013	-----> if test $selection != files
            if functions -q -- $i
                set res 0
                set found 1
                switch $mode
                    case normal
                        printf (_ '%s is a function') $i
                        if test $short != yes
                            echo (_ ' with definition')
                            functions $i
                        else
                            set -l func_path (functions --details $i)
                            if not contains -- $func_path - stdin
                                printf (_ ' (defined in %s)') $func_path
                            end
                            echo
                        end
                    case type
                        echo (_ 'function')
                    case path
                        set -l func_path (functions --details $i)
                        switch $func_path
                            case "-"
                            case "n/a"
                            case "stdin"
                                break
                            case "*"
                                echo $func_path
                        end
                end
                if test $multi != yes
                    continue
                end
            end

            if contains -- $i (builtin -n)
                set res 0
                set found 1
                switch $mode
                    case normal
                        printf (_ '%s is a builtin\n') $i

                    case type
                        echo (_ 'builtin')
                end
                if test $multi != yes
                    continue
                end
            end
        ...
34	34	------> test $selection != files
4	527	------> if functions -q -- $i
                set res 0
                set found 1
                switch $mode
                    case normal
                        printf (_ '%s is a function') $i
                        if test $short != yes
                            echo (_ ' with definition')
                            functions $i
                        else
                            set -l func_path (functions --details $i)
                            if not contains -- $func_path - stdin
                                printf (_ ' (defined in %s)') $func_path
                            end
                            echo
                        end
                    case type
                        echo (_ 'function')
                    case path
                        set -l func_path (functions --details $i)
                        switch $func_path
                            case "-"
                            case "n/a"
                            case "stdin"
                                break
                            case "*"
                                echo $func_path
                        end
                end
                if test $multi != yes
                    continue
                end
            ...
523	523	-------> functions -q -- $i
6	437	------> if contains -- $i (builtin -n)
                set res 0
                set found 1
                switch $mode
                    case normal
                        printf (_ '%s is a builtin\n') $i

                    case type
                        echo (_ 'builtin')
                end
                if test $multi != yes
                    continue
                end
            ...
342	431	-------> contains -- $i (builtin -n)
89	89	--------> builtin -n
32	32	-----> set -l paths
11	896	-----> if test $multi != yes
            set paths (command -s -- $i)
        else
            set paths (command -sa -- $i)
        ...
29	29	------> test $multi != yes
150	856	------> set paths (command -s -- $i)
706	706	-------> command -s -- $i
23	23	-----> for path in $paths
            set res 0
            set found 1
            switch $mode
                case normal
                    printf (_ '%s is %s\n') $i $path
                case type
                    echo (_ 'file')
                case path
                    echo $path
            end
            if test $multi != yes
                continue
            end
        ...
9	62	-----> if test $found = 0
            and test $mode != quiet
            and test $mode != path
            printf (_ "%s: Could not find '%s'\n") type $i >&2
        ...
29	29	------> test $found = 0
24	24	------> test $mode != quiet
24	24	----> return $res
23	23	---> set -l os
10	758	---> if test -r /etc/os-release
            set os (string match -r '^ID(?:_LIKE)?\s*=.*' < /etc/os-release | \
            string replace -r '^ID(?:_LIKE)?\s*=(.*)' '$1' | string trim -c '\'"' | string split " ")
        ...
27	27	----> test -r /etc/os-release
151	721	----> set os (string match -r '^ID(?:_LIKE)?\s*=.*' < /etc/os-release | \
            string replace -r '^ID(?:_LIKE)?\s*=(.*)' '$1' | string trim -c '\'"' | string split " ")
570	570	-----> string match -r '^ID(?:_LIKE)?\s*=.*' < /etc/os-release | \
            string replace -r '^ID(?:_LIKE)?\s*=(.*)' '$1' | string trim -c '\'"' | string split " "
14	119	---> if contains -- suse $os || contains -- sles $os && type -q command-not-found
            function __fish_command_not_found_handler --on-event fish_command_not_found
                /usr/bin/command-not-found $argv[1]
            end
            # Check for Fedora's handler
        else if test -f /usr/libexec/pk-command-not-found
            function __fish_command_not_found_handler --on-event fish_command_not_found
                /usr/libexec/pk-command-not-found $argv[1]
            end
            # Check in /usr/lib, this is where modern Ubuntus place this command
        else if test -f /usr/lib/command-not-found
            function __fish_command_not_found_handler --on-event fish_command_not_found
                /usr/lib/command-not-found -- $argv[1]
            end
            # Check for NixOS handler
        else if test -f /run/current-system/sw/bin/command-not-found
            function __fish_command_not_found_handler --on-event fish_command_not_found
                /run/current-system/sw/bin/command-not-found $argv
            end
            # Ubuntu Feisty places this command in the regular path instead
        else if type -q command-not-found
            function __fish_command_not_found_handler --on-event fish_command_not_found
                command-not-found -- $argv[1]
            end
            # pkgfile is an optional, but official, package on Arch Linux
            # it ships with example handlers for bash and zsh, so we'll follow that format
        else if type -p -q pkgfile
            function __fish_command_not_found_handler --on-event fish_command_not_found
                set -l __packages (pkgfile --binaries --verbose -- $argv[1] 2>/dev/null)
                if test $status -eq 0
                    printf "%s may be found in the following packages:\n" "$argv[1]"
                    printf "  %s\n" $__packages
                else
                    __fish_default_command_not_found_handler $argv[1]
                end
            end
            # Use standard fish command not found handler otherwise
        else
            function __fish_command_not_found_handler --on-event fish_command_not_found
                __fish_default_command_not_found_handler $argv[1]
            end
        ...
39	39	----> contains -- suse $os
24	24	----> contains -- sles $os
18	18	----> test -f /usr/libexec/pk-command-not-found
14	14	----> test -f /usr/lib/command-not-found
10	10	----> function __fish_command_not_found_handler --on-event fish_command_not_found
                /usr/lib/command-not-found -- $argv[1]
            ...
26	26	--> set __fish_initialized 3100
27	27	-> functions -e __fish_on_interactive
19	19	> fish_mode_prompt
49	33667	> fish_prompt
17	40	-> switch "$fish_key_bindings"
        case fish_hybrid_key_bindings fish_vi_key_bindings
            set keymap "$fish_bind_mode"
        case '*'
            set keymap insert
    ...
23	23	--> set keymap "$fish_bind_mode"
21	21	-> set -l exit_code $status
20	20	-> set -l starship_duration "$CMD_DURATION$cmd_duration"
32872	33537	-> "/home/niklash/.cargo/bin/starship" prompt --status=$exit_code --keymap=$keymap --cmd-duration=$starship_duration --jobs=(count (jobs -p))
456	665	--> count (jobs -p)
209	209	---> jobs -p
52	1302	> fish_right_prompt
51	51	-> set_color $fish_color_autosuggestion 2> /dev/null
1167	1167	-> date "+%H:%M:%S"
32	32	-> set_color normal
26	316	> fish_title
8	290	-> if not set -q INSIDE_EMACS
        echo (status current-command) (__fish_pwd)
    ...
14	14	--> not set -q INSIDE_EMACS
202	268	--> echo (status current-command) (__fish_pwd)
15	15	---> status current-command
30	51	---> __fish_pwd
21	21	----> pwd
80	193	> __fish_disable_bracketed_paste 0
113	113	-> printf "\e[?2004l"
