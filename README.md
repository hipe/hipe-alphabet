=== Summary

  Get an overview of the status of all your different git projects.
  (helpful for if they're interdependant and you're changing multiple of them at once.)


=== Usage

  I keep a list of my projects in a small textfile in my home directory:

  ~ > cat ~/alphabet.txt
      alphabet => ~/proj/mygems/hipe-alphabet
      # ack-lite =>
      githelper => ~/proj/mygems/hipe-githelper
      hipe-core => ~/proj/mygems/hipe-core-bleeding
      hipe-cli  => ~/proj/mygems/hipe-cli-bleeding
      # hipe-didcap => ~/proj/mygems/hipe-didcap
      hipe-filemetrics => ~/proj/mygems/hipe-filemetrics
      gorillagrammar => ~/proj/mygems/hipe-gorillagrammar
      githelper => ~/proj/mygems/hipe-githelper
      local-data => ~/locally-versioned-data
      vhost => ~/proj/mygems/hipe-vhost
      visiting => ~/proj/mygems/visiting
      # php-diffy
      # fonteye
      # m -> metacms (actually hipe-wisteria and hipe-asses)
      # r -> remon (make it!)
      # s -> shapes (do it!)

  So note the syntax with the arrows. and '#' denotes comments.


  Then i can:

    ~ > alphabet summary
      |__->_____________________|______________________|_______|______________________|
      |_LTR_->_NAME_____________|______________REMOTE__|_AHEAD_|_______________CHANGE_|
      | alphabet -> hipe-alpha  |       hipe-alphabet  |     2 |            1 changed |
      | githelper -> hipe-gith  |           githelper  |     0 |            2 changed |
      | dotfiles -> .dotfiles   |       hipe-dotfiles  |     1 |              1 added |
      | hipe-core -> hipe-core  |           hipe-core  |     0 |                   ok |
      | hipe-cli -> hipe-cli-b  |            hipe-cli  |     1 |            2 changed |
      | hipe-filemetrics -> hi  |    hipe-filemetrics  |     1 |                   ok |
      | local-data -> locally-  |         (no remote)  |     0 |                   ok |
      | vhost -> hipe-vhost     |          hipe-vhost  |     1 |                   ok |
      | visiting -> visiting    |       hipe-visiting  |     0 |                   ok |
      |__->_____________________|______________________|_______|______________________|
                                  it's my code in a box



      when executing this command:
      cd ~/proj/mygems/hipe-alphabet; git rev-list origin/master.. | wc -l
      got this error:
      warning: refname 'origin/master' is ambiguous.

      ~ >


=== Thank you's
  - thank you to to rolfb for giving me some valuable one-on-one time to help me re-learn
  how to use homebrew to get my git back in order.
  - thank you wereHamster, jjuran, drizzd for helping me with git! when you don't know
  the names of the things you don't know, it's hard to ask a machine what their names are.
