# codding: UTF-8

require 'rest-client'
require 'json'
require 'date'

url_principal = 'https://api.github.com'
url_repositories = 'search/repositories?'
url_users = 'search/users?'
url_user = 'users'
busca = "s"
puts "#################################################################################"
puts "Consumindo API - Github"
puts "Tutorial: Onebitcode - Link: https://onebitcode.com/consumindo-apis-ruby/"
puts "#################################################################################"

while busca == "s"
  puts ''
  puts '1 - Buscar repositorios'
  puts '2 - Buscar usuarios'
  puts '3 - Buscar usuario'
  puts '4 - sair'

  print 'Escolha uma opção: '
  escolha = gets.chomp
  puts ''

  # puts escolha
  case escolha
  when '1'
    # Repositories
    puts 'Digite o projeto: '
    q = gets.chomp

    puts 'Digite a linguagem: '
    language = gets.chomp

    # Via Get
    res = RestClient.get "#{url_principal}/#{url_repositories}q=#{q}&language=#{language}"

    puts "Total encontrado: #{JSON.parse(res.body)['total_count']}"

    listProjects = JSON.parse(res.body)['items']

    listProjects.each do |project|
      puts project['id']
      puts project['name']
      puts project['description']
    end

    puts "Deseja continuar? (s/n)"
    busca = gets.chomp

  when '2'
    # users
    puts 'Digite o usuario: '
    q = gets.chomp
    res = RestClient.get "#{url_principal}/#{url_users}q=#{q}+repos:%3E2+followers:%3E1"
    puts JSON.parse(res.body)['total_count']
    puts JSON.parse(res.body)['items'][0]['login']

    puts "Deseja continuar? (s/n)"
    busca = gets.chomp

  when '3'
    # User
    puts 'Digite o usuario: '
    q = gets.chomp
    res = RestClient.get "#{url_principal}/#{url_user}/#{q}"
    dateRepositoryUser = JSON.parse(res.body)['created_at']
    d = Date.parse(dateRepositoryUser)
    puts "Nome: #{JSON.parse(res.body)['name']}"
    puts "Login: #{JSON.parse(res.body)['login']}"
    puts "Seguidores: #{JSON.parse(res.body)['followers']}"
    puts "Seguindo: #{JSON.parse(res.body)['following']}"
    puts "Repositorio criado em: #{d.strftime('%d-%m-%Y')}"

    puts "Deseja continuar? (s/n)"
    busca = gets.chomp

  when '4'
    puts "Obrigado!"
    busca = "n"
  else
    puts "Desculpa, opção inválida!"
    puts "Deseja continuar? (s/n)"
    busca = gets.chomp
  end
end


