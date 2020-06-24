
function gco
{
    #inside project git repository
    inside_git="$(git rev-parse --is-inside-work-tree 2>/dev/null)"

    if [[ $inside_git == "true" ]]
    then

		echo "Inside a git repos"

    else

		echo "Not inside a git repos"

    fi
}
