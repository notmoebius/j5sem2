require 'pry'

def check_if_user_gave_input
  abort("Missing arguments for create directory:\n- type mkdiruby directory (ie: dir1/project)\nmkdiruby: missing input") if ARGV.empty?
end

# je récupère la chaine passée en paramètre de ma commande
def get_string_search
  return str_search = ARGV.first
end

# je formate le nom du répertoire à créer
def get_folder_name(creat_dir_name)
  return folder_name = "~/Documents/thp/#{ARGV.first}"  # je souhaite mettre mes dossiers ruby dans $HOME/Documents/thp
end

# je créé les répertoires nécessaires
# /lib pour les progr ruby
def create_folder(name)
  p "Création du dossier destination #{name}"
  system("mkdir -p #{name}")
  system("mkdir -p #{name}/lib")
end

def create_files(files_locator)
  system("touch #{files_locator}/Gemfile")
  system("touch #{files_locator}/.env")
  system("touch #{files_locator}/README.md")
  #creation du fichier Gemfile
  p "...je créé le Gemfile"
  file = File.open("#{files_locator}/Gemfile", "a")
  file.puts("source 'https://rubygems.org'")
  file.puts("ruby '2.5.1'")
  file.puts("gem 'rspec'")
  file.puts("gem 'rubocop', '~> 0.57.2'")
  file.puts("gem 'pry'")
  file.puts("gem 'dotenv'")
  file.puts("gem 'twitter'")
  file.puts("gem 'nokogiri'")
  file.close

  #creation du fichier .env
  file = File.open("#{files_locator}/.env", "a")
  p "...je créé le .env"
  file.puts('TWITTER_CONSUMER_KEY = "key"')
  file.puts('TWITTER_CONSUMER_SECRET = "key"')
  file.puts('TWITTER_ACCESS_TOKEN = "key"')
  file.puts('TWITTER_ACCESS_TOKEN_SECRET = "key"')
  file.close

  #creation du fichier README.md
  p "...je créé le README.md"
  file = File.open("#{files_locator}/README.md", "a")
  file.puts('## Projet THP\n')
  file.puts('Projet de Alexandre Labonne (@Lab\'s et Brice Jones (@brice))\n')
  file.close

end

# Je créé le gemfile
def launch_tools(folder_work)
  # se positionner dans le répertoire
  system("cd #{folder_work}")
  #Dir.chdir(folder_work)
  p "Se positionne dans le répertoire: #{folder_work}"
  # va créer 3 fichiers
  create_files(folder_work)
  # fait un git init
  #system("git init")
  #system('rspec --init')
end

def perform
  check_if_user_gave_input()
  get_string_search()
  folder_base_name = get_folder_name(get_string_search)
  create_folder(get_folder_name(folder_base_name))
  launch_tools(folder_base_name)
  binding.pry
end

perform