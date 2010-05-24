def fibonacci_until(max)
    x, y = 1, 1
    while x <= max
        puts ">> O valor inicial de x nessa iteracao e: #{x}"
        puts ">> O metodo yield que passa e tb recebe x: #{yield x}"
        puts "---"
        x, y = y, x + y
    end
end

fibonacci_until(10) do |i|
    puts ">> O bloco recebe o valor de x(#{i}) e em seguida o incrementa"
    i += 1
end

computer = ["H", "A", "L"].collect { |x| x.succ }
puts "Usando o metodo collect para criar um novo array: #{computer}"

puts "---"

total = [1,2,3,4,5].inject(0) { |soma, elemento| soma + elemento }
puts "Usando o metodo inject para armazenar o valor total da soma dos elementos: #{total}"

total = [1,2,3,4,5].inject(1) { |produto, elemento| produto * elemento }
puts "Usando o metodo inject para armazenar o produto de todos elementos: #{total}"

