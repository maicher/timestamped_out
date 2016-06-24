require 'timestamped_out/version'

class TimestampedOut
  DEFAULT_FORMATTER = lambda { |severity, datetime, progname, message| "#{datetime} #{Process.pid} TID-#{Thread.current.object_id.to_s(36)}#{progname} #{severity}: #{message}\n" }

  attr_accessor :formatter

  def initialize(formatter = DEFAULT_FORMATTER)
    self.formatter = formatter
  end

  def call
    old_stdout = STDOUT.clone
    pipe_r, pipe_w = IO.pipe
    pipe_r.sync = true
    output = ''
    reader = Thread.new do
      begin
        loop do
          output << formatter.call('INFO', Time.now, '', pipe_r.readpartial(1024))
        end
      rescue EOFError
      end
    end
    STDOUT.reopen(pipe_w)
    yield
    self
  rescue StandardError => e
    STDERR.write formatter.call('ERROR', Time.now, '', "#{e}\n#{e.backtrace.join("\n")}")
  ensure
    STDOUT.reopen(old_stdout)
    pipe_w.close
    reader.join
    STDOUT.write(output)
    return self
  end

  def with_timestamp(str, level)
    if str.length == 1 && str == "\n"
      ''
    elsif str[0] == "\n"
      prepend_timestamp(str[1..-1], level)
    elsif str[-1] == "\n"
      prepend_timestamp(str[0..-2], level)
    else
      prepend_timestamp(str, level)
    end
  end
end
