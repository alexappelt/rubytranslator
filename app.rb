

require_relative 'translate'

t = Tradutor.new #cria classe a partir do translate.rb

class Gera_liguas #classe que trabalha com as linguas

  def gera_array #Cria classe onde gera um array de linguas sem repetição
  t = Tradutor.new
  array_linguas = []
  array = []
  index = 1
  t.linguas.each do |x|
    array = ( x[0]+x[1])
    if array_linguas.include?(array) == false
      array_linguas.push(array)
    end
  end
  array_linguas
  end #fim da classe

  def imprime_linguas #imprime as linguas com numeração
    index=0 #posição do array
    gera_array.each do |x|  #pega o array gerado no metodo gera_array e imprime com each
      puts "#{index} - #{x}"
      index +=1
    end
  end

  def traduzir(hash_respostas)
    linguas = gera_array
    lang = gera_array[hash_respostas[:lang_traducao]]
    t = Tradutor.new #cria classe a partir do translate.rb
    tradutor = t.tradutor
    result = tradutor.translate hash_respostas[:frase] , from: lang #recebe a frase do hash e a posição da lingua escolhida
    puts result
  end

end


class Messages #mensagens
  def welcome
    p  "Bem vinco ao tradutor Ruby"
    p "Para iniciar digite as opções abaixo."
  end

  def option
    p "1 - Linguas disponiveis"
    p "2 - Traduzir"
    p "9 - Sair"
    r = gets.chomp.to_i
  end

  def translate
    p "Escolha o número referente a lingua que deseja traduzir:"
    r = gets.chomp.to_i
    p 'Digite a frase para traduzir:'
    f = gets.chomp.to_s
    ans = {lang_traducao: r , frase: f} #guarda as respostas em um hash
    return ans #retorna hash
  end

end

msg = Messages.new




msg.welcome

while 1

  case msg.option
  when 1
    gera = Gera_liguas.new

    gera.imprime_linguas
  when 2
    gera = Gera_liguas.new
    hash_ans = msg.translate #recebe retorno da função e guarda em um hash
    gera.traduzir(hash_ans)
  when 9
    break
    end

end













