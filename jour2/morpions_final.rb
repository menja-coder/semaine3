#jeu du tic tac toe
require 'colorize'
require 'Whirly'

class Board

  def initialize #Affiche les règles
    puts "\n"
    puts "§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§".red
    puts " Welcome to the famous Tic Tac Toe".blue
    puts "§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§".yellow
    puts "\n"
    puts "1) Chaque joueur devra tenter sa chance à chaque tour et devra écrire le nom de la case qu'il souhaite remplir"
    puts "\n"
    puts "2) Le premier qui aligne 3 cases en horizontal, diagonal ou vertical gagnera la partie et  la valeur la plus élevée bitcoin du jour".green
    puts "\n"
    
    puts "\n"
    puts "    A   B  C"

    puts "  1 _ | _ | _"

    puts "  2 _ | _ | _"

    puts "  3 _ | _ | _"

  end



end


class BoardCase # on définit la classe du tableau de jeu

  def initialize

    @my_hash = { #on appelle notre tableau de jeu my_hash
    "A1" => "_", 
    "A2" => "_", 
    "A3" => "_", 
    "B1" => "_", 
    "B2" => "_", 
    "B3" => "_", 
    "C1" => "_", 
    "C2" => "_", 
    "C3" => "_"} #crée le hash de départ avec les clés vide qui forment les 9 cases du jeu

    #succession des 9 tours
    new_round_p1
    new_round_p2
    new_round_p1
    new_round_p2
    new_round_p1
    new_round_p2
    new_round_p1
    new_round_p2
    new_round_p1
  end

  def puts_board #méthode "écran" que l'on appèle a chaque tour pour afficher le tableau du jeu
    puts "\n"
    puts "    A   B  C"

    puts "  1 #{@my_hash["A1"]} | #{@my_hash["B1"]} | #{@my_hash["C1"]}".blue

    puts "  2 #{@my_hash["A2"]} | #{@my_hash["B2"]} | #{@my_hash["C2"]}".white

    puts "  3 #{@my_hash["A3"]} | #{@my_hash["B3"]} | #{@my_hash["C3"]}".red
  end

  def new_round_p1 #methode qui définie l'action du joueur 1 : choisir une case et la remplacer si elle est disponible

    puts "Joueur 1 : Tape le nom de ta case"
    choice = gets.chomp.to_s.capitalize #enregiste le choix de la case choisi par le joueur 1 et conversion en string pour pouvoir l'utiliser dans le hash
    if @my_hash[choice] == "_" # si la case du choix est vide
      @my_hash[choice] = "X" # alors on remplace la case vide par un X


    else
      puts "La case est prise ou inexistante. Merci de jouer une autre case" # sinon le joueur a choisi une case déja prise ou inexistante
      new_round_p1 #je relance new round P1
    end
    puts_board #afficher le tableau avec toutes les cases joués ou vide
    check_win_p1 #lance la methode qui verifie si le joueur 1 a gagné
  end

  def new_round_p2 #methode qui définie l'action du joueur 2 : choisir une case et la remplacer si elle est disponible
    puts "Joueur 2 : Tape le nom de ta case"
    choice = gets.chomp.to_s.capitalize #enregiste le choix de la case choisi par le joueur 2 et conversion en string pour pouvoir l'utiliser dans le hash
    if @my_hash[choice] == "_" # si la case du choix est vide
      @my_hash[choice] = "o" # alors on remplace la case vide par un X

    else
      puts "La case est prise ou inexistante. Merci de jouer une autre case" # sinon le joueur a choisi une case déja prise ou inexistante
      new_round_p2 #je relance le tour de joueur 2 : new round P2
    end
    puts_board #afficher le tableau avec toutes les cases joués ou vide
    check_win_p2 #lance la methode qui verifie si le joueur 1 a gagné
  end

  def check_win_p1 #methode qui vérifie a chaque tour si le joueur 1 a une combinaison gagnante
    if @my_hash["A1"] == "X" && @my_hash["A2"] == "X" && @my_hash["A3"] == "X" || @my_hash["B1"] == "X" && @my_hash["B2"] == "X" && @my_hash["B3"] == "X" || @my_hash["C1"] == "X" && @my_hash["C2"] == "X" && @my_hash["C3"] == "X" || @my_hash["A1"] == "X" && @my_hash["B1"] == "X" && @my_hash["C1"] == "X" || @my_hash["A2"] == "X" && @my_hash["B2"] == "X" && @my_hash["C2"] == "X" || @my_hash["A3"] == "X" && @my_hash["B3"] == "X" && @my_hash["C3"] == "X" || @my_hash["A1"] == "X" && @my_hash["B2"] == "X" && @my_hash["C3"] == "X" || @my_hash["C1"] == "X" && @my_hash["B2"] == "X" && @my_hash["A3"] == "X"
      puts "le joueur 1 gagne! Bravo!"  #si il a une combinaison gagnante, afficher gagnant

      #ajout animation
      require 'Whirly'

      Whirly.start do
        Whirly.status = "BRAVO tu es le MEILLEUR!!!!"
        sleep 3
        Whirly.status = "CONGRATULATIONS"
        sleep 2
      end
      #fin ajout animation 

      start_new_game #lancer le menu qui propose de rejoueur une partie
    end
  end


  def check_win_p2 #methode qui vérifie a chaque tour si le joueur 2 a une combinaison gagnante
    if @my_hash["A1"] == "o" && @my_hash["A2"] == "o" && @my_hash["A3"] == "o" || @my_hash["B1"] == "o" && @my_hash["B2"] == "o" && @my_hash["B3"] == "o" || @my_hash["C1"] == "o" && @my_hash["C2"] == "o" && @my_hash["C3"] == "o" || @my_hash["A1"] == "o" && @my_hash["B1"] == "o" && @my_hash["C1"] == "o" || @my_hash["A2"] == "o" && @my_hash["B2"] == "o" && @my_hash["C2"] == "o" || @my_hash["A3"] == "o" && @my_hash["B3"] == "o" && @my_hash["C3"] == "o" || @my_hash["A1"] == "o" && @my_hash["B2"] == "o" && @my_hash["C3"] == "o" || @my_hash["C1"] == "o" && @my_hash["B2"] == "o" && @my_hash["A3"] == "o"
      puts "le joueur 2 gagne! Bravo!" #si il a une combinaison gagnante, afficher gagnant
      start_new_game #lancer le menu qui propose de rejoueur une partie
    end
  end

  def start_new_game #menu pour reproposer de jouer une partie
    puts "Voulez-vous retenter encore 1 fois ? Tape YES ou NO"
    start_again = gets.chomp.to_s #enregistrement du choix

    if start_again == "YES"
      BoardCase.new #si choix Yes, on relance le jeu
    elsif start_again == "NO" #si choix non, on quitte le programme
      puts "\n"
      abort("Dommage... GAME OVER")
    else
      puts "Vous n'avez pas choisi YES ou NO" #si erreur de choix, on relance le menu pour reproposer de jouer une partie
      start_new_game
    end
  end



end

class Player #Va initialiser un joueur
  def initialize(numero_joueur)
    puts "\n"
    puts "Joueur #{numero_joueur}, comment t'appelles-tu? "
    @player_name = gets.chomp.to_s #enregistre le nom du joueur

  end

end


class Game # boite de commande du jeu

  def initialize

    new_game = Board.new #on lance les règles du jeu
    player1 = Player.new(1) #on initialise le joueur 1
    player2 = Player.new(2) #on initialise le joueur 2
    board = BoardCase.new #on lance une partie du jeu

    game_nul #si les 9 coups ont été joué, on lance le menu qui dit qu'il y a égalité dans le jeu
  end

  def game_nul #jeu a égalité
    puts "Egalité! Personne n'a gagné!"
    puts "Voulez-vous rejouer ? Tape YES ou NO en majuscule"
    start_again = gets.chomp.to_s # enregistre le choix de l'utilisateur

    if start_again == "YES" #si choix Yes, on relance le jeu
      BoardCase.new
    elsif start_again == "NO" #si choix non, on quitte le programme
      puts "\n"
      abort("Dommage Game Over!!! ")
    else
      puts "Vous n'avez pas choisi YES ou NO en majuscule" #si erreur de choix, on relance le menu pour reproposer de jouer une partie
      start_new_game
    end
  end

end
#tentative ajout couleur

def color(index) 
  normal = "\e[#{index}m#{index}\e[0m" 
  bold = "\e[#{index}m\e[1m#{index}\e[0m" 
  "#{normal} #{bold} " 
end 

=begin ajout couleur pour plus tard
8.times do|index| 
  line = color(index + 1) 
  line += color(index + 30) 
  line += color(index + 90) 
  line += color(index + 40) 
  line += color(index + 100) 
  puts line 
=end


#fin ajout couleur
start = Game.new #lancement du jeu