def fibonacci_until(max)
    x, y = 1, 1
    while x <= max
        puts ">> O valor inicial de x nessa iteracao e: #{x}"
        puts ">> O metodo yield que passa e tb recebe x: #{yield x}"
        puts "---"
        x, y = y, x + y
    end
end

fibonacci_until(20) do |i|
    puts ">> O bloco recebe o valor de x(#{i}) e em seguida o incrementa"
    i += 1
end
