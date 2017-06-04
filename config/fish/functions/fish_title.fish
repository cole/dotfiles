function fish_title
    switch $_
        case fish
            echo -n (prompt_pwd)
        case '*'
            echo -n $_ ' ' (prompt_pwd)
    end
end