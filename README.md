@depends:
  - github.com/hipe/githelper.git
  - github.com/hipe/hipe-cli.git


This started off as a one-off to give an overview of all projects i'm working
on, in terms of whether or not they are versioned, whether they are versioned
remotely, and whether any modifications have been made to them since the last commit.

You keep a file in your home directory that has all the projects you're working
on, (or not working on at the moment) and it can display them in a nice row
and tell you whether or not you have changes to commit, or commits to push
to origin/master

Make an "alphabet.txt" file like this in your home directory:
    ---- ~/alphabet.txt --------
    a -> utility-scripts
    b -> hipe-core
    c -> hipe-cli
    i -> innate (theirs)
    j -> ramaze (theirs)
    -----------------------------


then get output something like this:
    ~/a > alphabet summary
    |_________________________|___________________________________|_________________|
    |_LTR_->_NAME_____________|____________________________WHERE__|__________CHANGE_|
    | a -> alphabet           |         (gitnames:)hipe-alphabet  | 1 files changed |
    | al -> ack-lite          |                        (no repo)  |               - |
    | c -> hipe-core          |             (gitnames:)hipe-core  | 2 files changed |
    | d -> hipe-didcap        |           (no remote)hipe-didcap  | 1 files changed |
    | f -> fonteye            |               (gitnames:)fonteye  |              ok |
    | fm -> filemetrics       |      (gitnames:)hipe-filemetrics  |              ok |
    | m -> metacms            |         (gitnames:)hipe-wisteria  | 5 files changed |
    | s -> shapes             |                        (no repo)  |               - |
    | t -> texmate            |                        (no repo)  |               - |
    |_________________________|___________________________________|_________________|





It has a tiny syntax which is
  1) those arrows
and
  2) the tag "(theirs)"

The name on the left of the arrow is the 'project name', and the name on the right
is the path...

The tag "(theirs)" tells alphabet "this isn't my project, this is someone
else's; so don't bother checking for modifications, but do show it in summary
lists."
