##### ailias #####
# Common aliases
ostype() {
    echo $(uname)
}

os_detect() {
    export PLATFORM
    case "$(ostype)" in
        *'linux'*)  PLATFORM='linux'   ;;
        *'Darwin'*) PLATFORM='osx'     ;;
        *'bsd'*)    PLATFORM='bsd'     ;;
        *)          PLATFORM='unknown' ;;
    esac
}

if [[ $PLATFORM == osx ]]; then
  if [ -x /usr/local/bin/gdircolors ]; then
    if [ -f ~/.colorrc ]; then
      eval `gdircolors ~/.colorrc`
      alias ls='gls -F --color=auto'
      alias lsa='gls -aF --color=auto'
    else
      echo "colorrc does not exist"
      alias ls='gls -F --color=auto'
      alias lsa='gls -aF --color=auto'
    fi
  else
    echo "I recommend to install gdircolors and make colorrc"
    alias ls='ls -FG'
    alias lsa='ls -aFG'
  fi
elif [[ $PLATFORM == linux ]]; then
  if [ -f ~/.colorrc ]; then
    eval `dircolors ~/.colorrc`
  fi
  alias ls='ls -F --color=auto'
  alias lsa='ls -aF --color=auto'
else
  if [ -f ~/.colorrc ]; then
    eval `dircolors ~/.colorrc`
  fi
  alias ls='ls -F --color=auto'
  alias lsa='ls -aF --color=auto'
fi