module OStreamCatcher

  def catch(&block)
    stdout_orig, stdout_mock = mock_stdout
    stderr_orig, stderr_mock = mock_stderr

    stderr_orig = $stderr
    stderr_mock = StringIO.new
    $stderr = stderr_mock

    begin
      result = block.call
    ensure
      $stdout = stdout_orig
      $stderr = stderr_orig
    end

    [result, stdout_mock.string, stderr_mock.string]
  end

    protected

      def mock_stdout
        orig = $stdout
        mock = StringIO.new
        $stdout = mock
        [orig, mock]
      end

      def mock_stderr
        orig = $stderr
        mock = StringIO.new
        $sterr = mock
        [orig, mock]
      end

  extend self

end
