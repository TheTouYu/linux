#  ls -t  #default using modifyed time  ,, -u acessing time, is what we need
#ls -u ~/data/music/*/*.mp3 |tac |xargs -i ffplay {} -autoexit -showmode 0 -loglevel quiet
####!!!!!!!!!!!  can't be killed!!!!  unless,killall -u 
#>>>   # no atime !!!!!!!!!!!
# so shuffle it
ls  ~/data/music/*/*.mp3 |sort -R |xargs -i ffplay {} -autoexit -showmode 0 -loglevel quiet
