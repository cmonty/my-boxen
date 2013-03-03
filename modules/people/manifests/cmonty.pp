class people::cmonty {
  include chrome
  include dropbox
  include encfs
  include onepassword
  include spotify
  include tmux
  include vagrant
  include virtualbox
  include viscosity
  include wget

  $home = "/Users/${::luser}"
  $my = "${home}/my"
  $dotfiles = "${my}/dotfiles"
  $vim_dotfiles = "${my}/vim_dotfiles"

  file { $my:
    ensure => "directory",
    owner => "cory",
    group => "staff"
  }

  repository { $dotfiles:
    source => "cmonty/dotfiles",
    require => File[$my]
  }

  repository { $vim_dotfiles:
    source => "cmonty/vim_dotfiles",
    require => File[$my]
  }

  file { "${home}/.zsh":
    ensure => "link",
    target => "${my}/dotfiles/zsh",
    require => Repository[$dotfiles]
  }

  file { "${home}/.zshenv":
    ensure => "link",
    target => "${my}/dotfiles/zshenv",
    require => Repository[$dotfiles]
  }

  file { "${home}/.zshenv_personal":
    ensure => "link",
    target => "${my}/dotfiles/zshenv_personal",
    require => Repository[$dotfiles]
  }

  file { "${home}/.tmux.conf":
    ensure => "link",
    target => "${my}/dotfiles/tmux.conf",
    require => Repository[$dotfiles]
  }

  file { "${home}/.vimrc":
    ensure => "link",
    target => "${my}/vim_dotfiles/vimrc",
    require => Repository[$vim_dotfiles]
  }

  file { "${home}/.vim":
    ensure => "link",
    target => "${my}/vim_dotfiles/vim",
    require => Repository[$vim_dotfiles]
  }
}
