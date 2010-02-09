@depends:
  - github.com/hipe/githelper.git
  - github.com/hipe/hipe-cli.git  
  

This started off as a one-off to give an overview of all projects i'm working
on, in terms of whether or not they are versioned, whether they are versioned
remotely, and whether any modifications have been made to them since the last commit.

It assumes that projects folders have symlinks of lowercase single letters in
the user's home directory, (and for now an ~/alphabet.txt file giving the projects titles)

Make an "alphabet.txt" file like this in your home directory:
---- ~/alphabet.txt --------
a -> utility-scripts
b -> hipe-core
c -> hipe-cli
i -> innate (theirs)
j -> ramaze (theirs)
-----------------------------


It has a tiny syntax which is
  1) those arrows
and 
  2) the tag "(theirs)"
  
The single letter names on the left should be symlinks in your homedirectory that point to wherever the project actually lives on your system.  

The thing on the right side of the arrow is the name for this project that
will end up in summary reports.

The tag "(theirs)" tells alphabet "this isn't my project, this is someone
else's; so don't bother checking for modifications, but do show it in summary
lists."
