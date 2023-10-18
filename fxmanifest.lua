author "maskirovka"
version '1.0.0'

fx_version "adamant"

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

game "rdr3"
lua54 'yes'

escrow_ignore {
  'config.lua',
  'lang.lua'
}

client_scripts {
  'client/*.lua'
}

server_scripts {
  'server/*.lua'
}

shared_script {
  "shared/*.lua",
  'config.lua',
  'lang.lua',
}