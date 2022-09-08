#VK_ICD_FILENAMES="/usr/lib/wineland/vulkan/icd.d/intel_icd.i686.json:/usr/lib/wineland/vulkan/icd.d/radeon_icd.i686.json"
#LD_LIBRARY_PATH="/usr/lib/wineland/lib32:$LD_LIBRARY_PATH"
cd /home/h/T/usr/'Genshin Impact Game'
WINEDEBUG=fps wine cmd /c launcher.bat  #sed -n -E  's/.*approx (.*),/\1/p'|awk '{print $1}' | osd_cat  -c green  -o 30 -s 1 -l1
