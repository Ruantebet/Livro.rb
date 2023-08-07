class Livro
  attr_reader :titulo, :autor, :preco

  def initialize(titulo, autor, preco)
    @titulo = titulo
    @autor = autor
    @preco = preco
  end

  def to_s
    "#{@titulo} - #{@autor} (R$ #{@preco})"
  end
end


require_relative 'livro'

class LivrariaVirtual
  def initialize
    @livros = []
    @carrinho = []
  end

  def adicionar_livro(livro)
    @livros << livro
  end

  def listar_livros
    puts "===== Livros Disponíveis ====="
    @livros.each_with_index { |livro, index| puts "#{index + 1}. #{livro}" }
    puts "==============================="
  end

  def adicionar_ao_carrinho(index)
    livro = @livros[index]
    @carrinho << livro
    puts "#{livro.titulo} adicionado ao carrinho."
  end

  def listar_carrinho
    puts "===== Carrinho ====="
    @carrinho.each_with_index { |livro, index| puts "#{index + 1}. #{livro}" }
    puts "====================="
  end

  def calcular_total
    total = @carrinho.sum(&:preco)
    puts "Total da compra: R$ #{total}"
  end

  def menu
    puts "===== Menu ====="
    puts "1. Listar Livros"
    puts "2. Adicionar ao Carrinho"
    puts "3. Listar Carrinho"
    puts "4. Calcular Total"
    puts "0. Sair"
    puts "================="

    escolha = gets.chomp.to_i
    processar_escolha(escolha)
  end

  def processar_escolha(escolha)
    case escolha
    when 1
      listar_livros
    when 2
      adicionar_livro_carrinho
    when 3
      listar_carrinho
    when 4
      calcular_total
    when 0
      encerrar_programa
    else
      puts "Opção inválida. Tente novamente."
    end
  end

  def adicionar_livro_carrinho
    puts "Digite o número do livro que deseja adicionar ao carrinho:"
    listar_livros
    livro_index = gets.chomp.to_i - 1

    if livro_index.between?(0, @livros.size - 1)
      adicionar_ao_carrinho(livro_index)
    else
      puts "Índice de livro inválido."
    end
  end

  def encerrar_programa
    puts "Obrigado por usar a Livraria Virtual. Até mais!"
    exit
  end

  def iniciar
    loop do
      menu
      puts "=============================="
    end
  end
end

# Inicialização da livraria
livraria = LivrariaVirtual.new

livraria.adicionar_livro(Livro.new("Livro 1", "Autor 1", 25.99))
livraria.adicionar_livro(Livro.new("Livro 2", "Autor 2", 19.50))
livraria.adicionar_livro(Livro.new("Livro 3", "Autor 3", 12.75))

livraria.iniciar

