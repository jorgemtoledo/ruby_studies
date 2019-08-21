novo_jogo = "s"

while novo_jogo == "s"

  puts "Adivinhe o que estou pensanto entre 1 a 100."

  seu_numero = gets.to_i
  # puts seu_numero
  pc_numero = Random.rand(99) + 1
  # puts pc_numero
  tentativas = 1

  while pc_numero != seu_numero
    if pc_numero > seu_numero
      puts "O numero é maior que o #{seu_numero}"
    else
      puts "O numero é menor que o #{seu_numero}"
    end

    tentativas += 1 
    puts "Tente novamente"
    seu_numero = gets.to_i
  end

  puts "Parabéns, o número era #{pc_numero}"
  puts "Voce usou #{tentativas} tentativas"

  puts "Deseja jogar novamente? (s/n)"
  novo_jogo = gets.chomp

end

puts "Obrigado por jogar"

