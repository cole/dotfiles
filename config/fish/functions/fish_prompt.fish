function fish_prompt
        echo -n -s '[' (set_color purple) (hostname -s) (set_color normal) ':' (set_color cyan) (whoami) (set_color normal) '] ' (set_color yellow) (prompt_pwd) (set_color normal) ' $ '
end