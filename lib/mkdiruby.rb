
# ne fonctionne uniquement dans le dossier d'exécution.
def check_if_user_gave_input
  abort("Missing arguments for create directory:\n- type mkdiruby directory (ie: dir1/project)\nmkdiruby: missing input") if ARGV.empty?
end

# je récupère la chaine passée en paramètre de ma commande
def get_string_search
  return str_search = ARGV.join(' ')
end

# je créé les répertoires nécessaires
# /lib pour les progr ruby
def create_folder(name)
  p "Création du dossier destination #{name}"
  Dir.mkdir(name)
  Dir.chdir(name)
  Dir.mkdir("lib")
end

def create_files

  #creation du fichier Gemfile
  p "...je créé le Gemfile: Gemfile"
  f = File.open("Gemfile", "a")
  f.puts("source 'https://rubygems.org'")
  f.puts("ruby '2.5.1'")
  f.puts("gem 'rspec'")
  f.puts("gem 'rubocop', '~> 0.57.2'")
  f.puts("gem 'pry'")
  f.puts("gem 'dotenv'")
  f.puts("gem 'twitter'")
  f.puts("gem 'nokogiri'")
  f.close

  #creation du fichier .env
  f1 = File.open(".env", "a")
  p "...je créé le .env"
  f1.puts('TWITTER_CONSUMER_KEY = "key"')
  f1.puts('TWITTER_CONSUMER_SECRET = "key"')
  f1.puts('TWITTER_ACCESS_TOKEN = "key"')
  f1.puts('TWITTER_ACCESS_TOKEN_SECRET = "key"')
  f1.close

  #creation du fichier README.md
  p "...je créé le README.md"
  f3 = File.open("README.md", "a")
  f3.puts('## Projet THP\n')
  f3.puts('Projet de Alexandre Labonne (@Lab\'s et Brice Jones (@brice))\n')
  f3.close

  #création  du .gitignore
  p "...je créé le .gitignore"
  gitginore = File.open(".gitignore", "a")
  gitginore.puts ".env"
  gitginore.close

end

def launch_tools(folder_work)
  # se positionner dans le répertoire
  p "Se positionne dans le répertoire: #{folder_work}"

  # va créer 3 fichiers
  create_files
  
  # fait un git init
  system("rspec --init")
  system("git init")
  system("bundle install")
  p "Les commandes rspec, git et bundle sont passés"
end

def perform
  check_if_user_gave_input()
  folder_base_name = get_string_search()
  create_folder(folder_base_name)
  launch_tools(folder_base_name)
end

perform