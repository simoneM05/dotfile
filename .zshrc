export ZSH="$HOME/.oh-my-zsh"

echo -e "nameserver 8.8.8.8\nnameserver 8.8.4.4" | sudo tee /etc/resolv.conf > /dev/null
export PATH="$PATH:$(yarn global bin)"


ZSH_THEME="refined"
plugins=(
        git
        zsh-autosuggestions
        node
        docker
)

source $ZSH/oh-my-zsh.sh


# alias
alias zshconfig="nvim ~/.zshrc"
alias gc="git commit -m"   # Commit con messaggio veloce
alias gcm="git commit --amend"   # Modifica ultimo commit
alias gca="git commit -am"  # Aggiungi e fai commit in un colpo solo
alias ls="lsd"
alias la="lsd -la"
alias l="lsd"
alias c="clear"
alias s="source"
alias nv="nvim"
alias fd="fdfind"
#yarn 
alias ya="yarn add"
alias yaD="yarn add -D"   # -D è più breve di --save-dev
alias yaG="yarn global add"
alias yr="yarn run"
alias dev="yarn dev"      # yarn run è opzionale
alias tsc="yarn tsc"
alias start="yarn start"
alias rp="docker start postgres & docker start redis"



#GO
alias gr="go run main.go"                  # Esegue il main.go
alias gbuild="go build"                         # Compila il progetto
alias gi="go install"                       # Installa il binario
alias gt="go test ./..."                    # Esegue tutti i test
alias gtb="go test -bench ."                # Esegue i benchmark
alias gtv="go test -v ./..."                # Esegue i test con output dettagliato
alias gtc="go test -cover ./..."            # Controlla la copertura dei test

# Moduli e pacchetti
alias gmt="go mod tidy"                     # Pulisce e organizza i moduli
alias gmi="go mod init"                     # Inizializza un modulo
alias gmu="go mod upgrade"                  # Aggiorna i moduli
alias gmv="go mod verify"                   # Verifica la consistenza dei moduli

# Gestione pacchetti
alias gget="go get"                         # Installa pacchetti
alias ggetu="go get -u ./..."               # Aggiorna tutti i pacchetti

# Debugging e analisi
alias gf="go fmt ./..."                     # Formatta il codice
alias gfix="go fix ./..."                   # Corregge il codice obsoleto
alias gvet="go vet ./..."                   # Analizza il codice per bug comuni
alias gdoc="go doc"                         # Mostra la documentazione di un pacchetto

# Esecuzione di script veloci
alias gexec="go run"                        # Esegue uno script Go senza build




