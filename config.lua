-------------------------------
-- DOCUMENTATION : https://docs.kaddarem.com/
--------------------------------

Config = {}

Config.debug = true --display debug information
Config.stressStart = 0 -- value of stress when player log
Config.timerIncrease = 1000 -- in ms. Decrease 1 % evey Config.timerDecrease ms
Config.stopRunAt = 90 -- stop run if value higher
Config.stopJumpAt = 90 -- stop jump if value higher

 -- 'steam:11000011716de6f' maskirovka00

Config.specialUsers = {
  ['steam:1100001047d45bd'] = {
    reduction = 1 --in percentage : 0.5 = 2x slower
  }
}

Config.saloons = {
  { --saint denis
    interiorID = 53762,
    reduction = 1 --in percentage : 0.5 = 2x slower
  },
  { --valentine
    interiorID = 21250,
    reduction = 1 --in percentage : 0.5 = 2x slower
  },
  { --black water
    interiorID = 41218,
    reduction = 1  --in percentage : 0.5 = 2x slower
  }
}