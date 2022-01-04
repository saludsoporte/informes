working_directory "/home/ruby3/informes_app/informes"
pid "/home/ruby3/informes_app/informes/tmp/pids/unicorn.pid"
stderr_path "/home/ruby3/informes_app/informes/log/unicorn.log"
stdout_path "/home/ruby3/informes_app/informes/log/unicorn.log"

listen "/tmp/unicorn.informes.sock", :backlog=>64
#listen "0.0.0.0:8443", :tcp_nopush => true
worker_processes 2
timeout 30
