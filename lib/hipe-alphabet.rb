#!/usr/bin/env ruby

require 'ruby-debug'
require 'hipe-cli'
require 'open3'

# This started off as a one-off to give an overview of all projects i'm working on,
# in terms of whether or not they are versioned, whether they are versioned remotely,
# and whether any modifications have been made to them since the last commit.
#
#
# It assumes that projects folders have symlinks of lowercase single letters in the
# user's home directory, (and for now an ~/alphabet.txt file giving the projects titles)
#
# ~ > cat alphabet.txt
# a -> rbtree
# b -> simplebtree
# c -> hipe-cli
# d -> webrat

module Hipe
  class Alphabet
    include Hipe::Cli
    cli.default_command = 'help'
    cli.does '-h','--help'

    cli.does :summary, "where does it live? what's it called? how much has changed?"
    def summary
      puts line('','','','','').gsub(' ','_')
      puts line('LTR','NAME','REMOTE','AHEAD','CHANGE').gsub(' ','_')
      alphabet_data.each(&proc_where)
      puts line('','','','','').gsub(' ','_')
      puts "                                 it's my code in a box"
      ''
    end

    cli.does :list, "basic list of projects"
    def list
      %x{cat ~/alphabet.txt}
    end

  private

    def alphabet_filename
      %x{ls -d ~/alphabet.txt}.chomp
    end

    def alphabet_data
      out = []
      lines = File.read(alphabet_filename).split("\n")
      lines.each do |line|
        next if comment_or_empty?(line)
        info = parse_line line
        out << info
      end
      out
    end

    Comment = /^ *#/
    def comment_or_empty? line
      line =~ Comment or "" == line.strip
    end

    Re = /\A *(.*[^ ]) *=> *(.+) *\Z/
    def parse_line line
      md = Re.match(line)
      unless md
        abort("failed to match line in alphabet.txt: #{line}")
      end
      info = {:path=>md[2], :label=>[1]}
      info
    end

    def report_where_and_change(label, path)
      # return ['-','-'] if x[:tags].include?('theirs')
      # @fixme no shell escaping below
      path = hack_path(path)
      stdin, stdout, stderr = Open3.popen3 %{cd #{path}; git remote -v}
      out = stdout.read.chomp
      err = stderr.read.chomp
      if (err.length>0)
        if err =~ /not a git repository/i
          where = '(no repo)'
        else
          where = %{unexpected git failure: #{err}}
        end
        return [where,'-']
      end
      # parse the lines of the results of git remote -v into triplets
      rs = out.scan(/^([^\t]+)\t([^ ]+) \(([^\)]+)\)/)
      names = []
      rs.each do |them|
        name, url, fetch_or_push = *them
        md = %r{/(.+)\.git}.match(url)
        if md
          inner_name = md[1]
        else
          inner_name = '(nomatch?:)'+url
        end
        names << inner_name
      end
      if (names.size > 0)
        where = names.uniq.to_s
      else
        where = "(no remote)"+describe_ln_target(label)
      end
      change_summ = change_summary(path)
      change = (""==change_summ) ? %{ok} : change_summ
      return [where,change]
    end

    def hack_path path
      path.sub('~',ENV["HOME"])
    end

    def proc_where
      @proc_where ||= begin
        lambda do |x|
          use_path = File.basename(x[:path])
          where, change = report_where_and_change(x[:label], x[:path])
          puts line( x[:label],use_path ,where,0, change)
        end
      end
    end

    def line(label,path,where,ahead,change)
      # first_col = ((letter.length + title.length) > 0) ? %{#{letter} -> #{title}} : ''
      first_col = "#{label} -> #{path}"
      sprintf(%{| %-22s  |%17s  | %5s | %20s |}, first_col.slice(0,22), where, ahead, change)
    end

    def change_summary(path)
      list = %x{cd #{path}; git ls-files --others }
      stat = %x{cd #{path}; git diff --numstat}
      num_added = list.scan(/\n/).size
      num_changed = stat.scan(/\n/).size
      a = []
      if num_added > 0
        a.push "#{num_added} added"
      end
      if num_changed > 0
        a.push "#{num_changed} changed"
      end
      a.join(", ")
    end

    def describe_ln_target(letter)
      stdin,stdout,stderr = Open3.popen3 %{ls -ld ~/#{letter}}
      out = stdout.read.chomp
      out = File.basename(out) if (out.length > 0)
      err = stderr.read.chomp
      err = '(bad link)' if err =~ /no such file or directory/i
      out+(err.length>0?(err) : '')
    end
  end
end

puts Hipe::Alphabet.new.cli.run(ARGV) if $PROGRAM_NAME == __FILE__