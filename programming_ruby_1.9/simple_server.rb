require 'gserver'

class LogServer < GServer
    def initialize
        super(8888)
    end
    def serve(client)
        client.puts get_system_log_tail
    end
private
    def get_system_log_tail
        File.open("/var/log/system.log") do |log|
            log.seek(-1000, IO::SEEK_END)   # pega os últimos 1000 caracteres do final
            log.gets                        # ignora linhas em branco
            log.read                        # retorna o conteudo
        end
    end
end

server = LogServer.new
server.start.join
