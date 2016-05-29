require 'timestamped_out/version'

class TimestampedOut
  class TimestampedStringIO < StringIO
    def initialize(stdout, level)
      @stdout = stdout
      @level = level
    end

    def write(str)
      timestamped_str =
        if str.length == 1 && str == "\n"
          ''
        elsif str[0] == "\n"
          prepend_timestamp(str[1..-1])
        elsif str[-1] == "\n"
          prepend_timestamp(str[0..-2])
        else
          prepend_timestamp(str)
        end

      @stdout.write(timestamped_str)
    end

    private

    def prepend_timestamp(str)
      "\n#{Time.now} #{Process.pid} TID-#{Thread.current.object_id.to_s(36)} #{@level}: #{str}"
    end
  end

  def call
    buffered_stdout = $stdout
    buffered_stderr = $stderr
    $stdout = TimestampedStringIO.new(buffered_stdout, 'INFO')
    $stderr = TimestampedStringIO.new(buffered_stderr, 'ERROR')
    yield
    self
  rescue Exception => e
    $stderr.write "\n#{e}\n#{e.backtrace.join("\n")}"
  ensure
    $stdout = buffered_stdout
    $stderr = buffered_stderr
  end
end
