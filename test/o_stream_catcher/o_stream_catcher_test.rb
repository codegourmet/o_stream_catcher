require_relative "../test_helper"
require_relative "../../lib/o_stream_catcher/o_stream_catcher"

module OStreamCatcher
  class OStreamCatcherTest < MiniTest::Test

    def test_should_return_result_of_block
      result, _stdout, _stderr = OStreamCatcher.catch { 42 }
      assert_equal 42, result
    end

    def test_should_return_stdout_contents
      _result, stdout, _stderr = OStreamCatcher.catch { print "out: Hello world!" }
      assert_equal "out: Hello world!", stdout
    end

    def test_should_return_sterr_contents
      _result, _stdout, stderr = OStreamCatcher.catch { $stderr.print "err: Hello world!" }
      assert_equal "err: Hello world!", stderr
    end

    def test_should_restore_streams_when_exception
      orig_stdout = $stdout
      orig_stderr = $stderr
      _result = (OStreamCatcher.catch { throw "test" }) rescue []

      assert_equal orig_stdout, $stdout
      assert_equal orig_stderr, $stderr
    end

  end
end
