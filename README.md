Just a quick short one-off to show me an overview of the git status of all
the projects i'm working on, in terms of whether or not they are versioned,
whether they are versioned remotely, and whether any modifications have been
made to them since the last commit.

It uses the bloated hipe-cli, but the thing itself is under 200 lines long.

You keep a file in your home directory that has all the projects you're working
on, (or not working on at the moment) and it can display them in a nice row
and tell you whether or not you have changes to commit, or commits to push
to origin/master

Make an "alphabet.txt" file like this in your home directory:
    ~ > cat ~/alphabet.txt
    alphabet => ~/proj/mygems/hipe-alphabet
    githelper => ~/proj/mygems/hipe-githelper
    hipe-core => ~/proj/mygems/hipe-core-bleeding
    hipe-cli  => ~/proj/mygems/hipe-cli-bleeding


then get output something like this:

    ~ > alphabet summary
    |__->_____________________|___________________|_______|______________________|
    |_LTR_->_NAME_____________|___________REMOTE__|_AHEAD_|_______________CHANGE_|
    | alphabet -> hipe-alpha  |    hipe-alphabet  |     0 |              2 added |
    | al -> ack-lite          |        (no repo)  |     - |                    - |
    | githelper -> hipe-gith  |        githelper  |     0 | 24 added, 15 changed |
    | hipe-core -> hipe-core  |        hipe-core  |     0 |              9 added |
    | hipe-cli -> hipe-cli-b  |         hipe-cli  |     0 |  25 added, 2 changed |
    |__->_____________________|___________________|_______|______________________|
                                it's my code in a box




###   (the below is in flux:)
###  It has a tiny syntax which is
###    1) those arrows
###  and
###    2) the tag "(theirs)"
###
###  The name on the left of the arrow is the 'project name', and the name on the right
###  is the path...
###
###  The tag "(theirs)" tells alphabet "this isn't my project, this is someone
###  else's; so don't bother checking for modifications, but do show it in summary
###  lists."
###
