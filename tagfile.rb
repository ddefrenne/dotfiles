require 'Pathname'

def time_difference_in_minutes
  ((Time.now - File.atime("#{ARGV[0]}/tags")) / 60).to_i
end

if Pathname.new("#{ARGV[0]}/.git").exist?
  ctags_cmd = `/usr/local/bin/ctags -R -f #{ARGV[0]}/tags --exclude=log --exclude=coverage --exclude=.git -h 'rb.js.coffee.scss.html.haml.yml' &> /dev/null`

  if !File.exists?("#{ARGV[0]}/tags")
    ctags_cmd
  else
    ctags_cmd if time_difference_in_minutes >= 60
  end
end
