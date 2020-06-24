
function gco
{
    #inside project git repository
    inside_git="$(git rev-parse --is-inside-work-tree 2>/dev/null)"

    if [[ $inside_git == "true" ]]
    then

	if [[ $# < 1 ]]
	then
	  	echo "Error! There is no commit message"
	    	echo "Retry and add the commit message after gco"

	else
	    	echo "Inside a git repos"
	    	echo " "

      	    	#verify current branch
	    	current_branch="$(git rev-parse --abbrev-ref HEAD)"
	    	echo "On branch $current_branch"
	    	echo " "
            	git commit -m "[$current_branch] $*"
       	        echo "Commit message = [$current_branch] $*"

	fi

    else

	echo "ERROR!!! Not inside a git repos"

    fi
}
