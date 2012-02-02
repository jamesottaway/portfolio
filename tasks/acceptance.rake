task :acceptance do
  portfolio = Process.spawn 'rackup -p 9292 -E test'
  
  until is_port_open?('localhost', '9292') do
    puts "Waiting for Portfolio to start listening..."
    sleep 1
  end
  
  trap("INT") {
    Process.kill(9, portfolio) rescue Errno::ESRCH
    exit 0
  }
  
  Rake::Task['cucumber'].invoke
  
  Process.kill 9, portfolio
end

private

require 'timeout'

def is_port_open?(ip, port)
  begin
    Timeout::timeout(1) do
      begin
        s = TCPSocket.new(ip, port)
        s.close
        return true
      rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH
        return false
      end
    end
  rescue Timeout::Error
  end

  return false
end
